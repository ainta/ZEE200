//===-- ZEEMCExpr.cpp - ZEE specific MC expression classes --------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the implementation of the assembly expression modifiers
// accepted by the ZEE architecture
//
//===----------------------------------------------------------------------===//

#include "ZEEMCExpr.h"
#include "MCTargetDesc/ZEEAsmBackend.h"
#include "ZEE.h"
#include "ZEEFixupKinds.h"
#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCAsmLayout.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbolELF.h"
#include "llvm/MC/MCValue.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define DEBUG_TYPE "zeemcexpr"

// NOTE llvm/include/llvm/MC/MCExpr.h
// NOTE llvm/lib/MC/MCExpr.cpp

const ZEEMCExpr *ZEEMCExpr::create(const MCExpr *Expr, VariantKind Kind,
                                         MCContext &Ctx) {
  return new (Ctx) ZEEMCExpr(Expr, Kind);
}

// NOTE: definition required.
void ZEEMCExpr::printImpl(raw_ostream &OS, const MCAsmInfo *MAI) const {
  // TODO: add any target-specific formatting if needed.
  Expr->print(OS, MAI);
}

// NOTE: definition required.
bool ZEEMCExpr::evaluateAsRelocatableImpl(MCValue &Res,
                                             const MCAsmLayout *Layout,
                                             const MCFixup *Fixup) const {
  // TODO: add target-specific handling if required.
  return getSubExpr()->evaluateAsRelocatable(Res, Layout, Fixup);
}

// NOTE: definition required.
void ZEEMCExpr::visitUsedExpr(MCStreamer &Streamer) const {
  // TODO: add target-specific handling if required.
  Streamer.visitUsedExpr(*getSubExpr());
}

// TODO: likely not needed.
#if 0
ZEEMCExpr::VariantKind ZEEMCExpr::getVariantKindForName(StringRef name) {
}
#endif

// TODO: likely not needed.
#if 0
StringRef ZEEMCExpr::getVariantKindName(VariantKind Kind) {
  switch (Kind) {
  default:
    llvm_unreachable("Invalid ELF symbol kind");
  }
}
#endif

// NOTE: definition required.
void ZEEMCExpr::fixELFSymbolsInTLSFixups(MCAssembler &Asm) const {
  // TODO: add target-specific handling if required.
}
