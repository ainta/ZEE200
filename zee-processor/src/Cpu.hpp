#include <Op.h>
#include <Protocol.h>
#include <Cpu.h>
#include <Channel.h>
#include <Oracle.h>


void editProgram(Program& p) {
  for (auto& raw: p) {
    Instr i = decode(raw);
    if (i.op == OP_EQZ) {
      // clear reg1 and reg2
      raw &= (0xFFFFFFFFFFFFFFFF ^ REG1_MASK);
      raw &= (0xFFFFFFFFFFFFFFFF ^ REG2_MASK);
      // set reg1 to reg2
      raw |= ((std::uint64_t)i.reg2 << REG1_OFFSET);
    }
  }
}

template <Role role>
ACpu<role> mkACpu(
    const Program& program,
    const std::vector<std::uint32_t>& data,
    const std::vector<std::uint32_t>& regInit,
    std::deque<std::uint32_t>* input,
    CycleQueue<std::uint32_t>* romOrder,
    CycleQueue<std::uint32_t>* regOrder,
    CycleQueue<std::uint32_t>* memOrder,
    std::size_t powMem) {
  /* std::vector<std::array<std::uint32_t, 2>> p; */
  std::vector<std::array<Zp, 2>> p;
  for (auto raw: program) {
    std::uint32_t instr = raw >> 32;
    std::uint32_t imm = raw;
    /* p.push_back({ instr, imm }); */
    p.push_back({ constant<role>(instr), constant<role>(imm) });
  }

  auto mem = Ram<role, 1, LogCache> { powMem, data, memOrder };
  mem.ixcontent[1 << (powMem - 1)][0] = constant<role>(Zp::prime - 1);


  return ACpu<role> {
    constant<role>(2),
    Rom<role>(p, romOrder),
    Ram<role, 1, LogCache>(5, regInit, regOrder),
    mem,
    input
  };
}


constexpr std::size_t INTERRUPT_TIMER = 10000;

int instcnt = 0;

// Perform a processor step.
bool pstep(PCpu& cpu, std::size_t powMem, std::size_t cycle) {
  const auto rawinstr = cpu.program.read(cpu.pc);
  auto [isImm, o, reg0, reg1, reg2, imm] = decode(rawinstr);
  const Op op { o };

  const auto noTar =
    (op == OP_JUMP)
    || (op == OP_HALT)
    || (op == OP_QED)
    || (op == OP_BNZ)
    || (op == OP_ORACLE);

  bool hit1 = true;
  bool hit2 = true;
  bool hit3 = true;
  bool hitmain = true;
  const auto inp0 = cpu.registry.access(1, reg1, hit1);
  const auto src2 = cpu.registry.access(!isImm, reg2, hit2);
  auto& tar = cpu.registry.access(!noTar, reg0, hit3);
  auto inp1 = isImm*imm + !isImm*src2;

  // main memory is addressed as multiples of 4, so we drop the last to bits to model this.
  auto addr = (inp0 + inp1) >> 2;
  bool illegal_addr = addr == (1 << (powMem - 1));
  if (illegal_addr) { addr = 0; }


  auto& pc = cpu.pc;

  // we hit if all accesses work

  bool isAccess = op == OP_LOAD || op == OP_STORE;
  if ((cycle % INTERRUPT_TIMER) == 0 && cycle > 0) {
    // Periodically check for illegal main memory access
    bool hit = hit1 && hit2 && hit3 && isAccess;
    if (hit && illegal_addr) {
      std::cerr << "ILLEGAL LOOKUP!\n";
      pc = 1;
    }
    // if no illegal access, skip cycle entirely
    return hit;
  } else {
    auto& mainmem = cpu.memory.access(isAccess, addr, hitmain);
    bool hit = hit1 && hit2 && hit3 && hitmain && (!isAccess || !illegal_addr);
    if (hit) {
		// std::cout << instcnt << ' ' << op << std::endl;
		instcnt++;
      switch (op) {
        case OP_QED: break;
        case OP_HALT: break;
        case OP_MOV: tar = inp1; ++pc; break;
        case OP_CMOV: tar = inp0 != 0 ? inp1 : tar; ++pc; break;
        case OP_ADD: tar = inp0 + inp1; ++pc; break;
        case OP_SUB: tar = inp0 - inp1; ++pc; break;
        case OP_MUL: tar = inp0 * inp1; ++pc; break;

        case OP_XOR: tar = inp0 ^ inp1; ++pc; break;
        case OP_AND: tar = inp0 & inp1; ++pc; break;
        case OP_OR: tar = inp0 | inp1; ++pc; break;

        case OP_EQZ: tar = inp0 == 0; ++pc; break;
        case OP_MSB: tar = inp1 >= (1 << 31); ++pc; break;
        case OP_POW2: tar = 1 << inp1; ++pc; break;

        case OP_JUMP: pc = inp1; break;
        case OP_BNZ: pc = inp0 != 0 ? inp1 : pc+1; break;

        case OP_INPUT:
          tar = cpu.input.top();
          cpu.input.pop();
          cpu.tape.push_back(tar);
          ++pc;
          break;

        case OP_LOAD: tar = mainmem; ++pc; break;
        case OP_STORE: mainmem = tar; ++pc; break;
        case OP_PC: tar = pc + inp1; ++pc; break;

        case OP_ORACLE: {
          Machine m {
            cpu.pc,
            &cpu.registry.content,
            &cpu.memory.content,
            &cpu.program.content,
            &cpu.input
          };
          oracle(m, inp1);
          ++pc;
          break;
        }
        case OP_OUTPUT: ++pc; break;
        default: break;
      }
    }

    /* if (op == OP_STORE && hit) { */
    /*   std::cout << "STORE " << (inp0 >> 2) << ' ' << mainmem << '\n'; */
    /* } else if (op == OP_LOAD && hit) { */
    /*   std::cout << "LOAD " << (inp0 >> 2) << ' ' << mainmem << '\n'; */
    /* } else { */
    /*   std::cout << tar << " <- " << inp0 << ' ' << inp1 << '\n'; */
    /* } */

    return hit;
  }
}


