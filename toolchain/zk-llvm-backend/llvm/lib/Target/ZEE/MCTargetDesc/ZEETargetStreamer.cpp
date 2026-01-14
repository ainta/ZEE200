//===-- ZEETargetStreamer.cpp - ZEE Target Streamer Methods -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides ZEE specific target streamer methods.
//
//===----------------------------------------------------------------------===//

#include "ZEETargetStreamer.h"
#include "llvm/Support/FormattedStream.h"

using namespace llvm;

ZEETargetStreamer::ZEETargetStreamer(MCStreamer &S) : MCTargetStreamer(S) {}

// This part is for ascii assembly output
ZEETargetAsmStreamer::ZEETargetAsmStreamer(MCStreamer &S,
                                                 formatted_raw_ostream &OS)
    : ZEETargetStreamer(S), OS(OS) {}
