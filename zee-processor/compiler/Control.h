#ifndef CONTROL_H__
#define CONTROL_H__

#include <Reg.h>


template <typename F, typename G>
void conditional(const Reg& r, const F& f, const G& g) {
  const auto before = Program::instructions;


  ++Program::nInstructions; // skip past the conditional check
  Program::instructions = { };
  f();
  const auto branch1 = Program::instructions;
  const auto pos1 = Program::nInstructions;


  ++Program::nInstructions; // skip past the jump
  Program::instructions = { };
  g();
  const auto branch2 = Program::instructions;
  const auto pos2 = Program::nInstructions;

  Program::instructions = before;
  emit("BEQZI", r.id, pos1+1); // 1 increment skips post jump
  --Program::nInstructions; // account for earlier increment

  std::copy(branch1.begin(), branch1.end(),
      std::back_inserter(Program::instructions));

  emit("JUMPI", pos2);
  --Program::nInstructions; // account for earlier increment
  std::copy(branch2.begin(), branch2.end(),
      std::back_inserter(Program::instructions));
}


template <typename Cond, typename F, typename G>
void conditional(const Cond& c, const F& f, const G& g) {
  Reg fresh;
  fresh = c();
  conditional(fresh, f, g);
}


template <typename F>
void loop(const Reg& r, const F& f) {
  const auto before = Program::instructions;
  const auto posBefore = Program::nInstructions;

  ++Program::nInstructions; // skip past beqz
  Program::instructions = { };
  f();
  const auto body = Program::instructions;
  const auto posAfter = Program::nInstructions;

  Program::instructions = before;
  // 1 constant skips jump
  emit("BEQZI", r.id, posAfter + 1);
  --Program::nInstructions; // account for earlier increment
  std::copy(body.begin(), body.end(),
      std::back_inserter(Program::instructions));
  emit("JUMPI", posBefore);
}


template <typename Cond, typename F>
void loop(const Cond& c, const F& f) {
  const auto posBefore = Program::nInstructions;

  Reg fresh;
  fresh = c();
  const auto before = Program::instructions;

  ++Program::nInstructions; // skip past beqz
  Program::instructions = { };
  f();
  const auto body = Program::instructions;
  const auto posAfter = Program::nInstructions;

  Program::instructions = before;
  // 1 constant skips jump
  emit("BEQZI", fresh.id, posAfter + 1);
  --Program::nInstructions; // account for earlier increment
  std::copy(body.begin(), body.end(),
      std::back_inserter(Program::instructions));
  emit("JUMPI", posBefore);
}


#define IF \
  conditional([&] { return

#define THEN \
  ; } , [&] {

#define ELSE \
  }, [&] {

#define END \
  });

#define WHILE \
  loop([&] { return

#define DO \
  ; } , [&] {

#endif