std::size_t ram_ots = 0;
std::size_t ram_multiplicands = 0;


// Perform a processor step.
template <Role role>
void step(ACpu<role>& cpu, bool hit, std::size_t powMem, std::size_t cycle) {
  const auto zero = constant<role>(0);
  const auto one = constant<role>(1);
  const auto top = constant<role>((std::uint64_t)1 << 32);

  const auto [pc_goal, instr_goal, imm] = cpu.program.read();
  Instr clear = decode(instr_goal.content << 32 ^ imm.content);
  /* if (role == Role::Input) { */
  /*   std::cout << cycle << ' '; print(clear); */
  /* } */

  const auto [src0, x] = cpu.registry.access();
  const auto [src1, src1_content] = cpu.registry.access();
  auto& [tar_ix, tar] = cpu.registry.access();

  const auto [isImm, imm_content_diff]
    = inputSelect<role, 1>(clear.isImm, { imm - src1_content });
  auto y = src1_content + imm_content_diff;

  Zp tar_delta;
  Zp pc_delta;
  Zp store_delta;
  Zp load_valid;
  Zp store_valid;
  Zp operation;

  auto& pc = cpu.pc;

  if ((cycle % INTERRUPT_TIMER) == 0 && cycle > 0) {
    // Periodically check for illegal main memory access
    // first, read in the opcode

    auto [isLoad, loadOp] = inputSelect<role, 1>(clear.op == OP_LOAD, { constant<role>(OP_LOAD) });
    auto [isStore, storeOp] = inputSelect<role, 1>(clear.op == OP_STORE, { constant<role>(OP_STORE) });
    auto isAccess = isLoad + isStore;

    const auto addr_unadjusted = x + y;
    const auto addr_overflow = select<role>(
        addr_unadjusted >= Zp { (std::uint64_t)1 << 32 }, constant<role>((std::uint64_t)1 << 32));
    const auto addr_with_low = addr_unadjusted - addr_overflow;
    const auto addrs = project32<role>(addr_with_low);
    const auto addr = inject(addrs.begin() + 2, addrs.end(), 0);
    const auto illegal = constant<role>(1 << (powMem - 1));


    // If the machine is stuck, we can trust malicious prover to say so (i.e.,
    // she will not claim it is *not* stuck), because otherwise she cannot
    // build a proof.
    const auto [addrDiff, jump, access_check] = select<role, 3>(
        (bool)(isAccess.content) && (addr == illegal),
        { addr - illegal, constant<role>(1) - pc, one - isAccess});
    // if the machine is stuck, prover must prove "stuckness"
    prove0<role>(addrDiff);
    // to be stuck, the operation must be an access
    prove0<role>(access_check);

    tar_delta = zero;
    pc_delta = jump;
    store_delta = zero;
    load_valid = zero;
    store_valid = zero;
    operation = loadOp + storeOp;
  } else {

    // alu
    std::uint64_t xchoice = 0;
    if constexpr (role == Role::Input) {
      if (clear.op == OP_INPUT && hit) {
        xchoice = cpu.input->front();
        cpu.input->pop_front();
      } else {
        xchoice = x.content;
      }
    }

    // project x into bits while determining if it is all 0s
    std::array<Zp, 32> xbits;
    Zp isZero = one;
    for (std::size_t i = 0; i < 32; ++i) {
      const auto [xb, isZ] = inputSelect<role, 1>((xchoice & (1 << i)) <= 0, { isZero });
      xbits[i] = one - xb;
      isZero = isZ;
    }

    std::array<Zp, 32> ybits, ands, ors, xors;
    Zp mul = zero;
    Zp pow2 = one;
    for (std::size_t i = 0; i < 32; ++i) {
      const Zp powDiff = i <= 5 ? (pow2 << (1 << i)) - pow2 : zero - pow2;
      const auto [ybit, xybit, bitmul, ypowDiff]
        = inputSelect<role, 3>((y.content & (1 << i)) > 0,
            { xbits[i]
            , inject(xbits.begin(), xbits.end() - i, i)
            , powDiff
            });
      ybits[i] = ybit;
      ands[i] = xybit;
      ors[i] = xbits[i] + ybits[i] - ands[i];
      xors[i] = ors[i] - ands[i];
      pow2 += ypowDiff;
      mul += bitmul;
    }


    // main memory
    // we can safely allow P to choose the overflow -- if she does not she cannot access memory
    const auto addr_base = inject(xbits.begin() + 2, xbits.end(), 0);
    const auto addr_offset = inject(ybits.begin() + 2, ybits.end(), 0);
    const auto addr_overflow = select<role>(addr_base + addr_offset >= Zp { 1 << 30 }, constant<role>((std::uint64_t)(1 << 30)));
    const auto addr = addr_base + addr_offset - addr_overflow;

    /* if (role == Role::Input) { std::cerr << addr << '\n'; } */


    std::size_t ot_before;
    std::size_t mult_before;
    if (role == Role::Input) {
      ot_before = Protocol::choices.size();
      mult_before = Protocol::pNumDiff;
    }

    auto& [main_ix, main_el] = cpu.memory.access();

    if (role == Role::Input) {
      ram_ots += Protocol::choices.size() - ot_before;
      ram_multiplicands += Protocol::pNumDiff - mult_before;
    }



    const auto [r, load_v] =
      inputSelect<role, 1>(clear.op == OP_LOAD, { addr - main_ix });
    const auto [w, store_v, store_what] =
      inputSelect<role, 2>(clear.op == OP_STORE, { addr - main_ix, tar - main_el });
    load_valid = load_v;
    store_valid = store_v;
    store_delta = store_what;


    // multiplex
    auto cmovDiff = select<role>(one - isZero, y - tar);
    const auto bnzTar = mux<role>(one - isZero, y - pc, one);

    std::array<std::array<Zp, 2>, 32> table;
    for (auto& row: table) { row = { zero, zero }; }
    table[OP_PC]     = { pc + y - tar        , one };
    table[OP_MOV]    = { y - tar             , one };
    table[OP_CMOV]   = { cmovDiff            , one };
    table[OP_ADD]    = { x + y - tar         , one };
    table[OP_SUB]    = { x - y + top - tar   , one };
    table[OP_MUL]    = { mul - tar           , one };
    table[OP_XOR]    = { inject(xors) - tar  , one };
    table[OP_AND]    = { inject(ands) - tar  , one };
    table[OP_OR]     = { inject(ors) - tar   , one };
    table[OP_EQZ]    = { isZero - tar        , one };
    table[OP_MSB]    = { ybits[31] - tar     , one };
    table[OP_POW2]   = { pow2 - tar          , one };
    // if prover chooses not to prove load/store is correct, processor stalls
    table[OP_LOAD]   = { main_el - tar       , r };
    table[OP_STORE]  = { zero                , w };
    table[OP_ORACLE] = { zero                , one }; // no op
    table[OP_OUTPUT] = { zero                , one }; // no op
    table[OP_INPUT]  = { inject(xbits) - tar , one };

    table[OP_JUMP]   = { zero                , y - pc };
    table[OP_BNZ]    = { zero                , bnzTar };
    table[OP_HALT]   = { zero                , zero };
    table[OP_QED]    = { zero                , zero };

    /* const auto [operation, row] = lookup<role, 5, 2>(clear.op, table); */
    const auto tableout = lookup<role, 5, 2>(clear.op, table);
    operation = tableout.first;
    tar_delta = tableout.second[0];
    pc_delta = tableout.second[1];


    const auto dx = x - inject(xbits);
    const auto [input_check, idx] =
      select<role, 2>(clear.op == OP_INPUT, { operation - constant<role>(OP_INPUT), dx });


    // If prover elects to take an input, he must prove the op code is INPUT
    prove0<role>(input_check);
    // If prover elects to take an input, he need not prove x matches his injection
    prove0<role>(dx - idx);
    prove0<role>(y - inject(ybits));
  }

  // The prover may elect to force a miss: to cause the processor to make no progress whatsoever.

  // authenticate the choice of the instruction
  const Zp instr = (isImm << (IMM_OFFSET - 32))
      + (operation << (OP_OFFSET - 32))
      + (tar_ix << (REG0_OFFSET - 32))
      + (src0 << (REG1_OFFSET - 32))
      + (src1 << (REG2_OFFSET - 32));

  // Prover chooses whether or not the processor should make progress here:
  // multiply the effects of computation by `miss`
  // highest overflow possible is under 32*2^32, so read in 5 bits corresponding to overflow
  const auto [tarDiff, pcDiff, storeDiff, pc_check, mem_check, instr_check] =
    select<role, 6>(hit, {
      tar_delta - (ole<5, role>(Protocol::delta, Zp { (tar + tar_delta).content >> 32 }) << 32),
      pc_delta,
      store_delta,
      cpu.pc - pc_goal,
      load_valid + store_valid,
      instr_goal - instr
      });


  prove0<role>(pc_check);
  prove0<role>(mem_check);
  prove0<role>(instr_check);

  tar += tarDiff;
  pc += pcDiff;
  cpu.memory.front()[1] += storeDiff;

  /* if (role == Role::Input) { */
  /*   std::cout << tar << '\n'; */
  /* } */
}


template <Role role>
void exec(
    Program p,
    const std::vector<std::uint32_t>& data,
    std::size_t powMem) {
  editProgram(p);

  // verifier has to select a random delta value before any values/constants are set.
  if constexpr (role == Role::Verifier) {
    Protocol::delta = Zp::random(Zp { 1 });
  }

  // const std::size_t multiple = 32;
  /* const std::size_t multiple = std::max((std::size_t)5*32, powMem*(1 << powMem)); */
  /* const std::size_t multiple = std::max(16384, (1 << powMem)); */
  const std::size_t multiple = 64;

  constexpr uint32_t STACKPTR_REGISTER = 7;
  constexpr uint32_t HEAPPTR_REGISTER = 10;
  std::vector<std::uint32_t> registryInit(32);
  for (std::size_t i = 0; i < 32; ++i) { registryInit[i] = 0; }
  registryInit[STACKPTR_REGISTER] = 1 << (powMem + 2);
  registryInit[HEAPPTR_REGISTER] = data.size() * 4;

  PCpu pcpu;

  std::size_t pcycles = 0;

  if constexpr (role == Role::Input) {
    pcpu = PCpu { 2, { p , multiple+1 }, { registryInit, 5, 4*multiple }, { data, powMem, multiple+1 }, { }, { }};
  }

  CycleQueue<std::uint32_t>* paccess = nullptr;
  CycleQueue<std::uint32_t>* raccess = nullptr;
  CycleQueue<std::uint32_t>* maccess = nullptr;
  std::deque<std::uint32_t>* tape = nullptr;
  if constexpr (role == Role::Input) {
    paccess = &pcpu.program.accessOrder;
    raccess = &pcpu.registry.accessOrder;
    maccess = &pcpu.memory.accessOrder;
    tape = &pcpu.tape;
  }


  auto acpu = mkACpu<role>(p, data, registryInit, tape, paccess, raccess, maccess, powMem);

  if constexpr (role == Role::Input) {
    std::size_t nmiss = 0;
    std::size_t ncachemiss = 0;
    std::size_t naccess = 0;
    bool stalled = false;
    std::size_t current_stall;
    std::vector<std::size_t> stalls;


    std::size_t icycles = 0;

    std::deque<bool> hits;
    Instr in = decode(p[pcpu.pc]);
    const auto do_step = [&] {
      // std::cout << pcycles << ' ' << in.op << '\n';
      // std::cout << pcpu.pc << ' ';
      // print(in);
      const auto hit = pstep(pcpu, powMem, pcycles);
      hits.push_back(hit);
      in = decode(p[pcpu.pc]);
      /* getchar(); */
      if (hit && (in.op == OP_STORE || in.op == OP_LOAD)) {
        ++naccess;
      }
      if ((pcycles % INTERRUPT_TIMER) != 0) {
        nmiss += !hit;
        if (stalled && hit) {
          stalled = false;
          stalls.push_back(current_stall);
        } else if (stalled) {
          ++current_stall;
        } else if (!stalled && !hit) {
          stalled = true;
          ++ncachemiss;
          current_stall = 1;
        }
      }
      ++pcycles;
    };

    while (in.op != OP_HALT && in.op != OP_QED) {
      do_step();
    }
    do_step();
	// for (int ti = 0; ti < 1300000; ti ++)
	// {
	// 	do_step();
	// }

	// std::cout << hits.size() << std::endl;
	// std::cout << stalls.size() << std::endl;

    /* for (std::size_t i = 0; i < LogCache::midnight(powMem-1); ++i) { */
    /*   do_step(); */
    /* } */

	// pcycles = 10;
    while (icycles < pcycles) {
      step<role>(acpu, hits.front(), powMem, icycles);
      hits.pop_front();
      ++icycles;
    }

    const auto [pc, instr, imm] = acpu.program.front();
    prove0<role>(acpu.pc - pc);
    prove0<role>(instr - constant<role>((std::uint64_t)OP_QED << OP_OFFSET));
	// pcycles = 10;
    Protocol::nCycles = pcycles;
    std::cout << "Cycle misses: " << nmiss << '\n';
    std::cout << "Cache misses: " << ncachemiss << '\n';
    std::cout << "Main memory accesses: " << naccess << '\n';

    std::cout << "Num Cycles: " << Protocol::nCycles << '\n';
    std::cout << "Num Insts: " << instcnt << std::endl;
    std::cout << "Vector Scalar Multiplications: " <<  Protocol::choices.size() << '\n';
    std::cout << "Multiplicands: " <<  Protocol::pNumDiff << '\n';
    std::cout << "RAM Vector Scalar Multiplications: " <<  ram_ots << '\n';
    std::cout << "RAM Multiplicands: " <<  ram_multiplicands << '\n';

    /* for (const auto& s: stalls) { */
    /*   std::cerr << s << '\n'; */
    /* } */
  }


  const auto vcycles = send<role, Role::Verifier, Role::Input, std::size_t>(pcycles);

  setupHash<role>();

  dispatchRandomOts<role>();
  theChannel()->flush();

  if constexpr (role == Role::Verifier) {
		  std::cout << "DEBUG my VC = " << vcycles << std::endl;
    for (std::size_t i = 0; i < vcycles; ++i) {
      step<role>(acpu, false, powMem, i);
    }

    const auto [pc, instr, imm] = acpu.program.front();
    prove0<role>(acpu.pc - pc);
    prove0<role>(instr - constant<role>((std::uint64_t)OP_QED << OP_OFFSET));
    sendMessage(Protocol::num_ot * 16, (const char*)Protocol::vOtZerosBuffer.data());
    sendMessage(Protocol::vNumDiff * 5, Protocol::vDiffBuffer.data());
  }

  theChannel()->flush();


  if constexpr (role == Role::Prover) {
    Protocol::pOtZerosBuffer.resize(Protocol::choices.size());
    Protocol::pDiffBuffer.resize(Protocol::pNumDiff * 5);
    recvMessage(Protocol::choices.size() * 16, (char*)Protocol::pOtZerosBuffer.data());
    recvMessage(Protocol::pNumDiff * 5, Protocol::pDiffBuffer.data());

    for (std::size_t i = 0; i < Protocol::nCycles; ++i) {
      step<role>(acpu, false, powMem, i);
    }

    const auto [pc, instr, imm] = acpu.program.front();
    prove0<role>(acpu.pc - pc);
    prove0<role>(instr - constant<role>((std::uint64_t)OP_QED << OP_OFFSET));
  }

  if constexpr (role == Role::Check) {
    for (std::size_t i = 0; i < Protocol::nCycles; ++i) {
      step<role>(acpu, false, powMem, i);
    }
    const auto [pc, instr, imm] = acpu.program.front();
    prove0<role>(acpu.pc - pc);
    prove0<role>(instr - constant<role>((std::uint64_t)OP_QED << OP_OFFSET));
  }

  // check that the proof indeed matches the desired value.
}
