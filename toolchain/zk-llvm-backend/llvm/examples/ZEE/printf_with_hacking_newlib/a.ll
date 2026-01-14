; ModuleID = 'a.out.0.5.precodegen.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._reent = type { i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon.0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)*, i64 (%struct._reent*, i8*, i64, i32)*, i32 (%struct._reent*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct._reent*, i32, %struct._mbstate_t, i32 }
%struct.__sbuf = type { i8*, i32 }
%struct._mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%struct.__locale_t = type { [7 x [32 x i8]], i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }
%struct.lconv = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct._Bigint = type { %struct._Bigint*, i32, i32, i32, i32, [1 x i32] }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [30 x i8*], [30 x i32] }
%struct._atexit = type { %struct._atexit*, i32, [32 x void ()*], %struct._on_exit_args }
%struct._on_exit_args = type { [32 x i8*], [32 x i8*], i32, i32 }
%struct._glue = type { %struct._glue*, i32, %struct.__sFILE* }
%struct.anon = type { i32, i8*, [26 x i8], %struct.__tm, i32, i64, %struct._rand48, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, [8 x i8], [24 x i8], i32, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, i32 }
%struct.__tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._rand48 = type { [3 x i16], [3 x i16], i16 }
%struct.malloc_chunk = type { i64, i64, %struct.malloc_chunk*, %struct.malloc_chunk* }
%struct._reent.263 = type { i32, %struct.__sFILE.254*, %struct.__sFILE.254*, %struct.__sFILE.254*, i32, [25 x i8], i32, %struct.__locale_t.256*, i32, void (%struct._reent.263*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon.0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue.262, [3 x %struct.__sFILE.254] }
%struct.__sFILE.254 = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent.263*, i8*, i8*, i32)*, i32 (%struct._reent.263*, i8*, i8*, i32)*, i64 (%struct._reent.263*, i8*, i64, i32)*, i32 (%struct._reent.263*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct._reent.263*, i32, %struct._mbstate_t, i32 }
%struct.__locale_t.256 = type { [7 x [32 x i8]], {}*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }
%struct._glue.262 = type { %struct._glue.262*, i32, %struct.__sFILE.254* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.__suio = type { %struct.__siov*, i32, i64 }
%struct.__siov = type { i8*, i64 }
%struct.stat = type { i16, i16, i32, i16, i16, i16, i16, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, [2 x i64] }
%struct.timespec = type { i64, i64 }
%struct._reent.122 = type { i32, %struct.__sFILE.114*, %struct.__sFILE.114*, %struct.__sFILE.114*, i32, [25 x i8], i32, %struct.__locale_t*, i32, {}*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon.0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue.121, [3 x %struct.__sFILE.114] }
%struct.__sFILE.114 = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent.122*, i8*, i8*, i32)*, i32 (%struct._reent.122*, i8*, i8*, i32)*, i64 (%struct._reent.122*, i8*, i64, i32)*, i32 (%struct._reent.122*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct._reent.122*, i32, %struct._mbstate_t, i32 }
%struct._glue.121 = type { %struct._glue.121*, i32, %struct.__sFILE.114* }
%struct._reent.146 = type { i32, %struct.__sFILE.138*, %struct.__sFILE.138*, %struct.__sFILE.138*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent.146*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon.0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue.145, [3 x %struct.__sFILE.138] }
%struct.__sFILE.138 = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, {}*, i32 (%struct._reent.146*, i8*, i8*, i32)*, i64 (%struct._reent.146*, i8*, i64, i32)*, i32 (%struct._reent.146*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct._reent.146*, i32, %struct._mbstate_t, i32 }
%struct._glue.145 = type { %struct._glue.145*, i32, %struct.__sFILE.138* }
%struct._reent.286 = type { i32, %struct.__sFILE.279*, %struct.__sFILE.279*, %struct.__sFILE.279*, i32, [25 x i8], i32, %struct.__locale_t.288*, i32, void (%struct._reent.286*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon.0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue.285, [3 x %struct.__sFILE.279] }
%struct.__sFILE.279 = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent.286*, i8*, i8*, i32)*, i32 (%struct._reent.286*, i8*, i8*, i32)*, i64 (%struct._reent.286*, i8*, i64, i32)*, i32 (%struct._reent.286*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct._reent.286*, i32, %struct._mbstate_t, i32 }
%struct.__locale_t.288 = type { [7 x [32 x i8]], i32 (%struct._reent.286*, i8*, i32, %struct._mbstate_t*)*, {}*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }
%struct._glue.285 = type { %struct._glue.285*, i32, %struct.__sFILE.279* }

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"hacking\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"(null)\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"0123456789ABCDEF\00", align 1
@.str.3.7 = private unnamed_addr constant [26 x i8] c"bug in vfprintf: bad base\00", align 1
@_vfprintf_r.blanks = internal constant [16 x i8] c"                ", align 16
@_vfprintf_r.zeroes = internal constant [16 x i8] c"0000000000000000", align 16
@_impure_ptr = internal unnamed_addr constant %struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), align 8
@impure_data = internal global { i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] } { i32 0, %struct.__sFILE* bitcast (i8* getelementptr (i8, i8* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to i8*), i64 1336) to %struct.__sFILE*), %struct.__sFILE* bitcast (i8* getelementptr (i8, i8* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to i8*), i64 1512) to %struct.__sFILE*), %struct.__sFILE* bitcast (i8* getelementptr (i8, i8* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to i8*), i64 1688) to %struct.__sFILE*), i32 0, [25 x i8] zeroinitializer, i32 0, %struct.__locale_t* null, i32 0, void (%struct._reent*)* null, %struct._Bigint* null, i32 0, %struct._Bigint* null, %struct._Bigint** null, i32 0, i8* null, { %struct.anon, [144 x i8] } { %struct.anon { i32 0, i8* null, [26 x i8] zeroinitializer, %struct.__tm zeroinitializer, i32 0, i64 1, %struct._rand48 { [3 x i16] [i16 13070, i16 -21555, i16 4660], [3 x i16] [i16 -6547, i16 -8468, i16 5], i16 11 }, %struct._mbstate_t zeroinitializer, %struct._mbstate_t zeroinitializer, %struct._mbstate_t zeroinitializer, [8 x i8] zeroinitializer, [24 x i8] zeroinitializer, i32 0, %struct._mbstate_t zeroinitializer, %struct._mbstate_t zeroinitializer, %struct._mbstate_t zeroinitializer, %struct._mbstate_t zeroinitializer, %struct._mbstate_t zeroinitializer, i32 0 }, [144 x i8] undef }, %struct._atexit* null, %struct._atexit zeroinitializer, void (i32)** null, %struct._glue zeroinitializer, [3 x %struct.__sFILE] zeroinitializer }, align 8
@__malloc_av_ = internal global [258 x %struct.malloc_chunk*] [%struct.malloc_chunk* null, %struct.malloc_chunk* null, %struct.malloc_chunk* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 16) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 16) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 32) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 32) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 48) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 48) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 64) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 64) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 80) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 80) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 96) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 96) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 112) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 112) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 128) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 128) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 144) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 144) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 160) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 160) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 176) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 176) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 192) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 192) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 208) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 208) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 224) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 224) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 240) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 240) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 256) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 256) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 272) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 272) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 288) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 288) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 304) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 304) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 320) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 320) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 336) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 336) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 352) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 352) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 368) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 368) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 384) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 384) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 400) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 400) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 416) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 416) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 432) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 432) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 448) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 448) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 464) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 464) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 480) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 480) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 496) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 496) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 512) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 512) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 528) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 528) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 544) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 544) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 560) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 560) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 576) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 576) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 592) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 592) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 608) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 608) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 624) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 624) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 640) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 640) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 656) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 656) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 672) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 672) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 688) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 688) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 704) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 704) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 720) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 720) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 736) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 736) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 752) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 752) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 768) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 768) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 784) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 784) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 800) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 800) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 816) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 816) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 832) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 832) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 848) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 848) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 864) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 864) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 880) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 880) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 896) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 896) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 912) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 912) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 928) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 928) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 944) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 944) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 960) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 960) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 976) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 976) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 992) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 992) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1008) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1008) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1024) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1024) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1040) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1040) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1056) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1056) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1072) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1072) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1088) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1088) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1104) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1104) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1120) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1120) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1136) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1136) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1152) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1152) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1168) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1168) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1184) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1184) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1200) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1200) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1216) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1216) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1232) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1232) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1248) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1248) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1264) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1264) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1280) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1280) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1296) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1296) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1312) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1312) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1328) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1328) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1344) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1344) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1360) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1360) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1376) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1376) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1392) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1392) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1408) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1408) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1424) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1424) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1440) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1440) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1456) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1456) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1472) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1472) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1488) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1488) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1504) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1504) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1520) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1520) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1536) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1536) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1552) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1552) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1568) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1568) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1584) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1584) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1600) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1600) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1616) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1616) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1632) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1632) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1648) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1648) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1664) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1664) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1680) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1680) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1696) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1696) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1712) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1712) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1728) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1728) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1744) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1744) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1760) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1760) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1776) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1776) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1792) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1792) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1808) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1808) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1824) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1824) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1840) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1840) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1856) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1856) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1872) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1872) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1888) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1888) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1904) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1904) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1920) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1920) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1936) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1936) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1952) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1952) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1968) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1968) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1984) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 1984) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 2000) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 2000) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 2016) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 2016) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 2032) to %struct.malloc_chunk*), %struct.malloc_chunk* bitcast (i8* getelementptr (i8, i8* bitcast ([258 x %struct.malloc_chunk*]* @__malloc_av_ to i8*), i64 2032) to %struct.malloc_chunk*)], align 16
@__malloc_sbrk_base = internal unnamed_addr global i8* inttoptr (i64 -1 to i8*), align 8
@__malloc_max_sbrked_mem = internal unnamed_addr global i64 0, align 8
@__malloc_max_total_mem = internal unnamed_addr global i64 0, align 8
@.str.2.75 = private unnamed_addr constant [6 x i8] c"POSIX\00", align 1
@.str.3.76 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.1.77 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__global_locale = internal unnamed_addr constant { [7 x [32 x i8]], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] } { [7 x [32 x i8]] [[32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)* @__ascii_wctomb, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)* bitcast (i32 (%struct._reent.286*, i32*, i8*, i64, %struct._mbstate_t*)* @__ascii_mbtowc to i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*), i32 0, i8* getelementptr inbounds ([0 x i8], [0 x i8]* bitcast (<{ [256 x i8], [128 x i8] }>* @_ctype_b to [0 x i8]*), i32 0, i64 127), %struct.lconv { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.80, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i32 0, i32 0), i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127, i8 127 }, [2 x i8] c"\01\00", [32 x i8] c"ASCII\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"ASCII\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 8
@.str.80 = private unnamed_addr constant [2 x i8] c".\00", align 1
@errno = common dso_local local_unnamed_addr global i32 0, align 4
@_ctype_b = internal constant <{ [256 x i8], [128 x i8] }> <{ [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00         (((((                  \88\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\04\04\04\04\04\04\04\04\04\04\10\10\10\10\10\10\10AAAAAA\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\10\10\10\10\10\10BBBBBB\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\10\10\10\10 ", [128 x i8] zeroinitializer }>, align 16
@__malloc_current_mallinfo.0 = internal unnamed_addr global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 123, i32 9999)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @printf(i8* noalias %fmt, ...) local_unnamed_addr #1 {
entry:
  %fmt.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %ptr = alloca %struct._reent*, align 8
  store i8* %fmt, i8** %fmt.addr, align 8
  store %struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct._reent** %ptr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._reent*, %struct._reent** %ptr, align 8
  %1 = load %struct._reent*, %struct._reent** %ptr, align 8
  %_stdout = getelementptr inbounds %struct._reent, %struct._reent* %1, i32 0, i32 2
  %2 = load %struct.__sFILE*, %struct.__sFILE** %_stdout, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %call = call fastcc i32 @_vfprintf_r(%struct._reent* %0, %struct.__sFILE* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), %struct.__va_list_tag* %arraydecay2) #4
  store i32 %call, i32* %ret, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  %3 = load i32, i32* %ret, align 4
  ret i32 %3
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vfprintf(%struct.__sFILE* %fp, i8* %fmt0, %struct.__va_list_tag* %ap) local_unnamed_addr #1 {
entry:
  %fp.addr = alloca %struct.__sFILE*, align 8
  %fmt0.addr = alloca i8*, align 8
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  %result = alloca i32, align 4
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store i8* %fmt0, i8** %fmt0.addr, align 8
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %1 = load i8*, i8** %fmt0.addr, align 8
  %2 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %call = call fastcc i32 @_vfprintf_r(%struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct.__sFILE* %0, i8* %1, %struct.__va_list_tag* %2) #4
  store i32 %call, i32* %result, align 4
  %3 = load i32, i32* %result, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @_vfprintf_r(%struct._reent* %data, %struct.__sFILE* %fp, i8* %fmt0, %struct.__va_list_tag* %ap) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %data.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %fmt0.addr = alloca i8*, align 8
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  %fmt = alloca i8*, align 8
  %ch = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %cp = alloca i8*, align 8
  %flags = alloca i32, align 4
  %fmt_anchor = alloca i8*, align 8
  %ret = alloca i32, align 4
  %width = alloca i32, align 4
  %prec = alloca i32, align 4
  %sign = alloca i8, align 1
  %_uquad = alloca i64, align 8
  %base = alloca i32, align 4
  %dprec = alloca i32, align 4
  %realsz = alloca i32, align 4
  %size = alloca i32, align 4
  %xdigs = alloca i8*, align 8
  %uio = alloca %struct.__suio, align 8
  %iov = alloca [8 x %struct.__siov], align 16
  %iovp = alloca %struct.__siov*, align 8
  %buf = alloca [40 x i8], align 16
  %ox = alloca [2 x i8], align 1
  %malloc_buf = alloca i8*, align 8
  %_check_init_ptr = alloca %struct._reent*, align 8
  %p = alloca i8*, align 8
  store %struct._reent* %data, %struct._reent** %data.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store i8* %fmt0, i8** %fmt0.addr, align 8
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  store i8* null, i8** %xdigs, align 8
  store i8* null, i8** %malloc_buf, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct._reent*, %struct._reent** %data.addr, align 8
  store %struct._reent* %0, %struct._reent** %_check_init_ptr, align 8
  %1 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %tobool = icmp ne %struct._reent* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %2 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %2, i32 0, i32 8
  %3 = load i32, i32* %__sdidinit, align 8
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  call fastcc void @__sinit(%struct._reent* %4) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 23
  %6 = load i32, i32* %_flags2, align 4
  %and = and i32 %6, 1
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.end6, label %if.then3

if.then3:                                         ; preds = %do.end
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %7, i32 0, i32 3
  %8 = load i16, i16* %_flags, align 8
  %conv = sext i16 %8 to i32
  %and4 = and i32 %conv, 512
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then3
  br label %cond.end

cond.false:                                       ; preds = %if.then3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  br label %if.end6

if.end6:                                          ; preds = %cond.end, %do.end
  br label %do.body7

do.body7:                                         ; preds = %if.end6
  %9 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags8 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %9, i32 0, i32 3
  %10 = load i16, i16* %_flags8, align 8
  %conv9 = sext i16 %10 to i32
  %and10 = and i32 %conv9, 8192
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.end18, label %if.then12

if.then12:                                        ; preds = %do.body7
  %11 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags13 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %11, i32 0, i32 3
  %12 = load i16, i16* %_flags13, align 8
  %conv14 = sext i16 %12 to i32
  %or = or i32 %conv14, 8192
  %conv15 = trunc i32 %or to i16
  store i16 %conv15, i16* %_flags13, align 8
  %13 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags216 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %13, i32 0, i32 23
  %14 = load i32, i32* %_flags216, align 4
  %and17 = and i32 %14, -8193
  store i32 %and17, i32* %_flags216, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then12, %do.body7
  br label %do.end19

do.end19:                                         ; preds = %if.end18
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags20 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 3
  %16 = load i16, i16* %_flags20, align 8
  %conv21 = sext i16 %16 to i32
  %and22 = and i32 %conv21, 8
  %cmp = icmp eq i32 %and22, 0
  br i1 %cmp, label %land.lhs.true26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end19
  %17 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %17, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  %18 = load i8*, i8** %_base, align 8
  %cmp24 = icmp eq i8* %18, null
  br i1 %cmp24, label %land.lhs.true26, label %if.end41

land.lhs.true26:                                  ; preds = %lor.lhs.false, %do.end19
  %19 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %20 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__swsetup_r(%struct._reent* %19, %struct.__sFILE* %20) #4
  %tobool27 = icmp ne i32 %call, 0
  br i1 %tobool27, label %if.then28, label %if.end41

if.then28:                                        ; preds = %land.lhs.true26
  %21 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags229 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %21, i32 0, i32 23
  %22 = load i32, i32* %_flags229, align 4
  %and30 = and i32 %22, 1
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %if.end40, label %if.then32

if.then32:                                        ; preds = %if.then28
  %23 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags33 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %23, i32 0, i32 3
  %24 = load i16, i16* %_flags33, align 8
  %conv34 = sext i16 %24 to i32
  %and35 = and i32 %conv34, 512
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %cond.true37, label %cond.false38

cond.true37:                                      ; preds = %if.then32
  br label %cond.end39

cond.false38:                                     ; preds = %if.then32
  br label %cond.end39

cond.end39:                                       ; preds = %cond.false38, %cond.true37
  br label %if.end40

if.end40:                                         ; preds = %cond.end39, %if.then28
  store i32 -1, i32* %retval, align 4
  br label %return

if.end41:                                         ; preds = %land.lhs.true26, %lor.lhs.false
  %25 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags42 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %25, i32 0, i32 3
  %26 = load i16, i16* %_flags42, align 8
  %conv43 = sext i16 %26 to i32
  %and44 = and i32 %conv43, 26
  %cmp45 = icmp eq i32 %and44, 10
  br i1 %cmp45, label %land.lhs.true47, label %if.end65

land.lhs.true47:                                  ; preds = %if.end41
  %27 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_file = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %27, i32 0, i32 4
  %28 = load i16, i16* %_file, align 2
  %conv48 = sext i16 %28 to i32
  %cmp49 = icmp sge i32 %conv48, 0
  br i1 %cmp49, label %if.then51, label %if.end65

if.then51:                                        ; preds = %land.lhs.true47
  %29 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags252 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %29, i32 0, i32 23
  %30 = load i32, i32* %_flags252, align 4
  %and53 = and i32 %30, 1
  %tobool54 = icmp ne i32 %and53, 0
  br i1 %tobool54, label %if.end63, label %if.then55

if.then55:                                        ; preds = %if.then51
  %31 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags56 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %31, i32 0, i32 3
  %32 = load i16, i16* %_flags56, align 8
  %conv57 = sext i16 %32 to i32
  %and58 = and i32 %conv57, 512
  %tobool59 = icmp ne i32 %and58, 0
  br i1 %tobool59, label %cond.true60, label %cond.false61

cond.true60:                                      ; preds = %if.then55
  br label %cond.end62

cond.false61:                                     ; preds = %if.then55
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false61, %cond.true60
  br label %if.end63

if.end63:                                         ; preds = %cond.end62, %if.then51
  %33 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %34 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %35 = load i8*, i8** %fmt0.addr, align 8
  %36 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %call64 = call fastcc i32 @__sbprintf(%struct._reent* %33, %struct.__sFILE* %34, i8* %35, %struct.__va_list_tag* %36) #4
  store i32 %call64, i32* %retval, align 4
  br label %return

if.end65:                                         ; preds = %land.lhs.true47, %if.end41
  %37 = load i8*, i8** %fmt0.addr, align 8
  store i8* %37, i8** %fmt, align 8
  %arraydecay = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay, %struct.__siov** %iovp, align 8
  %uio_iov = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 0
  store %struct.__siov* %arraydecay, %struct.__siov** %uio_iov, align 8
  %uio_resid = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  store i64 0, i64* %uio_resid, align 8
  %uio_iovcnt = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  store i32 0, i32* %uio_iovcnt, align 8
  store i32 0, i32* %ret, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.cond.backedge, %if.end65
  %38 = load i8*, i8** %fmt, align 8
  store i8* %38, i8** %cp, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.cond
  %39 = load i8*, i8** %fmt, align 8
  %40 = load i8, i8* %39, align 1
  %conv66 = sext i8 %40 to i32
  %cmp67 = icmp ne i32 %conv66, 0
  br i1 %cmp67, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %41 = load i8*, i8** %fmt, align 8
  %42 = load i8, i8* %41, align 1
  %conv69 = sext i8 %42 to i32
  %cmp70 = icmp ne i32 %conv69, 37
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %43 = phi i1 [ false, %while.cond ], [ %cmp70, %land.rhs ]
  br i1 %43, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %44 = load i8*, i8** %fmt, align 8
  %add.ptr = getelementptr inbounds i8, i8* %44, i64 1
  store i8* %add.ptr, i8** %fmt, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %45 = load i8*, i8** %fmt, align 8
  %46 = load i8*, i8** %cp, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %45 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %46 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv72 = trunc i64 %sub.ptr.sub to i32
  store i32 %conv72, i32* %m, align 4
  %cmp73 = icmp ne i32 %conv72, 0
  br i1 %cmp73, label %if.then75, label %if.end90

if.then75:                                        ; preds = %while.end
  %47 = load i8*, i8** %cp, align 8
  %48 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base = getelementptr inbounds %struct.__siov, %struct.__siov* %48, i32 0, i32 0
  store i8* %47, i8** %iov_base, align 8
  %49 = load i32, i32* %m, align 4
  %conv76 = sext i32 %49 to i64
  %50 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len = getelementptr inbounds %struct.__siov, %struct.__siov* %50, i32 0, i32 1
  store i64 %conv76, i64* %iov_len, align 8
  %51 = load i32, i32* %m, align 4
  %conv77 = sext i32 %51 to i64
  %uio_resid78 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %52 = load i64, i64* %uio_resid78, align 8
  %add = add i64 %52, %conv77
  store i64 %add, i64* %uio_resid78, align 8
  %53 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr = getelementptr inbounds %struct.__siov, %struct.__siov* %53, i32 1
  store %struct.__siov* %incdec.ptr, %struct.__siov** %iovp, align 8
  %uio_iovcnt79 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %54 = load i32, i32* %uio_iovcnt79, align 8
  %inc = add nsw i32 %54, 1
  store i32 %inc, i32* %uio_iovcnt79, align 8
  %cmp80 = icmp sge i32 %inc, 8
  br i1 %cmp80, label %if.then82, label %if.end88

if.then82:                                        ; preds = %if.then75
  %55 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %56 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call83 = call fastcc i32 @__sprint_r(%struct._reent* %55, %struct.__sFILE* %56, %struct.__suio* %uio) #4
  %tobool84 = icmp ne i32 %call83, 0
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.then82
  br label %error

if.end86:                                         ; preds = %if.then82
  %arraydecay87 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay87, %struct.__siov** %iovp, align 8
  br label %if.end88

if.end88:                                         ; preds = %if.end86, %if.then75
  %57 = load i32, i32* %m, align 4
  %58 = load i32, i32* %ret, align 4
  %add89 = add nsw i32 %58, %57
  store i32 %add89, i32* %ret, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.end88, %while.end
  %59 = load i8*, i8** %fmt, align 8
  %60 = load i8, i8* %59, align 1
  %conv91 = sext i8 %60 to i32
  %cmp92 = icmp eq i32 %conv91, 0
  br i1 %cmp92, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end90
  br label %done

if.end95:                                         ; preds = %if.end90
  %61 = load i8*, i8** %fmt, align 8
  store i8* %61, i8** %fmt_anchor, align 8
  %62 = load i8*, i8** %fmt, align 8
  %incdec.ptr96 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr96, i8** %fmt, align 8
  store i32 0, i32* %flags, align 4
  store i32 0, i32* %dprec, align 4
  store i32 0, i32* %width, align 4
  store i32 -1, i32* %prec, align 4
  store i8 0, i8* %sign, align 1
  br label %rflag

rflag:                                            ; preds = %rflag.backedge, %if.end95
  %63 = load i8*, i8** %fmt, align 8
  %incdec.ptr97 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %incdec.ptr97, i8** %fmt, align 8
  %64 = load i8, i8* %63, align 1
  %conv98 = sext i8 %64 to i32
  store i32 %conv98, i32* %ch, align 4
  br label %reswitch

reswitch:                                         ; preds = %reswitch.backedge, %rflag
  %65 = load i32, i32* %ch, align 4
  switch i32 %65, label %sw.default651 [
    i32 32, label %sw.bb
    i32 35, label %sw.bb102
    i32 42, label %sw.bb104
    i32 45, label %sw.bb109.loopexit
    i32 43, label %sw.bb111
    i32 46, label %sw.bb112
    i32 48, label %sw.bb149
    i32 49, label %sw.bb151
    i32 50, label %sw.bb151
    i32 51, label %sw.bb151
    i32 52, label %sw.bb151
    i32 53, label %sw.bb151
    i32 54, label %sw.bb151
    i32 55, label %sw.bb151
    i32 56, label %sw.bb151
    i32 57, label %sw.bb151
    i32 104, label %sw.bb162
    i32 108, label %sw.bb164
    i32 113, label %sw.bb166
    i32 99, label %sw.bb168
    i32 68, label %sw.bb182
    i32 100, label %sw.bb184.loopexit
    i32 105, label %sw.bb184.loopexit
    i32 110, label %sw.bb257
    i32 79, label %sw.bb302
    i32 111, label %sw.bb304.loopexit
    i32 112, label %sw.bb372
    i32 115, label %sw.bb386
    i32 85, label %sw.bb427
    i32 117, label %sw.bb429.loopexit
    i32 88, label %sw.bb497
    i32 120, label %sw.bb498
  ]

sw.bb:                                            ; preds = %reswitch
  %66 = load i8, i8* %sign, align 1
  %tobool99 = icmp ne i8 %66, 0
  br i1 %tobool99, label %if.end101, label %if.then100

if.then100:                                       ; preds = %sw.bb
  store i8 32, i8* %sign, align 1
  br label %if.end101

if.end101:                                        ; preds = %if.then100, %sw.bb
  br label %rflag.backedge

rflag.backedge:                                   ; preds = %sw.bb166, %sw.bb164, %sw.bb162, %sw.bb149, %if.end132, %sw.bb111, %sw.bb109, %if.then107, %sw.bb102, %if.end101
  br label %rflag

sw.bb102:                                         ; preds = %reswitch
  %67 = load i32, i32* %flags, align 4
  %or103 = or i32 %67, 1
  store i32 %or103, i32* %flags, align 4
  br label %rflag.backedge

sw.bb104:                                         ; preds = %reswitch
  %68 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %68, i32 0, i32 0
  %gp_offset = load i32, i32* %gp_offset_p, align 8
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb104
  %69 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %68, i32 0, i32 3
  %reg_save_area = load i8*, i8** %69, align 8
  %70 = getelementptr i8, i8* %reg_save_area, i32 %gp_offset
  %71 = bitcast i8* %70 to i32*
  %72 = add i32 %gp_offset, 8
  store i32 %72, i32* %gp_offset_p, align 8
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb104
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %68, i32 0, i32 2
  %overflow_arg_area = load i8*, i8** %overflow_arg_area_p, align 8
  %73 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8, i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %71, %vaarg.in_reg ], [ %73, %vaarg.in_mem ]
  %74 = load i32, i32* %vaarg.addr, align 4
  store i32 %74, i32* %width, align 4
  %75 = load i32, i32* %width, align 4
  %cmp105 = icmp sge i32 %75, 0
  br i1 %cmp105, label %if.then107, label %if.end108

if.then107:                                       ; preds = %vaarg.end
  br label %rflag.backedge

if.end108:                                        ; preds = %vaarg.end
  %76 = load i32, i32* %width, align 4
  %sub = sub nsw i32 0, %76
  store i32 %sub, i32* %width, align 4
  br label %sw.bb109

sw.bb109.loopexit:                                ; preds = %reswitch
  br label %sw.bb109

sw.bb109:                                         ; preds = %sw.bb109.loopexit, %if.end108
  %77 = load i32, i32* %flags, align 4
  %or110 = or i32 %77, 4
  store i32 %or110, i32* %flags, align 4
  br label %rflag.backedge

sw.bb111:                                         ; preds = %reswitch
  store i8 43, i8* %sign, align 1
  br label %rflag.backedge

sw.bb112:                                         ; preds = %reswitch
  %78 = load i8*, i8** %fmt, align 8
  %incdec.ptr113 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %incdec.ptr113, i8** %fmt, align 8
  %79 = load i8, i8* %78, align 1
  %conv114 = sext i8 %79 to i32
  store i32 %conv114, i32* %ch, align 4
  %cmp115 = icmp eq i32 %conv114, 42
  br i1 %cmp115, label %if.then117, label %if.end133

if.then117:                                       ; preds = %sw.bb112
  %80 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p118 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 0
  %gp_offset119 = load i32, i32* %gp_offset_p118, align 8
  %fits_in_gp120 = icmp ule i32 %gp_offset119, 40
  br i1 %fits_in_gp120, label %vaarg.in_reg121, label %vaarg.in_mem123

vaarg.in_reg121:                                  ; preds = %if.then117
  %81 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 3
  %reg_save_area122 = load i8*, i8** %81, align 8
  %82 = getelementptr i8, i8* %reg_save_area122, i32 %gp_offset119
  %83 = bitcast i8* %82 to i32*
  %84 = add i32 %gp_offset119, 8
  store i32 %84, i32* %gp_offset_p118, align 8
  br label %vaarg.end127

vaarg.in_mem123:                                  ; preds = %if.then117
  %overflow_arg_area_p124 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 2
  %overflow_arg_area125 = load i8*, i8** %overflow_arg_area_p124, align 8
  %85 = bitcast i8* %overflow_arg_area125 to i32*
  %overflow_arg_area.next126 = getelementptr i8, i8* %overflow_arg_area125, i32 8
  store i8* %overflow_arg_area.next126, i8** %overflow_arg_area_p124, align 8
  br label %vaarg.end127

vaarg.end127:                                     ; preds = %vaarg.in_mem123, %vaarg.in_reg121
  %vaarg.addr128 = phi i32* [ %83, %vaarg.in_reg121 ], [ %85, %vaarg.in_mem123 ]
  %86 = load i32, i32* %vaarg.addr128, align 4
  store i32 %86, i32* %prec, align 4
  %87 = load i32, i32* %prec, align 4
  %cmp129 = icmp slt i32 %87, 0
  br i1 %cmp129, label %if.then131, label %if.end132

if.then131:                                       ; preds = %vaarg.end127
  store i32 -1, i32* %prec, align 4
  br label %if.end132

if.end132:                                        ; preds = %if.then131, %vaarg.end127
  br label %rflag.backedge

if.end133:                                        ; preds = %sw.bb112
  store i32 0, i32* %n, align 4
  br label %while.cond134

while.cond134:                                    ; preds = %while.body138, %if.end133
  %88 = load i32, i32* %ch, align 4
  %sub135 = sub nsw i32 %88, 48
  %cmp136 = icmp ule i32 %sub135, 9
  br i1 %cmp136, label %while.body138, label %while.end143

while.body138:                                    ; preds = %while.cond134
  %89 = load i32, i32* %n, align 4
  %mul = mul nsw i32 10, %89
  %90 = load i32, i32* %ch, align 4
  %sub139 = sub nsw i32 %90, 48
  %add140 = add nsw i32 %mul, %sub139
  store i32 %add140, i32* %n, align 4
  %91 = load i8*, i8** %fmt, align 8
  %incdec.ptr141 = getelementptr inbounds i8, i8* %91, i32 1
  store i8* %incdec.ptr141, i8** %fmt, align 8
  %92 = load i8, i8* %91, align 1
  %conv142 = sext i8 %92 to i32
  store i32 %conv142, i32* %ch, align 4
  br label %while.cond134

while.end143:                                     ; preds = %while.cond134
  %93 = load i32, i32* %n, align 4
  %cmp144 = icmp slt i32 %93, 0
  br i1 %cmp144, label %cond.true146, label %cond.false147

cond.true146:                                     ; preds = %while.end143
  br label %cond.end148

cond.false147:                                    ; preds = %while.end143
  %94 = load i32, i32* %n, align 4
  br label %cond.end148

cond.end148:                                      ; preds = %cond.false147, %cond.true146
  %cond = phi i32 [ -1, %cond.true146 ], [ %94, %cond.false147 ]
  store i32 %cond, i32* %prec, align 4
  br label %reswitch.backedge

reswitch.backedge:                                ; preds = %do.end161, %cond.end148
  br label %reswitch

sw.bb149:                                         ; preds = %reswitch
  %95 = load i32, i32* %flags, align 4
  %or150 = or i32 %95, 128
  store i32 %or150, i32* %flags, align 4
  br label %rflag.backedge

sw.bb151:                                         ; preds = %reswitch, %reswitch, %reswitch, %reswitch, %reswitch, %reswitch, %reswitch, %reswitch, %reswitch
  store i32 0, i32* %n, align 4
  br label %do.body152

do.body152:                                       ; preds = %do.cond, %sw.bb151
  %96 = load i32, i32* %n, align 4
  %mul153 = mul nsw i32 10, %96
  %97 = load i32, i32* %ch, align 4
  %sub154 = sub nsw i32 %97, 48
  %add155 = add nsw i32 %mul153, %sub154
  store i32 %add155, i32* %n, align 4
  %98 = load i8*, i8** %fmt, align 8
  %incdec.ptr156 = getelementptr inbounds i8, i8* %98, i32 1
  store i8* %incdec.ptr156, i8** %fmt, align 8
  %99 = load i8, i8* %98, align 1
  %conv157 = sext i8 %99 to i32
  store i32 %conv157, i32* %ch, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body152
  %100 = load i32, i32* %ch, align 4
  %sub158 = sub nsw i32 %100, 48
  %cmp159 = icmp ule i32 %sub158, 9
  br i1 %cmp159, label %do.body152, label %do.end161

do.end161:                                        ; preds = %do.cond
  %101 = load i32, i32* %n, align 4
  store i32 %101, i32* %width, align 4
  br label %reswitch.backedge

sw.bb162:                                         ; preds = %reswitch
  %102 = load i32, i32* %flags, align 4
  %or163 = or i32 %102, 64
  store i32 %or163, i32* %flags, align 4
  br label %rflag.backedge

sw.bb164:                                         ; preds = %reswitch
  %103 = load i32, i32* %flags, align 4
  %or165 = or i32 %103, 16
  store i32 %or165, i32* %flags, align 4
  br label %rflag.backedge

sw.bb166:                                         ; preds = %reswitch
  %104 = load i32, i32* %flags, align 4
  %or167 = or i32 %104, 16
  store i32 %or167, i32* %flags, align 4
  br label %rflag.backedge

sw.bb168:                                         ; preds = %reswitch
  %arraydecay169 = getelementptr inbounds [40 x i8], [40 x i8]* %buf, i64 0, i64 0
  store i8* %arraydecay169, i8** %cp, align 8
  %105 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p170 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %105, i32 0, i32 0
  %gp_offset171 = load i32, i32* %gp_offset_p170, align 8
  %fits_in_gp172 = icmp ule i32 %gp_offset171, 40
  br i1 %fits_in_gp172, label %vaarg.in_reg173, label %vaarg.in_mem175

vaarg.in_reg173:                                  ; preds = %sw.bb168
  %106 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %105, i32 0, i32 3
  %reg_save_area174 = load i8*, i8** %106, align 8
  %107 = getelementptr i8, i8* %reg_save_area174, i32 %gp_offset171
  %108 = bitcast i8* %107 to i32*
  %109 = add i32 %gp_offset171, 8
  store i32 %109, i32* %gp_offset_p170, align 8
  br label %vaarg.end179

vaarg.in_mem175:                                  ; preds = %sw.bb168
  %overflow_arg_area_p176 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %105, i32 0, i32 2
  %overflow_arg_area177 = load i8*, i8** %overflow_arg_area_p176, align 8
  %110 = bitcast i8* %overflow_arg_area177 to i32*
  %overflow_arg_area.next178 = getelementptr i8, i8* %overflow_arg_area177, i32 8
  store i8* %overflow_arg_area.next178, i8** %overflow_arg_area_p176, align 8
  br label %vaarg.end179

vaarg.end179:                                     ; preds = %vaarg.in_mem175, %vaarg.in_reg173
  %vaarg.addr180 = phi i32* [ %108, %vaarg.in_reg173 ], [ %110, %vaarg.in_mem175 ]
  %111 = load i32, i32* %vaarg.addr180, align 4
  %conv181 = trunc i32 %111 to i8
  %112 = load i8*, i8** %cp, align 8
  store i8 %conv181, i8* %112, align 1
  store i32 1, i32* %size, align 4
  store i8 0, i8* %sign, align 1
  br label %sw.epilog658

sw.bb182:                                         ; preds = %reswitch
  %113 = load i32, i32* %flags, align 4
  %or183 = or i32 %113, 16
  store i32 %or183, i32* %flags, align 4
  br label %sw.bb184

sw.bb184.loopexit:                                ; preds = %reswitch, %reswitch
  br label %sw.bb184

sw.bb184:                                         ; preds = %sw.bb184.loopexit, %sw.bb182
  %114 = load i32, i32* %flags, align 4
  %and185 = and i32 %114, 16
  %tobool186 = icmp ne i32 %and185, 0
  br i1 %tobool186, label %cond.true187, label %cond.false199

cond.true187:                                     ; preds = %sw.bb184
  %115 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p188 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %115, i32 0, i32 0
  %gp_offset189 = load i32, i32* %gp_offset_p188, align 8
  %fits_in_gp190 = icmp ule i32 %gp_offset189, 40
  br i1 %fits_in_gp190, label %vaarg.in_reg191, label %vaarg.in_mem193

vaarg.in_reg191:                                  ; preds = %cond.true187
  %116 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %115, i32 0, i32 3
  %reg_save_area192 = load i8*, i8** %116, align 8
  %117 = getelementptr i8, i8* %reg_save_area192, i32 %gp_offset189
  %118 = bitcast i8* %117 to i64*
  %119 = add i32 %gp_offset189, 8
  store i32 %119, i32* %gp_offset_p188, align 8
  br label %vaarg.end197

vaarg.in_mem193:                                  ; preds = %cond.true187
  %overflow_arg_area_p194 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %115, i32 0, i32 2
  %overflow_arg_area195 = load i8*, i8** %overflow_arg_area_p194, align 8
  %120 = bitcast i8* %overflow_arg_area195 to i64*
  %overflow_arg_area.next196 = getelementptr i8, i8* %overflow_arg_area195, i32 8
  store i8* %overflow_arg_area.next196, i8** %overflow_arg_area_p194, align 8
  br label %vaarg.end197

vaarg.end197:                                     ; preds = %vaarg.in_mem193, %vaarg.in_reg191
  %vaarg.addr198 = phi i64* [ %118, %vaarg.in_reg191 ], [ %120, %vaarg.in_mem193 ]
  %121 = load i64, i64* %vaarg.addr198, align 8
  br label %cond.end250

cond.false199:                                    ; preds = %sw.bb184
  %122 = load i32, i32* %flags, align 4
  %and200 = and i32 %122, 64
  %tobool201 = icmp ne i32 %and200, 0
  br i1 %tobool201, label %cond.true202, label %cond.false216

cond.true202:                                     ; preds = %cond.false199
  %123 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p203 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %123, i32 0, i32 0
  %gp_offset204 = load i32, i32* %gp_offset_p203, align 8
  %fits_in_gp205 = icmp ule i32 %gp_offset204, 40
  br i1 %fits_in_gp205, label %vaarg.in_reg206, label %vaarg.in_mem208

vaarg.in_reg206:                                  ; preds = %cond.true202
  %124 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %123, i32 0, i32 3
  %reg_save_area207 = load i8*, i8** %124, align 8
  %125 = getelementptr i8, i8* %reg_save_area207, i32 %gp_offset204
  %126 = bitcast i8* %125 to i32*
  %127 = add i32 %gp_offset204, 8
  store i32 %127, i32* %gp_offset_p203, align 8
  br label %vaarg.end212

vaarg.in_mem208:                                  ; preds = %cond.true202
  %overflow_arg_area_p209 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %123, i32 0, i32 2
  %overflow_arg_area210 = load i8*, i8** %overflow_arg_area_p209, align 8
  %128 = bitcast i8* %overflow_arg_area210 to i32*
  %overflow_arg_area.next211 = getelementptr i8, i8* %overflow_arg_area210, i32 8
  store i8* %overflow_arg_area.next211, i8** %overflow_arg_area_p209, align 8
  br label %vaarg.end212

vaarg.end212:                                     ; preds = %vaarg.in_mem208, %vaarg.in_reg206
  %vaarg.addr213 = phi i32* [ %126, %vaarg.in_reg206 ], [ %128, %vaarg.in_mem208 ]
  %129 = load i32, i32* %vaarg.addr213, align 4
  %conv214 = trunc i32 %129 to i16
  %conv215 = sext i16 %conv214 to i64
  br label %cond.end248

cond.false216:                                    ; preds = %cond.false199
  %130 = load i32, i32* %flags, align 4
  br label %cond.false233

cond.false233:                                    ; preds = %cond.false216
  %131 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p234 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %131, i32 0, i32 0
  %gp_offset235 = load i32, i32* %gp_offset_p234, align 8
  %fits_in_gp236 = icmp ule i32 %gp_offset235, 40
  br i1 %fits_in_gp236, label %vaarg.in_reg237, label %vaarg.in_mem239

vaarg.in_reg237:                                  ; preds = %cond.false233
  %132 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %131, i32 0, i32 3
  %reg_save_area238 = load i8*, i8** %132, align 8
  %133 = getelementptr i8, i8* %reg_save_area238, i32 %gp_offset235
  %134 = bitcast i8* %133 to i32*
  %135 = add i32 %gp_offset235, 8
  store i32 %135, i32* %gp_offset_p234, align 8
  br label %vaarg.end243

vaarg.in_mem239:                                  ; preds = %cond.false233
  %overflow_arg_area_p240 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %131, i32 0, i32 2
  %overflow_arg_area241 = load i8*, i8** %overflow_arg_area_p240, align 8
  %136 = bitcast i8* %overflow_arg_area241 to i32*
  %overflow_arg_area.next242 = getelementptr i8, i8* %overflow_arg_area241, i32 8
  store i8* %overflow_arg_area.next242, i8** %overflow_arg_area_p240, align 8
  br label %vaarg.end243

vaarg.end243:                                     ; preds = %vaarg.in_mem239, %vaarg.in_reg237
  %vaarg.addr244 = phi i32* [ %134, %vaarg.in_reg237 ], [ %136, %vaarg.in_mem239 ]
  %137 = load i32, i32* %vaarg.addr244, align 4
  %conv245 = sext i32 %137 to i64
  br label %cond.end246

cond.end246:                                      ; preds = %vaarg.end243
  br label %cond.end248

cond.end248:                                      ; preds = %cond.end246, %vaarg.end212
  %cond249 = phi i64 [ %conv215, %vaarg.end212 ], [ %conv245, %cond.end246 ]
  br label %cond.end250

cond.end250:                                      ; preds = %cond.end248, %vaarg.end197
  %cond251 = phi i64 [ %121, %vaarg.end197 ], [ %cond249, %cond.end248 ]
  store i64 %cond251, i64* %_uquad, align 8
  %138 = load i64, i64* %_uquad, align 8
  %cmp252 = icmp slt i64 %138, 0
  br i1 %cmp252, label %if.then254, label %if.end256

if.then254:                                       ; preds = %cond.end250
  %139 = load i64, i64* %_uquad, align 8
  %sub255 = sub i64 0, %139
  store i64 %sub255, i64* %_uquad, align 8
  store i8 45, i8* %sign, align 1
  br label %if.end256

if.end256:                                        ; preds = %if.then254, %cond.end250
  store i32 1, i32* %base, align 4
  br label %number

sw.bb257:                                         ; preds = %reswitch
  %140 = load i32, i32* %flags, align 4
  %and258 = and i32 %140, 16
  %tobool259 = icmp ne i32 %and258, 0
  br i1 %tobool259, label %if.then260, label %if.else

if.then260:                                       ; preds = %sw.bb257
  %141 = load i32, i32* %ret, align 4
  %conv261 = sext i32 %141 to i64
  %142 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p262 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %142, i32 0, i32 0
  %gp_offset263 = load i32, i32* %gp_offset_p262, align 8
  %fits_in_gp264 = icmp ule i32 %gp_offset263, 40
  br i1 %fits_in_gp264, label %vaarg.in_reg265, label %vaarg.in_mem267

vaarg.in_reg265:                                  ; preds = %if.then260
  %143 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %142, i32 0, i32 3
  %reg_save_area266 = load i8*, i8** %143, align 8
  %144 = getelementptr i8, i8* %reg_save_area266, i32 %gp_offset263
  %145 = bitcast i8* %144 to i64**
  %146 = add i32 %gp_offset263, 8
  store i32 %146, i32* %gp_offset_p262, align 8
  br label %vaarg.end271

vaarg.in_mem267:                                  ; preds = %if.then260
  %overflow_arg_area_p268 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %142, i32 0, i32 2
  %overflow_arg_area269 = load i8*, i8** %overflow_arg_area_p268, align 8
  %147 = bitcast i8* %overflow_arg_area269 to i64**
  %overflow_arg_area.next270 = getelementptr i8, i8* %overflow_arg_area269, i32 8
  store i8* %overflow_arg_area.next270, i8** %overflow_arg_area_p268, align 8
  br label %vaarg.end271

vaarg.end271:                                     ; preds = %vaarg.in_mem267, %vaarg.in_reg265
  %vaarg.addr272 = phi i64** [ %145, %vaarg.in_reg265 ], [ %147, %vaarg.in_mem267 ]
  %148 = load i64*, i64** %vaarg.addr272, align 8
  store i64 %conv261, i64* %148, align 8
  br label %if.end301

if.else:                                          ; preds = %sw.bb257
  %149 = load i32, i32* %flags, align 4
  %and273 = and i32 %149, 64
  %tobool274 = icmp ne i32 %and273, 0
  br i1 %tobool274, label %if.then275, label %if.else288

if.then275:                                       ; preds = %if.else
  %150 = load i32, i32* %ret, align 4
  %conv276 = trunc i32 %150 to i16
  %151 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p277 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %151, i32 0, i32 0
  %gp_offset278 = load i32, i32* %gp_offset_p277, align 8
  %fits_in_gp279 = icmp ule i32 %gp_offset278, 40
  br i1 %fits_in_gp279, label %vaarg.in_reg280, label %vaarg.in_mem282

vaarg.in_reg280:                                  ; preds = %if.then275
  %152 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %151, i32 0, i32 3
  %reg_save_area281 = load i8*, i8** %152, align 8
  %153 = getelementptr i8, i8* %reg_save_area281, i32 %gp_offset278
  %154 = bitcast i8* %153 to i16**
  %155 = add i32 %gp_offset278, 8
  store i32 %155, i32* %gp_offset_p277, align 8
  br label %vaarg.end286

vaarg.in_mem282:                                  ; preds = %if.then275
  %overflow_arg_area_p283 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %151, i32 0, i32 2
  %overflow_arg_area284 = load i8*, i8** %overflow_arg_area_p283, align 8
  %156 = bitcast i8* %overflow_arg_area284 to i16**
  %overflow_arg_area.next285 = getelementptr i8, i8* %overflow_arg_area284, i32 8
  store i8* %overflow_arg_area.next285, i8** %overflow_arg_area_p283, align 8
  br label %vaarg.end286

vaarg.end286:                                     ; preds = %vaarg.in_mem282, %vaarg.in_reg280
  %vaarg.addr287 = phi i16** [ %154, %vaarg.in_reg280 ], [ %156, %vaarg.in_mem282 ]
  %157 = load i16*, i16** %vaarg.addr287, align 8
  store i16 %conv276, i16* %157, align 2
  br label %if.end300

if.else288:                                       ; preds = %if.else
  %158 = load i32, i32* %ret, align 4
  %159 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p289 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %159, i32 0, i32 0
  %gp_offset290 = load i32, i32* %gp_offset_p289, align 8
  %fits_in_gp291 = icmp ule i32 %gp_offset290, 40
  br i1 %fits_in_gp291, label %vaarg.in_reg292, label %vaarg.in_mem294

vaarg.in_reg292:                                  ; preds = %if.else288
  %160 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %159, i32 0, i32 3
  %reg_save_area293 = load i8*, i8** %160, align 8
  %161 = getelementptr i8, i8* %reg_save_area293, i32 %gp_offset290
  %162 = bitcast i8* %161 to i32**
  %163 = add i32 %gp_offset290, 8
  store i32 %163, i32* %gp_offset_p289, align 8
  br label %vaarg.end298

vaarg.in_mem294:                                  ; preds = %if.else288
  %overflow_arg_area_p295 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %159, i32 0, i32 2
  %overflow_arg_area296 = load i8*, i8** %overflow_arg_area_p295, align 8
  %164 = bitcast i8* %overflow_arg_area296 to i32**
  %overflow_arg_area.next297 = getelementptr i8, i8* %overflow_arg_area296, i32 8
  store i8* %overflow_arg_area.next297, i8** %overflow_arg_area_p295, align 8
  br label %vaarg.end298

vaarg.end298:                                     ; preds = %vaarg.in_mem294, %vaarg.in_reg292
  %vaarg.addr299 = phi i32** [ %162, %vaarg.in_reg292 ], [ %164, %vaarg.in_mem294 ]
  %165 = load i32*, i32** %vaarg.addr299, align 8
  store i32 %158, i32* %165, align 4
  br label %if.end300

if.end300:                                        ; preds = %vaarg.end298, %vaarg.end286
  br label %if.end301

if.end301:                                        ; preds = %if.end300, %vaarg.end271
  br label %for.cond.backedge

for.cond.backedge:                                ; preds = %if.end945, %if.end301
  br label %for.cond

sw.bb302:                                         ; preds = %reswitch
  %166 = load i32, i32* %flags, align 4
  %or303 = or i32 %166, 16
  store i32 %or303, i32* %flags, align 4
  br label %sw.bb304

sw.bb304.loopexit:                                ; preds = %reswitch
  br label %sw.bb304

sw.bb304:                                         ; preds = %sw.bb304.loopexit, %sw.bb302
  %167 = load i32, i32* %flags, align 4
  %and305 = and i32 %167, 16
  %tobool306 = icmp ne i32 %and305, 0
  br i1 %tobool306, label %cond.true307, label %cond.false319

cond.true307:                                     ; preds = %sw.bb304
  %168 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p308 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 0
  %gp_offset309 = load i32, i32* %gp_offset_p308, align 8
  %fits_in_gp310 = icmp ule i32 %gp_offset309, 40
  br i1 %fits_in_gp310, label %vaarg.in_reg311, label %vaarg.in_mem313

vaarg.in_reg311:                                  ; preds = %cond.true307
  %169 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 3
  %reg_save_area312 = load i8*, i8** %169, align 8
  %170 = getelementptr i8, i8* %reg_save_area312, i32 %gp_offset309
  %171 = bitcast i8* %170 to i64*
  %172 = add i32 %gp_offset309, 8
  store i32 %172, i32* %gp_offset_p308, align 8
  br label %vaarg.end317

vaarg.in_mem313:                                  ; preds = %cond.true307
  %overflow_arg_area_p314 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 2
  %overflow_arg_area315 = load i8*, i8** %overflow_arg_area_p314, align 8
  %173 = bitcast i8* %overflow_arg_area315 to i64*
  %overflow_arg_area.next316 = getelementptr i8, i8* %overflow_arg_area315, i32 8
  store i8* %overflow_arg_area.next316, i8** %overflow_arg_area_p314, align 8
  br label %vaarg.end317

vaarg.end317:                                     ; preds = %vaarg.in_mem313, %vaarg.in_reg311
  %vaarg.addr318 = phi i64* [ %171, %vaarg.in_reg311 ], [ %173, %vaarg.in_mem313 ]
  %174 = load i64, i64* %vaarg.addr318, align 8
  br label %cond.end370

cond.false319:                                    ; preds = %sw.bb304
  %175 = load i32, i32* %flags, align 4
  %and320 = and i32 %175, 64
  %tobool321 = icmp ne i32 %and320, 0
  br i1 %tobool321, label %cond.true322, label %cond.false336

cond.true322:                                     ; preds = %cond.false319
  %176 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p323 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %176, i32 0, i32 0
  %gp_offset324 = load i32, i32* %gp_offset_p323, align 8
  %fits_in_gp325 = icmp ule i32 %gp_offset324, 40
  br i1 %fits_in_gp325, label %vaarg.in_reg326, label %vaarg.in_mem328

vaarg.in_reg326:                                  ; preds = %cond.true322
  %177 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %176, i32 0, i32 3
  %reg_save_area327 = load i8*, i8** %177, align 8
  %178 = getelementptr i8, i8* %reg_save_area327, i32 %gp_offset324
  %179 = bitcast i8* %178 to i32*
  %180 = add i32 %gp_offset324, 8
  store i32 %180, i32* %gp_offset_p323, align 8
  br label %vaarg.end332

vaarg.in_mem328:                                  ; preds = %cond.true322
  %overflow_arg_area_p329 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %176, i32 0, i32 2
  %overflow_arg_area330 = load i8*, i8** %overflow_arg_area_p329, align 8
  %181 = bitcast i8* %overflow_arg_area330 to i32*
  %overflow_arg_area.next331 = getelementptr i8, i8* %overflow_arg_area330, i32 8
  store i8* %overflow_arg_area.next331, i8** %overflow_arg_area_p329, align 8
  br label %vaarg.end332

vaarg.end332:                                     ; preds = %vaarg.in_mem328, %vaarg.in_reg326
  %vaarg.addr333 = phi i32* [ %179, %vaarg.in_reg326 ], [ %181, %vaarg.in_mem328 ]
  %182 = load i32, i32* %vaarg.addr333, align 4
  %conv334 = trunc i32 %182 to i16
  %conv335 = zext i16 %conv334 to i64
  br label %cond.end368

cond.false336:                                    ; preds = %cond.false319
  %183 = load i32, i32* %flags, align 4
  br label %cond.false353

cond.false353:                                    ; preds = %cond.false336
  %184 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p354 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %184, i32 0, i32 0
  %gp_offset355 = load i32, i32* %gp_offset_p354, align 8
  %fits_in_gp356 = icmp ule i32 %gp_offset355, 40
  br i1 %fits_in_gp356, label %vaarg.in_reg357, label %vaarg.in_mem359

vaarg.in_reg357:                                  ; preds = %cond.false353
  %185 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %184, i32 0, i32 3
  %reg_save_area358 = load i8*, i8** %185, align 8
  %186 = getelementptr i8, i8* %reg_save_area358, i32 %gp_offset355
  %187 = bitcast i8* %186 to i32*
  %188 = add i32 %gp_offset355, 8
  store i32 %188, i32* %gp_offset_p354, align 8
  br label %vaarg.end363

vaarg.in_mem359:                                  ; preds = %cond.false353
  %overflow_arg_area_p360 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %184, i32 0, i32 2
  %overflow_arg_area361 = load i8*, i8** %overflow_arg_area_p360, align 8
  %189 = bitcast i8* %overflow_arg_area361 to i32*
  %overflow_arg_area.next362 = getelementptr i8, i8* %overflow_arg_area361, i32 8
  store i8* %overflow_arg_area.next362, i8** %overflow_arg_area_p360, align 8
  br label %vaarg.end363

vaarg.end363:                                     ; preds = %vaarg.in_mem359, %vaarg.in_reg357
  %vaarg.addr364 = phi i32* [ %187, %vaarg.in_reg357 ], [ %189, %vaarg.in_mem359 ]
  %190 = load i32, i32* %vaarg.addr364, align 4
  %conv365 = zext i32 %190 to i64
  br label %cond.end366

cond.end366:                                      ; preds = %vaarg.end363
  br label %cond.end368

cond.end368:                                      ; preds = %cond.end366, %vaarg.end332
  %cond369 = phi i64 [ %conv335, %vaarg.end332 ], [ %conv365, %cond.end366 ]
  br label %cond.end370

cond.end370:                                      ; preds = %cond.end368, %vaarg.end317
  %cond371 = phi i64 [ %174, %vaarg.end317 ], [ %cond369, %cond.end368 ]
  store i64 %cond371, i64* %_uquad, align 8
  store i32 0, i32* %base, align 4
  br label %nosign

sw.bb372:                                         ; preds = %reswitch
  %191 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p373 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %191, i32 0, i32 0
  %gp_offset374 = load i32, i32* %gp_offset_p373, align 8
  %fits_in_gp375 = icmp ule i32 %gp_offset374, 40
  br i1 %fits_in_gp375, label %vaarg.in_reg376, label %vaarg.in_mem378

vaarg.in_reg376:                                  ; preds = %sw.bb372
  %192 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %191, i32 0, i32 3
  %reg_save_area377 = load i8*, i8** %192, align 8
  %193 = getelementptr i8, i8* %reg_save_area377, i32 %gp_offset374
  %194 = bitcast i8* %193 to i8**
  %195 = add i32 %gp_offset374, 8
  store i32 %195, i32* %gp_offset_p373, align 8
  br label %vaarg.end382

vaarg.in_mem378:                                  ; preds = %sw.bb372
  %overflow_arg_area_p379 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %191, i32 0, i32 2
  %overflow_arg_area380 = load i8*, i8** %overflow_arg_area_p379, align 8
  %196 = bitcast i8* %overflow_arg_area380 to i8**
  %overflow_arg_area.next381 = getelementptr i8, i8* %overflow_arg_area380, i32 8
  store i8* %overflow_arg_area.next381, i8** %overflow_arg_area_p379, align 8
  br label %vaarg.end382

vaarg.end382:                                     ; preds = %vaarg.in_mem378, %vaarg.in_reg376
  %vaarg.addr383 = phi i8** [ %194, %vaarg.in_reg376 ], [ %196, %vaarg.in_mem378 ]
  %197 = load i8*, i8** %vaarg.addr383, align 8
  %198 = ptrtoint i8* %197 to i64
  store i64 %198, i64* %_uquad, align 8
  store i32 2, i32* %base, align 4
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8** %xdigs, align 8
  %199 = load i32, i32* %flags, align 4
  %or384 = or i32 %199, 2
  store i32 %or384, i32* %flags, align 4
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %ox, i64 0, i64 0
  store i8 48, i8* %arrayidx, align 1
  store i32 120, i32* %ch, align 4
  %arrayidx385 = getelementptr inbounds [2 x i8], [2 x i8]* %ox, i64 0, i64 1
  store i8 120, i8* %arrayidx385, align 1
  br label %nosign

sw.bb386:                                         ; preds = %reswitch
  %200 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p387 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %200, i32 0, i32 0
  %gp_offset388 = load i32, i32* %gp_offset_p387, align 8
  %fits_in_gp389 = icmp ule i32 %gp_offset388, 40
  br i1 %fits_in_gp389, label %vaarg.in_reg390, label %vaarg.in_mem392

vaarg.in_reg390:                                  ; preds = %sw.bb386
  %201 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %200, i32 0, i32 3
  %reg_save_area391 = load i8*, i8** %201, align 8
  %202 = getelementptr i8, i8* %reg_save_area391, i32 %gp_offset388
  %203 = bitcast i8* %202 to i8**
  %204 = add i32 %gp_offset388, 8
  store i32 %204, i32* %gp_offset_p387, align 8
  br label %vaarg.end396

vaarg.in_mem392:                                  ; preds = %sw.bb386
  %overflow_arg_area_p393 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %200, i32 0, i32 2
  %overflow_arg_area394 = load i8*, i8** %overflow_arg_area_p393, align 8
  %205 = bitcast i8* %overflow_arg_area394 to i8**
  %overflow_arg_area.next395 = getelementptr i8, i8* %overflow_arg_area394, i32 8
  store i8* %overflow_arg_area.next395, i8** %overflow_arg_area_p393, align 8
  br label %vaarg.end396

vaarg.end396:                                     ; preds = %vaarg.in_mem392, %vaarg.in_reg390
  %vaarg.addr397 = phi i8** [ %203, %vaarg.in_reg390 ], [ %205, %vaarg.in_mem392 ]
  %206 = load i8*, i8** %vaarg.addr397, align 8
  store i8* %206, i8** %cp, align 8
  store i8 0, i8* %sign, align 1
  %207 = load i8*, i8** %cp, align 8
  %cmp398 = icmp eq i8* %207, null
  br i1 %cmp398, label %if.then400, label %if.else407

if.then400:                                       ; preds = %vaarg.end396
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i8** %cp, align 8
  %208 = load i32, i32* %prec, align 4
  %cmp401 = icmp ugt i32 %208, 6
  br i1 %cmp401, label %cond.true403, label %cond.false404

cond.true403:                                     ; preds = %if.then400
  br label %cond.end405

cond.false404:                                    ; preds = %if.then400
  %209 = load i32, i32* %prec, align 4
  br label %cond.end405

cond.end405:                                      ; preds = %cond.false404, %cond.true403
  %cond406 = phi i32 [ 6, %cond.true403 ], [ %209, %cond.false404 ]
  store i32 %cond406, i32* %size, align 4
  br label %if.end426

if.else407:                                       ; preds = %vaarg.end396
  %210 = load i32, i32* %prec, align 4
  %cmp408 = icmp sge i32 %210, 0
  br i1 %cmp408, label %if.then410, label %if.else422

if.then410:                                       ; preds = %if.else407
  %211 = load i8*, i8** %cp, align 8
  %212 = load i32, i32* %prec, align 4
  %conv411 = sext i32 %212 to i64
  %call412 = call i8* @memchr(i8* %211, i32 0, i64 %conv411) #4
  store i8* %call412, i8** %p, align 8
  %213 = load i8*, i8** %p, align 8
  %cmp413 = icmp ne i8* %213, null
  br i1 %cmp413, label %if.then415, label %if.else420

if.then415:                                       ; preds = %if.then410
  %214 = load i8*, i8** %p, align 8
  %215 = load i8*, i8** %cp, align 8
  %sub.ptr.lhs.cast416 = ptrtoint i8* %214 to i64
  %sub.ptr.rhs.cast417 = ptrtoint i8* %215 to i64
  %sub.ptr.sub418 = sub i64 %sub.ptr.lhs.cast416, %sub.ptr.rhs.cast417
  %conv419 = trunc i64 %sub.ptr.sub418 to i32
  store i32 %conv419, i32* %size, align 4
  br label %if.end421

if.else420:                                       ; preds = %if.then410
  %216 = load i32, i32* %prec, align 4
  store i32 %216, i32* %size, align 4
  br label %if.end421

if.end421:                                        ; preds = %if.else420, %if.then415
  br label %if.end425

if.else422:                                       ; preds = %if.else407
  %217 = load i8*, i8** %cp, align 8
  %call423 = call i64 @strlen(i8* %217) #4
  %conv424 = trunc i64 %call423 to i32
  store i32 %conv424, i32* %size, align 4
  br label %if.end425

if.end425:                                        ; preds = %if.else422, %if.end421
  br label %if.end426

if.end426:                                        ; preds = %if.end425, %cond.end405
  br label %sw.epilog658

sw.bb427:                                         ; preds = %reswitch
  %218 = load i32, i32* %flags, align 4
  %or428 = or i32 %218, 16
  store i32 %or428, i32* %flags, align 4
  br label %sw.bb429

sw.bb429.loopexit:                                ; preds = %reswitch
  br label %sw.bb429

sw.bb429:                                         ; preds = %sw.bb429.loopexit, %sw.bb427
  %219 = load i32, i32* %flags, align 4
  %and430 = and i32 %219, 16
  %tobool431 = icmp ne i32 %and430, 0
  br i1 %tobool431, label %cond.true432, label %cond.false444

cond.true432:                                     ; preds = %sw.bb429
  %220 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p433 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %220, i32 0, i32 0
  %gp_offset434 = load i32, i32* %gp_offset_p433, align 8
  %fits_in_gp435 = icmp ule i32 %gp_offset434, 40
  br i1 %fits_in_gp435, label %vaarg.in_reg436, label %vaarg.in_mem438

vaarg.in_reg436:                                  ; preds = %cond.true432
  %221 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %220, i32 0, i32 3
  %reg_save_area437 = load i8*, i8** %221, align 8
  %222 = getelementptr i8, i8* %reg_save_area437, i32 %gp_offset434
  %223 = bitcast i8* %222 to i64*
  %224 = add i32 %gp_offset434, 8
  store i32 %224, i32* %gp_offset_p433, align 8
  br label %vaarg.end442

vaarg.in_mem438:                                  ; preds = %cond.true432
  %overflow_arg_area_p439 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %220, i32 0, i32 2
  %overflow_arg_area440 = load i8*, i8** %overflow_arg_area_p439, align 8
  %225 = bitcast i8* %overflow_arg_area440 to i64*
  %overflow_arg_area.next441 = getelementptr i8, i8* %overflow_arg_area440, i32 8
  store i8* %overflow_arg_area.next441, i8** %overflow_arg_area_p439, align 8
  br label %vaarg.end442

vaarg.end442:                                     ; preds = %vaarg.in_mem438, %vaarg.in_reg436
  %vaarg.addr443 = phi i64* [ %223, %vaarg.in_reg436 ], [ %225, %vaarg.in_mem438 ]
  %226 = load i64, i64* %vaarg.addr443, align 8
  br label %cond.end495

cond.false444:                                    ; preds = %sw.bb429
  %227 = load i32, i32* %flags, align 4
  %and445 = and i32 %227, 64
  %tobool446 = icmp ne i32 %and445, 0
  br i1 %tobool446, label %cond.true447, label %cond.false461

cond.true447:                                     ; preds = %cond.false444
  %228 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p448 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %228, i32 0, i32 0
  %gp_offset449 = load i32, i32* %gp_offset_p448, align 8
  %fits_in_gp450 = icmp ule i32 %gp_offset449, 40
  br i1 %fits_in_gp450, label %vaarg.in_reg451, label %vaarg.in_mem453

vaarg.in_reg451:                                  ; preds = %cond.true447
  %229 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %228, i32 0, i32 3
  %reg_save_area452 = load i8*, i8** %229, align 8
  %230 = getelementptr i8, i8* %reg_save_area452, i32 %gp_offset449
  %231 = bitcast i8* %230 to i32*
  %232 = add i32 %gp_offset449, 8
  store i32 %232, i32* %gp_offset_p448, align 8
  br label %vaarg.end457

vaarg.in_mem453:                                  ; preds = %cond.true447
  %overflow_arg_area_p454 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %228, i32 0, i32 2
  %overflow_arg_area455 = load i8*, i8** %overflow_arg_area_p454, align 8
  %233 = bitcast i8* %overflow_arg_area455 to i32*
  %overflow_arg_area.next456 = getelementptr i8, i8* %overflow_arg_area455, i32 8
  store i8* %overflow_arg_area.next456, i8** %overflow_arg_area_p454, align 8
  br label %vaarg.end457

vaarg.end457:                                     ; preds = %vaarg.in_mem453, %vaarg.in_reg451
  %vaarg.addr458 = phi i32* [ %231, %vaarg.in_reg451 ], [ %233, %vaarg.in_mem453 ]
  %234 = load i32, i32* %vaarg.addr458, align 4
  %conv459 = trunc i32 %234 to i16
  %conv460 = zext i16 %conv459 to i64
  br label %cond.end493

cond.false461:                                    ; preds = %cond.false444
  %235 = load i32, i32* %flags, align 4
  br label %cond.false478

cond.false478:                                    ; preds = %cond.false461
  %236 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p479 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %236, i32 0, i32 0
  %gp_offset480 = load i32, i32* %gp_offset_p479, align 8
  %fits_in_gp481 = icmp ule i32 %gp_offset480, 40
  br i1 %fits_in_gp481, label %vaarg.in_reg482, label %vaarg.in_mem484

vaarg.in_reg482:                                  ; preds = %cond.false478
  %237 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %236, i32 0, i32 3
  %reg_save_area483 = load i8*, i8** %237, align 8
  %238 = getelementptr i8, i8* %reg_save_area483, i32 %gp_offset480
  %239 = bitcast i8* %238 to i32*
  %240 = add i32 %gp_offset480, 8
  store i32 %240, i32* %gp_offset_p479, align 8
  br label %vaarg.end488

vaarg.in_mem484:                                  ; preds = %cond.false478
  %overflow_arg_area_p485 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %236, i32 0, i32 2
  %overflow_arg_area486 = load i8*, i8** %overflow_arg_area_p485, align 8
  %241 = bitcast i8* %overflow_arg_area486 to i32*
  %overflow_arg_area.next487 = getelementptr i8, i8* %overflow_arg_area486, i32 8
  store i8* %overflow_arg_area.next487, i8** %overflow_arg_area_p485, align 8
  br label %vaarg.end488

vaarg.end488:                                     ; preds = %vaarg.in_mem484, %vaarg.in_reg482
  %vaarg.addr489 = phi i32* [ %239, %vaarg.in_reg482 ], [ %241, %vaarg.in_mem484 ]
  %242 = load i32, i32* %vaarg.addr489, align 4
  %conv490 = zext i32 %242 to i64
  br label %cond.end491

cond.end491:                                      ; preds = %vaarg.end488
  br label %cond.end493

cond.end493:                                      ; preds = %cond.end491, %vaarg.end457
  %cond494 = phi i64 [ %conv460, %vaarg.end457 ], [ %conv490, %cond.end491 ]
  br label %cond.end495

cond.end495:                                      ; preds = %cond.end493, %vaarg.end442
  %cond496 = phi i64 [ %226, %vaarg.end442 ], [ %cond494, %cond.end493 ]
  store i64 %cond496, i64* %_uquad, align 8
  store i32 1, i32* %base, align 4
  br label %nosign

sw.bb497:                                         ; preds = %reswitch
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8** %xdigs, align 8
  br label %hex

sw.bb498:                                         ; preds = %reswitch
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8** %xdigs, align 8
  br label %hex

hex:                                              ; preds = %sw.bb498, %sw.bb497
  %243 = load i32, i32* %flags, align 4
  %and499 = and i32 %243, 16
  %tobool500 = icmp ne i32 %and499, 0
  br i1 %tobool500, label %cond.true501, label %cond.false513

cond.true501:                                     ; preds = %hex
  %244 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p502 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %244, i32 0, i32 0
  %gp_offset503 = load i32, i32* %gp_offset_p502, align 8
  %fits_in_gp504 = icmp ule i32 %gp_offset503, 40
  br i1 %fits_in_gp504, label %vaarg.in_reg505, label %vaarg.in_mem507

vaarg.in_reg505:                                  ; preds = %cond.true501
  %245 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %244, i32 0, i32 3
  %reg_save_area506 = load i8*, i8** %245, align 8
  %246 = getelementptr i8, i8* %reg_save_area506, i32 %gp_offset503
  %247 = bitcast i8* %246 to i64*
  %248 = add i32 %gp_offset503, 8
  store i32 %248, i32* %gp_offset_p502, align 8
  br label %vaarg.end511

vaarg.in_mem507:                                  ; preds = %cond.true501
  %overflow_arg_area_p508 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %244, i32 0, i32 2
  %overflow_arg_area509 = load i8*, i8** %overflow_arg_area_p508, align 8
  %249 = bitcast i8* %overflow_arg_area509 to i64*
  %overflow_arg_area.next510 = getelementptr i8, i8* %overflow_arg_area509, i32 8
  store i8* %overflow_arg_area.next510, i8** %overflow_arg_area_p508, align 8
  br label %vaarg.end511

vaarg.end511:                                     ; preds = %vaarg.in_mem507, %vaarg.in_reg505
  %vaarg.addr512 = phi i64* [ %247, %vaarg.in_reg505 ], [ %249, %vaarg.in_mem507 ]
  %250 = load i64, i64* %vaarg.addr512, align 8
  br label %cond.end564

cond.false513:                                    ; preds = %hex
  %251 = load i32, i32* %flags, align 4
  %and514 = and i32 %251, 64
  %tobool515 = icmp ne i32 %and514, 0
  br i1 %tobool515, label %cond.true516, label %cond.false530

cond.true516:                                     ; preds = %cond.false513
  %252 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p517 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %252, i32 0, i32 0
  %gp_offset518 = load i32, i32* %gp_offset_p517, align 8
  %fits_in_gp519 = icmp ule i32 %gp_offset518, 40
  br i1 %fits_in_gp519, label %vaarg.in_reg520, label %vaarg.in_mem522

vaarg.in_reg520:                                  ; preds = %cond.true516
  %253 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %252, i32 0, i32 3
  %reg_save_area521 = load i8*, i8** %253, align 8
  %254 = getelementptr i8, i8* %reg_save_area521, i32 %gp_offset518
  %255 = bitcast i8* %254 to i32*
  %256 = add i32 %gp_offset518, 8
  store i32 %256, i32* %gp_offset_p517, align 8
  br label %vaarg.end526

vaarg.in_mem522:                                  ; preds = %cond.true516
  %overflow_arg_area_p523 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %252, i32 0, i32 2
  %overflow_arg_area524 = load i8*, i8** %overflow_arg_area_p523, align 8
  %257 = bitcast i8* %overflow_arg_area524 to i32*
  %overflow_arg_area.next525 = getelementptr i8, i8* %overflow_arg_area524, i32 8
  store i8* %overflow_arg_area.next525, i8** %overflow_arg_area_p523, align 8
  br label %vaarg.end526

vaarg.end526:                                     ; preds = %vaarg.in_mem522, %vaarg.in_reg520
  %vaarg.addr527 = phi i32* [ %255, %vaarg.in_reg520 ], [ %257, %vaarg.in_mem522 ]
  %258 = load i32, i32* %vaarg.addr527, align 4
  %conv528 = trunc i32 %258 to i16
  %conv529 = zext i16 %conv528 to i64
  br label %cond.end562

cond.false530:                                    ; preds = %cond.false513
  %259 = load i32, i32* %flags, align 4
  br label %cond.false547

cond.false547:                                    ; preds = %cond.false530
  %260 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p548 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %260, i32 0, i32 0
  %gp_offset549 = load i32, i32* %gp_offset_p548, align 8
  %fits_in_gp550 = icmp ule i32 %gp_offset549, 40
  br i1 %fits_in_gp550, label %vaarg.in_reg551, label %vaarg.in_mem553

vaarg.in_reg551:                                  ; preds = %cond.false547
  %261 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %260, i32 0, i32 3
  %reg_save_area552 = load i8*, i8** %261, align 8
  %262 = getelementptr i8, i8* %reg_save_area552, i32 %gp_offset549
  %263 = bitcast i8* %262 to i32*
  %264 = add i32 %gp_offset549, 8
  store i32 %264, i32* %gp_offset_p548, align 8
  br label %vaarg.end557

vaarg.in_mem553:                                  ; preds = %cond.false547
  %overflow_arg_area_p554 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %260, i32 0, i32 2
  %overflow_arg_area555 = load i8*, i8** %overflow_arg_area_p554, align 8
  %265 = bitcast i8* %overflow_arg_area555 to i32*
  %overflow_arg_area.next556 = getelementptr i8, i8* %overflow_arg_area555, i32 8
  store i8* %overflow_arg_area.next556, i8** %overflow_arg_area_p554, align 8
  br label %vaarg.end557

vaarg.end557:                                     ; preds = %vaarg.in_mem553, %vaarg.in_reg551
  %vaarg.addr558 = phi i32* [ %263, %vaarg.in_reg551 ], [ %265, %vaarg.in_mem553 ]
  %266 = load i32, i32* %vaarg.addr558, align 4
  %conv559 = zext i32 %266 to i64
  br label %cond.end560

cond.end560:                                      ; preds = %vaarg.end557
  br label %cond.end562

cond.end562:                                      ; preds = %cond.end560, %vaarg.end526
  %cond563 = phi i64 [ %conv529, %vaarg.end526 ], [ %conv559, %cond.end560 ]
  br label %cond.end564

cond.end564:                                      ; preds = %cond.end562, %vaarg.end511
  %cond565 = phi i64 [ %250, %vaarg.end511 ], [ %cond563, %cond.end562 ]
  store i64 %cond565, i64* %_uquad, align 8
  store i32 2, i32* %base, align 4
  %267 = load i32, i32* %flags, align 4
  %and566 = and i32 %267, 1
  %tobool567 = icmp ne i32 %and566, 0
  br i1 %tobool567, label %land.lhs.true568, label %if.end576

land.lhs.true568:                                 ; preds = %cond.end564
  %268 = load i64, i64* %_uquad, align 8
  %cmp569 = icmp ne i64 %268, 0
  br i1 %cmp569, label %if.then571, label %if.end576

if.then571:                                       ; preds = %land.lhs.true568
  %arrayidx572 = getelementptr inbounds [2 x i8], [2 x i8]* %ox, i64 0, i64 0
  store i8 48, i8* %arrayidx572, align 1
  %269 = load i32, i32* %ch, align 4
  %conv573 = trunc i32 %269 to i8
  %arrayidx574 = getelementptr inbounds [2 x i8], [2 x i8]* %ox, i64 0, i64 1
  store i8 %conv573, i8* %arrayidx574, align 1
  %270 = load i32, i32* %flags, align 4
  %or575 = or i32 %270, 2
  store i32 %or575, i32* %flags, align 4
  br label %if.end576

if.end576:                                        ; preds = %if.then571, %land.lhs.true568, %cond.end564
  br label %nosign

nosign:                                           ; preds = %if.end576, %cond.end495, %vaarg.end382, %cond.end370
  store i8 0, i8* %sign, align 1
  br label %number

number:                                           ; preds = %nosign, %if.end256
  %271 = load i32, i32* %prec, align 4
  store i32 %271, i32* %dprec, align 4
  %cmp577 = icmp sge i32 %271, 0
  br i1 %cmp577, label %if.then579, label %if.end581

if.then579:                                       ; preds = %number
  %272 = load i32, i32* %flags, align 4
  %and580 = and i32 %272, -129
  store i32 %and580, i32* %flags, align 4
  br label %if.end581

if.end581:                                        ; preds = %if.then579, %number
  %arraydecay582 = getelementptr inbounds [40 x i8], [40 x i8]* %buf, i64 0, i64 0
  %add.ptr583 = getelementptr inbounds i8, i8* %arraydecay582, i64 40
  store i8* %add.ptr583, i8** %cp, align 8
  %273 = load i64, i64* %_uquad, align 8
  %cmp584 = icmp ne i64 %273, 0
  br i1 %cmp584, label %if.then589, label %lor.lhs.false586

lor.lhs.false586:                                 ; preds = %if.end581
  %274 = load i32, i32* %prec, align 4
  %cmp587 = icmp ne i32 %274, 0
  br i1 %cmp587, label %if.then589, label %if.else635

if.then589:                                       ; preds = %lor.lhs.false586, %if.end581
  %275 = load i32, i32* %base, align 4
  switch i32 %275, label %sw.default [
    i32 0, label %sw.bb590
    i32 1, label %sw.bb608
    i32 2, label %sw.bb624
  ]

sw.bb590:                                         ; preds = %if.then589
  br label %do.body591

do.body591:                                       ; preds = %do.cond596, %sw.bb590
  %276 = load i64, i64* %_uquad, align 8
  %and592 = and i64 %276, 7
  %add593 = add i64 %and592, 48
  %conv594 = trunc i64 %add593 to i8
  %277 = load i8*, i8** %cp, align 8
  %incdec.ptr595 = getelementptr inbounds i8, i8* %277, i32 -1
  store i8* %incdec.ptr595, i8** %cp, align 8
  store i8 %conv594, i8* %incdec.ptr595, align 1
  %278 = load i64, i64* %_uquad, align 8
  %shr = lshr i64 %278, 3
  store i64 %shr, i64* %_uquad, align 8
  br label %do.cond596

do.cond596:                                       ; preds = %do.body591
  %279 = load i64, i64* %_uquad, align 8
  %tobool597 = icmp ne i64 %279, 0
  br i1 %tobool597, label %do.body591, label %do.end598

do.end598:                                        ; preds = %do.cond596
  %280 = load i32, i32* %flags, align 4
  %and599 = and i32 %280, 1
  %tobool600 = icmp ne i32 %and599, 0
  br i1 %tobool600, label %land.lhs.true601, label %if.end607

land.lhs.true601:                                 ; preds = %do.end598
  %281 = load i8*, i8** %cp, align 8
  %282 = load i8, i8* %281, align 1
  %conv602 = sext i8 %282 to i32
  %cmp603 = icmp ne i32 %conv602, 48
  br i1 %cmp603, label %if.then605, label %if.end607

if.then605:                                       ; preds = %land.lhs.true601
  %283 = load i8*, i8** %cp, align 8
  %incdec.ptr606 = getelementptr inbounds i8, i8* %283, i32 -1
  store i8* %incdec.ptr606, i8** %cp, align 8
  store i8 48, i8* %incdec.ptr606, align 1
  br label %if.end607

if.end607:                                        ; preds = %if.then605, %land.lhs.true601, %do.end598
  br label %sw.epilog

sw.bb608:                                         ; preds = %if.then589
  %284 = load i64, i64* %_uquad, align 8
  %cmp609 = icmp ult i64 %284, 10
  br i1 %cmp609, label %if.then611, label %if.end615

if.then611:                                       ; preds = %sw.bb608
  %285 = load i64, i64* %_uquad, align 8
  %add612 = add i64 %285, 48
  %conv613 = trunc i64 %add612 to i8
  %286 = load i8*, i8** %cp, align 8
  %incdec.ptr614 = getelementptr inbounds i8, i8* %286, i32 -1
  store i8* %incdec.ptr614, i8** %cp, align 8
  store i8 %conv613, i8* %incdec.ptr614, align 1
  br label %sw.epilog

if.end615:                                        ; preds = %sw.bb608
  br label %do.body616

do.body616:                                       ; preds = %do.cond620, %if.end615
  %287 = load i64, i64* %_uquad, align 8
  %rem = urem i64 %287, 10
  %add617 = add i64 %rem, 48
  %conv618 = trunc i64 %add617 to i8
  %288 = load i8*, i8** %cp, align 8
  %incdec.ptr619 = getelementptr inbounds i8, i8* %288, i32 -1
  store i8* %incdec.ptr619, i8** %cp, align 8
  store i8 %conv618, i8* %incdec.ptr619, align 1
  %289 = load i64, i64* %_uquad, align 8
  %div = udiv i64 %289, 10
  store i64 %div, i64* %_uquad, align 8
  br label %do.cond620

do.cond620:                                       ; preds = %do.body616
  %290 = load i64, i64* %_uquad, align 8
  %cmp621 = icmp ne i64 %290, 0
  br i1 %cmp621, label %do.body616, label %do.end623

do.end623:                                        ; preds = %do.cond620
  br label %sw.epilog

sw.bb624:                                         ; preds = %if.then589
  br label %do.body625

do.body625:                                       ; preds = %do.cond630, %sw.bb624
  %291 = load i8*, i8** %xdigs, align 8
  %292 = load i64, i64* %_uquad, align 8
  %and626 = and i64 %292, 15
  %arrayidx627 = getelementptr inbounds i8, i8* %291, i64 %and626
  %293 = load i8, i8* %arrayidx627, align 1
  %294 = load i8*, i8** %cp, align 8
  %incdec.ptr628 = getelementptr inbounds i8, i8* %294, i32 -1
  store i8* %incdec.ptr628, i8** %cp, align 8
  store i8 %293, i8* %incdec.ptr628, align 1
  %295 = load i64, i64* %_uquad, align 8
  %shr629 = lshr i64 %295, 4
  store i64 %shr629, i64* %_uquad, align 8
  br label %do.cond630

do.cond630:                                       ; preds = %do.body625
  %296 = load i64, i64* %_uquad, align 8
  %tobool631 = icmp ne i64 %296, 0
  br i1 %tobool631, label %do.body625, label %do.end632

do.end632:                                        ; preds = %do.cond630
  br label %sw.epilog

sw.default:                                       ; preds = %if.then589
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3.7, i64 0, i64 0), i8** %cp, align 8
  %297 = load i8*, i8** %cp, align 8
  %call633 = call i64 @strlen(i8* %297) #4
  %conv634 = trunc i64 %call633 to i32
  store i32 %conv634, i32* %size, align 4
  br label %skipsize

sw.epilog:                                        ; preds = %do.end632, %do.end623, %if.then611, %if.end607
  br label %if.end644

if.else635:                                       ; preds = %lor.lhs.false586
  %298 = load i32, i32* %base, align 4
  %cmp636 = icmp eq i32 %298, 0
  br i1 %cmp636, label %land.lhs.true638, label %if.end643

land.lhs.true638:                                 ; preds = %if.else635
  %299 = load i32, i32* %flags, align 4
  %and639 = and i32 %299, 1
  %tobool640 = icmp ne i32 %and639, 0
  br i1 %tobool640, label %if.then641, label %if.end643

if.then641:                                       ; preds = %land.lhs.true638
  %300 = load i8*, i8** %cp, align 8
  %incdec.ptr642 = getelementptr inbounds i8, i8* %300, i32 -1
  store i8* %incdec.ptr642, i8** %cp, align 8
  store i8 48, i8* %incdec.ptr642, align 1
  br label %if.end643

if.end643:                                        ; preds = %if.then641, %land.lhs.true638, %if.else635
  br label %if.end644

if.end644:                                        ; preds = %if.end643, %sw.epilog
  %arraydecay645 = getelementptr inbounds [40 x i8], [40 x i8]* %buf, i64 0, i64 0
  %add.ptr646 = getelementptr inbounds i8, i8* %arraydecay645, i64 40
  %301 = load i8*, i8** %cp, align 8
  %sub.ptr.lhs.cast647 = ptrtoint i8* %add.ptr646 to i64
  %sub.ptr.rhs.cast648 = ptrtoint i8* %301 to i64
  %sub.ptr.sub649 = sub i64 %sub.ptr.lhs.cast647, %sub.ptr.rhs.cast648
  %conv650 = trunc i64 %sub.ptr.sub649 to i32
  store i32 %conv650, i32* %size, align 4
  br label %skipsize

skipsize:                                         ; preds = %if.end644, %sw.default
  br label %sw.epilog658

sw.default651:                                    ; preds = %reswitch
  %302 = load i32, i32* %ch, align 4
  %cmp652 = icmp eq i32 %302, 0
  br i1 %cmp652, label %if.then654, label %if.end655

if.then654:                                       ; preds = %sw.default651
  br label %done

if.end655:                                        ; preds = %sw.default651
  %arraydecay656 = getelementptr inbounds [40 x i8], [40 x i8]* %buf, i64 0, i64 0
  store i8* %arraydecay656, i8** %cp, align 8
  %303 = load i32, i32* %ch, align 4
  %conv657 = trunc i32 %303 to i8
  %304 = load i8*, i8** %cp, align 8
  store i8 %conv657, i8* %304, align 1
  store i32 1, i32* %size, align 4
  store i8 0, i8* %sign, align 1
  br label %sw.epilog658

sw.epilog658:                                     ; preds = %if.end655, %skipsize, %if.end426, %vaarg.end179
  %305 = load i32, i32* %dprec, align 4
  %306 = load i32, i32* %size, align 4
  %cmp659 = icmp sgt i32 %305, %306
  br i1 %cmp659, label %cond.true661, label %cond.false662

cond.true661:                                     ; preds = %sw.epilog658
  %307 = load i32, i32* %dprec, align 4
  br label %cond.end663

cond.false662:                                    ; preds = %sw.epilog658
  %308 = load i32, i32* %size, align 4
  br label %cond.end663

cond.end663:                                      ; preds = %cond.false662, %cond.true661
  %cond664 = phi i32 [ %307, %cond.true661 ], [ %308, %cond.false662 ]
  store i32 %cond664, i32* %realsz, align 4
  %309 = load i8, i8* %sign, align 1
  %tobool665 = icmp ne i8 %309, 0
  br i1 %tobool665, label %if.then666, label %if.end668

if.then666:                                       ; preds = %cond.end663
  %310 = load i32, i32* %realsz, align 4
  %inc667 = add nsw i32 %310, 1
  store i32 %inc667, i32* %realsz, align 4
  br label %if.end668

if.end668:                                        ; preds = %if.then666, %cond.end663
  %311 = load i32, i32* %flags, align 4
  %and669 = and i32 %311, 2
  %tobool670 = icmp ne i32 %and669, 0
  br i1 %tobool670, label %if.then671, label %if.end673

if.then671:                                       ; preds = %if.end668
  %312 = load i32, i32* %realsz, align 4
  %add672 = add nsw i32 %312, 2
  store i32 %add672, i32* %realsz, align 4
  br label %if.end673

if.end673:                                        ; preds = %if.then671, %if.end668
  %313 = load i32, i32* %flags, align 4
  %and674 = and i32 %313, 132
  %cmp675 = icmp eq i32 %and674, 0
  br i1 %cmp675, label %if.then677, label %if.end723

if.then677:                                       ; preds = %if.end673
  %314 = load i32, i32* %width, align 4
  %315 = load i32, i32* %realsz, align 4
  %sub678 = sub nsw i32 %314, %315
  store i32 %sub678, i32* %n, align 4
  %cmp679 = icmp sgt i32 %sub678, 0
  br i1 %cmp679, label %if.then681, label %if.end722

if.then681:                                       ; preds = %if.then677
  br label %while.cond682

while.cond682:                                    ; preds = %if.end701, %if.then681
  %316 = load i32, i32* %n, align 4
  %cmp683 = icmp sgt i32 %316, 16
  br i1 %cmp683, label %while.body685, label %while.end703

while.body685:                                    ; preds = %while.cond682
  %317 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base686 = getelementptr inbounds %struct.__siov, %struct.__siov* %317, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.blanks, i64 0, i64 0), i8** %iov_base686, align 8
  %318 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len687 = getelementptr inbounds %struct.__siov, %struct.__siov* %318, i32 0, i32 1
  store i64 16, i64* %iov_len687, align 8
  %uio_resid688 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %319 = load i64, i64* %uio_resid688, align 8
  %add689 = add i64 %319, 16
  store i64 %add689, i64* %uio_resid688, align 8
  %320 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr690 = getelementptr inbounds %struct.__siov, %struct.__siov* %320, i32 1
  store %struct.__siov* %incdec.ptr690, %struct.__siov** %iovp, align 8
  %uio_iovcnt691 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %321 = load i32, i32* %uio_iovcnt691, align 8
  %inc692 = add nsw i32 %321, 1
  store i32 %inc692, i32* %uio_iovcnt691, align 8
  %cmp693 = icmp sge i32 %inc692, 8
  br i1 %cmp693, label %if.then695, label %if.end701

if.then695:                                       ; preds = %while.body685
  %322 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %323 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call696 = call fastcc i32 @__sprint_r(%struct._reent* %322, %struct.__sFILE* %323, %struct.__suio* %uio) #4
  %tobool697 = icmp ne i32 %call696, 0
  br i1 %tobool697, label %if.then698, label %if.end699

if.then698:                                       ; preds = %if.then695
  br label %error

if.end699:                                        ; preds = %if.then695
  %arraydecay700 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay700, %struct.__siov** %iovp, align 8
  br label %if.end701

if.end701:                                        ; preds = %if.end699, %while.body685
  %324 = load i32, i32* %n, align 4
  %sub702 = sub nsw i32 %324, 16
  store i32 %sub702, i32* %n, align 4
  br label %while.cond682

while.end703:                                     ; preds = %while.cond682
  %325 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base704 = getelementptr inbounds %struct.__siov, %struct.__siov* %325, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.blanks, i64 0, i64 0), i8** %iov_base704, align 8
  %326 = load i32, i32* %n, align 4
  %conv705 = sext i32 %326 to i64
  %327 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len706 = getelementptr inbounds %struct.__siov, %struct.__siov* %327, i32 0, i32 1
  store i64 %conv705, i64* %iov_len706, align 8
  %328 = load i32, i32* %n, align 4
  %conv707 = sext i32 %328 to i64
  %uio_resid708 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %329 = load i64, i64* %uio_resid708, align 8
  %add709 = add i64 %329, %conv707
  store i64 %add709, i64* %uio_resid708, align 8
  %330 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr710 = getelementptr inbounds %struct.__siov, %struct.__siov* %330, i32 1
  store %struct.__siov* %incdec.ptr710, %struct.__siov** %iovp, align 8
  %uio_iovcnt711 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %331 = load i32, i32* %uio_iovcnt711, align 8
  %inc712 = add nsw i32 %331, 1
  store i32 %inc712, i32* %uio_iovcnt711, align 8
  %cmp713 = icmp sge i32 %inc712, 8
  br i1 %cmp713, label %if.then715, label %if.end721

if.then715:                                       ; preds = %while.end703
  %332 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %333 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call716 = call fastcc i32 @__sprint_r(%struct._reent* %332, %struct.__sFILE* %333, %struct.__suio* %uio) #4
  %tobool717 = icmp ne i32 %call716, 0
  br i1 %tobool717, label %if.then718, label %if.end719

if.then718:                                       ; preds = %if.then715
  br label %error

if.end719:                                        ; preds = %if.then715
  %arraydecay720 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay720, %struct.__siov** %iovp, align 8
  br label %if.end721

if.end721:                                        ; preds = %if.end719, %while.end703
  br label %if.end722

if.end722:                                        ; preds = %if.end721, %if.then677
  br label %if.end723

if.end723:                                        ; preds = %if.end722, %if.end673
  %334 = load i8, i8* %sign, align 1
  %tobool724 = icmp ne i8 %334, 0
  br i1 %tobool724, label %if.then725, label %if.end742

if.then725:                                       ; preds = %if.end723
  %335 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base726 = getelementptr inbounds %struct.__siov, %struct.__siov* %335, i32 0, i32 0
  store i8* %sign, i8** %iov_base726, align 8
  %336 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len727 = getelementptr inbounds %struct.__siov, %struct.__siov* %336, i32 0, i32 1
  store i64 1, i64* %iov_len727, align 8
  %uio_resid728 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %337 = load i64, i64* %uio_resid728, align 8
  %add729 = add i64 %337, 1
  store i64 %add729, i64* %uio_resid728, align 8
  %338 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr730 = getelementptr inbounds %struct.__siov, %struct.__siov* %338, i32 1
  store %struct.__siov* %incdec.ptr730, %struct.__siov** %iovp, align 8
  %uio_iovcnt731 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %339 = load i32, i32* %uio_iovcnt731, align 8
  %inc732 = add nsw i32 %339, 1
  store i32 %inc732, i32* %uio_iovcnt731, align 8
  %cmp733 = icmp sge i32 %inc732, 8
  br i1 %cmp733, label %if.then735, label %if.end741

if.then735:                                       ; preds = %if.then725
  %340 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %341 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call736 = call fastcc i32 @__sprint_r(%struct._reent* %340, %struct.__sFILE* %341, %struct.__suio* %uio) #4
  %tobool737 = icmp ne i32 %call736, 0
  br i1 %tobool737, label %if.then738, label %if.end739

if.then738:                                       ; preds = %if.then735
  br label %error

if.end739:                                        ; preds = %if.then735
  %arraydecay740 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay740, %struct.__siov** %iovp, align 8
  br label %if.end741

if.end741:                                        ; preds = %if.end739, %if.then725
  br label %if.end742

if.end742:                                        ; preds = %if.end741, %if.end723
  %342 = load i32, i32* %flags, align 4
  %and743 = and i32 %342, 2
  %tobool744 = icmp ne i32 %and743, 0
  br i1 %tobool744, label %if.then745, label %if.end763

if.then745:                                       ; preds = %if.end742
  %arraydecay746 = getelementptr inbounds [2 x i8], [2 x i8]* %ox, i64 0, i64 0
  %343 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base747 = getelementptr inbounds %struct.__siov, %struct.__siov* %343, i32 0, i32 0
  store i8* %arraydecay746, i8** %iov_base747, align 8
  %344 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len748 = getelementptr inbounds %struct.__siov, %struct.__siov* %344, i32 0, i32 1
  store i64 2, i64* %iov_len748, align 8
  %uio_resid749 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %345 = load i64, i64* %uio_resid749, align 8
  %add750 = add i64 %345, 2
  store i64 %add750, i64* %uio_resid749, align 8
  %346 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr751 = getelementptr inbounds %struct.__siov, %struct.__siov* %346, i32 1
  store %struct.__siov* %incdec.ptr751, %struct.__siov** %iovp, align 8
  %uio_iovcnt752 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %347 = load i32, i32* %uio_iovcnt752, align 8
  %inc753 = add nsw i32 %347, 1
  store i32 %inc753, i32* %uio_iovcnt752, align 8
  %cmp754 = icmp sge i32 %inc753, 8
  br i1 %cmp754, label %if.then756, label %if.end762

if.then756:                                       ; preds = %if.then745
  %348 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %349 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call757 = call fastcc i32 @__sprint_r(%struct._reent* %348, %struct.__sFILE* %349, %struct.__suio* %uio) #4
  %tobool758 = icmp ne i32 %call757, 0
  br i1 %tobool758, label %if.then759, label %if.end760

if.then759:                                       ; preds = %if.then756
  br label %error

if.end760:                                        ; preds = %if.then756
  %arraydecay761 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay761, %struct.__siov** %iovp, align 8
  br label %if.end762

if.end762:                                        ; preds = %if.end760, %if.then745
  br label %if.end763

if.end763:                                        ; preds = %if.end762, %if.end742
  %350 = load i32, i32* %flags, align 4
  %and764 = and i32 %350, 132
  %cmp765 = icmp eq i32 %and764, 128
  br i1 %cmp765, label %if.then767, label %if.end813

if.then767:                                       ; preds = %if.end763
  %351 = load i32, i32* %width, align 4
  %352 = load i32, i32* %realsz, align 4
  %sub768 = sub nsw i32 %351, %352
  store i32 %sub768, i32* %n, align 4
  %cmp769 = icmp sgt i32 %sub768, 0
  br i1 %cmp769, label %if.then771, label %if.end812

if.then771:                                       ; preds = %if.then767
  br label %while.cond772

while.cond772:                                    ; preds = %if.end791, %if.then771
  %353 = load i32, i32* %n, align 4
  %cmp773 = icmp sgt i32 %353, 16
  br i1 %cmp773, label %while.body775, label %while.end793

while.body775:                                    ; preds = %while.cond772
  %354 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base776 = getelementptr inbounds %struct.__siov, %struct.__siov* %354, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.zeroes, i64 0, i64 0), i8** %iov_base776, align 8
  %355 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len777 = getelementptr inbounds %struct.__siov, %struct.__siov* %355, i32 0, i32 1
  store i64 16, i64* %iov_len777, align 8
  %uio_resid778 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %356 = load i64, i64* %uio_resid778, align 8
  %add779 = add i64 %356, 16
  store i64 %add779, i64* %uio_resid778, align 8
  %357 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr780 = getelementptr inbounds %struct.__siov, %struct.__siov* %357, i32 1
  store %struct.__siov* %incdec.ptr780, %struct.__siov** %iovp, align 8
  %uio_iovcnt781 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %358 = load i32, i32* %uio_iovcnt781, align 8
  %inc782 = add nsw i32 %358, 1
  store i32 %inc782, i32* %uio_iovcnt781, align 8
  %cmp783 = icmp sge i32 %inc782, 8
  br i1 %cmp783, label %if.then785, label %if.end791

if.then785:                                       ; preds = %while.body775
  %359 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %360 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call786 = call fastcc i32 @__sprint_r(%struct._reent* %359, %struct.__sFILE* %360, %struct.__suio* %uio) #4
  %tobool787 = icmp ne i32 %call786, 0
  br i1 %tobool787, label %if.then788, label %if.end789

if.then788:                                       ; preds = %if.then785
  br label %error

if.end789:                                        ; preds = %if.then785
  %arraydecay790 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay790, %struct.__siov** %iovp, align 8
  br label %if.end791

if.end791:                                        ; preds = %if.end789, %while.body775
  %361 = load i32, i32* %n, align 4
  %sub792 = sub nsw i32 %361, 16
  store i32 %sub792, i32* %n, align 4
  br label %while.cond772

while.end793:                                     ; preds = %while.cond772
  %362 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base794 = getelementptr inbounds %struct.__siov, %struct.__siov* %362, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.zeroes, i64 0, i64 0), i8** %iov_base794, align 8
  %363 = load i32, i32* %n, align 4
  %conv795 = sext i32 %363 to i64
  %364 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len796 = getelementptr inbounds %struct.__siov, %struct.__siov* %364, i32 0, i32 1
  store i64 %conv795, i64* %iov_len796, align 8
  %365 = load i32, i32* %n, align 4
  %conv797 = sext i32 %365 to i64
  %uio_resid798 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %366 = load i64, i64* %uio_resid798, align 8
  %add799 = add i64 %366, %conv797
  store i64 %add799, i64* %uio_resid798, align 8
  %367 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr800 = getelementptr inbounds %struct.__siov, %struct.__siov* %367, i32 1
  store %struct.__siov* %incdec.ptr800, %struct.__siov** %iovp, align 8
  %uio_iovcnt801 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %368 = load i32, i32* %uio_iovcnt801, align 8
  %inc802 = add nsw i32 %368, 1
  store i32 %inc802, i32* %uio_iovcnt801, align 8
  %cmp803 = icmp sge i32 %inc802, 8
  br i1 %cmp803, label %if.then805, label %if.end811

if.then805:                                       ; preds = %while.end793
  %369 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %370 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call806 = call fastcc i32 @__sprint_r(%struct._reent* %369, %struct.__sFILE* %370, %struct.__suio* %uio) #4
  %tobool807 = icmp ne i32 %call806, 0
  br i1 %tobool807, label %if.then808, label %if.end809

if.then808:                                       ; preds = %if.then805
  br label %error

if.end809:                                        ; preds = %if.then805
  %arraydecay810 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay810, %struct.__siov** %iovp, align 8
  br label %if.end811

if.end811:                                        ; preds = %if.end809, %while.end793
  br label %if.end812

if.end812:                                        ; preds = %if.end811, %if.then767
  br label %if.end813

if.end813:                                        ; preds = %if.end812, %if.end763
  %371 = load i32, i32* %dprec, align 4
  %372 = load i32, i32* %size, align 4
  %sub814 = sub nsw i32 %371, %372
  store i32 %sub814, i32* %n, align 4
  %cmp815 = icmp sgt i32 %sub814, 0
  br i1 %cmp815, label %if.then817, label %if.end858

if.then817:                                       ; preds = %if.end813
  br label %while.cond818

while.cond818:                                    ; preds = %if.end837, %if.then817
  %373 = load i32, i32* %n, align 4
  %cmp819 = icmp sgt i32 %373, 16
  br i1 %cmp819, label %while.body821, label %while.end839

while.body821:                                    ; preds = %while.cond818
  %374 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base822 = getelementptr inbounds %struct.__siov, %struct.__siov* %374, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.zeroes, i64 0, i64 0), i8** %iov_base822, align 8
  %375 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len823 = getelementptr inbounds %struct.__siov, %struct.__siov* %375, i32 0, i32 1
  store i64 16, i64* %iov_len823, align 8
  %uio_resid824 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %376 = load i64, i64* %uio_resid824, align 8
  %add825 = add i64 %376, 16
  store i64 %add825, i64* %uio_resid824, align 8
  %377 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr826 = getelementptr inbounds %struct.__siov, %struct.__siov* %377, i32 1
  store %struct.__siov* %incdec.ptr826, %struct.__siov** %iovp, align 8
  %uio_iovcnt827 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %378 = load i32, i32* %uio_iovcnt827, align 8
  %inc828 = add nsw i32 %378, 1
  store i32 %inc828, i32* %uio_iovcnt827, align 8
  %cmp829 = icmp sge i32 %inc828, 8
  br i1 %cmp829, label %if.then831, label %if.end837

if.then831:                                       ; preds = %while.body821
  %379 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %380 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call832 = call fastcc i32 @__sprint_r(%struct._reent* %379, %struct.__sFILE* %380, %struct.__suio* %uio) #4
  %tobool833 = icmp ne i32 %call832, 0
  br i1 %tobool833, label %if.then834, label %if.end835

if.then834:                                       ; preds = %if.then831
  br label %error

if.end835:                                        ; preds = %if.then831
  %arraydecay836 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay836, %struct.__siov** %iovp, align 8
  br label %if.end837

if.end837:                                        ; preds = %if.end835, %while.body821
  %381 = load i32, i32* %n, align 4
  %sub838 = sub nsw i32 %381, 16
  store i32 %sub838, i32* %n, align 4
  br label %while.cond818

while.end839:                                     ; preds = %while.cond818
  %382 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base840 = getelementptr inbounds %struct.__siov, %struct.__siov* %382, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.zeroes, i64 0, i64 0), i8** %iov_base840, align 8
  %383 = load i32, i32* %n, align 4
  %conv841 = sext i32 %383 to i64
  %384 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len842 = getelementptr inbounds %struct.__siov, %struct.__siov* %384, i32 0, i32 1
  store i64 %conv841, i64* %iov_len842, align 8
  %385 = load i32, i32* %n, align 4
  %conv843 = sext i32 %385 to i64
  %uio_resid844 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %386 = load i64, i64* %uio_resid844, align 8
  %add845 = add i64 %386, %conv843
  store i64 %add845, i64* %uio_resid844, align 8
  %387 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr846 = getelementptr inbounds %struct.__siov, %struct.__siov* %387, i32 1
  store %struct.__siov* %incdec.ptr846, %struct.__siov** %iovp, align 8
  %uio_iovcnt847 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %388 = load i32, i32* %uio_iovcnt847, align 8
  %inc848 = add nsw i32 %388, 1
  store i32 %inc848, i32* %uio_iovcnt847, align 8
  %cmp849 = icmp sge i32 %inc848, 8
  br i1 %cmp849, label %if.then851, label %if.end857

if.then851:                                       ; preds = %while.end839
  %389 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %390 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call852 = call fastcc i32 @__sprint_r(%struct._reent* %389, %struct.__sFILE* %390, %struct.__suio* %uio) #4
  %tobool853 = icmp ne i32 %call852, 0
  br i1 %tobool853, label %if.then854, label %if.end855

if.then854:                                       ; preds = %if.then851
  br label %error

if.end855:                                        ; preds = %if.then851
  %arraydecay856 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay856, %struct.__siov** %iovp, align 8
  br label %if.end857

if.end857:                                        ; preds = %if.end855, %while.end839
  br label %if.end858

if.end858:                                        ; preds = %if.end857, %if.end813
  %391 = load i8*, i8** %cp, align 8
  %392 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base859 = getelementptr inbounds %struct.__siov, %struct.__siov* %392, i32 0, i32 0
  store i8* %391, i8** %iov_base859, align 8
  %393 = load i32, i32* %size, align 4
  %conv860 = sext i32 %393 to i64
  %394 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len861 = getelementptr inbounds %struct.__siov, %struct.__siov* %394, i32 0, i32 1
  store i64 %conv860, i64* %iov_len861, align 8
  %395 = load i32, i32* %size, align 4
  %conv862 = sext i32 %395 to i64
  %uio_resid863 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %396 = load i64, i64* %uio_resid863, align 8
  %add864 = add i64 %396, %conv862
  store i64 %add864, i64* %uio_resid863, align 8
  %397 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr865 = getelementptr inbounds %struct.__siov, %struct.__siov* %397, i32 1
  store %struct.__siov* %incdec.ptr865, %struct.__siov** %iovp, align 8
  %uio_iovcnt866 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %398 = load i32, i32* %uio_iovcnt866, align 8
  %inc867 = add nsw i32 %398, 1
  store i32 %inc867, i32* %uio_iovcnt866, align 8
  %cmp868 = icmp sge i32 %inc867, 8
  br i1 %cmp868, label %if.then870, label %if.end876

if.then870:                                       ; preds = %if.end858
  %399 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %400 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call871 = call fastcc i32 @__sprint_r(%struct._reent* %399, %struct.__sFILE* %400, %struct.__suio* %uio) #4
  %tobool872 = icmp ne i32 %call871, 0
  br i1 %tobool872, label %if.then873, label %if.end874

if.then873:                                       ; preds = %if.then870
  br label %error

if.end874:                                        ; preds = %if.then870
  %arraydecay875 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay875, %struct.__siov** %iovp, align 8
  br label %if.end876

if.end876:                                        ; preds = %if.end874, %if.end858
  %401 = load i32, i32* %flags, align 4
  %and877 = and i32 %401, 4
  %tobool878 = icmp ne i32 %and877, 0
  br i1 %tobool878, label %if.then879, label %if.end925

if.then879:                                       ; preds = %if.end876
  %402 = load i32, i32* %width, align 4
  %403 = load i32, i32* %realsz, align 4
  %sub880 = sub nsw i32 %402, %403
  store i32 %sub880, i32* %n, align 4
  %cmp881 = icmp sgt i32 %sub880, 0
  br i1 %cmp881, label %if.then883, label %if.end924

if.then883:                                       ; preds = %if.then879
  br label %while.cond884

while.cond884:                                    ; preds = %if.end903, %if.then883
  %404 = load i32, i32* %n, align 4
  %cmp885 = icmp sgt i32 %404, 16
  br i1 %cmp885, label %while.body887, label %while.end905

while.body887:                                    ; preds = %while.cond884
  %405 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base888 = getelementptr inbounds %struct.__siov, %struct.__siov* %405, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.blanks, i64 0, i64 0), i8** %iov_base888, align 8
  %406 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len889 = getelementptr inbounds %struct.__siov, %struct.__siov* %406, i32 0, i32 1
  store i64 16, i64* %iov_len889, align 8
  %uio_resid890 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %407 = load i64, i64* %uio_resid890, align 8
  %add891 = add i64 %407, 16
  store i64 %add891, i64* %uio_resid890, align 8
  %408 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr892 = getelementptr inbounds %struct.__siov, %struct.__siov* %408, i32 1
  store %struct.__siov* %incdec.ptr892, %struct.__siov** %iovp, align 8
  %uio_iovcnt893 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %409 = load i32, i32* %uio_iovcnt893, align 8
  %inc894 = add nsw i32 %409, 1
  store i32 %inc894, i32* %uio_iovcnt893, align 8
  %cmp895 = icmp sge i32 %inc894, 8
  br i1 %cmp895, label %if.then897, label %if.end903

if.then897:                                       ; preds = %while.body887
  %410 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %411 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call898 = call fastcc i32 @__sprint_r(%struct._reent* %410, %struct.__sFILE* %411, %struct.__suio* %uio) #4
  %tobool899 = icmp ne i32 %call898, 0
  br i1 %tobool899, label %if.then900, label %if.end901

if.then900:                                       ; preds = %if.then897
  br label %error

if.end901:                                        ; preds = %if.then897
  %arraydecay902 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay902, %struct.__siov** %iovp, align 8
  br label %if.end903

if.end903:                                        ; preds = %if.end901, %while.body887
  %412 = load i32, i32* %n, align 4
  %sub904 = sub nsw i32 %412, 16
  store i32 %sub904, i32* %n, align 4
  br label %while.cond884

while.end905:                                     ; preds = %while.cond884
  %413 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_base906 = getelementptr inbounds %struct.__siov, %struct.__siov* %413, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_vfprintf_r.blanks, i64 0, i64 0), i8** %iov_base906, align 8
  %414 = load i32, i32* %n, align 4
  %conv907 = sext i32 %414 to i64
  %415 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %iov_len908 = getelementptr inbounds %struct.__siov, %struct.__siov* %415, i32 0, i32 1
  store i64 %conv907, i64* %iov_len908, align 8
  %416 = load i32, i32* %n, align 4
  %conv909 = sext i32 %416 to i64
  %uio_resid910 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %417 = load i64, i64* %uio_resid910, align 8
  %add911 = add i64 %417, %conv909
  store i64 %add911, i64* %uio_resid910, align 8
  %418 = load %struct.__siov*, %struct.__siov** %iovp, align 8
  %incdec.ptr912 = getelementptr inbounds %struct.__siov, %struct.__siov* %418, i32 1
  store %struct.__siov* %incdec.ptr912, %struct.__siov** %iovp, align 8
  %uio_iovcnt913 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  %419 = load i32, i32* %uio_iovcnt913, align 8
  %inc914 = add nsw i32 %419, 1
  store i32 %inc914, i32* %uio_iovcnt913, align 8
  %cmp915 = icmp sge i32 %inc914, 8
  br i1 %cmp915, label %if.then917, label %if.end923

if.then917:                                       ; preds = %while.end905
  %420 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %421 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call918 = call fastcc i32 @__sprint_r(%struct._reent* %420, %struct.__sFILE* %421, %struct.__suio* %uio) #4
  %tobool919 = icmp ne i32 %call918, 0
  br i1 %tobool919, label %if.then920, label %if.end921

if.then920:                                       ; preds = %if.then917
  br label %error

if.end921:                                        ; preds = %if.then917
  %arraydecay922 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay922, %struct.__siov** %iovp, align 8
  br label %if.end923

if.end923:                                        ; preds = %if.end921, %while.end905
  br label %if.end924

if.end924:                                        ; preds = %if.end923, %if.then879
  br label %if.end925

if.end925:                                        ; preds = %if.end924, %if.end876
  %422 = load i32, i32* %width, align 4
  %423 = load i32, i32* %realsz, align 4
  %cmp926 = icmp sgt i32 %422, %423
  br i1 %cmp926, label %cond.true928, label %cond.false929

cond.true928:                                     ; preds = %if.end925
  %424 = load i32, i32* %width, align 4
  br label %cond.end930

cond.false929:                                    ; preds = %if.end925
  %425 = load i32, i32* %realsz, align 4
  br label %cond.end930

cond.end930:                                      ; preds = %cond.false929, %cond.true928
  %cond931 = phi i32 [ %424, %cond.true928 ], [ %425, %cond.false929 ]
  %426 = load i32, i32* %ret, align 4
  %add932 = add nsw i32 %426, %cond931
  store i32 %add932, i32* %ret, align 4
  %uio_resid933 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %427 = load i64, i64* %uio_resid933, align 8
  %tobool934 = icmp ne i64 %427, 0
  br i1 %tobool934, label %land.lhs.true935, label %if.end939

land.lhs.true935:                                 ; preds = %cond.end930
  %428 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %429 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call936 = call fastcc i32 @__sprint_r(%struct._reent* %428, %struct.__sFILE* %429, %struct.__suio* %uio) #4
  %tobool937 = icmp ne i32 %call936, 0
  br i1 %tobool937, label %if.then938, label %if.end939

if.then938:                                       ; preds = %land.lhs.true935
  br label %error

if.end939:                                        ; preds = %land.lhs.true935, %cond.end930
  %uio_iovcnt940 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  store i32 0, i32* %uio_iovcnt940, align 8
  %arraydecay941 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay941, %struct.__siov** %iovp, align 8
  %430 = load i8*, i8** %malloc_buf, align 8
  %cmp942 = icmp ne i8* %430, null
  br i1 %cmp942, label %if.then944, label %if.end945

if.then944:                                       ; preds = %if.end939
  %431 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %432 = load i8*, i8** %malloc_buf, align 8
  call fastcc void @_free_r(%struct._reent* %431, i8* %432) #4
  store i8* null, i8** %malloc_buf, align 8
  br label %if.end945

if.end945:                                        ; preds = %if.then944, %if.end939
  br label %for.cond.backedge

done:                                             ; preds = %if.then654, %if.then94
  %uio_resid946 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 2
  %433 = load i64, i64* %uio_resid946, align 8
  %tobool947 = icmp ne i64 %433, 0
  br i1 %tobool947, label %land.lhs.true948, label %if.end952

land.lhs.true948:                                 ; preds = %done
  %434 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %435 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call949 = call fastcc i32 @__sprint_r(%struct._reent* %434, %struct.__sFILE* %435, %struct.__suio* %uio) #4
  %tobool950 = icmp ne i32 %call949, 0
  br i1 %tobool950, label %if.then951, label %if.end952

if.then951:                                       ; preds = %land.lhs.true948
  br label %error

if.end952:                                        ; preds = %land.lhs.true948, %done
  %uio_iovcnt953 = getelementptr inbounds %struct.__suio, %struct.__suio* %uio, i32 0, i32 1
  store i32 0, i32* %uio_iovcnt953, align 8
  %arraydecay954 = getelementptr inbounds [8 x %struct.__siov], [8 x %struct.__siov]* %iov, i64 0, i64 0
  store %struct.__siov* %arraydecay954, %struct.__siov** %iovp, align 8
  br label %error

error:                                            ; preds = %if.end952, %if.then951, %if.then938, %if.then920, %if.then900, %if.then873, %if.then854, %if.then834, %if.then808, %if.then788, %if.then759, %if.then738, %if.then718, %if.then698, %if.then85
  %436 = load i8*, i8** %malloc_buf, align 8
  %cmp955 = icmp ne i8* %436, null
  br i1 %cmp955, label %if.then957, label %if.end958

if.then957:                                       ; preds = %error
  %437 = load %struct._reent*, %struct._reent** %data.addr, align 8
  %438 = load i8*, i8** %malloc_buf, align 8
  call fastcc void @_free_r(%struct._reent* %437, i8* %438) #4
  br label %if.end958

if.end958:                                        ; preds = %if.then957, %error
  %439 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2959 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %439, i32 0, i32 23
  %440 = load i32, i32* %_flags2959, align 4
  %and960 = and i32 %440, 1
  %tobool961 = icmp ne i32 %and960, 0
  br i1 %tobool961, label %if.end970, label %if.then962

if.then962:                                       ; preds = %if.end958
  %441 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags963 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %441, i32 0, i32 3
  %442 = load i16, i16* %_flags963, align 8
  %conv964 = sext i16 %442 to i32
  %and965 = and i32 %conv964, 512
  %tobool966 = icmp ne i32 %and965, 0
  br i1 %tobool966, label %cond.true967, label %cond.false968

cond.true967:                                     ; preds = %if.then962
  br label %cond.end969

cond.false968:                                    ; preds = %if.then962
  br label %cond.end969

cond.end969:                                      ; preds = %cond.false968, %cond.true967
  br label %if.end970

if.end970:                                        ; preds = %cond.end969, %if.end958
  %443 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags971 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %443, i32 0, i32 3
  %444 = load i16, i16* %_flags971, align 8
  %conv972 = sext i16 %444 to i32
  %and973 = and i32 %conv972, 64
  %cmp974 = icmp ne i32 %and973, 0
  br i1 %cmp974, label %cond.true976, label %cond.false977

cond.true976:                                     ; preds = %if.end970
  br label %cond.end978

cond.false977:                                    ; preds = %if.end970
  %445 = load i32, i32* %ret, align 4
  br label %cond.end978

cond.end978:                                      ; preds = %cond.false977, %cond.true976
  %cond979 = phi i32 [ -1, %cond.true976 ], [ %445, %cond.false977 ]
  store i32 %cond979, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end978, %if.end63, %if.end40
  %446 = load i32, i32* %retval, align 4
  ret i32 %446
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__sbprintf(%struct._reent* %rptr, %struct.__sFILE* %fp, i8* %fmt, %struct.__va_list_tag* %ap) unnamed_addr #1 {
entry:
  %rptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %fmt.addr = alloca i8*, align 8
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  %ret = alloca i32, align 4
  %fake = alloca %struct.__sFILE, align 8
  %buf = alloca [1024 x i8], align 16
  store %struct._reent* %rptr, %struct._reent** %rptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store i8* %fmt, i8** %fmt.addr, align 8
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 3
  %1 = load i16, i16* %_flags, align 8
  %conv = sext i16 %1 to i32
  %and = and i32 %conv, -3
  %conv1 = trunc i32 %and to i16
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 3
  store i16 %conv1, i16* %_flags2, align 8
  %2 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags23 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %2, i32 0, i32 23
  %3 = load i32, i32* %_flags23, align 4
  %_flags24 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 23
  store i32 %3, i32* %_flags24, align 4
  %4 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_file = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 4
  %5 = load i16, i16* %_file, align 2
  %_file5 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 4
  store i16 %5, i16* %_file5, align 2
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %6, i32 0, i32 7
  %7 = load i8*, i8** %_cookie, align 8
  %_cookie6 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 7
  store i8* %7, i8** %_cookie6, align 8
  %8 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_write = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %8, i32 0, i32 9
  %9 = load i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)** %_write, align 8
  %_write7 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 9
  store i32 (%struct._reent*, i8*, i8*, i32)* %9, i32 (%struct._reent*, i8*, i8*, i32)** %_write7, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i64 0, i64 0
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 0
  store i8* %arraydecay, i8** %_p, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  store i8* %arraydecay, i8** %_base, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 2
  store i32 1024, i32* %_w, align 4
  %_bf8 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf8, i32 0, i32 1
  store i32 1024, i32* %_size, align 8
  %_lbfsize = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 6
  store i32 0, i32* %_lbfsize, align 8
  %10 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %11 = load i8*, i8** %fmt.addr, align 8
  %12 = load %struct.__va_list_tag*, %struct.__va_list_tag** %ap.addr, align 8
  %call = call fastcc i32 @_vfprintf_r(%struct._reent* %10, %struct.__sFILE* %fake, i8* %11, %struct.__va_list_tag* %12) #4
  store i32 %call, i32* %ret, align 4
  %13 = load i32, i32* %ret, align 4
  %cmp = icmp sge i32 %13, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %14 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %call10 = call i32 @_fflush_r(%struct._reent* %14, %struct.__sFILE* %fake) #4
  %tobool = icmp ne i32 %call10, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 -1, i32* %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %_flags11 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %fake, i32 0, i32 3
  %15 = load i16, i16* %_flags11, align 8
  %conv12 = sext i16 %15 to i32
  %and13 = and i32 %conv12, 64
  %tobool14 = icmp ne i32 %and13, 0
  br i1 %tobool14, label %if.then15, label %if.end19

if.then15:                                        ; preds = %if.end
  %16 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags16 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %16, i32 0, i32 3
  %17 = load i16, i16* %_flags16, align 8
  %conv17 = sext i16 %17 to i32
  %or = or i32 %conv17, 64
  %conv18 = trunc i32 %or to i16
  store i16 %conv18, i16* %_flags16, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.then15, %if.end
  %18 = load i32, i32* %ret, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__swsetup_r(%struct._reent* %ptr, %struct.__sFILE* %fp) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %_check_init_ptr = alloca %struct._reent*, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  store %struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct._reent** %_check_init_ptr, align 8
  %0 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %tobool = icmp ne %struct._reent* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %1, i32 0, i32 8
  %2 = load i32, i32* %__sdidinit, align 8
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  call fastcc void @__sinit(%struct._reent* %3) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %4 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 3
  %5 = load i16, i16* %_flags, align 8
  %conv = sext i16 %5 to i32
  %and = and i32 %conv, 8
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then3, label %if.end43

if.then3:                                         ; preds = %do.end
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags4 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %6, i32 0, i32 3
  %7 = load i16, i16* %_flags4, align 8
  %conv5 = sext i16 %7 to i32
  %and6 = and i32 %conv5, 16
  %cmp7 = icmp eq i32 %and6, 0
  br i1 %cmp7, label %if.then9, label %if.end13

if.then9:                                         ; preds = %if.then3
  %8 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %8, i32 0, i32 0
  store i32 9, i32* %_errno, align 8
  %9 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags10 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %9, i32 0, i32 3
  %10 = load i16, i16* %_flags10, align 8
  %conv11 = sext i16 %10 to i32
  %or = or i32 %conv11, 64
  %conv12 = trunc i32 %or to i16
  store i16 %conv12, i16* %_flags10, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.then3
  %11 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags14 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %11, i32 0, i32 3
  %12 = load i16, i16* %_flags14, align 8
  %conv15 = sext i16 %12 to i32
  %and16 = and i32 %conv15, 4
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %if.then18, label %if.end38

if.then18:                                        ; preds = %if.end13
  %13 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %13, i32 0, i32 12
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub, i32 0, i32 0
  %14 = load i8*, i8** %_base, align 8
  %cmp19 = icmp ne i8* %14, null
  br i1 %cmp19, label %if.then21, label %if.end32

if.then21:                                        ; preds = %if.then18
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub22 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 12
  %_base23 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub22, i32 0, i32 0
  %16 = load i8*, i8** %_base23, align 8
  %17 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ubuf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %17, i32 0, i32 15
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %_ubuf, i64 0, i64 0
  %cmp24 = icmp ne i8* %16, %arraydecay
  br i1 %cmp24, label %if.then26, label %if.end29

if.then26:                                        ; preds = %if.then21
  %18 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %19 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub27 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %19, i32 0, i32 12
  %_base28 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub27, i32 0, i32 0
  %20 = load i8*, i8** %_base28, align 8
  call fastcc void @_free_r(%struct._reent* %18, i8* %20) #4
  br label %if.end29

if.end29:                                         ; preds = %if.then26, %if.then21
  %21 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub30 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %21, i32 0, i32 12
  %_base31 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub30, i32 0, i32 0
  store i8* null, i8** %_base31, align 8
  br label %if.end32

if.end32:                                         ; preds = %if.end29, %if.then18
  %22 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags33 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %22, i32 0, i32 3
  %23 = load i16, i16* %_flags33, align 8
  %conv34 = sext i16 %23 to i32
  %and35 = and i32 %conv34, -37
  %conv36 = trunc i32 %and35 to i16
  store i16 %conv36, i16* %_flags33, align 8
  %24 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_r = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %24, i32 0, i32 1
  store i32 0, i32* %_r, align 8
  %25 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %25, i32 0, i32 5
  %_base37 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  %26 = load i8*, i8** %_base37, align 8
  %27 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %27, i32 0, i32 0
  store i8* %26, i8** %_p, align 8
  br label %if.end38

if.end38:                                         ; preds = %if.end32, %if.end13
  %28 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags39 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %28, i32 0, i32 3
  %29 = load i16, i16* %_flags39, align 8
  %conv40 = sext i16 %29 to i32
  %or41 = or i32 %conv40, 8
  %conv42 = trunc i32 %or41 to i16
  store i16 %conv42, i16* %_flags39, align 8
  br label %if.end43

if.end43:                                         ; preds = %if.end38, %do.end
  %30 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf44 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %30, i32 0, i32 5
  %_base45 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf44, i32 0, i32 0
  %31 = load i8*, i8** %_base45, align 8
  %cmp46 = icmp eq i8* %31, null
  br i1 %cmp46, label %land.lhs.true48, label %if.end58

land.lhs.true48:                                  ; preds = %if.end43
  %32 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags49 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %32, i32 0, i32 3
  %33 = load i16, i16* %_flags49, align 8
  %conv50 = sext i16 %33 to i32
  %and51 = and i32 %conv50, 512
  %tobool52 = icmp ne i32 %and51, 0
  br i1 %tobool52, label %lor.lhs.false, label %if.then57

lor.lhs.false:                                    ; preds = %land.lhs.true48
  %34 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags53 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %34, i32 0, i32 3
  %35 = load i16, i16* %_flags53, align 8
  %conv54 = sext i16 %35 to i32
  %and55 = and i32 %conv54, 128
  %tobool56 = icmp ne i32 %and55, 0
  br i1 %tobool56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %lor.lhs.false, %land.lhs.true48
  %36 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %37 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  call fastcc void @__smakebuf_r(%struct._reent* %36, %struct.__sFILE* %37) #4
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %lor.lhs.false, %if.end43
  %38 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags59 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %38, i32 0, i32 3
  %39 = load i16, i16* %_flags59, align 8
  %conv60 = sext i16 %39 to i32
  %and61 = and i32 %conv60, 1
  %tobool62 = icmp ne i32 %and61, 0
  br i1 %tobool62, label %if.then63, label %if.else

if.then63:                                        ; preds = %if.end58
  %40 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %40, i32 0, i32 2
  store i32 0, i32* %_w, align 4
  %41 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf64 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %41, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf64, i32 0, i32 1
  %42 = load i32, i32* %_size, align 8
  %sub = sub nsw i32 0, %42
  %43 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_lbfsize = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %43, i32 0, i32 6
  store i32 %sub, i32* %_lbfsize, align 8
  br label %if.end72

if.else:                                          ; preds = %if.end58
  %44 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags65 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %44, i32 0, i32 3
  %45 = load i16, i16* %_flags65, align 8
  %conv66 = sext i16 %45 to i32
  %and67 = and i32 %conv66, 2
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %46 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf69 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %46, i32 0, i32 5
  %_size70 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf69, i32 0, i32 1
  %47 = load i32, i32* %_size70, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %47, %cond.false ]
  %48 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w71 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %48, i32 0, i32 2
  store i32 %cond, i32* %_w71, align 4
  br label %if.end72

if.end72:                                         ; preds = %cond.end, %if.then63
  %49 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf73 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %49, i32 0, i32 5
  %_base74 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf73, i32 0, i32 0
  %50 = load i8*, i8** %_base74, align 8
  %tobool75 = icmp ne i8* %50, null
  br i1 %tobool75, label %if.end86, label %land.lhs.true76

land.lhs.true76:                                  ; preds = %if.end72
  %51 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags77 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %51, i32 0, i32 3
  %52 = load i16, i16* %_flags77, align 8
  %conv78 = sext i16 %52 to i32
  %and79 = and i32 %conv78, 128
  %tobool80 = icmp ne i32 %and79, 0
  br i1 %tobool80, label %if.then81, label %if.end86

if.then81:                                        ; preds = %land.lhs.true76
  %53 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags82 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %53, i32 0, i32 3
  %54 = load i16, i16* %_flags82, align 8
  %conv83 = sext i16 %54 to i32
  %or84 = or i32 %conv83, 64
  %conv85 = trunc i32 %or84 to i16
  store i16 %conv85, i16* %_flags82, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end86:                                         ; preds = %land.lhs.true76, %if.end72
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end86, %if.then81, %if.then9
  %55 = load i32, i32* %retval, align 4
  ret i32 %55
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__sflush_r(%struct._reent* %ptr, %struct.__sFILE* %fp) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %p = alloca i8*, align 8
  %n = alloca i32, align 4
  %t = alloca i32, align 4
  %flags = alloca i16, align 2
  %tmp_errno = alloca i32, align 4
  %curoff = alloca i64, align 8
  %result = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 3
  %1 = load i16, i16* %_flags, align 8
  store i16 %1, i16* %flags, align 2
  %2 = load i16, i16* %flags, align 2
  %conv = sext i16 %2 to i32
  %and = and i32 %conv, 8
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end118

if.then:                                          ; preds = %entry
  %3 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %3, i32 0, i32 3
  %4 = load i16, i16* %_flags2, align 8
  %conv3 = sext i16 %4 to i32
  %or = or i32 %conv3, 2048
  %conv4 = trunc i32 %or to i16
  store i16 %conv4, i16* %_flags2, align 8
  %5 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_r = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 1
  %6 = load i32, i32* %_r, align 8
  %cmp5 = icmp sgt i32 %6, 0
  br i1 %cmp5, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ur = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %7, i32 0, i32 14
  %8 = load i32, i32* %_ur, align 8
  %cmp7 = icmp sgt i32 %8, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end117

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.then
  %9 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_seek = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %9, i32 0, i32 10
  %10 = load i64 (%struct._reent*, i8*, i64, i32)*, i64 (%struct._reent*, i8*, i64, i32)** %_seek, align 8
  %cmp9 = icmp ne i64 (%struct._reent*, i8*, i64, i32)* %10, null
  br i1 %cmp9, label %if.then11, label %if.end117

if.then11:                                        ; preds = %land.lhs.true
  %11 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %11, i32 0, i32 0
  %12 = load i32, i32* %_errno, align 8
  store i32 %12, i32* %tmp_errno, align 4
  %13 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno12 = getelementptr inbounds %struct._reent, %struct._reent* %13, i32 0, i32 0
  store i32 0, i32* %_errno12, align 8
  %14 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags13 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %14, i32 0, i32 3
  %15 = load i16, i16* %_flags13, align 8
  %conv14 = sext i16 %15 to i32
  %and15 = and i32 %conv14, 4096
  %tobool = icmp ne i32 %and15, 0
  br i1 %tobool, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.then11
  %16 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_offset = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %16, i32 0, i32 19
  %17 = load i64, i64* %_offset, align 8
  store i64 %17, i64* %curoff, align 8
  br label %if.end40

if.else:                                          ; preds = %if.then11
  %18 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_seek17 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %18, i32 0, i32 10
  %19 = load i64 (%struct._reent*, i8*, i64, i32)*, i64 (%struct._reent*, i8*, i64, i32)** %_seek17, align 8
  %20 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %21 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %21, i32 0, i32 7
  %22 = load i8*, i8** %_cookie, align 8
  %call = call i64 %19(%struct._reent* %20, i8* %22, i64 0, i32 1) #5
  store i64 %call, i64* %curoff, align 8
  %23 = load i64, i64* %curoff, align 8
  %cmp18 = icmp eq i64 %23, -1
  br i1 %cmp18, label %land.lhs.true20, label %if.end39

land.lhs.true20:                                  ; preds = %if.else
  %24 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno21 = getelementptr inbounds %struct._reent, %struct._reent* %24, i32 0, i32 0
  %25 = load i32, i32* %_errno21, align 8
  %cmp22 = icmp ne i32 %25, 0
  br i1 %cmp22, label %if.then24, label %if.end39

if.then24:                                        ; preds = %land.lhs.true20
  store i32 -1, i32* %result, align 4
  %26 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno25 = getelementptr inbounds %struct._reent, %struct._reent* %26, i32 0, i32 0
  %27 = load i32, i32* %_errno25, align 8
  %cmp26 = icmp eq i32 %27, 29
  br i1 %cmp26, label %if.then32, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.then24
  %28 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno29 = getelementptr inbounds %struct._reent, %struct._reent* %28, i32 0, i32 0
  %29 = load i32, i32* %_errno29, align 8
  %cmp30 = icmp eq i32 %29, 22
  br i1 %cmp30, label %if.then32, label %if.else34

if.then32:                                        ; preds = %lor.lhs.false28, %if.then24
  store i32 0, i32* %result, align 4
  %30 = load i32, i32* %tmp_errno, align 4
  %31 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno33 = getelementptr inbounds %struct._reent, %struct._reent* %31, i32 0, i32 0
  store i32 %30, i32* %_errno33, align 8
  br label %if.end

if.else34:                                        ; preds = %lor.lhs.false28
  %32 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags35 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %32, i32 0, i32 3
  %33 = load i16, i16* %_flags35, align 8
  %conv36 = sext i16 %33 to i32
  %or37 = or i32 %conv36, 64
  %conv38 = trunc i32 %or37 to i16
  store i16 %conv38, i16* %_flags35, align 8
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then32
  %34 = load i32, i32* %result, align 4
  store i32 %34, i32* %retval, align 4
  br label %return

if.end39:                                         ; preds = %land.lhs.true20, %if.else
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then16
  %35 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags41 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %35, i32 0, i32 3
  %36 = load i16, i16* %_flags41, align 8
  %conv42 = sext i16 %36 to i32
  %and43 = and i32 %conv42, 4
  %tobool44 = icmp ne i32 %and43, 0
  br i1 %tobool44, label %if.then45, label %if.end55

if.then45:                                        ; preds = %if.end40
  %37 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_r46 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %37, i32 0, i32 1
  %38 = load i32, i32* %_r46, align 8
  %conv47 = sext i32 %38 to i64
  %39 = load i64, i64* %curoff, align 8
  %sub = sub nsw i64 %39, %conv47
  store i64 %sub, i64* %curoff, align 8
  %40 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %40, i32 0, i32 12
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub, i32 0, i32 0
  %41 = load i8*, i8** %_base, align 8
  %cmp48 = icmp ne i8* %41, null
  br i1 %cmp48, label %if.then50, label %if.end54

if.then50:                                        ; preds = %if.then45
  %42 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ur51 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %42, i32 0, i32 14
  %43 = load i32, i32* %_ur51, align 8
  %conv52 = sext i32 %43 to i64
  %44 = load i64, i64* %curoff, align 8
  %sub53 = sub nsw i64 %44, %conv52
  store i64 %sub53, i64* %curoff, align 8
  br label %if.end54

if.end54:                                         ; preds = %if.then50, %if.then45
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end40
  %45 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_seek56 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %45, i32 0, i32 10
  %46 = load i64 (%struct._reent*, i8*, i64, i32)*, i64 (%struct._reent*, i8*, i64, i32)** %_seek56, align 8
  %47 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %48 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie57 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %48, i32 0, i32 7
  %49 = load i8*, i8** %_cookie57, align 8
  %50 = load i64, i64* %curoff, align 8
  %call58 = call i64 %46(%struct._reent* %47, i8* %49, i64 %50, i32 0) #5
  store i64 %call58, i64* %curoff, align 8
  %51 = load i64, i64* %curoff, align 8
  %cmp59 = icmp ne i64 %51, -1
  br i1 %cmp59, label %if.then73, label %lor.lhs.false61

lor.lhs.false61:                                  ; preds = %if.end55
  %52 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno62 = getelementptr inbounds %struct._reent, %struct._reent* %52, i32 0, i32 0
  %53 = load i32, i32* %_errno62, align 8
  %cmp63 = icmp eq i32 %53, 0
  br i1 %cmp63, label %if.then73, label %lor.lhs.false65

lor.lhs.false65:                                  ; preds = %lor.lhs.false61
  %54 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno66 = getelementptr inbounds %struct._reent, %struct._reent* %54, i32 0, i32 0
  %55 = load i32, i32* %_errno66, align 8
  %cmp67 = icmp eq i32 %55, 29
  br i1 %cmp67, label %if.then73, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %lor.lhs.false65
  %56 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno70 = getelementptr inbounds %struct._reent, %struct._reent* %56, i32 0, i32 0
  %57 = load i32, i32* %_errno70, align 8
  %cmp71 = icmp eq i32 %57, 22
  br i1 %cmp71, label %if.then73, label %if.else111

if.then73:                                        ; preds = %lor.lhs.false69, %lor.lhs.false65, %lor.lhs.false61, %if.end55
  %58 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags74 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %58, i32 0, i32 3
  %59 = load i16, i16* %_flags74, align 8
  %conv75 = sext i16 %59 to i32
  %and76 = and i32 %conv75, -2049
  %conv77 = trunc i32 %and76 to i16
  store i16 %conv77, i16* %_flags74, align 8
  %60 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_r78 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %60, i32 0, i32 1
  store i32 0, i32* %_r78, align 8
  %61 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %61, i32 0, i32 5
  %_base79 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  %62 = load i8*, i8** %_base79, align 8
  %63 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %63, i32 0, i32 0
  store i8* %62, i8** %_p, align 8
  %64 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags80 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %64, i32 0, i32 3
  %65 = load i16, i16* %_flags80, align 8
  %conv81 = sext i16 %65 to i32
  %and82 = and i32 %conv81, 4096
  %tobool83 = icmp ne i32 %and82, 0
  br i1 %tobool83, label %land.lhs.true84, label %if.end93

land.lhs.true84:                                  ; preds = %if.then73
  %66 = load i64, i64* %curoff, align 8
  %cmp85 = icmp ne i64 %66, -1
  br i1 %cmp85, label %if.then91, label %lor.lhs.false87

lor.lhs.false87:                                  ; preds = %land.lhs.true84
  %67 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno88 = getelementptr inbounds %struct._reent, %struct._reent* %67, i32 0, i32 0
  %68 = load i32, i32* %_errno88, align 8
  %cmp89 = icmp eq i32 %68, 0
  br i1 %cmp89, label %if.then91, label %if.end93

if.then91:                                        ; preds = %lor.lhs.false87, %land.lhs.true84
  %69 = load i64, i64* %curoff, align 8
  %70 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_offset92 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %70, i32 0, i32 19
  store i64 %69, i64* %_offset92, align 8
  br label %if.end93

if.end93:                                         ; preds = %if.then91, %lor.lhs.false87, %if.then73
  %71 = load i32, i32* %tmp_errno, align 4
  %72 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno94 = getelementptr inbounds %struct._reent, %struct._reent* %72, i32 0, i32 0
  store i32 %71, i32* %_errno94, align 8
  %73 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub95 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %73, i32 0, i32 12
  %_base96 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub95, i32 0, i32 0
  %74 = load i8*, i8** %_base96, align 8
  %cmp97 = icmp ne i8* %74, null
  br i1 %cmp97, label %if.then99, label %if.end110

if.then99:                                        ; preds = %if.end93
  %75 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub100 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %75, i32 0, i32 12
  %_base101 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub100, i32 0, i32 0
  %76 = load i8*, i8** %_base101, align 8
  %77 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ubuf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %77, i32 0, i32 15
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %_ubuf, i64 0, i64 0
  %cmp102 = icmp ne i8* %76, %arraydecay
  br i1 %cmp102, label %if.then104, label %if.end107

if.then104:                                       ; preds = %if.then99
  %78 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %79 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub105 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %79, i32 0, i32 12
  %_base106 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub105, i32 0, i32 0
  %80 = load i8*, i8** %_base106, align 8
  call fastcc void @_free_r(%struct._reent* %78, i8* %80) #4
  br label %if.end107

if.end107:                                        ; preds = %if.then104, %if.then99
  %81 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub108 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %81, i32 0, i32 12
  %_base109 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub108, i32 0, i32 0
  store i8* null, i8** %_base109, align 8
  br label %if.end110

if.end110:                                        ; preds = %if.end107, %if.end93
  br label %if.end116

if.else111:                                       ; preds = %lor.lhs.false69
  %82 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags112 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %82, i32 0, i32 3
  %83 = load i16, i16* %_flags112, align 8
  %conv113 = sext i16 %83 to i32
  %or114 = or i32 %conv113, 64
  %conv115 = trunc i32 %or114 to i16
  store i16 %conv115, i16* %_flags112, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end116:                                        ; preds = %if.end110
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %land.lhs.true, %lor.lhs.false
  store i32 0, i32* %retval, align 4
  br label %return

if.end118:                                        ; preds = %entry
  %84 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf119 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %84, i32 0, i32 5
  %_base120 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf119, i32 0, i32 0
  %85 = load i8*, i8** %_base120, align 8
  store i8* %85, i8** %p, align 8
  %cmp121 = icmp eq i8* %85, null
  br i1 %cmp121, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end118
  store i32 0, i32* %retval, align 4
  br label %return

if.end124:                                        ; preds = %if.end118
  %86 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p125 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %86, i32 0, i32 0
  %87 = load i8*, i8** %_p125, align 8
  %88 = load i8*, i8** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %87 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %88 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv126 = trunc i64 %sub.ptr.sub to i32
  store i32 %conv126, i32* %n, align 4
  %89 = load i8*, i8** %p, align 8
  %90 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p127 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %90, i32 0, i32 0
  store i8* %89, i8** %_p127, align 8
  %91 = load i16, i16* %flags, align 2
  %conv128 = sext i16 %91 to i32
  %and129 = and i32 %conv128, 3
  %tobool130 = icmp ne i32 %and129, 0
  br i1 %tobool130, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end124
  br label %cond.end

cond.false:                                       ; preds = %if.end124
  %92 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf131 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %92, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf131, i32 0, i32 1
  %93 = load i32, i32* %_size, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %93, %cond.false ]
  %94 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %94, i32 0, i32 2
  store i32 %cond, i32* %_w, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end143, %cond.end
  %95 = load i32, i32* %n, align 4
  %cmp132 = icmp sgt i32 %95, 0
  br i1 %cmp132, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %96 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_write = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %96, i32 0, i32 9
  %97 = load i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)** %_write, align 8
  %98 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %99 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie134 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %99, i32 0, i32 7
  %100 = load i8*, i8** %_cookie134, align 8
  %101 = load i8*, i8** %p, align 8
  %102 = load i32, i32* %n, align 4
  %call135 = call i32 %97(%struct._reent* %98, i8* %100, i8* %101, i32 %102) #5
  store i32 %call135, i32* %t, align 4
  %103 = load i32, i32* %t, align 4
  %cmp136 = icmp sle i32 %103, 0
  br i1 %cmp136, label %if.then138, label %if.end143

if.then138:                                       ; preds = %while.body
  %104 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags139 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %104, i32 0, i32 3
  %105 = load i16, i16* %_flags139, align 8
  %conv140 = sext i16 %105 to i32
  %or141 = or i32 %conv140, 64
  %conv142 = trunc i32 %or141 to i16
  store i16 %conv142, i16* %_flags139, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end143:                                        ; preds = %while.body
  %106 = load i32, i32* %t, align 4
  %107 = load i8*, i8** %p, align 8
  %idx.ext = sext i32 %106 to i64
  %add.ptr = getelementptr inbounds i8, i8* %107, i64 %idx.ext
  store i8* %add.ptr, i8** %p, align 8
  %108 = load i32, i32* %t, align 4
  %109 = load i32, i32* %n, align 4
  %sub144 = sub nsw i32 %109, %108
  store i32 %sub144, i32* %n, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then138, %if.then123, %if.end117, %if.else111, %if.end
  %110 = load i32, i32* %retval, align 4
  ret i32 %110
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_fflush_r(%struct._reent* %ptr, %struct.__sFILE* %fp) #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %ret = alloca i32, align 4
  %_check_init_ptr = alloca %struct._reent*, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  store %struct._reent* %0, %struct._reent** %_check_init_ptr, align 8
  %1 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %tobool = icmp ne %struct._reent* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %2 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %2, i32 0, i32 8
  %3 = load i32, i32* %__sdidinit, align 8
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  call fastcc void @__sinit(%struct._reent* %4) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 3
  %6 = load i16, i16* %_flags, align 8
  %tobool2 = icmp ne i16 %6, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %do.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %do.end
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %7, i32 0, i32 23
  %8 = load i32, i32* %_flags2, align 4
  %and = and i32 %8, 1
  %tobool5 = icmp ne i32 %and, 0
  br i1 %tobool5, label %if.end10, label %if.then6

if.then6:                                         ; preds = %if.end4
  %9 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags7 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %9, i32 0, i32 3
  %10 = load i16, i16* %_flags7, align 8
  %conv = sext i16 %10 to i32
  %and8 = and i32 %conv, 512
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  br label %if.end10

if.end10:                                         ; preds = %cond.end, %if.end4
  %11 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %12 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__sflush_r(%struct._reent* %11, %struct.__sFILE* %12) #4
  store i32 %call, i32* %ret, align 4
  %13 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags211 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %13, i32 0, i32 23
  %14 = load i32, i32* %_flags211, align 4
  %and12 = and i32 %14, 1
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.end22, label %if.then14

if.then14:                                        ; preds = %if.end10
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags15 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 3
  %16 = load i16, i16* %_flags15, align 8
  %conv16 = sext i16 %16 to i32
  %and17 = and i32 %conv16, 512
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %if.then14
  br label %cond.end21

cond.false20:                                     ; preds = %if.then14
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  br label %if.end22

if.end22:                                         ; preds = %cond.end21, %if.end10
  %17 = load i32, i32* %ret, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then3
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fflush(%struct.__sFILE* %fp) local_unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %fp.addr = alloca %struct.__sFILE*, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %cmp = icmp eq %struct.__sFILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call fastcc i32 @_fwalk_reent(%struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), i32 (%struct._reent*, %struct.__sFILE*)* @_fflush_r) #4
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call1 = call i32 @_fflush_r(%struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct.__sFILE* %1) #4
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__sfp_lock_acquire() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__sinit(%struct._reent* %s) unnamed_addr #1 {
entry:
  %s.addr = alloca %struct._reent*, align 8
  store %struct._reent* %s, %struct._reent** %s.addr, align 8
  call fastcc void @__sinit_lock_acquire() #4
  %0 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %0, i32 0, i32 8
  %1 = load i32, i32* %__sdidinit, align 8
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call fastcc void @__sinit_lock_release() #4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__cleanup = getelementptr inbounds %struct._reent, %struct._reent* %2, i32 0, i32 9
  store void (%struct._reent*)* @_cleanup_r, void (%struct._reent*)** %__cleanup, align 8
  %3 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__sglue = getelementptr inbounds %struct._reent, %struct._reent* %3, i32 0, i32 20
  %_next = getelementptr inbounds %struct._glue, %struct._glue* %__sglue, i32 0, i32 0
  store %struct._glue* null, %struct._glue** %_next, align 8
  %4 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__sglue1 = getelementptr inbounds %struct._reent, %struct._reent* %4, i32 0, i32 20
  %_niobs = getelementptr inbounds %struct._glue, %struct._glue* %__sglue1, i32 0, i32 1
  store i32 3, i32* %_niobs, align 8
  %5 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__sf = getelementptr inbounds %struct._reent, %struct._reent* %5, i32 0, i32 21
  %arrayidx = getelementptr inbounds [3 x %struct.__sFILE], [3 x %struct.__sFILE]* %__sf, i64 0, i64 0
  %6 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__sglue2 = getelementptr inbounds %struct._reent, %struct._reent* %6, i32 0, i32 20
  %_iobs = getelementptr inbounds %struct._glue, %struct._glue* %__sglue2, i32 0, i32 2
  store %struct.__sFILE* %arrayidx, %struct.__sFILE** %_iobs, align 8
  %7 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %_stdin = getelementptr inbounds %struct._reent, %struct._reent* %7, i32 0, i32 1
  %8 = load %struct.__sFILE*, %struct.__sFILE** %_stdin, align 8
  call fastcc void @stdin_init(%struct.__sFILE* %8) #4
  %9 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %_stdout = getelementptr inbounds %struct._reent, %struct._reent* %9, i32 0, i32 2
  %10 = load %struct.__sFILE*, %struct.__sFILE** %_stdout, align 8
  call fastcc void @stdout_init(%struct.__sFILE* %10) #4
  %11 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %_stderr = getelementptr inbounds %struct._reent, %struct._reent* %11, i32 0, i32 3
  %12 = load %struct.__sFILE*, %struct.__sFILE** %_stderr, align 8
  call fastcc void @stderr_init(%struct.__sFILE* %12) #4
  %13 = load %struct._reent*, %struct._reent** %s.addr, align 8
  %__sdidinit3 = getelementptr inbounds %struct._reent, %struct._reent* %13, i32 0, i32 8
  store i32 1, i32* %__sdidinit3, align 8
  call fastcc void @__sinit_lock_release() #4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__sinit_lock_acquire() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__sinit_lock_release() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_cleanup_r(%struct._reent* %ptr) #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %cleanup_func = alloca i32 (%struct._reent*, %struct.__sFILE*)*, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 (%struct._reent*, %struct.__sFILE*)* @_fclose_r, i32 (%struct._reent*, %struct.__sFILE*)** %cleanup_func, align 8
  %0 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %1 = load i32 (%struct._reent*, %struct.__sFILE*)*, i32 (%struct._reent*, %struct.__sFILE*)** %cleanup_func, align 8
  %call = call fastcc i32 @_fwalk_reent(%struct._reent* %0, i32 (%struct._reent*, %struct.__sFILE*)* %1) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @stdin_init(%struct.__sFILE* %ptr) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct.__sFILE*, align 8
  store %struct.__sFILE* %ptr, %struct.__sFILE** %ptr.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  call fastcc void @std(%struct.__sFILE* %0, i32 4, i32 0) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @stdout_init(%struct.__sFILE* %ptr) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct.__sFILE*, align 8
  store %struct.__sFILE* %ptr, %struct.__sFILE** %ptr.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  call fastcc void @std(%struct.__sFILE* %0, i32 9, i32 1) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @stderr_init(%struct.__sFILE* %ptr) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct.__sFILE*, align 8
  store %struct.__sFILE* %ptr, %struct.__sFILE** %ptr.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  call fastcc void @std(%struct.__sFILE* %0, i32 18, i32 2) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @std(%struct.__sFILE* %ptr, i32 %flags, i32 %file) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct.__sFILE*, align 8
  %flags.addr = alloca i32, align 4
  %file.addr = alloca i32, align 4
  store %struct.__sFILE* %ptr, %struct.__sFILE** %ptr.addr, align 8
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %file, i32* %file.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 0
  store i8* null, i8** %_p, align 8
  %1 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_r = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %1, i32 0, i32 1
  store i32 0, i32* %_r, align 8
  %2 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %2, i32 0, i32 2
  store i32 0, i32* %_w, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %conv = trunc i32 %3 to i16
  %4 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 3
  store i16 %conv, i16* %_flags, align 8
  %5 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 23
  store i32 0, i32* %_flags2, align 4
  %6 = load i32, i32* %file.addr, align 4
  %conv1 = trunc i32 %6 to i16
  %7 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_file = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %7, i32 0, i32 4
  store i16 %conv1, i16* %_file, align 2
  %8 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %8, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  store i8* null, i8** %_base, align 8
  %9 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_bf2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %9, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf2, i32 0, i32 1
  store i32 0, i32* %_size, align 8
  %10 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_lbfsize = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %10, i32 0, i32 6
  store i32 0, i32* %_lbfsize, align 8
  %11 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_mbstate = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %11, i32 0, i32 22
  %12 = bitcast %struct._mbstate_t* %_mbstate to i8*
  %call = call i8* @memset(i8* %12, i32 0, i64 8) #4
  %13 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %14 = bitcast %struct.__sFILE* %13 to i8*
  %15 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_cookie = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 7
  store i8* %14, i8** %_cookie, align 8
  %16 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_read = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %16, i32 0, i32 8
  store i32 (%struct._reent*, i8*, i8*, i32)* bitcast (i32 (%struct._reent.146*, i8*, i8*, i32)* @__sread to i32 (%struct._reent*, i8*, i8*, i32)*), i32 (%struct._reent*, i8*, i8*, i32)** %_read, align 8
  %17 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_write = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %17, i32 0, i32 9
  store i32 (%struct._reent*, i8*, i8*, i32)* bitcast (i32 (%struct._reent.146*, i8*, i8*, i32)* @__swrite to i32 (%struct._reent*, i8*, i8*, i32)*), i32 (%struct._reent*, i8*, i8*, i32)** %_write, align 8
  %18 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_seek = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %18, i32 0, i32 10
  store i64 (%struct._reent*, i8*, i64, i32)* bitcast (i64 (%struct._reent.146*, i8*, i64, i32)* @__sseek to i64 (%struct._reent*, i8*, i64, i32)*), i64 (%struct._reent*, i8*, i64, i32)** %_seek, align 8
  %19 = load %struct.__sFILE*, %struct.__sFILE** %ptr.addr, align 8
  %_close = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %19, i32 0, i32 11
  store i32 (%struct._reent*, i8*)* bitcast (i32 (%struct._reent.146*, i8*)* @__sclose to i32 (%struct._reent*, i8*)*), i32 (%struct._reent*, i8*)** %_close, align 8
  ret void
}

declare dso_local i8* @memset(i8*, i32, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__sfp_lock_release() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @_free_r(%struct._reent* %reent_ptr, i8* %mem) unnamed_addr #1 {
entry:
  %reent_ptr.addr = alloca %struct._reent*, align 8
  %mem.addr = alloca i8*, align 8
  %p = alloca %struct.malloc_chunk*, align 8
  %hd = alloca i64, align 8
  %sz = alloca i64, align 8
  %idx = alloca i32, align 4
  %next = alloca %struct.malloc_chunk*, align 8
  %nextsz = alloca i64, align 8
  %prevsz = alloca i64, align 8
  %bck = alloca %struct.malloc_chunk*, align 8
  %fwd = alloca %struct.malloc_chunk*, align 8
  %islr = alloca i32, align 4
  store %struct._reent* %reent_ptr, %struct._reent** %reent_ptr.addr, align 8
  store i8* %mem, i8** %mem.addr, align 8
  %0 = load i8*, i8** %mem.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_lock to void (%struct._reent*)*)(%struct._reent* %1) #4
  %2 = load i8*, i8** %mem.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 -16
  %3 = bitcast i8* %add.ptr to %struct.malloc_chunk*
  store %struct.malloc_chunk* %3, %struct.malloc_chunk** %p, align 8
  %4 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %4, i32 0, i32 1
  %5 = load i64, i64* %size, align 8
  store i64 %5, i64* %hd, align 8
  %6 = load i64, i64* %hd, align 8
  %and = and i64 %6, -2
  store i64 %and, i64* %sz, align 8
  %7 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %8 = bitcast %struct.malloc_chunk* %7 to i8*
  %9 = load i64, i64* %sz, align 8
  %add.ptr1 = getelementptr inbounds i8, i8* %8, i64 %9
  %10 = bitcast i8* %add.ptr1 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %10, %struct.malloc_chunk** %next, align 8
  %11 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %size2 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %11, i32 0, i32 1
  %12 = load i64, i64* %size2, align 8
  %and3 = and i64 %12, -4
  store i64 %and3, i64* %nextsz, align 8
  %13 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %14 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %cmp4 = icmp eq %struct.malloc_chunk* %13, %14
  br i1 %cmp4, label %if.then5, label %if.end17

if.then5:                                         ; preds = %if.end
  %15 = load i64, i64* %nextsz, align 8
  %16 = load i64, i64* %sz, align 8
  %add = add i64 %16, %15
  store i64 %add, i64* %sz, align 8
  %17 = load i64, i64* %hd, align 8
  %and6 = and i64 %17, 1
  %tobool = icmp ne i64 %and6, 0
  br i1 %tobool, label %if.end12, label %if.then7

if.then7:                                         ; preds = %if.then5
  %18 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %prev_size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %18, i32 0, i32 0
  %19 = load i64, i64* %prev_size, align 8
  store i64 %19, i64* %prevsz, align 8
  %20 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %21 = bitcast %struct.malloc_chunk* %20 to i8*
  %22 = load i64, i64* %prevsz, align 8
  %sub = sub i64 0, %22
  %add.ptr8 = getelementptr inbounds i8, i8* %21, i64 %sub
  %23 = bitcast i8* %add.ptr8 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %23, %struct.malloc_chunk** %p, align 8
  %24 = load i64, i64* %prevsz, align 8
  %25 = load i64, i64* %sz, align 8
  %add9 = add i64 %25, %24
  store i64 %add9, i64* %sz, align 8
  %26 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %bk = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %26, i32 0, i32 3
  %27 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk, align 8
  store %struct.malloc_chunk* %27, %struct.malloc_chunk** %bck, align 8
  %28 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %fd = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %28, i32 0, i32 2
  %29 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd, align 8
  store %struct.malloc_chunk* %29, %struct.malloc_chunk** %fwd, align 8
  %30 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %31 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk10 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %31, i32 0, i32 3
  store %struct.malloc_chunk* %30, %struct.malloc_chunk** %bk10, align 8
  %32 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %33 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd11 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %33, i32 0, i32 2
  store %struct.malloc_chunk* %32, %struct.malloc_chunk** %fd11, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then7, %if.then5
  %34 = load i64, i64* %sz, align 8
  %or = or i64 %34, 1
  %35 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %size13 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %35, i32 0, i32 1
  store i64 %or, i64* %size13, align 8
  %36 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  store %struct.malloc_chunk* %36, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %37 = load i64, i64* %sz, align 8
  %cmp14 = icmp uge i64 %37, 131072
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  %38 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call fastcc void @_malloc_trim_r(%struct._reent* %38) #4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end12
  %39 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %39) #4
  br label %return

if.end17:                                         ; preds = %if.end
  %40 = load i64, i64* %nextsz, align 8
  %41 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %size18 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %41, i32 0, i32 1
  store i64 %40, i64* %size18, align 8
  store i32 0, i32* %islr, align 4
  %42 = load i64, i64* %hd, align 8
  %and19 = and i64 %42, 1
  %tobool20 = icmp ne i64 %and19, 0
  br i1 %tobool20, label %if.end34, label %if.then21

if.then21:                                        ; preds = %if.end17
  %43 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %prev_size22 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %43, i32 0, i32 0
  %44 = load i64, i64* %prev_size22, align 8
  store i64 %44, i64* %prevsz, align 8
  %45 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %46 = bitcast %struct.malloc_chunk* %45 to i8*
  %47 = load i64, i64* %prevsz, align 8
  %sub23 = sub i64 0, %47
  %add.ptr24 = getelementptr inbounds i8, i8* %46, i64 %sub23
  %48 = bitcast i8* %add.ptr24 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %48, %struct.malloc_chunk** %p, align 8
  %49 = load i64, i64* %prevsz, align 8
  %50 = load i64, i64* %sz, align 8
  %add25 = add i64 %50, %49
  store i64 %add25, i64* %sz, align 8
  %51 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %fd26 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %51, i32 0, i32 2
  %52 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd26, align 8
  %cmp27 = icmp eq %struct.malloc_chunk* %52, bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*)
  br i1 %cmp27, label %if.then28, label %if.else

if.then28:                                        ; preds = %if.then21
  store i32 1, i32* %islr, align 4
  br label %if.end33

if.else:                                          ; preds = %if.then21
  %53 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %bk29 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %53, i32 0, i32 3
  %54 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk29, align 8
  store %struct.malloc_chunk* %54, %struct.malloc_chunk** %bck, align 8
  %55 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %fd30 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %55, i32 0, i32 2
  %56 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd30, align 8
  store %struct.malloc_chunk* %56, %struct.malloc_chunk** %fwd, align 8
  %57 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %58 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk31 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %58, i32 0, i32 3
  store %struct.malloc_chunk* %57, %struct.malloc_chunk** %bk31, align 8
  %59 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %60 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd32 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %60, i32 0, i32 2
  store %struct.malloc_chunk* %59, %struct.malloc_chunk** %fd32, align 8
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then28
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end17
  %61 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %62 = bitcast %struct.malloc_chunk* %61 to i8*
  %63 = load i64, i64* %nextsz, align 8
  %add.ptr35 = getelementptr inbounds i8, i8* %62, i64 %63
  %64 = bitcast i8* %add.ptr35 to %struct.malloc_chunk*
  %size36 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %64, i32 0, i32 1
  %65 = load i64, i64* %size36, align 8
  %and37 = and i64 %65, 1
  %tobool38 = icmp ne i64 %and37, 0
  br i1 %tobool38, label %if.end53, label %if.then39

if.then39:                                        ; preds = %if.end34
  %66 = load i64, i64* %nextsz, align 8
  %67 = load i64, i64* %sz, align 8
  %add40 = add i64 %67, %66
  store i64 %add40, i64* %sz, align 8
  %68 = load i32, i32* %islr, align 4
  %tobool41 = icmp ne i32 %68, 0
  br i1 %tobool41, label %if.else47, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then39
  %69 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %fd42 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %69, i32 0, i32 2
  %70 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd42, align 8
  %cmp43 = icmp eq %struct.malloc_chunk* %70, bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*)
  br i1 %cmp43, label %if.then44, label %if.else47

if.then44:                                        ; preds = %land.lhs.true
  store i32 1, i32* %islr, align 4
  %71 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  store %struct.malloc_chunk* %71, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 3), align 8
  store %struct.malloc_chunk* %71, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %72 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %bk45 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %72, i32 0, i32 3
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** %bk45, align 8
  %73 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %fd46 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %73, i32 0, i32 2
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** %fd46, align 8
  br label %if.end52

if.else47:                                        ; preds = %land.lhs.true, %if.then39
  %74 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %bk48 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %74, i32 0, i32 3
  %75 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk48, align 8
  store %struct.malloc_chunk* %75, %struct.malloc_chunk** %bck, align 8
  %76 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %fd49 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %76, i32 0, i32 2
  %77 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd49, align 8
  store %struct.malloc_chunk* %77, %struct.malloc_chunk** %fwd, align 8
  %78 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %79 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk50 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %79, i32 0, i32 3
  store %struct.malloc_chunk* %78, %struct.malloc_chunk** %bk50, align 8
  %80 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %81 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd51 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %81, i32 0, i32 2
  store %struct.malloc_chunk* %80, %struct.malloc_chunk** %fd51, align 8
  br label %if.end52

if.end52:                                         ; preds = %if.else47, %if.then44
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end34
  %82 = load i64, i64* %sz, align 8
  %or54 = or i64 %82, 1
  %83 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %size55 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %83, i32 0, i32 1
  store i64 %or54, i64* %size55, align 8
  %84 = load i64, i64* %sz, align 8
  %85 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %86 = bitcast %struct.malloc_chunk* %85 to i8*
  %87 = load i64, i64* %sz, align 8
  %add.ptr56 = getelementptr inbounds i8, i8* %86, i64 %87
  %88 = bitcast i8* %add.ptr56 to %struct.malloc_chunk*
  %prev_size57 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %88, i32 0, i32 0
  store i64 %84, i64* %prev_size57, align 8
  %89 = load i32, i32* %islr, align 4
  %tobool58 = icmp ne i32 %89, 0
  br i1 %tobool58, label %if.end149, label %if.then59

if.then59:                                        ; preds = %if.end53
  %90 = load i64, i64* %sz, align 8
  %cmp60 = icmp ult i64 %90, 512
  br i1 %cmp60, label %if.then61, label %if.else70

if.then61:                                        ; preds = %if.then59
  %91 = load i64, i64* %sz, align 8
  %shr = lshr i64 %91, 3
  %conv = trunc i64 %shr to i32
  store i32 %conv, i32* %idx, align 4
  %92 = load i32, i32* %idx, align 4
  %div = sdiv i32 %92, 4
  %sh_prom = zext i32 %div to i64
  %shl = shl i64 1, %sh_prom
  %93 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %or62 = or i64 %93, %shl
  store i64 %or62, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %94 = load i32, i32* %idx, align 4
  %mul = mul nsw i32 2, %94
  %add63 = add nsw i32 %mul, 2
  %idxprom = sext i32 %add63 to i64
  %arrayidx = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom
  %95 = bitcast %struct.malloc_chunk** %arrayidx to i8*
  %add.ptr64 = getelementptr inbounds i8, i8* %95, i64 -16
  %96 = bitcast i8* %add.ptr64 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %96, %struct.malloc_chunk** %bck, align 8
  %97 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd65 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %97, i32 0, i32 2
  %98 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd65, align 8
  store %struct.malloc_chunk* %98, %struct.malloc_chunk** %fwd, align 8
  %99 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %100 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %bk66 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %100, i32 0, i32 3
  store %struct.malloc_chunk* %99, %struct.malloc_chunk** %bk66, align 8
  %101 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %102 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %fd67 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %102, i32 0, i32 2
  store %struct.malloc_chunk* %101, %struct.malloc_chunk** %fd67, align 8
  %103 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %104 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd68 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %104, i32 0, i32 2
  store %struct.malloc_chunk* %103, %struct.malloc_chunk** %fd68, align 8
  %105 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk69 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %105, i32 0, i32 3
  store %struct.malloc_chunk* %103, %struct.malloc_chunk** %bk69, align 8
  br label %if.end148

if.else70:                                        ; preds = %if.then59
  %106 = load i64, i64* %sz, align 8
  %shr71 = lshr i64 %106, 9
  %cmp72 = icmp eq i64 %shr71, 0
  br i1 %cmp72, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else70
  %107 = load i64, i64* %sz, align 8
  %shr74 = lshr i64 %107, 3
  br label %cond.end118

cond.false:                                       ; preds = %if.else70
  %108 = load i64, i64* %sz, align 8
  %shr75 = lshr i64 %108, 9
  %cmp76 = icmp ule i64 %shr75, 4
  br i1 %cmp76, label %cond.true78, label %cond.false81

cond.true78:                                      ; preds = %cond.false
  %109 = load i64, i64* %sz, align 8
  %shr79 = lshr i64 %109, 6
  %add80 = add i64 56, %shr79
  br label %cond.end116

cond.false81:                                     ; preds = %cond.false
  %110 = load i64, i64* %sz, align 8
  %shr82 = lshr i64 %110, 9
  %cmp83 = icmp ule i64 %shr82, 20
  br i1 %cmp83, label %cond.true85, label %cond.false88

cond.true85:                                      ; preds = %cond.false81
  %111 = load i64, i64* %sz, align 8
  %shr86 = lshr i64 %111, 9
  %add87 = add i64 91, %shr86
  br label %cond.end114

cond.false88:                                     ; preds = %cond.false81
  %112 = load i64, i64* %sz, align 8
  %shr89 = lshr i64 %112, 9
  %cmp90 = icmp ule i64 %shr89, 84
  br i1 %cmp90, label %cond.true92, label %cond.false95

cond.true92:                                      ; preds = %cond.false88
  %113 = load i64, i64* %sz, align 8
  %shr93 = lshr i64 %113, 12
  %add94 = add i64 110, %shr93
  br label %cond.end112

cond.false95:                                     ; preds = %cond.false88
  %114 = load i64, i64* %sz, align 8
  %shr96 = lshr i64 %114, 9
  %cmp97 = icmp ule i64 %shr96, 340
  br i1 %cmp97, label %cond.true99, label %cond.false102

cond.true99:                                      ; preds = %cond.false95
  %115 = load i64, i64* %sz, align 8
  %shr100 = lshr i64 %115, 15
  %add101 = add i64 119, %shr100
  br label %cond.end110

cond.false102:                                    ; preds = %cond.false95
  %116 = load i64, i64* %sz, align 8
  %shr103 = lshr i64 %116, 9
  %cmp104 = icmp ule i64 %shr103, 1364
  br i1 %cmp104, label %cond.true106, label %cond.false109

cond.true106:                                     ; preds = %cond.false102
  %117 = load i64, i64* %sz, align 8
  %shr107 = lshr i64 %117, 18
  %add108 = add i64 124, %shr107
  br label %cond.end

cond.false109:                                    ; preds = %cond.false102
  br label %cond.end

cond.end:                                         ; preds = %cond.false109, %cond.true106
  %cond = phi i64 [ %add108, %cond.true106 ], [ 126, %cond.false109 ]
  br label %cond.end110

cond.end110:                                      ; preds = %cond.end, %cond.true99
  %cond111 = phi i64 [ %add101, %cond.true99 ], [ %cond, %cond.end ]
  br label %cond.end112

cond.end112:                                      ; preds = %cond.end110, %cond.true92
  %cond113 = phi i64 [ %add94, %cond.true92 ], [ %cond111, %cond.end110 ]
  br label %cond.end114

cond.end114:                                      ; preds = %cond.end112, %cond.true85
  %cond115 = phi i64 [ %add87, %cond.true85 ], [ %cond113, %cond.end112 ]
  br label %cond.end116

cond.end116:                                      ; preds = %cond.end114, %cond.true78
  %cond117 = phi i64 [ %add80, %cond.true78 ], [ %cond115, %cond.end114 ]
  br label %cond.end118

cond.end118:                                      ; preds = %cond.end116, %cond.true
  %cond119 = phi i64 [ %shr74, %cond.true ], [ %cond117, %cond.end116 ]
  %conv120 = trunc i64 %cond119 to i32
  store i32 %conv120, i32* %idx, align 4
  %118 = load i32, i32* %idx, align 4
  %mul121 = mul nsw i32 2, %118
  %add122 = add nsw i32 %mul121, 2
  %idxprom123 = sext i32 %add122 to i64
  %arrayidx124 = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom123
  %119 = bitcast %struct.malloc_chunk** %arrayidx124 to i8*
  %add.ptr125 = getelementptr inbounds i8, i8* %119, i64 -16
  %120 = bitcast i8* %add.ptr125 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %120, %struct.malloc_chunk** %bck, align 8
  %121 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd126 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %121, i32 0, i32 2
  %122 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd126, align 8
  store %struct.malloc_chunk* %122, %struct.malloc_chunk** %fwd, align 8
  %123 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %124 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %cmp127 = icmp eq %struct.malloc_chunk* %123, %124
  br i1 %cmp127, label %if.then129, label %if.else134

if.then129:                                       ; preds = %cond.end118
  %125 = load i32, i32* %idx, align 4
  %div130 = sdiv i32 %125, 4
  %sh_prom131 = zext i32 %div130 to i64
  %shl132 = shl i64 1, %sh_prom131
  %126 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %or133 = or i64 %126, %shl132
  store i64 %or133, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  br label %if.end143

if.else134:                                       ; preds = %cond.end118
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else134
  %127 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %128 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %cmp135 = icmp ne %struct.malloc_chunk* %127, %128
  br i1 %cmp135, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %129 = load i64, i64* %sz, align 8
  %130 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %size137 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %130, i32 0, i32 1
  %131 = load i64, i64* %size137, align 8
  %and138 = and i64 %131, -4
  %cmp139 = icmp ult i64 %129, %and138
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %132 = phi i1 [ false, %while.cond ], [ %cmp139, %land.rhs ]
  br i1 %132, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %133 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %fd141 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %133, i32 0, i32 2
  %134 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd141, align 8
  store %struct.malloc_chunk* %134, %struct.malloc_chunk** %fwd, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %135 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk142 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %135, i32 0, i32 3
  %136 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk142, align 8
  store %struct.malloc_chunk* %136, %struct.malloc_chunk** %bck, align 8
  br label %if.end143

if.end143:                                        ; preds = %while.end, %if.then129
  %137 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %138 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %bk144 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %138, i32 0, i32 3
  store %struct.malloc_chunk* %137, %struct.malloc_chunk** %bk144, align 8
  %139 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %140 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %fd145 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %140, i32 0, i32 2
  store %struct.malloc_chunk* %139, %struct.malloc_chunk** %fd145, align 8
  %141 = load %struct.malloc_chunk*, %struct.malloc_chunk** %p, align 8
  %142 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd146 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %142, i32 0, i32 2
  store %struct.malloc_chunk* %141, %struct.malloc_chunk** %fd146, align 8
  %143 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk147 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %143, i32 0, i32 3
  store %struct.malloc_chunk* %141, %struct.malloc_chunk** %bk147, align 8
  br label %if.end148

if.end148:                                        ; preds = %if.end143, %if.then61
  br label %if.end149

if.end149:                                        ; preds = %if.end148, %if.end53
  %144 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %144) #4
  br label %return

return:                                           ; preds = %if.end149, %if.end16, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @_malloc_trim_r(%struct._reent* %reent_ptr) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %reent_ptr.addr = alloca %struct._reent*, align 8
  %pad.addr = alloca i64, align 8
  %top_size = alloca i64, align 8
  %extra = alloca i64, align 8
  %current_brk = alloca i8*, align 8
  %new_brk = alloca i8*, align 8
  %pagesz = alloca i64, align 8
  store %struct._reent* %reent_ptr, %struct._reent** %reent_ptr.addr, align 8
  store i64 0, i64* %pad.addr, align 8
  store i64 4096, i64* %pagesz, align 8
  %0 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_lock to void (%struct._reent*)*)(%struct._reent* %0) #4
  %1 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %1, i32 0, i32 1
  %2 = load i64, i64* %size, align 8
  %and = and i64 %2, -4
  store i64 %and, i64* %top_size, align 8
  %3 = load i64, i64* %top_size, align 8
  %4 = load i64, i64* %pad.addr, align 8
  %sub = sub i64 %3, %4
  %sub1 = sub i64 %sub, 32
  %5 = load i64, i64* %pagesz, align 8
  %sub2 = sub i64 %5, 1
  %add = add i64 %sub1, %sub2
  %6 = load i64, i64* %pagesz, align 8
  %div = udiv i64 %add, %6
  %sub3 = sub i64 %div, 1
  %7 = load i64, i64* %pagesz, align 8
  %mul = mul i64 %sub3, %7
  store i64 %mul, i64* %extra, align 8
  %8 = load i64, i64* %extra, align 8
  %9 = load i64, i64* %pagesz, align 8
  %cmp = icmp slt i64 %8, %9
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %10 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %10) #4
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %11 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %call = call fastcc i8* @_sbrk_r(%struct._reent* %11, i64 0) #4
  store i8* %call, i8** %current_brk, align 8
  %12 = load i8*, i8** %current_brk, align 8
  %13 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %14 = bitcast %struct.malloc_chunk* %13 to i8*
  %15 = load i64, i64* %top_size, align 8
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 %15
  %cmp4 = icmp ne i8* %12, %add.ptr
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else
  %16 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %16) #4
  store i32 0, i32* %retval, align 4
  br label %return

if.else6:                                         ; preds = %if.else
  %17 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %18 = load i64, i64* %extra, align 8
  %sub7 = sub nsw i64 0, %18
  %call8 = call fastcc i8* @_sbrk_r(%struct._reent* %17, i64 %sub7) #4
  store i8* %call8, i8** %new_brk, align 8
  %19 = load i8*, i8** %new_brk, align 8
  %cmp9 = icmp eq i8* %19, inttoptr (i64 -1 to i8*)
  br i1 %cmp9, label %if.then10, label %if.else18

if.then10:                                        ; preds = %if.else6
  %20 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %call11 = call fastcc i8* @_sbrk_r(%struct._reent* %20, i64 0) #4
  store i8* %call11, i8** %current_brk, align 8
  %21 = load i8*, i8** %current_brk, align 8
  %22 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %23 = bitcast %struct.malloc_chunk* %22 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %21 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %23 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i64 %sub.ptr.sub, i64* %top_size, align 8
  %24 = load i64, i64* %top_size, align 8
  %cmp12 = icmp sge i64 %24, 32
  br i1 %cmp12, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.then10
  %25 = load i8*, i8** %current_brk, align 8
  %26 = load i8*, i8** @__malloc_sbrk_base, align 8
  %sub.ptr.lhs.cast14 = ptrtoint i8* %25 to i64
  %sub.ptr.rhs.cast15 = ptrtoint i8* %26 to i64
  %sub.ptr.sub16 = sub i64 %sub.ptr.lhs.cast14, %sub.ptr.rhs.cast15
  %conv = trunc i64 %sub.ptr.sub16 to i32
  store i32 %conv, i32* @__malloc_current_mallinfo.0, align 4
  %27 = load i64, i64* %top_size, align 8
  %or = or i64 %27, 1
  %28 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size17 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %28, i32 0, i32 1
  store i64 %or, i64* %size17, align 8
  br label %if.end

if.end:                                           ; preds = %if.then13, %if.then10
  %29 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %29) #4
  store i32 0, i32* %retval, align 4
  br label %return

if.else18:                                        ; preds = %if.else6
  %30 = load i64, i64* %top_size, align 8
  %31 = load i64, i64* %extra, align 8
  %sub19 = sub nsw i64 %30, %31
  %or20 = or i64 %sub19, 1
  %32 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size21 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %32, i32 0, i32 1
  store i64 %or20, i64* %size21, align 8
  %33 = load i64, i64* %extra, align 8
  %34 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv22 = sext i32 %34 to i64
  %sub23 = sub nsw i64 %conv22, %33
  %conv24 = trunc i64 %sub23 to i32
  store i32 %conv24, i32* @__malloc_current_mallinfo.0, align 4
  %35 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %35) #4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else18, %if.end, %if.then5, %if.then
  %36 = load i32, i32* %retval, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @_fwalk_reent(%struct._reent* %ptr, i32 (%struct._reent*, %struct.__sFILE*)* %reent_function) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %reent_function.addr = alloca i32 (%struct._reent*, %struct.__sFILE*)*, align 8
  %fp = alloca %struct.__sFILE*, align 8
  %n = alloca i32, align 4
  %ret = alloca i32, align 4
  %g = alloca %struct._glue*, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 (%struct._reent*, %struct.__sFILE*)* %reent_function, i32 (%struct._reent*, %struct.__sFILE*)** %reent_function.addr, align 8
  store i32 0, i32* %ret, align 4
  %0 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %__sglue = getelementptr inbounds %struct._reent, %struct._reent* %0, i32 0, i32 20
  store %struct._glue* %__sglue, %struct._glue** %g, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %1 = load %struct._glue*, %struct._glue** %g, align 8
  %cmp = icmp ne %struct._glue* %1, null
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %2 = load %struct._glue*, %struct._glue** %g, align 8
  %_iobs = getelementptr inbounds %struct._glue, %struct._glue* %2, i32 0, i32 2
  %3 = load %struct.__sFILE*, %struct.__sFILE** %_iobs, align 8
  store %struct.__sFILE* %3, %struct.__sFILE** %fp, align 8
  %4 = load %struct._glue*, %struct._glue** %g, align 8
  %_niobs = getelementptr inbounds %struct._glue, %struct._glue* %4, i32 0, i32 1
  %5 = load i32, i32* %_niobs, align 8
  store i32 %5, i32* %n, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %n, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* %n, align 4
  %cmp2 = icmp sge i32 %dec, 0
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %7, i32 0, i32 3
  %8 = load i16, i16* %_flags, align 8
  %conv = sext i16 %8 to i32
  %cmp4 = icmp ne i32 %conv, 0
  br i1 %cmp4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body3
  %9 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8
  %_flags6 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %9, i32 0, i32 3
  %10 = load i16, i16* %_flags6, align 8
  %conv7 = sext i16 %10 to i32
  %cmp8 = icmp ne i32 %conv7, 1
  br i1 %cmp8, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %land.lhs.true
  %11 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8
  %_file = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %11, i32 0, i32 4
  %12 = load i16, i16* %_file, align 2
  %conv11 = sext i16 %12 to i32
  %cmp12 = icmp ne i32 %conv11, -1
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true10
  %13 = load i32 (%struct._reent*, %struct.__sFILE*)*, i32 (%struct._reent*, %struct.__sFILE*)** %reent_function.addr, align 8
  %14 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8
  %call = call i32 %13(%struct._reent* %14, %struct.__sFILE* %15) #5
  %16 = load i32, i32* %ret, align 4
  %or = or i32 %16, %call
  store i32 %or, i32* %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true10, %land.lhs.true, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8
  %incdec.ptr = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %17, i32 1
  store %struct.__sFILE* %incdec.ptr, %struct.__sFILE** %fp, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %18 = load %struct._glue*, %struct._glue** %g, align 8
  %_next = getelementptr inbounds %struct._glue, %struct._glue* %18, i32 0, i32 0
  %19 = load %struct._glue*, %struct._glue** %_next, align 8
  store %struct._glue* %19, %struct._glue** %g, align 8
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %20 = load i32, i32* %ret, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__smakebuf_r(%struct._reent* %ptr, %struct.__sFILE* %fp) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %p = alloca i8*, align 8
  %flags = alloca i32, align 4
  %size = alloca i64, align 8
  %couldbetty = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 3
  %1 = load i16, i16* %_flags, align 8
  %conv = sext i16 %1 to i32
  %and = and i32 %conv, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_nbuf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %2, i32 0, i32 16
  %arraydecay = getelementptr inbounds [1 x i8], [1 x i8]* %_nbuf, i64 0, i64 0
  %3 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %3, i32 0, i32 0
  store i8* %arraydecay, i8** %_p, align 8
  %4 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  store i8* %arraydecay, i8** %_base, align 8
  %5 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf1 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf1, i32 0, i32 1
  store i32 1, i32* %_size, align 8
  br label %if.end49

if.end:                                           ; preds = %entry
  %6 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__swhatbuf_r(%struct._reent* %6, %struct.__sFILE* %7, i64* %size, i32* %couldbetty) #4
  store i32 %call, i32* %flags, align 4
  %8 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %9 = load i64, i64* %size, align 8
  %call2 = call fastcc i8* @_malloc_r(%struct._reent* %8, i64 %9) #4
  store i8* %call2, i8** %p, align 8
  %cmp = icmp eq i8* %call2, null
  br i1 %cmp, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %10 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags5 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %10, i32 0, i32 3
  %11 = load i16, i16* %_flags5, align 8
  %conv6 = sext i16 %11 to i32
  %and7 = and i32 %conv6, 512
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.end22, label %if.then9

if.then9:                                         ; preds = %if.then4
  %12 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags10 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %12, i32 0, i32 3
  %13 = load i16, i16* %_flags10, align 8
  %conv11 = sext i16 %13 to i32
  %and12 = and i32 %conv11, -2
  %or = or i32 %and12, 2
  %conv13 = trunc i32 %or to i16
  %14 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags14 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %14, i32 0, i32 3
  store i16 %conv13, i16* %_flags14, align 8
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_nbuf15 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 16
  %arraydecay16 = getelementptr inbounds [1 x i8], [1 x i8]* %_nbuf15, i64 0, i64 0
  %16 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p17 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %16, i32 0, i32 0
  store i8* %arraydecay16, i8** %_p17, align 8
  %17 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf18 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %17, i32 0, i32 5
  %_base19 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf18, i32 0, i32 0
  store i8* %arraydecay16, i8** %_base19, align 8
  %18 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf20 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %18, i32 0, i32 5
  %_size21 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf20, i32 0, i32 1
  store i32 1, i32* %_size21, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then9, %if.then4
  br label %if.end49

if.else:                                          ; preds = %if.end
  %19 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %__cleanup = getelementptr inbounds %struct._reent, %struct._reent* %19, i32 0, i32 9
  store void (%struct._reent*)* @_cleanup_r, void (%struct._reent*)** %__cleanup, align 8
  %20 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags23 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %20, i32 0, i32 3
  %21 = load i16, i16* %_flags23, align 8
  %conv24 = sext i16 %21 to i32
  %or25 = or i32 %conv24, 128
  %conv26 = trunc i32 %or25 to i16
  store i16 %conv26, i16* %_flags23, align 8
  %22 = load i8*, i8** %p, align 8
  %23 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p27 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %23, i32 0, i32 0
  store i8* %22, i8** %_p27, align 8
  %24 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf28 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %24, i32 0, i32 5
  %_base29 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf28, i32 0, i32 0
  store i8* %22, i8** %_base29, align 8
  %25 = load i64, i64* %size, align 8
  %conv30 = trunc i64 %25 to i32
  %26 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf31 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %26, i32 0, i32 5
  %_size32 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf31, i32 0, i32 1
  store i32 %conv30, i32* %_size32, align 8
  %27 = load i32, i32* %couldbetty, align 4
  %tobool33 = icmp ne i32 %27, 0
  br i1 %tobool33, label %land.lhs.true, label %if.end44

land.lhs.true:                                    ; preds = %if.else
  %28 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %29 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_file = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %29, i32 0, i32 4
  %30 = load i16, i16* %_file, align 2
  %conv34 = sext i16 %30 to i32
  %call35 = call fastcc i32 @_isatty_r(%struct._reent* %28, i32 %conv34) #4
  %tobool36 = icmp ne i32 %call35, 0
  br i1 %tobool36, label %if.then37, label %if.end44

if.then37:                                        ; preds = %land.lhs.true
  %31 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags38 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %31, i32 0, i32 3
  %32 = load i16, i16* %_flags38, align 8
  %conv39 = sext i16 %32 to i32
  %and40 = and i32 %conv39, -3
  %or41 = or i32 %and40, 1
  %conv42 = trunc i32 %or41 to i16
  %33 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags43 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %33, i32 0, i32 3
  store i16 %conv42, i16* %_flags43, align 8
  br label %if.end44

if.end44:                                         ; preds = %if.then37, %land.lhs.true, %if.else
  %34 = load i32, i32* %flags, align 4
  %35 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags45 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %35, i32 0, i32 3
  %36 = load i16, i16* %_flags45, align 8
  %conv46 = sext i16 %36 to i32
  %or47 = or i32 %conv46, %34
  %conv48 = trunc i32 %or47 to i16
  store i16 %conv48, i16* %_flags45, align 8
  br label %if.end49

if.end49:                                         ; preds = %if.end44, %if.end22, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__swhatbuf_r(%struct._reent* %ptr, %struct.__sFILE* %fp, i64* %bufsize, i32* %couldbetty) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %bufsize.addr = alloca i64*, align 8
  %couldbetty.addr = alloca i32*, align 8
  %snpt = alloca i32, align 4
  %st = alloca %struct.stat, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store i64* %bufsize, i64** %bufsize.addr, align 8
  store i32* %couldbetty, i32** %couldbetty.addr, align 8
  store i32 2048, i32* %snpt, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_file = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 4
  %1 = load i16, i16* %_file, align 2
  %conv = sext i16 %1 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %3 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_file2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %3, i32 0, i32 4
  %4 = load i16, i16* %_file2, align 2
  %conv3 = sext i16 %4 to i32
  %call = call fastcc i32 @_fstat_r(%struct._reent* %2, i32 %conv3, %struct.stat* %st) #4
  %cmp4 = icmp slt i32 %call, 0
  br i1 %cmp4, label %if.then, label %if.end8

if.then:                                          ; preds = %lor.lhs.false, %entry
  %5 = load i32*, i32** %couldbetty.addr, align 8
  store i32 0, i32* %5, align 4
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %6, i32 0, i32 3
  %7 = load i16, i16* %_flags, align 8
  %conv6 = sext i16 %7 to i32
  %and = and i32 %conv6, 128
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %8 = load i64*, i64** %bufsize.addr, align 8
  store i64 64, i64* %8, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %9 = load i64*, i64** %bufsize.addr, align 8
  store i64 1024, i64* %9, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  store i32 0, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 2
  %10 = load i32, i32* %st_mode, align 4
  %and9 = and i32 %10, 61440
  %cmp10 = icmp eq i32 %and9, 8192
  %conv11 = zext i1 %cmp10 to i32
  %11 = load i32*, i32** %couldbetty.addr, align 8
  store i32 %conv11, i32* %11, align 4
  %12 = load i64*, i64** %bufsize.addr, align 8
  store i64 1024, i64* %12, align 8
  store i32 2048, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.end
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i8* @_malloc_r(%struct._reent* %reent_ptr, i64 %bytes) unnamed_addr #1 {
entry:
  %retval = alloca i8*, align 8
  %reent_ptr.addr = alloca %struct._reent*, align 8
  %bytes.addr = alloca i64, align 8
  %victim = alloca %struct.malloc_chunk*, align 8
  %victim_size = alloca i64, align 8
  %idx = alloca i32, align 4
  %bin = alloca %struct.malloc_chunk*, align 8
  %remainder = alloca %struct.malloc_chunk*, align 8
  %remainder_size = alloca i64, align 8
  %remainder_index = alloca i32, align 4
  %block = alloca i64, align 8
  %startidx = alloca i32, align 4
  %fwd = alloca %struct.malloc_chunk*, align 8
  %bck = alloca %struct.malloc_chunk*, align 8
  %q = alloca %struct.malloc_chunk*, align 8
  %nb = alloca i64, align 8
  store %struct._reent* %reent_ptr, %struct._reent** %reent_ptr.addr, align 8
  store i64 %bytes, i64* %bytes.addr, align 8
  %0 = load i64, i64* %bytes.addr, align 8
  %add = add i64 %0, 23
  %cmp = icmp ult i64 %add, 47
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i64, i64* %bytes.addr, align 8
  %add1 = add i64 %1, 23
  %and = and i64 %add1, -16
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 32, %cond.true ], [ %and, %cond.false ]
  store i64 %cond, i64* %nb, align 8
  %2 = load i64, i64* %nb, align 8
  %cmp2 = icmp ugt i64 %2, 2147483647
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %3 = load i64, i64* %nb, align 8
  %4 = load i64, i64* %bytes.addr, align 8
  %cmp3 = icmp ult i64 %3, %4
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %cond.end
  %5 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %5, i32 0, i32 0
  store i32 12, i32* %_errno, align 8
  store i8* null, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %6 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_lock to void (%struct._reent*)*)(%struct._reent* %6) #4
  %7 = load i64, i64* %nb, align 8
  %cmp4 = icmp ult i64 %7, 504
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  %8 = load i64, i64* %nb, align 8
  %shr = lshr i64 %8, 3
  %conv = trunc i64 %shr to i32
  store i32 %conv, i32* %idx, align 4
  %9 = load i32, i32* %idx, align 4
  %mul = mul nsw i32 2, %9
  %add6 = add nsw i32 %mul, 2
  %idxprom = sext i32 %add6 to i64
  %arrayidx = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom
  %10 = bitcast %struct.malloc_chunk** %arrayidx to i8*
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 -16
  %11 = bitcast i8* %add.ptr to %struct.malloc_chunk*
  store %struct.malloc_chunk* %11, %struct.malloc_chunk** %q, align 8
  %12 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %bk = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %12, i32 0, i32 3
  %13 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk, align 8
  store %struct.malloc_chunk* %13, %struct.malloc_chunk** %victim, align 8
  %14 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %15 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %cmp7 = icmp eq %struct.malloc_chunk* %14, %15
  br i1 %cmp7, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.then5
  %16 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %17 = bitcast %struct.malloc_chunk* %16 to i8*
  %add.ptr10 = getelementptr inbounds i8, i8* %17, i64 16
  %18 = bitcast i8* %add.ptr10 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %18, %struct.malloc_chunk** %q, align 8
  %19 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %bk11 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %19, i32 0, i32 3
  %20 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk11, align 8
  store %struct.malloc_chunk* %20, %struct.malloc_chunk** %victim, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then9, %if.then5
  %21 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %22 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %cmp13 = icmp ne %struct.malloc_chunk* %21, %22
  br i1 %cmp13, label %if.then15, label %if.end23

if.then15:                                        ; preds = %if.end12
  %23 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %23, i32 0, i32 1
  %24 = load i64, i64* %size, align 8
  %and16 = and i64 %24, -4
  store i64 %and16, i64* %victim_size, align 8
  %25 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk17 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %25, i32 0, i32 3
  %26 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk17, align 8
  store %struct.malloc_chunk* %26, %struct.malloc_chunk** %bck, align 8
  %27 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %fd = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %27, i32 0, i32 2
  %28 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd, align 8
  store %struct.malloc_chunk* %28, %struct.malloc_chunk** %fwd, align 8
  %29 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %30 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk18 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %30, i32 0, i32 3
  store %struct.malloc_chunk* %29, %struct.malloc_chunk** %bk18, align 8
  %31 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %32 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd19 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %32, i32 0, i32 2
  store %struct.malloc_chunk* %31, %struct.malloc_chunk** %fd19, align 8
  %33 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %34 = bitcast %struct.malloc_chunk* %33 to i8*
  %35 = load i64, i64* %victim_size, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %34, i64 %35
  %36 = bitcast i8* %add.ptr20 to %struct.malloc_chunk*
  %size21 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %36, i32 0, i32 1
  %37 = load i64, i64* %size21, align 8
  %or = or i64 %37, 1
  store i64 %or, i64* %size21, align 8
  %38 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %38) #4
  %39 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %40 = bitcast %struct.malloc_chunk* %39 to i8*
  %add.ptr22 = getelementptr inbounds i8, i8* %40, i64 16
  store i8* %add.ptr22, i8** %retval, align 8
  br label %return

if.end23:                                         ; preds = %if.end12
  %41 = load i32, i32* %idx, align 4
  %add24 = add nsw i32 %41, 2
  store i32 %add24, i32* %idx, align 4
  br label %if.end107

if.else:                                          ; preds = %if.end
  %42 = load i64, i64* %nb, align 8
  %shr25 = lshr i64 %42, 9
  %cmp26 = icmp eq i64 %shr25, 0
  br i1 %cmp26, label %cond.true28, label %cond.false30

cond.true28:                                      ; preds = %if.else
  %43 = load i64, i64* %nb, align 8
  %shr29 = lshr i64 %43, 3
  br label %cond.end76

cond.false30:                                     ; preds = %if.else
  %44 = load i64, i64* %nb, align 8
  %shr31 = lshr i64 %44, 9
  %cmp32 = icmp ule i64 %shr31, 4
  br i1 %cmp32, label %cond.true34, label %cond.false37

cond.true34:                                      ; preds = %cond.false30
  %45 = load i64, i64* %nb, align 8
  %shr35 = lshr i64 %45, 6
  %add36 = add i64 56, %shr35
  br label %cond.end74

cond.false37:                                     ; preds = %cond.false30
  %46 = load i64, i64* %nb, align 8
  %shr38 = lshr i64 %46, 9
  %cmp39 = icmp ule i64 %shr38, 20
  br i1 %cmp39, label %cond.true41, label %cond.false44

cond.true41:                                      ; preds = %cond.false37
  %47 = load i64, i64* %nb, align 8
  %shr42 = lshr i64 %47, 9
  %add43 = add i64 91, %shr42
  br label %cond.end72

cond.false44:                                     ; preds = %cond.false37
  %48 = load i64, i64* %nb, align 8
  %shr45 = lshr i64 %48, 9
  %cmp46 = icmp ule i64 %shr45, 84
  br i1 %cmp46, label %cond.true48, label %cond.false51

cond.true48:                                      ; preds = %cond.false44
  %49 = load i64, i64* %nb, align 8
  %shr49 = lshr i64 %49, 12
  %add50 = add i64 110, %shr49
  br label %cond.end70

cond.false51:                                     ; preds = %cond.false44
  %50 = load i64, i64* %nb, align 8
  %shr52 = lshr i64 %50, 9
  %cmp53 = icmp ule i64 %shr52, 340
  br i1 %cmp53, label %cond.true55, label %cond.false58

cond.true55:                                      ; preds = %cond.false51
  %51 = load i64, i64* %nb, align 8
  %shr56 = lshr i64 %51, 15
  %add57 = add i64 119, %shr56
  br label %cond.end68

cond.false58:                                     ; preds = %cond.false51
  %52 = load i64, i64* %nb, align 8
  %shr59 = lshr i64 %52, 9
  %cmp60 = icmp ule i64 %shr59, 1364
  br i1 %cmp60, label %cond.true62, label %cond.false65

cond.true62:                                      ; preds = %cond.false58
  %53 = load i64, i64* %nb, align 8
  %shr63 = lshr i64 %53, 18
  %add64 = add i64 124, %shr63
  br label %cond.end66

cond.false65:                                     ; preds = %cond.false58
  br label %cond.end66

cond.end66:                                       ; preds = %cond.false65, %cond.true62
  %cond67 = phi i64 [ %add64, %cond.true62 ], [ 126, %cond.false65 ]
  br label %cond.end68

cond.end68:                                       ; preds = %cond.end66, %cond.true55
  %cond69 = phi i64 [ %add57, %cond.true55 ], [ %cond67, %cond.end66 ]
  br label %cond.end70

cond.end70:                                       ; preds = %cond.end68, %cond.true48
  %cond71 = phi i64 [ %add50, %cond.true48 ], [ %cond69, %cond.end68 ]
  br label %cond.end72

cond.end72:                                       ; preds = %cond.end70, %cond.true41
  %cond73 = phi i64 [ %add43, %cond.true41 ], [ %cond71, %cond.end70 ]
  br label %cond.end74

cond.end74:                                       ; preds = %cond.end72, %cond.true34
  %cond75 = phi i64 [ %add36, %cond.true34 ], [ %cond73, %cond.end72 ]
  br label %cond.end76

cond.end76:                                       ; preds = %cond.end74, %cond.true28
  %cond77 = phi i64 [ %shr29, %cond.true28 ], [ %cond75, %cond.end74 ]
  %conv78 = trunc i64 %cond77 to i32
  store i32 %conv78, i32* %idx, align 4
  %54 = load i32, i32* %idx, align 4
  %mul79 = mul nsw i32 2, %54
  %add80 = add nsw i32 %mul79, 2
  %idxprom81 = sext i32 %add80 to i64
  %arrayidx82 = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom81
  %55 = bitcast %struct.malloc_chunk** %arrayidx82 to i8*
  %add.ptr83 = getelementptr inbounds i8, i8* %55, i64 -16
  %56 = bitcast i8* %add.ptr83 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %56, %struct.malloc_chunk** %bin, align 8
  %57 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bin, align 8
  %bk84 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %57, i32 0, i32 3
  %58 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk84, align 8
  store %struct.malloc_chunk* %58, %struct.malloc_chunk** %victim, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end76
  %59 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %60 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bin, align 8
  %cmp85 = icmp ne %struct.malloc_chunk* %59, %60
  br i1 %cmp85, label %for.body, label %for.end.loopexit

for.body:                                         ; preds = %for.cond
  %61 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size87 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %61, i32 0, i32 1
  %62 = load i64, i64* %size87, align 8
  %and88 = and i64 %62, -4
  store i64 %and88, i64* %victim_size, align 8
  %63 = load i64, i64* %victim_size, align 8
  %64 = load i64, i64* %nb, align 8
  %sub = sub i64 %63, %64
  store i64 %sub, i64* %remainder_size, align 8
  %65 = load i64, i64* %remainder_size, align 8
  %cmp89 = icmp sge i64 %65, 32
  br i1 %cmp89, label %if.then91, label %if.else92

if.then91:                                        ; preds = %for.body
  %66 = load i32, i32* %idx, align 4
  %dec = add nsw i32 %66, -1
  store i32 %dec, i32* %idx, align 4
  br label %for.end

if.else92:                                        ; preds = %for.body
  %67 = load i64, i64* %remainder_size, align 8
  %cmp93 = icmp sge i64 %67, 0
  br i1 %cmp93, label %if.then95, label %if.end104

if.then95:                                        ; preds = %if.else92
  %68 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk96 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %68, i32 0, i32 3
  %69 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk96, align 8
  store %struct.malloc_chunk* %69, %struct.malloc_chunk** %bck, align 8
  %70 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %fd97 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %70, i32 0, i32 2
  %71 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd97, align 8
  store %struct.malloc_chunk* %71, %struct.malloc_chunk** %fwd, align 8
  %72 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %73 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk98 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %73, i32 0, i32 3
  store %struct.malloc_chunk* %72, %struct.malloc_chunk** %bk98, align 8
  %74 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %75 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd99 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %75, i32 0, i32 2
  store %struct.malloc_chunk* %74, %struct.malloc_chunk** %fd99, align 8
  %76 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %77 = bitcast %struct.malloc_chunk* %76 to i8*
  %78 = load i64, i64* %victim_size, align 8
  %add.ptr100 = getelementptr inbounds i8, i8* %77, i64 %78
  %79 = bitcast i8* %add.ptr100 to %struct.malloc_chunk*
  %size101 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %79, i32 0, i32 1
  %80 = load i64, i64* %size101, align 8
  %or102 = or i64 %80, 1
  store i64 %or102, i64* %size101, align 8
  %81 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %81) #4
  %82 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %83 = bitcast %struct.malloc_chunk* %82 to i8*
  %add.ptr103 = getelementptr inbounds i8, i8* %83, i64 16
  store i8* %add.ptr103, i8** %retval, align 8
  br label %return

if.end104:                                        ; preds = %if.else92
  br label %if.end105

if.end105:                                        ; preds = %if.end104
  br label %for.inc

for.inc:                                          ; preds = %if.end105
  %84 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk106 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %84, i32 0, i32 3
  %85 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk106, align 8
  store %struct.malloc_chunk* %85, %struct.malloc_chunk** %victim, align 8
  br label %for.cond

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then91
  %86 = load i32, i32* %idx, align 4
  %inc = add nsw i32 %86, 1
  store i32 %inc, i32* %idx, align 4
  br label %if.end107

if.end107:                                        ; preds = %for.end, %if.end23
  %87 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  store %struct.malloc_chunk* %87, %struct.malloc_chunk** %victim, align 8
  %cmp108 = icmp ne %struct.malloc_chunk* %87, bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*)
  br i1 %cmp108, label %if.then110, label %if.end234

if.then110:                                       ; preds = %if.end107
  %88 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size111 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %88, i32 0, i32 1
  %89 = load i64, i64* %size111, align 8
  %and112 = and i64 %89, -4
  store i64 %and112, i64* %victim_size, align 8
  %90 = load i64, i64* %victim_size, align 8
  %91 = load i64, i64* %nb, align 8
  %sub113 = sub i64 %90, %91
  store i64 %sub113, i64* %remainder_size, align 8
  %92 = load i64, i64* %remainder_size, align 8
  %cmp114 = icmp sge i64 %92, 32
  br i1 %cmp114, label %if.then116, label %if.end126

if.then116:                                       ; preds = %if.then110
  %93 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %94 = bitcast %struct.malloc_chunk* %93 to i8*
  %95 = load i64, i64* %nb, align 8
  %add.ptr117 = getelementptr inbounds i8, i8* %94, i64 %95
  %96 = bitcast i8* %add.ptr117 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %96, %struct.malloc_chunk** %remainder, align 8
  %97 = load i64, i64* %nb, align 8
  %or118 = or i64 %97, 1
  %98 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size119 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %98, i32 0, i32 1
  store i64 %or118, i64* %size119, align 8
  %99 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  store %struct.malloc_chunk* %99, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 3), align 8
  store %struct.malloc_chunk* %99, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %100 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %bk120 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %100, i32 0, i32 3
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** %bk120, align 8
  %101 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %fd121 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %101, i32 0, i32 2
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** %fd121, align 8
  %102 = load i64, i64* %remainder_size, align 8
  %or122 = or i64 %102, 1
  %103 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %size123 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %103, i32 0, i32 1
  store i64 %or122, i64* %size123, align 8
  %104 = load i64, i64* %remainder_size, align 8
  %105 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %106 = bitcast %struct.malloc_chunk* %105 to i8*
  %107 = load i64, i64* %remainder_size, align 8
  %add.ptr124 = getelementptr inbounds i8, i8* %106, i64 %107
  %108 = bitcast i8* %add.ptr124 to %struct.malloc_chunk*
  %prev_size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %108, i32 0, i32 0
  store i64 %104, i64* %prev_size, align 8
  %109 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %109) #4
  %110 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %111 = bitcast %struct.malloc_chunk* %110 to i8*
  %add.ptr125 = getelementptr inbounds i8, i8* %111, i64 16
  store i8* %add.ptr125, i8** %retval, align 8
  br label %return

if.end126:                                        ; preds = %if.then110
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 3), align 8
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %112 = load i64, i64* %remainder_size, align 8
  %cmp127 = icmp sge i64 %112, 0
  br i1 %cmp127, label %if.then129, label %if.end134

if.then129:                                       ; preds = %if.end126
  %113 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %114 = bitcast %struct.malloc_chunk* %113 to i8*
  %115 = load i64, i64* %victim_size, align 8
  %add.ptr130 = getelementptr inbounds i8, i8* %114, i64 %115
  %116 = bitcast i8* %add.ptr130 to %struct.malloc_chunk*
  %size131 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %116, i32 0, i32 1
  %117 = load i64, i64* %size131, align 8
  %or132 = or i64 %117, 1
  store i64 %or132, i64* %size131, align 8
  %118 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %118) #4
  %119 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %120 = bitcast %struct.malloc_chunk* %119 to i8*
  %add.ptr133 = getelementptr inbounds i8, i8* %120, i64 16
  store i8* %add.ptr133, i8** %retval, align 8
  br label %return

if.end134:                                        ; preds = %if.end126
  %121 = load i64, i64* %victim_size, align 8
  %cmp135 = icmp ult i64 %121, 512
  br i1 %cmp135, label %if.then137, label %if.else151

if.then137:                                       ; preds = %if.end134
  %122 = load i64, i64* %victim_size, align 8
  %shr138 = lshr i64 %122, 3
  %conv139 = trunc i64 %shr138 to i32
  store i32 %conv139, i32* %remainder_index, align 4
  %123 = load i32, i32* %remainder_index, align 4
  %div = sdiv i32 %123, 4
  %sh_prom = zext i32 %div to i64
  %shl = shl i64 1, %sh_prom
  %124 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %or140 = or i64 %124, %shl
  store i64 %or140, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %125 = load i32, i32* %remainder_index, align 4
  %mul141 = mul nsw i32 2, %125
  %add142 = add nsw i32 %mul141, 2
  %idxprom143 = sext i32 %add142 to i64
  %arrayidx144 = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom143
  %126 = bitcast %struct.malloc_chunk** %arrayidx144 to i8*
  %add.ptr145 = getelementptr inbounds i8, i8* %126, i64 -16
  %127 = bitcast i8* %add.ptr145 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %127, %struct.malloc_chunk** %bck, align 8
  %128 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd146 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %128, i32 0, i32 2
  %129 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd146, align 8
  store %struct.malloc_chunk* %129, %struct.malloc_chunk** %fwd, align 8
  %130 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %131 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk147 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %131, i32 0, i32 3
  store %struct.malloc_chunk* %130, %struct.malloc_chunk** %bk147, align 8
  %132 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %133 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %fd148 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %133, i32 0, i32 2
  store %struct.malloc_chunk* %132, %struct.malloc_chunk** %fd148, align 8
  %134 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %135 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd149 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %135, i32 0, i32 2
  store %struct.malloc_chunk* %134, %struct.malloc_chunk** %fd149, align 8
  %136 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk150 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %136, i32 0, i32 3
  store %struct.malloc_chunk* %134, %struct.malloc_chunk** %bk150, align 8
  br label %if.end233

if.else151:                                       ; preds = %if.end134
  %137 = load i64, i64* %victim_size, align 8
  %shr152 = lshr i64 %137, 9
  %cmp153 = icmp eq i64 %shr152, 0
  br i1 %cmp153, label %cond.true155, label %cond.false157

cond.true155:                                     ; preds = %if.else151
  %138 = load i64, i64* %victim_size, align 8
  %shr156 = lshr i64 %138, 3
  br label %cond.end203

cond.false157:                                    ; preds = %if.else151
  %139 = load i64, i64* %victim_size, align 8
  %shr158 = lshr i64 %139, 9
  %cmp159 = icmp ule i64 %shr158, 4
  br i1 %cmp159, label %cond.true161, label %cond.false164

cond.true161:                                     ; preds = %cond.false157
  %140 = load i64, i64* %victim_size, align 8
  %shr162 = lshr i64 %140, 6
  %add163 = add i64 56, %shr162
  br label %cond.end201

cond.false164:                                    ; preds = %cond.false157
  %141 = load i64, i64* %victim_size, align 8
  %shr165 = lshr i64 %141, 9
  %cmp166 = icmp ule i64 %shr165, 20
  br i1 %cmp166, label %cond.true168, label %cond.false171

cond.true168:                                     ; preds = %cond.false164
  %142 = load i64, i64* %victim_size, align 8
  %shr169 = lshr i64 %142, 9
  %add170 = add i64 91, %shr169
  br label %cond.end199

cond.false171:                                    ; preds = %cond.false164
  %143 = load i64, i64* %victim_size, align 8
  %shr172 = lshr i64 %143, 9
  %cmp173 = icmp ule i64 %shr172, 84
  br i1 %cmp173, label %cond.true175, label %cond.false178

cond.true175:                                     ; preds = %cond.false171
  %144 = load i64, i64* %victim_size, align 8
  %shr176 = lshr i64 %144, 12
  %add177 = add i64 110, %shr176
  br label %cond.end197

cond.false178:                                    ; preds = %cond.false171
  %145 = load i64, i64* %victim_size, align 8
  %shr179 = lshr i64 %145, 9
  %cmp180 = icmp ule i64 %shr179, 340
  br i1 %cmp180, label %cond.true182, label %cond.false185

cond.true182:                                     ; preds = %cond.false178
  %146 = load i64, i64* %victim_size, align 8
  %shr183 = lshr i64 %146, 15
  %add184 = add i64 119, %shr183
  br label %cond.end195

cond.false185:                                    ; preds = %cond.false178
  %147 = load i64, i64* %victim_size, align 8
  %shr186 = lshr i64 %147, 9
  %cmp187 = icmp ule i64 %shr186, 1364
  br i1 %cmp187, label %cond.true189, label %cond.false192

cond.true189:                                     ; preds = %cond.false185
  %148 = load i64, i64* %victim_size, align 8
  %shr190 = lshr i64 %148, 18
  %add191 = add i64 124, %shr190
  br label %cond.end193

cond.false192:                                    ; preds = %cond.false185
  br label %cond.end193

cond.end193:                                      ; preds = %cond.false192, %cond.true189
  %cond194 = phi i64 [ %add191, %cond.true189 ], [ 126, %cond.false192 ]
  br label %cond.end195

cond.end195:                                      ; preds = %cond.end193, %cond.true182
  %cond196 = phi i64 [ %add184, %cond.true182 ], [ %cond194, %cond.end193 ]
  br label %cond.end197

cond.end197:                                      ; preds = %cond.end195, %cond.true175
  %cond198 = phi i64 [ %add177, %cond.true175 ], [ %cond196, %cond.end195 ]
  br label %cond.end199

cond.end199:                                      ; preds = %cond.end197, %cond.true168
  %cond200 = phi i64 [ %add170, %cond.true168 ], [ %cond198, %cond.end197 ]
  br label %cond.end201

cond.end201:                                      ; preds = %cond.end199, %cond.true161
  %cond202 = phi i64 [ %add163, %cond.true161 ], [ %cond200, %cond.end199 ]
  br label %cond.end203

cond.end203:                                      ; preds = %cond.end201, %cond.true155
  %cond204 = phi i64 [ %shr156, %cond.true155 ], [ %cond202, %cond.end201 ]
  %conv205 = trunc i64 %cond204 to i32
  store i32 %conv205, i32* %remainder_index, align 4
  %149 = load i32, i32* %remainder_index, align 4
  %mul206 = mul nsw i32 2, %149
  %add207 = add nsw i32 %mul206, 2
  %idxprom208 = sext i32 %add207 to i64
  %arrayidx209 = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom208
  %150 = bitcast %struct.malloc_chunk** %arrayidx209 to i8*
  %add.ptr210 = getelementptr inbounds i8, i8* %150, i64 -16
  %151 = bitcast i8* %add.ptr210 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %151, %struct.malloc_chunk** %bck, align 8
  %152 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd211 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %152, i32 0, i32 2
  %153 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd211, align 8
  store %struct.malloc_chunk* %153, %struct.malloc_chunk** %fwd, align 8
  %154 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %155 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %cmp212 = icmp eq %struct.malloc_chunk* %154, %155
  br i1 %cmp212, label %if.then214, label %if.else219

if.then214:                                       ; preds = %cond.end203
  %156 = load i32, i32* %remainder_index, align 4
  %div215 = sdiv i32 %156, 4
  %sh_prom216 = zext i32 %div215 to i64
  %shl217 = shl i64 1, %sh_prom216
  %157 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %or218 = or i64 %157, %shl217
  store i64 %or218, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  br label %if.end228

if.else219:                                       ; preds = %cond.end203
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else219
  %158 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %159 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %cmp220 = icmp ne %struct.malloc_chunk* %158, %159
  br i1 %cmp220, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %160 = load i64, i64* %victim_size, align 8
  %161 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %size222 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %161, i32 0, i32 1
  %162 = load i64, i64* %size222, align 8
  %and223 = and i64 %162, -4
  %cmp224 = icmp ult i64 %160, %and223
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %163 = phi i1 [ false, %while.cond ], [ %cmp224, %land.rhs ]
  br i1 %163, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %164 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %fd226 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %164, i32 0, i32 2
  %165 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd226, align 8
  store %struct.malloc_chunk* %165, %struct.malloc_chunk** %fwd, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %166 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk227 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %166, i32 0, i32 3
  %167 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk227, align 8
  store %struct.malloc_chunk* %167, %struct.malloc_chunk** %bck, align 8
  br label %if.end228

if.end228:                                        ; preds = %while.end, %if.then214
  %168 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %169 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk229 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %169, i32 0, i32 3
  store %struct.malloc_chunk* %168, %struct.malloc_chunk** %bk229, align 8
  %170 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %171 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %fd230 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %171, i32 0, i32 2
  store %struct.malloc_chunk* %170, %struct.malloc_chunk** %fd230, align 8
  %172 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %173 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd231 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %173, i32 0, i32 2
  store %struct.malloc_chunk* %172, %struct.malloc_chunk** %fd231, align 8
  %174 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk232 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %174, i32 0, i32 3
  store %struct.malloc_chunk* %172, %struct.malloc_chunk** %bk232, align 8
  br label %if.end233

if.end233:                                        ; preds = %if.end228, %if.then137
  br label %if.end234

if.end234:                                        ; preds = %if.end233, %if.end107
  %175 = load i32, i32* %idx, align 4
  %div235 = sdiv i32 %175, 4
  %sh_prom236 = zext i32 %div235 to i64
  %shl237 = shl i64 1, %sh_prom236
  store i64 %shl237, i64* %block, align 8
  %176 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %cmp238 = icmp ule i64 %shl237, %176
  br i1 %cmp238, label %if.then240, label %if.end341

if.then240:                                       ; preds = %if.end234
  %177 = load i64, i64* %block, align 8
  %178 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %and241 = and i64 %177, %178
  %cmp242 = icmp eq i64 %and241, 0
  br i1 %cmp242, label %if.then244, label %if.end256

if.then244:                                       ; preds = %if.then240
  %179 = load i32, i32* %idx, align 4
  %and245 = and i32 %179, -4
  %add246 = add nsw i32 %and245, 4
  store i32 %add246, i32* %idx, align 4
  %180 = load i64, i64* %block, align 8
  %shl247 = shl i64 %180, 1
  store i64 %shl247, i64* %block, align 8
  br label %while.cond248

while.cond248:                                    ; preds = %while.body252, %if.then244
  %181 = load i64, i64* %block, align 8
  %182 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %and249 = and i64 %181, %182
  %cmp250 = icmp eq i64 %and249, 0
  br i1 %cmp250, label %while.body252, label %while.end255

while.body252:                                    ; preds = %while.cond248
  %183 = load i32, i32* %idx, align 4
  %add253 = add nsw i32 %183, 4
  store i32 %add253, i32* %idx, align 4
  %184 = load i64, i64* %block, align 8
  %shl254 = shl i64 %184, 1
  store i64 %shl254, i64* %block, align 8
  br label %while.cond248

while.end255:                                     ; preds = %while.cond248
  br label %if.end256

if.end256:                                        ; preds = %while.end255, %if.then240
  br label %for.cond257

for.cond257:                                      ; preds = %if.end339, %if.end256
  %185 = load i32, i32* %idx, align 4
  store i32 %185, i32* %startidx, align 4
  %186 = load i32, i32* %idx, align 4
  %mul258 = mul nsw i32 2, %186
  %add259 = add nsw i32 %mul258, 2
  %idxprom260 = sext i32 %add259 to i64
  %arrayidx261 = getelementptr inbounds [258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 %idxprom260
  %187 = bitcast %struct.malloc_chunk** %arrayidx261 to i8*
  %add.ptr262 = getelementptr inbounds i8, i8* %187, i64 -16
  %188 = bitcast i8* %add.ptr262 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %188, %struct.malloc_chunk** %bin, align 8
  store %struct.malloc_chunk* %188, %struct.malloc_chunk** %q, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.cond257
  %189 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bin, align 8
  %bk263 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %189, i32 0, i32 3
  %190 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk263, align 8
  store %struct.malloc_chunk* %190, %struct.malloc_chunk** %victim, align 8
  br label %for.cond264

for.cond264:                                      ; preds = %for.inc302, %do.body
  %191 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %192 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bin, align 8
  %cmp265 = icmp ne %struct.malloc_chunk* %191, %192
  br i1 %cmp265, label %for.body267, label %for.end304

for.body267:                                      ; preds = %for.cond264
  %193 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size268 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %193, i32 0, i32 1
  %194 = load i64, i64* %size268, align 8
  %and269 = and i64 %194, -4
  store i64 %and269, i64* %victim_size, align 8
  %195 = load i64, i64* %victim_size, align 8
  %196 = load i64, i64* %nb, align 8
  %sub270 = sub i64 %195, %196
  store i64 %sub270, i64* %remainder_size, align 8
  %197 = load i64, i64* %remainder_size, align 8
  %cmp271 = icmp sge i64 %197, 32
  br i1 %cmp271, label %if.then273, label %if.else288

if.then273:                                       ; preds = %for.body267
  %198 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %199 = bitcast %struct.malloc_chunk* %198 to i8*
  %200 = load i64, i64* %nb, align 8
  %add.ptr274 = getelementptr inbounds i8, i8* %199, i64 %200
  %201 = bitcast i8* %add.ptr274 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %201, %struct.malloc_chunk** %remainder, align 8
  %202 = load i64, i64* %nb, align 8
  %or275 = or i64 %202, 1
  %203 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size276 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %203, i32 0, i32 1
  store i64 %or275, i64* %size276, align 8
  %204 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk277 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %204, i32 0, i32 3
  %205 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk277, align 8
  store %struct.malloc_chunk* %205, %struct.malloc_chunk** %bck, align 8
  %206 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %fd278 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %206, i32 0, i32 2
  %207 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd278, align 8
  store %struct.malloc_chunk* %207, %struct.malloc_chunk** %fwd, align 8
  %208 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %209 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk279 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %209, i32 0, i32 3
  store %struct.malloc_chunk* %208, %struct.malloc_chunk** %bk279, align 8
  %210 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %211 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd280 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %211, i32 0, i32 2
  store %struct.malloc_chunk* %210, %struct.malloc_chunk** %fd280, align 8
  %212 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  store %struct.malloc_chunk* %212, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 3), align 8
  store %struct.malloc_chunk* %212, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %213 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %bk281 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %213, i32 0, i32 3
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** %bk281, align 8
  %214 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %fd282 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %214, i32 0, i32 2
  store %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 4) to i8*), i64 -16) to %struct.malloc_chunk*), %struct.malloc_chunk** %fd282, align 8
  %215 = load i64, i64* %remainder_size, align 8
  %or283 = or i64 %215, 1
  %216 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %size284 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %216, i32 0, i32 1
  store i64 %or283, i64* %size284, align 8
  %217 = load i64, i64* %remainder_size, align 8
  %218 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %219 = bitcast %struct.malloc_chunk* %218 to i8*
  %220 = load i64, i64* %remainder_size, align 8
  %add.ptr285 = getelementptr inbounds i8, i8* %219, i64 %220
  %221 = bitcast i8* %add.ptr285 to %struct.malloc_chunk*
  %prev_size286 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %221, i32 0, i32 0
  store i64 %217, i64* %prev_size286, align 8
  %222 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %222) #4
  %223 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %224 = bitcast %struct.malloc_chunk* %223 to i8*
  %add.ptr287 = getelementptr inbounds i8, i8* %224, i64 16
  store i8* %add.ptr287, i8** %retval, align 8
  br label %return

if.else288:                                       ; preds = %for.body267
  %225 = load i64, i64* %remainder_size, align 8
  %cmp289 = icmp sge i64 %225, 0
  br i1 %cmp289, label %if.then291, label %if.end300

if.then291:                                       ; preds = %if.else288
  %226 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %227 = bitcast %struct.malloc_chunk* %226 to i8*
  %228 = load i64, i64* %victim_size, align 8
  %add.ptr292 = getelementptr inbounds i8, i8* %227, i64 %228
  %229 = bitcast i8* %add.ptr292 to %struct.malloc_chunk*
  %size293 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %229, i32 0, i32 1
  %230 = load i64, i64* %size293, align 8
  %or294 = or i64 %230, 1
  store i64 %or294, i64* %size293, align 8
  %231 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk295 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %231, i32 0, i32 3
  %232 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk295, align 8
  store %struct.malloc_chunk* %232, %struct.malloc_chunk** %bck, align 8
  %233 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %fd296 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %233, i32 0, i32 2
  %234 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd296, align 8
  store %struct.malloc_chunk* %234, %struct.malloc_chunk** %fwd, align 8
  %235 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %236 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk297 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %236, i32 0, i32 3
  store %struct.malloc_chunk* %235, %struct.malloc_chunk** %bk297, align 8
  %237 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %238 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd298 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %238, i32 0, i32 2
  store %struct.malloc_chunk* %237, %struct.malloc_chunk** %fd298, align 8
  %239 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %239) #4
  %240 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %241 = bitcast %struct.malloc_chunk* %240 to i8*
  %add.ptr299 = getelementptr inbounds i8, i8* %241, i64 16
  store i8* %add.ptr299, i8** %retval, align 8
  br label %return

if.end300:                                        ; preds = %if.else288
  br label %if.end301

if.end301:                                        ; preds = %if.end300
  br label %for.inc302

for.inc302:                                       ; preds = %if.end301
  %242 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %bk303 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %242, i32 0, i32 3
  %243 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk303, align 8
  store %struct.malloc_chunk* %243, %struct.malloc_chunk** %victim, align 8
  br label %for.cond264

for.end304:                                       ; preds = %for.cond264
  %244 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bin, align 8
  %245 = bitcast %struct.malloc_chunk* %244 to i8*
  %add.ptr305 = getelementptr inbounds i8, i8* %245, i64 16
  %246 = bitcast i8* %add.ptr305 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %246, %struct.malloc_chunk** %bin, align 8
  br label %do.cond

do.cond:                                          ; preds = %for.end304
  %247 = load i32, i32* %idx, align 4
  %inc306 = add nsw i32 %247, 1
  store i32 %inc306, i32* %idx, align 4
  %and307 = and i32 %inc306, 3
  %cmp308 = icmp ne i32 %and307, 0
  br i1 %cmp308, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %do.body310

do.body310:                                       ; preds = %do.cond319, %do.end
  %248 = load i32, i32* %startidx, align 4
  %and311 = and i32 %248, 3
  %cmp312 = icmp eq i32 %and311, 0
  br i1 %cmp312, label %if.then314, label %if.end316

if.then314:                                       ; preds = %do.body310
  %249 = load i64, i64* %block, align 8
  %neg = xor i64 %249, -1
  %250 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %and315 = and i64 %250, %neg
  store i64 %and315, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  br label %do.end323

if.end316:                                        ; preds = %do.body310
  %251 = load i32, i32* %startidx, align 4
  %dec317 = add nsw i32 %251, -1
  store i32 %dec317, i32* %startidx, align 4
  %252 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %253 = bitcast %struct.malloc_chunk* %252 to i8*
  %add.ptr318 = getelementptr inbounds i8, i8* %253, i64 -16
  %254 = bitcast i8* %add.ptr318 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %254, %struct.malloc_chunk** %q, align 8
  br label %do.cond319

do.cond319:                                       ; preds = %if.end316
  %255 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %fd320 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %255, i32 0, i32 2
  %256 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd320, align 8
  %257 = load %struct.malloc_chunk*, %struct.malloc_chunk** %q, align 8
  %cmp321 = icmp eq %struct.malloc_chunk* %256, %257
  br i1 %cmp321, label %do.body310, label %do.end323.loopexit

do.end323.loopexit:                               ; preds = %do.cond319
  br label %do.end323

do.end323:                                        ; preds = %do.end323.loopexit, %if.then314
  %258 = load i64, i64* %block, align 8
  %shl324 = shl i64 %258, 1
  store i64 %shl324, i64* %block, align 8
  %259 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %cmp325 = icmp ule i64 %shl324, %259
  br i1 %cmp325, label %land.lhs.true, label %if.else338

land.lhs.true:                                    ; preds = %do.end323
  %260 = load i64, i64* %block, align 8
  %cmp327 = icmp ne i64 %260, 0
  br i1 %cmp327, label %if.then329, label %if.else338

if.then329:                                       ; preds = %land.lhs.true
  br label %while.cond330

while.cond330:                                    ; preds = %while.body334, %if.then329
  %261 = load i64, i64* %block, align 8
  %262 = load i64, i64* getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 1), align 8
  %and331 = and i64 %261, %262
  %cmp332 = icmp eq i64 %and331, 0
  br i1 %cmp332, label %while.body334, label %while.end337

while.body334:                                    ; preds = %while.cond330
  %263 = load i32, i32* %idx, align 4
  %add335 = add nsw i32 %263, 4
  store i32 %add335, i32* %idx, align 4
  %264 = load i64, i64* %block, align 8
  %shl336 = shl i64 %264, 1
  store i64 %shl336, i64* %block, align 8
  br label %while.cond330

while.end337:                                     ; preds = %while.cond330
  br label %if.end339

if.else338:                                       ; preds = %land.lhs.true, %do.end323
  br label %for.end340

if.end339:                                        ; preds = %while.end337
  br label %for.cond257

for.end340:                                       ; preds = %if.else338
  br label %if.end341

if.end341:                                        ; preds = %for.end340, %if.end234
  %265 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size342 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %265, i32 0, i32 1
  %266 = load i64, i64* %size342, align 8
  %and343 = and i64 %266, -4
  %267 = load i64, i64* %nb, align 8
  %sub344 = sub i64 %and343, %267
  store i64 %sub344, i64* %remainder_size, align 8
  %268 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size345 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %268, i32 0, i32 1
  %269 = load i64, i64* %size345, align 8
  %and346 = and i64 %269, -4
  %270 = load i64, i64* %nb, align 8
  %cmp347 = icmp ult i64 %and346, %270
  br i1 %cmp347, label %if.then352, label %lor.lhs.false349

lor.lhs.false349:                                 ; preds = %if.end341
  %271 = load i64, i64* %remainder_size, align 8
  %cmp350 = icmp slt i64 %271, 32
  br i1 %cmp350, label %if.then352, label %if.end365

if.then352:                                       ; preds = %lor.lhs.false349, %if.end341
  %272 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %273 = load i64, i64* %nb, align 8
  call fastcc void @malloc_extend_top(%struct._reent* %272, i64 %273) #4
  %274 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size353 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %274, i32 0, i32 1
  %275 = load i64, i64* %size353, align 8
  %and354 = and i64 %275, -4
  %276 = load i64, i64* %nb, align 8
  %sub355 = sub i64 %and354, %276
  store i64 %sub355, i64* %remainder_size, align 8
  %277 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size356 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %277, i32 0, i32 1
  %278 = load i64, i64* %size356, align 8
  %and357 = and i64 %278, -4
  %279 = load i64, i64* %nb, align 8
  %cmp358 = icmp ult i64 %and357, %279
  br i1 %cmp358, label %if.then363, label %lor.lhs.false360

lor.lhs.false360:                                 ; preds = %if.then352
  %280 = load i64, i64* %remainder_size, align 8
  %cmp361 = icmp slt i64 %280, 32
  br i1 %cmp361, label %if.then363, label %if.end364

if.then363:                                       ; preds = %lor.lhs.false360, %if.then352
  %281 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %281) #4
  store i8* null, i8** %retval, align 8
  br label %return

if.end364:                                        ; preds = %lor.lhs.false360
  br label %if.end365

if.end365:                                        ; preds = %if.end364, %lor.lhs.false349
  %282 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  store %struct.malloc_chunk* %282, %struct.malloc_chunk** %victim, align 8
  %283 = load i64, i64* %nb, align 8
  %or366 = or i64 %283, 1
  %284 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %size367 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %284, i32 0, i32 1
  store i64 %or366, i64* %size367, align 8
  %285 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %286 = bitcast %struct.malloc_chunk* %285 to i8*
  %287 = load i64, i64* %nb, align 8
  %add.ptr368 = getelementptr inbounds i8, i8* %286, i64 %287
  %288 = bitcast i8* %add.ptr368 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %288, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %289 = load i64, i64* %remainder_size, align 8
  %or369 = or i64 %289, 1
  %290 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size370 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %290, i32 0, i32 1
  store i64 %or369, i64* %size370, align 8
  %291 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %291) #4
  %292 = load %struct.malloc_chunk*, %struct.malloc_chunk** %victim, align 8
  %293 = bitcast %struct.malloc_chunk* %292 to i8*
  %add.ptr371 = getelementptr inbounds i8, i8* %293, i64 16
  store i8* %add.ptr371, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end365, %if.then363, %if.then291, %if.then273, %if.then129, %if.then116, %if.then95, %if.then15, %if.then
  %294 = load i8*, i8** %retval, align 8
  ret i8* %294
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @malloc_extend_top(%struct._reent* %reent_ptr, i64 %nb) unnamed_addr #1 {
entry:
  %reent_ptr.addr = alloca %struct._reent*, align 8
  %nb.addr = alloca i64, align 8
  %brk = alloca i8*, align 8
  %front_misalign = alloca i64, align 8
  %correction = alloca i64, align 8
  %correction_failed = alloca i32, align 4
  %new_brk = alloca i8*, align 8
  %top_size = alloca i64, align 8
  %old_top = alloca %struct.malloc_chunk*, align 8
  %old_top_size = alloca i64, align 8
  %old_end = alloca i8*, align 8
  %sbrk_size = alloca i64, align 8
  %pagesz = alloca i64, align 8
  store %struct._reent* %reent_ptr, %struct._reent** %reent_ptr.addr, align 8
  store i64 %nb, i64* %nb.addr, align 8
  store i32 0, i32* %correction_failed, align 4
  %0 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  store %struct.malloc_chunk* %0, %struct.malloc_chunk** %old_top, align 8
  %1 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %1, i32 0, i32 1
  %2 = load i64, i64* %size, align 8
  %and = and i64 %2, -4
  store i64 %and, i64* %old_top_size, align 8
  %3 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %4 = bitcast %struct.malloc_chunk* %3 to i8*
  %5 = load i64, i64* %old_top_size, align 8
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %5
  %6 = bitcast i8* %add.ptr to %struct.malloc_chunk*
  %7 = bitcast %struct.malloc_chunk* %6 to i8*
  store i8* %7, i8** %old_end, align 8
  %8 = load i64, i64* %nb.addr, align 8
  %add = add i64 %8, 0
  %add1 = add i64 %add, 32
  store i64 %add1, i64* %sbrk_size, align 8
  store i64 4096, i64* %pagesz, align 8
  %9 = load i8*, i8** @__malloc_sbrk_base, align 8
  %cmp = icmp ne i8* %9, inttoptr (i64 -1 to i8*)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %10 = load i64, i64* %sbrk_size, align 8
  %11 = load i64, i64* %pagesz, align 8
  %sub = sub i64 %11, 1
  %add2 = add i64 %10, %sub
  %12 = load i64, i64* %pagesz, align 8
  %sub3 = sub i64 %12, 1
  %neg = xor i64 %sub3, -1
  %and4 = and i64 %add2, %neg
  store i64 %and4, i64* %sbrk_size, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %13 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %14 = load i64, i64* %sbrk_size, align 8
  %call = call fastcc i8* @_sbrk_r(%struct._reent* %13, i64 %14) #4
  store i8* %call, i8** %brk, align 8
  %15 = load i8*, i8** %brk, align 8
  %cmp5 = icmp eq i8* %15, inttoptr (i64 -1 to i8*)
  br i1 %cmp5, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %16 = load i8*, i8** %brk, align 8
  %17 = load i8*, i8** %old_end, align 8
  %cmp6 = icmp ult i8* %16, %17
  br i1 %cmp6, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %lor.lhs.false
  %18 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %cmp7 = icmp ne %struct.malloc_chunk* %18, bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*)
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true, %if.end
  br label %if.end104

if.end9:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %19 = load i64, i64* %sbrk_size, align 8
  %20 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv = sext i32 %20 to i64
  %add10 = add i64 %conv, %19
  %conv11 = trunc i64 %add10 to i32
  store i32 %conv11, i32* @__malloc_current_mallinfo.0, align 4
  %21 = load i8*, i8** %brk, align 8
  %22 = load i8*, i8** %old_end, align 8
  %cmp12 = icmp eq i8* %21, %22
  br i1 %cmp12, label %land.lhs.true14, label %if.else

land.lhs.true14:                                  ; preds = %if.end9
  %23 = load i8*, i8** %old_end, align 8
  %24 = ptrtoint i8* %23 to i64
  %25 = load i64, i64* %pagesz, align 8
  %sub15 = sub i64 %25, 1
  %and16 = and i64 %24, %sub15
  %cmp17 = icmp eq i64 %and16, 0
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %land.lhs.true14
  %26 = load i64, i64* %sbrk_size, align 8
  %27 = load i64, i64* %old_top_size, align 8
  %add20 = add i64 %26, %27
  store i64 %add20, i64* %top_size, align 8
  %28 = load i64, i64* %top_size, align 8
  %or = or i64 %28, 1
  %29 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size21 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %29, i32 0, i32 1
  store i64 %or, i64* %size21, align 8
  br label %if.end92

if.else:                                          ; preds = %land.lhs.true14, %if.end9
  %30 = load i8*, i8** @__malloc_sbrk_base, align 8
  %cmp22 = icmp eq i8* %30, inttoptr (i64 -1 to i8*)
  br i1 %cmp22, label %if.then24, label %if.else25

if.then24:                                        ; preds = %if.else
  %31 = load i8*, i8** %brk, align 8
  store i8* %31, i8** @__malloc_sbrk_base, align 8
  br label %if.end29

if.else25:                                        ; preds = %if.else
  %32 = load i8*, i8** %brk, align 8
  %33 = load i8*, i8** %old_end, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %32 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %33 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %34 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv26 = sext i32 %34 to i64
  %add27 = add nsw i64 %conv26, %sub.ptr.sub
  %conv28 = trunc i64 %add27 to i32
  store i32 %conv28, i32* @__malloc_current_mallinfo.0, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.else25, %if.then24
  %35 = load i8*, i8** %brk, align 8
  %add.ptr30 = getelementptr inbounds i8, i8* %35, i64 16
  %36 = ptrtoint i8* %add.ptr30 to i64
  %and31 = and i64 %36, 15
  store i64 %and31, i64* %front_misalign, align 8
  %37 = load i64, i64* %front_misalign, align 8
  %cmp32 = icmp ugt i64 %37, 0
  br i1 %cmp32, label %if.then34, label %if.else37

if.then34:                                        ; preds = %if.end29
  %38 = load i64, i64* %front_misalign, align 8
  %sub35 = sub i64 16, %38
  store i64 %sub35, i64* %correction, align 8
  %39 = load i64, i64* %correction, align 8
  %40 = load i8*, i8** %brk, align 8
  %add.ptr36 = getelementptr inbounds i8, i8* %40, i64 %39
  store i8* %add.ptr36, i8** %brk, align 8
  br label %if.end38

if.else37:                                        ; preds = %if.end29
  store i64 0, i64* %correction, align 8
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %if.then34
  %41 = load i64, i64* %pagesz, align 8
  %42 = load i8*, i8** %brk, align 8
  %43 = load i64, i64* %sbrk_size, align 8
  %add.ptr39 = getelementptr inbounds i8, i8* %42, i64 %43
  %44 = ptrtoint i8* %add.ptr39 to i64
  %45 = load i64, i64* %pagesz, align 8
  %sub40 = sub i64 %45, 1
  %and41 = and i64 %44, %sub40
  %sub42 = sub i64 %41, %and41
  %46 = load i64, i64* %correction, align 8
  %add43 = add i64 %46, %sub42
  store i64 %add43, i64* %correction, align 8
  %47 = load i64, i64* %pagesz, align 8
  %sub44 = sub i64 %47, 1
  %48 = load i64, i64* %correction, align 8
  %and45 = and i64 %48, %sub44
  store i64 %and45, i64* %correction, align 8
  %49 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %50 = load i64, i64* %correction, align 8
  %call46 = call fastcc i8* @_sbrk_r(%struct._reent* %49, i64 %50) #4
  store i8* %call46, i8** %new_brk, align 8
  %51 = load i8*, i8** %new_brk, align 8
  %cmp47 = icmp eq i8* %51, inttoptr (i64 -1 to i8*)
  br i1 %cmp47, label %if.then49, label %if.end57

if.then49:                                        ; preds = %if.end38
  store i64 0, i64* %correction, align 8
  store i32 1, i32* %correction_failed, align 4
  %52 = load i8*, i8** %brk, align 8
  %53 = load i64, i64* %sbrk_size, align 8
  %add.ptr50 = getelementptr inbounds i8, i8* %52, i64 %53
  store i8* %add.ptr50, i8** %new_brk, align 8
  %54 = load i64, i64* %front_misalign, align 8
  %cmp51 = icmp ugt i64 %54, 0
  br i1 %cmp51, label %if.then53, label %if.end56

if.then53:                                        ; preds = %if.then49
  %55 = load i64, i64* %front_misalign, align 8
  %sub54 = sub i64 16, %55
  %56 = load i8*, i8** %new_brk, align 8
  %idx.neg = sub i64 0, %sub54
  %add.ptr55 = getelementptr inbounds i8, i8* %56, i64 %idx.neg
  store i8* %add.ptr55, i8** %new_brk, align 8
  br label %if.end56

if.end56:                                         ; preds = %if.then53, %if.then49
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end38
  %57 = load i64, i64* %correction, align 8
  %58 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv58 = sext i32 %58 to i64
  %add59 = add i64 %conv58, %57
  %conv60 = trunc i64 %add59 to i32
  store i32 %conv60, i32* @__malloc_current_mallinfo.0, align 4
  %59 = load i8*, i8** %brk, align 8
  %60 = bitcast i8* %59 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %60, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %61 = load i8*, i8** %new_brk, align 8
  %62 = load i8*, i8** %brk, align 8
  %sub.ptr.lhs.cast61 = ptrtoint i8* %61 to i64
  %sub.ptr.rhs.cast62 = ptrtoint i8* %62 to i64
  %sub.ptr.sub63 = sub i64 %sub.ptr.lhs.cast61, %sub.ptr.rhs.cast62
  %63 = load i64, i64* %correction, align 8
  %add64 = add i64 %sub.ptr.sub63, %63
  store i64 %add64, i64* %top_size, align 8
  %64 = load i64, i64* %top_size, align 8
  %or65 = or i64 %64, 1
  %65 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size66 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %65, i32 0, i32 1
  store i64 %or65, i64* %size66, align 8
  %66 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %cmp67 = icmp ne %struct.malloc_chunk* %66, bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*)
  br i1 %cmp67, label %if.then69, label %if.end91

if.then69:                                        ; preds = %if.end57
  %67 = load i64, i64* %old_top_size, align 8
  %cmp70 = icmp ult i64 %67, 32
  br i1 %cmp70, label %if.then72, label %if.end74

if.then72:                                        ; preds = %if.then69
  %68 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size73 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %68, i32 0, i32 1
  store i64 1, i64* %size73, align 8
  br label %if.end104

if.end74:                                         ; preds = %if.then69
  %69 = load i64, i64* %old_top_size, align 8
  %sub75 = sub i64 %69, 24
  %and76 = and i64 %sub75, -16
  store i64 %and76, i64* %old_top_size, align 8
  %70 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %size77 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %70, i32 0, i32 1
  %71 = load i64, i64* %size77, align 8
  %and78 = and i64 %71, 1
  %72 = load i64, i64* %old_top_size, align 8
  %or79 = or i64 %and78, %72
  %73 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %size80 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %73, i32 0, i32 1
  store i64 %or79, i64* %size80, align 8
  %74 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %75 = bitcast %struct.malloc_chunk* %74 to i8*
  %76 = load i64, i64* %old_top_size, align 8
  %add.ptr81 = getelementptr inbounds i8, i8* %75, i64 %76
  %77 = bitcast i8* %add.ptr81 to %struct.malloc_chunk*
  %size82 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %77, i32 0, i32 1
  store i64 9, i64* %size82, align 8
  %78 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %79 = bitcast %struct.malloc_chunk* %78 to i8*
  %80 = load i64, i64* %old_top_size, align 8
  %add83 = add i64 %80, 8
  %add.ptr84 = getelementptr inbounds i8, i8* %79, i64 %add83
  %81 = bitcast i8* %add.ptr84 to %struct.malloc_chunk*
  %size85 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %81, i32 0, i32 1
  store i64 9, i64* %size85, align 8
  %82 = load i64, i64* %old_top_size, align 8
  %cmp86 = icmp uge i64 %82, 32
  br i1 %cmp86, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.end74
  %83 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %84 = load %struct.malloc_chunk*, %struct.malloc_chunk** %old_top, align 8
  %85 = bitcast %struct.malloc_chunk* %84 to i8*
  %add.ptr89 = getelementptr inbounds i8, i8* %85, i64 16
  call fastcc void @_free_r(%struct._reent* %83, i8* %add.ptr89) #4
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %if.end74
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.end57
  br label %if.end92

if.end92:                                         ; preds = %if.end91, %if.then19
  %86 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv93 = sext i32 %86 to i64
  %87 = load i64, i64* @__malloc_max_sbrked_mem, align 8
  %cmp94 = icmp ugt i64 %conv93, %87
  br i1 %cmp94, label %if.then96, label %if.end98

if.then96:                                        ; preds = %if.end92
  %88 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv97 = sext i32 %88 to i64
  store i64 %conv97, i64* @__malloc_max_sbrked_mem, align 8
  br label %if.end98

if.end98:                                         ; preds = %if.then96, %if.end92
  %89 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv99 = sext i32 %89 to i64
  %90 = load i64, i64* @__malloc_max_total_mem, align 8
  %cmp100 = icmp ugt i64 %conv99, %90
  br i1 %cmp100, label %if.then102, label %if.end104

if.then102:                                       ; preds = %if.end98
  %91 = load i32, i32* @__malloc_current_mallinfo.0, align 4
  %conv103 = sext i32 %91 to i64
  store i64 %conv103, i64* @__malloc_max_total_mem, align 8
  br label %if.end104

if.end104:                                        ; preds = %if.then102, %if.end98, %if.then72, %if.then8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @memchr(i8* %src_void, i32 %c, i64 %length) local_unnamed_addr #1 {
entry:
  %retval = alloca i8*, align 8
  %src_void.addr = alloca i8*, align 8
  %c.addr = alloca i32, align 4
  %length.addr = alloca i64, align 8
  %src = alloca i8*, align 8
  %d = alloca i8, align 1
  %asrc = alloca i64*, align 8
  %mask = alloca i64, align 8
  %i = alloca i32, align 4
  store i8* %src_void, i8** %src_void.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store i64 %length, i64* %length.addr, align 8
  %0 = load i8*, i8** %src_void.addr, align 8
  store i8* %0, i8** %src, align 8
  %1 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %1 to i8
  store i8 %conv, i8* %d, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end6, %entry
  %2 = load i8*, i8** %src, align 8
  %3 = ptrtoint i8* %2 to i64
  %and = and i64 %3, 7
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i64, i64* %length.addr, align 8
  %dec = add i64 %4, -1
  store i64 %dec, i64* %length.addr, align 8
  %tobool1 = icmp ne i64 %4, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  store i8* null, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %while.body
  %5 = load i8*, i8** %src, align 8
  %6 = load i8, i8* %5, align 1
  %conv2 = zext i8 %6 to i32
  %7 = load i8, i8* %d, align 1
  %conv3 = zext i8 %7 to i32
  %cmp = icmp eq i32 %conv2, %conv3
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %8 = load i8*, i8** %src, align 8
  store i8* %8, i8** %retval, align 8
  br label %return

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %src, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %src, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %10 = load i64, i64* %length.addr, align 8
  %cmp7 = icmp ult i64 %10, 8
  br i1 %cmp7, label %if.end34, label %if.then9

if.then9:                                         ; preds = %while.end
  %11 = load i8*, i8** %src, align 8
  %12 = bitcast i8* %11 to i64*
  store i64* %12, i64** %asrc, align 8
  %13 = load i8, i8* %d, align 1
  %conv10 = zext i8 %13 to i32
  %shl = shl i32 %conv10, 8
  %14 = load i8, i8* %d, align 1
  %conv11 = zext i8 %14 to i32
  %or = or i32 %shl, %conv11
  %conv12 = sext i32 %or to i64
  store i64 %conv12, i64* %mask, align 8
  %15 = load i64, i64* %mask, align 8
  %shl13 = shl i64 %15, 16
  %16 = load i64, i64* %mask, align 8
  %or14 = or i64 %shl13, %16
  store i64 %or14, i64* %mask, align 8
  store i32 32, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then9
  %17 = load i32, i32* %i, align 4
  %conv15 = zext i32 %17 to i64
  %cmp16 = icmp ult i64 %conv15, 64
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %18 = load i64, i64* %mask, align 8
  %19 = load i32, i32* %i, align 4
  %sh_prom = zext i32 %19 to i64
  %shl18 = shl i64 %18, %sh_prom
  %20 = load i64, i64* %mask, align 8
  %or19 = or i64 %shl18, %20
  store i64 %or19, i64* %mask, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4
  %shl20 = shl i32 %21, 1
  store i32 %shl20, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %while.cond21

while.cond21:                                     ; preds = %if.end30, %for.end
  %22 = load i64, i64* %length.addr, align 8
  %cmp22 = icmp uge i64 %22, 8
  br i1 %cmp22, label %while.body24, label %while.end33.loopexit

while.body24:                                     ; preds = %while.cond21
  %23 = load i64*, i64** %asrc, align 8
  %24 = load i64, i64* %23, align 8
  %25 = load i64, i64* %mask, align 8
  %xor = xor i64 %24, %25
  %sub = sub i64 %xor, 72340172838076673
  %26 = load i64*, i64** %asrc, align 8
  %27 = load i64, i64* %26, align 8
  %28 = load i64, i64* %mask, align 8
  %xor25 = xor i64 %27, %28
  %neg = xor i64 %xor25, -1
  %and26 = and i64 %sub, %neg
  %and27 = and i64 %and26, -9187201950435737472
  %tobool28 = icmp ne i64 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %while.body24
  br label %while.end33

if.end30:                                         ; preds = %while.body24
  %29 = load i64, i64* %length.addr, align 8
  %sub31 = sub i64 %29, 8
  store i64 %sub31, i64* %length.addr, align 8
  %30 = load i64*, i64** %asrc, align 8
  %incdec.ptr32 = getelementptr inbounds i64, i64* %30, i32 1
  store i64* %incdec.ptr32, i64** %asrc, align 8
  br label %while.cond21

while.end33.loopexit:                             ; preds = %while.cond21
  br label %while.end33

while.end33:                                      ; preds = %while.end33.loopexit, %if.then29
  %31 = load i64*, i64** %asrc, align 8
  %32 = bitcast i64* %31 to i8*
  store i8* %32, i8** %src, align 8
  br label %if.end34

if.end34:                                         ; preds = %while.end33, %while.end
  br label %while.cond35

while.cond35:                                     ; preds = %if.end44, %if.end34
  %33 = load i64, i64* %length.addr, align 8
  %dec36 = add i64 %33, -1
  store i64 %dec36, i64* %length.addr, align 8
  %tobool37 = icmp ne i64 %33, 0
  br i1 %tobool37, label %while.body38, label %while.end46

while.body38:                                     ; preds = %while.cond35
  %34 = load i8*, i8** %src, align 8
  %35 = load i8, i8* %34, align 1
  %conv39 = zext i8 %35 to i32
  %36 = load i8, i8* %d, align 1
  %conv40 = zext i8 %36 to i32
  %cmp41 = icmp eq i32 %conv39, %conv40
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %while.body38
  %37 = load i8*, i8** %src, align 8
  store i8* %37, i8** %retval, align 8
  br label %return

if.end44:                                         ; preds = %while.body38
  %38 = load i8*, i8** %src, align 8
  %incdec.ptr45 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr45, i8** %src, align 8
  br label %while.cond35

while.end46:                                      ; preds = %while.cond35
  store i8* null, i8** %retval, align 8
  br label %return

return:                                           ; preds = %while.end46, %if.then43, %if.then5, %if.then
  %39 = load i8*, i8** %retval, align 8
  ret i8* %39
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__malloc_lock(%struct._reent.122* %ptr) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent.122*, align 8
  store %struct._reent.122* %ptr, %struct._reent.122** %ptr.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__malloc_unlock(%struct._reent.122* %ptr) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent.122*, align 8
  store %struct._reent.122* %ptr, %struct._reent.122** %ptr.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i8* @_sbrk_r(%struct._reent* %ptr, i64 %incr) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %incr.addr = alloca i64, align 8
  %ret = alloca i8*, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i64 %incr, i64* %incr.addr, align 8
  store i32 0, i32* @errno, align 4
  %0 = load i64, i64* %incr.addr, align 8
  %call = call i8* @sbrk(i64 %0) #4
  store i8* %call, i8** %ret, align 8
  %cmp = icmp eq i8* %call, inttoptr (i64 -1 to i8*)
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @errno, align 4
  %cmp1 = icmp ne i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @errno, align 4
  %3 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %3, i32 0, i32 0
  store i32 %2, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load i8*, i8** %ret, align 8
  ret i8* %4
}

declare dso_local i8* @sbrk(i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__sread(%struct._reent.146* %ptr, i8* %cookie, i8* %buf, i32 %n) #1 {
entry:
  %ptr.addr = alloca %struct._reent.146*, align 8
  %cookie.addr = alloca i8*, align 8
  %buf.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %fp = alloca %struct.__sFILE.138*, align 8
  %ret = alloca i64, align 8
  store %struct._reent.146* %ptr, %struct._reent.146** %ptr.addr, align 8
  store i8* %cookie, i8** %cookie.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load i8*, i8** %cookie.addr, align 8
  %1 = bitcast i8* %0 to %struct.__sFILE.138*
  store %struct.__sFILE.138* %1, %struct.__sFILE.138** %fp, align 8
  %2 = load %struct._reent.146*, %struct._reent.146** %ptr.addr, align 8
  %3 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_file = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %3, i32 0, i32 4
  %4 = load i16, i16* %_file, align 2
  %conv = sext i16 %4 to i32
  %5 = load i8*, i8** %buf.addr, align 8
  %6 = load i32, i32* %n.addr, align 4
  %conv1 = sext i32 %6 to i64
  %call = call i64 bitcast (i64 (%struct._reent*, i32, i8*, i64)* @_read_r to i64 (%struct._reent.146*, i32, i8*, i64)*)(%struct._reent.146* %2, i32 %conv, i8* %5, i64 %conv1) #4
  store i64 %call, i64* %ret, align 8
  %7 = load i64, i64* %ret, align 8
  %cmp = icmp sge i64 %7, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %8 = load i64, i64* %ret, align 8
  %9 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_offset = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %9, i32 0, i32 19
  %10 = load i64, i64* %_offset, align 8
  %add = add nsw i64 %10, %8
  store i64 %add, i64* %_offset, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %11 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_flags = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %11, i32 0, i32 3
  %12 = load i16, i16* %_flags, align 8
  %conv3 = sext i16 %12 to i32
  %and = and i32 %conv3, -4097
  %conv4 = trunc i32 %and to i16
  store i16 %conv4, i16* %_flags, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %13 = load i64, i64* %ret, align 8
  %conv5 = trunc i64 %13 to i32
  ret i32 %conv5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__swrite(%struct._reent.146* %ptr, i8* %cookie, i8* %buf, i32 %n) #1 {
entry:
  %ptr.addr = alloca %struct._reent.146*, align 8
  %cookie.addr = alloca i8*, align 8
  %buf.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %fp = alloca %struct.__sFILE.138*, align 8
  %w = alloca i64, align 8
  store %struct._reent.146* %ptr, %struct._reent.146** %ptr.addr, align 8
  store i8* %cookie, i8** %cookie.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load i8*, i8** %cookie.addr, align 8
  %1 = bitcast i8* %0 to %struct.__sFILE.138*
  store %struct.__sFILE.138* %1, %struct.__sFILE.138** %fp, align 8
  %2 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_flags = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %2, i32 0, i32 3
  %3 = load i16, i16* %_flags, align 8
  %conv = sext i16 %3 to i32
  %and = and i32 %conv, 256
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct._reent.146*, %struct._reent.146** %ptr.addr, align 8
  %5 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_file = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %5, i32 0, i32 4
  %6 = load i16, i16* %_file, align 2
  %conv1 = sext i16 %6 to i32
  %call = call i64 bitcast (i64 (%struct._reent*, i32, i64, i32)* @_lseek_r to i64 (%struct._reent.146*, i32, i64, i32)*)(%struct._reent.146* %4, i32 %conv1, i64 0, i32 2) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %7, i32 0, i32 3
  %8 = load i16, i16* %_flags2, align 8
  %conv3 = sext i16 %8 to i32
  %and4 = and i32 %conv3, -4097
  %conv5 = trunc i32 %and4 to i16
  store i16 %conv5, i16* %_flags2, align 8
  %9 = load %struct._reent.146*, %struct._reent.146** %ptr.addr, align 8
  %10 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_file6 = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %10, i32 0, i32 4
  %11 = load i16, i16* %_file6, align 2
  %conv7 = sext i16 %11 to i32
  %12 = load i8*, i8** %buf.addr, align 8
  %13 = load i32, i32* %n.addr, align 4
  %conv8 = sext i32 %13 to i64
  %call9 = call i64 bitcast (i64 (%struct._reent*, i32, i8*, i64)* @_write_r to i64 (%struct._reent.146*, i32, i8*, i64)*)(%struct._reent.146* %9, i32 %conv7, i8* %12, i64 %conv8) #4
  store i64 %call9, i64* %w, align 8
  %14 = load i64, i64* %w, align 8
  %conv10 = trunc i64 %14 to i32
  ret i32 %conv10
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @__sseek(%struct._reent.146* %ptr, i8* %cookie, i64 %offset, i32 %whence) #1 {
entry:
  %ptr.addr = alloca %struct._reent.146*, align 8
  %cookie.addr = alloca i8*, align 8
  %offset.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  %fp = alloca %struct.__sFILE.138*, align 8
  %ret = alloca i64, align 8
  store %struct._reent.146* %ptr, %struct._reent.146** %ptr.addr, align 8
  store i8* %cookie, i8** %cookie.addr, align 8
  store i64 %offset, i64* %offset.addr, align 8
  store i32 %whence, i32* %whence.addr, align 4
  %0 = load i8*, i8** %cookie.addr, align 8
  %1 = bitcast i8* %0 to %struct.__sFILE.138*
  store %struct.__sFILE.138* %1, %struct.__sFILE.138** %fp, align 8
  %2 = load %struct._reent.146*, %struct._reent.146** %ptr.addr, align 8
  %3 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_file = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %3, i32 0, i32 4
  %4 = load i16, i16* %_file, align 2
  %conv = sext i16 %4 to i32
  %5 = load i64, i64* %offset.addr, align 8
  %6 = load i32, i32* %whence.addr, align 4
  %call = call i64 bitcast (i64 (%struct._reent*, i32, i64, i32)* @_lseek_r to i64 (%struct._reent.146*, i32, i64, i32)*)(%struct._reent.146* %2, i32 %conv, i64 %5, i32 %6) #4
  store i64 %call, i64* %ret, align 8
  %7 = load i64, i64* %ret, align 8
  %cmp = icmp eq i64 %7, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %8 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_flags = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %8, i32 0, i32 3
  %9 = load i16, i16* %_flags, align 8
  %conv2 = sext i16 %9 to i32
  %and = and i32 %conv2, -4097
  %conv3 = trunc i32 %and to i16
  store i16 %conv3, i16* %_flags, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %10 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_flags4 = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %10, i32 0, i32 3
  %11 = load i16, i16* %_flags4, align 8
  %conv5 = sext i16 %11 to i32
  %or = or i32 %conv5, 4096
  %conv6 = trunc i32 %or to i16
  store i16 %conv6, i16* %_flags4, align 8
  %12 = load i64, i64* %ret, align 8
  %13 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_offset = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %13, i32 0, i32 19
  store i64 %12, i64* %_offset, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i64, i64* %ret, align 8
  ret i64 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__sclose(%struct._reent.146* %ptr, i8* %cookie) #1 {
entry:
  %ptr.addr = alloca %struct._reent.146*, align 8
  %cookie.addr = alloca i8*, align 8
  %fp = alloca %struct.__sFILE.138*, align 8
  store %struct._reent.146* %ptr, %struct._reent.146** %ptr.addr, align 8
  store i8* %cookie, i8** %cookie.addr, align 8
  %0 = load i8*, i8** %cookie.addr, align 8
  %1 = bitcast i8* %0 to %struct.__sFILE.138*
  store %struct.__sFILE.138* %1, %struct.__sFILE.138** %fp, align 8
  %2 = load %struct._reent.146*, %struct._reent.146** %ptr.addr, align 8
  %3 = load %struct.__sFILE.138*, %struct.__sFILE.138** %fp, align 8
  %_file = getelementptr inbounds %struct.__sFILE.138, %struct.__sFILE.138* %3, i32 0, i32 4
  %4 = load i16, i16* %_file, align 2
  %conv = sext i16 %4 to i32
  %call = call i32 bitcast (i32 (%struct._reent*, i32)* @_close_r to i32 (%struct._reent.146*, i32)*)(%struct._reent.146* %2, i32 %conv) #4
  ret i32 %call
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @strlen(i8* %str) local_unnamed_addr #1 {
entry:
  %retval = alloca i64, align 8
  %str.addr = alloca i8*, align 8
  %start = alloca i8*, align 8
  %aligned_addr = alloca i64*, align 8
  store i8* %str, i8** %str.addr, align 8
  %0 = load i8*, i8** %str.addr, align 8
  store i8* %0, i8** %start, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i8*, i8** %str.addr, align 8
  %2 = ptrtoint i8* %1 to i64
  %and = and i64 %2, 7
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %str.addr, align 8
  %4 = load i8, i8* %3, align 1
  %tobool1 = icmp ne i8 %4, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %5 = load i8*, i8** %str.addr, align 8
  %6 = load i8*, i8** %start, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %5 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %6 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i64 %sub.ptr.sub, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %while.body
  %7 = load i8*, i8** %str.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %str.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i8*, i8** %str.addr, align 8
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %aligned_addr, align 8
  br label %while.cond2

while.cond2:                                      ; preds = %while.body6, %while.end
  %10 = load i64*, i64** %aligned_addr, align 8
  %11 = load i64, i64* %10, align 8
  %sub = sub i64 %11, 72340172838076673
  %12 = load i64*, i64** %aligned_addr, align 8
  %13 = load i64, i64* %12, align 8
  %neg = xor i64 %13, -1
  %and3 = and i64 %sub, %neg
  %and4 = and i64 %and3, -9187201950435737472
  %tobool5 = icmp ne i64 %and4, 0
  %lnot = xor i1 %tobool5, true
  br i1 %lnot, label %while.body6, label %while.end8

while.body6:                                      ; preds = %while.cond2
  %14 = load i64*, i64** %aligned_addr, align 8
  %incdec.ptr7 = getelementptr inbounds i64, i64* %14, i32 1
  store i64* %incdec.ptr7, i64** %aligned_addr, align 8
  br label %while.cond2

while.end8:                                       ; preds = %while.cond2
  %15 = load i64*, i64** %aligned_addr, align 8
  %16 = bitcast i64* %15 to i8*
  store i8* %16, i8** %str.addr, align 8
  br label %while.cond9

while.cond9:                                      ; preds = %while.body11, %while.end8
  %17 = load i8*, i8** %str.addr, align 8
  %18 = load i8, i8* %17, align 1
  %tobool10 = icmp ne i8 %18, 0
  br i1 %tobool10, label %while.body11, label %while.end13

while.body11:                                     ; preds = %while.cond9
  %19 = load i8*, i8** %str.addr, align 8
  %incdec.ptr12 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr12, i8** %str.addr, align 8
  br label %while.cond9

while.end13:                                      ; preds = %while.cond9
  %20 = load i8*, i8** %str.addr, align 8
  %21 = load i8*, i8** %start, align 8
  %sub.ptr.lhs.cast14 = ptrtoint i8* %20 to i64
  %sub.ptr.rhs.cast15 = ptrtoint i8* %21 to i64
  %sub.ptr.sub16 = sub i64 %sub.ptr.lhs.cast14, %sub.ptr.rhs.cast15
  store i64 %sub.ptr.sub16, i64* %retval, align 8
  br label %return

return:                                           ; preds = %while.end13, %if.then
  %22 = load i64, i64* %retval, align 8
  ret i64 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__sprint_r(%struct._reent* %ptr, %struct.__sFILE* %fp, %struct.__suio* %uio) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %uio.addr = alloca %struct.__suio*, align 8
  %err = alloca i32, align 4
  %iov = alloca %struct.__siov*, align 8
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store %struct.__suio* %uio, %struct.__suio** %uio.addr, align 8
  store i32 0, i32* %err, align 4
  %0 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid = getelementptr inbounds %struct.__suio, %struct.__suio* %0, i32 0, i32 2
  %1 = load i64, i64* %uio_resid, align 8
  %cmp = icmp eq i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_iovcnt = getelementptr inbounds %struct.__suio, %struct.__suio* %2, i32 0, i32 1
  store i32 0, i32* %uio_iovcnt, align 8
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %3, i32 0, i32 23
  %4 = load i32, i32* %_flags2, align 4
  %and = and i32 %4, 8192
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %5 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_iov = getelementptr inbounds %struct.__suio, %struct.__suio* %5, i32 0, i32 0
  %6 = load %struct.__siov*, %struct.__siov** %uio_iov, align 8
  store %struct.__siov* %6, %struct.__siov** %iov, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %if.then1
  %7 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid2 = getelementptr inbounds %struct.__suio, %struct.__suio* %7, i32 0, i32 2
  %8 = load i64, i64* %uio_resid2, align 8
  %cmp3 = icmp ne i64 %8, 0
  br i1 %cmp3, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %9 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_base = getelementptr inbounds %struct.__siov, %struct.__siov* %9, i32 0, i32 0
  %10 = load i8*, i8** %iov_base, align 8
  %11 = bitcast i8* %10 to i32*
  store i32* %11, i32** %p, align 8
  %12 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_len = getelementptr inbounds %struct.__siov, %struct.__siov* %12, i32 0, i32 1
  %13 = load i64, i64* %iov_len, align 8
  %div = udiv i64 %13, 4
  %conv = trunc i64 %div to i32
  store i32 %conv, i32* %len, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %len, align 4
  %cmp5 = icmp slt i32 %14, %15
  br i1 %cmp5, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %16 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %17 = load i32*, i32** %p, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds i32, i32* %17, i64 %idxprom
  %19 = load i32, i32* %arrayidx, align 4
  %20 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @_fputwc_r(%struct._reent* %16, i32 %19, %struct.__sFILE* %20) #4
  %cmp8 = icmp eq i32 %call, -1
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.body7
  store i32 -1, i32* %err, align 4
  br label %out

if.end11:                                         ; preds = %for.body7
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %21 = load i32, i32* %i, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %22 = load i32, i32* %len, align 4
  %conv13 = sext i32 %22 to i64
  %mul = mul i64 %conv13, 4
  %23 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid14 = getelementptr inbounds %struct.__suio, %struct.__suio* %23, i32 0, i32 2
  %24 = load i64, i64* %uio_resid14, align 8
  %sub = sub i64 %24, %mul
  store i64 %sub, i64* %uio_resid14, align 8
  %25 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %incdec.ptr = getelementptr inbounds %struct.__siov, %struct.__siov* %25, i32 1
  store %struct.__siov* %incdec.ptr, %struct.__siov** %iov, align 8
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  br label %if.end17

if.else:                                          ; preds = %if.end
  %26 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %27 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %28 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %call16 = call fastcc i32 @__sfvwrite_r(%struct._reent* %26, %struct.__sFILE* %27, %struct.__suio* %28) #4
  store i32 %call16, i32* %err, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end15
  br label %out

out:                                              ; preds = %if.end17, %if.then10
  %29 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid18 = getelementptr inbounds %struct.__suio, %struct.__suio* %29, i32 0, i32 2
  store i64 0, i64* %uio_resid18, align 8
  %30 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_iovcnt19 = getelementptr inbounds %struct.__suio, %struct.__suio* %30, i32 0, i32 1
  store i32 0, i32* %uio_iovcnt19, align 8
  %31 = load i32, i32* %err, align 4
  store i32 %31, i32* %retval, align 4
  br label %return

return:                                           ; preds = %out, %if.then
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @_write_r(%struct._reent* %ptr, i32 %fd, i8* %buf, i64 %cnt) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %cnt.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i64 %cnt, i64* %cnt.addr, align 8
  store i32 0, i32* @errno, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 8
  %2 = load i64, i64* %cnt.addr, align 8
  %call = call i32 @write(i32 %0, i8* %1, i64 %2) #4
  %conv = sext i32 %call to i64
  store i64 %conv, i64* %ret, align 8
  %cmp = icmp eq i64 %conv, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* @errno, align 4
  %cmp2 = icmp ne i32 %3, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* @errno, align 4
  %5 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %5, i32 0, i32 0
  store i32 %4, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load i64, i64* %ret, align 8
  ret i64 %6
}

declare dso_local i32 @write(i32, i8*, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_close_r(%struct._reent* %ptr, i32 %fd) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fd.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i32 0, i32* @errno, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 @close(i32 %0) #4
  store i32 %call, i32* %ret, align 4
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @errno, align 4
  %cmp1 = icmp ne i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @errno, align 4
  %3 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %3, i32 0, i32 0
  store i32 %2, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load i32, i32* %ret, align 4
  ret i32 %4
}

declare dso_local i32 @close(i32) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_fclose_r(%struct._reent* %rptr, %struct.__sFILE* %fp) #1 {
entry:
  %retval = alloca i32, align 4
  %rptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %r = alloca i32, align 4
  %_check_init_ptr = alloca %struct._reent*, align 8
  store %struct._reent* %rptr, %struct._reent** %rptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %cmp = icmp eq %struct.__sFILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %1 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  store %struct._reent* %1, %struct._reent** %_check_init_ptr, align 8
  %2 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %tobool = icmp ne %struct._reent* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.end3

land.lhs.true:                                    ; preds = %do.body
  %3 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %3, i32 0, i32 8
  %4 = load i32, i32* %__sdidinit, align 8
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %land.lhs.true
  %5 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  call fastcc void @__sinit(%struct._reent* %5) #4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end3
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %6, i32 0, i32 23
  %7 = load i32, i32* %_flags2, align 4
  %and = and i32 %7, 1
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.end8, label %if.then5

if.then5:                                         ; preds = %do.end
  %8 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %8, i32 0, i32 3
  %9 = load i16, i16* %_flags, align 8
  %conv = sext i16 %9 to i32
  %and6 = and i32 %conv, 512
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then5
  br label %cond.end

cond.false:                                       ; preds = %if.then5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  br label %if.end8

if.end8:                                          ; preds = %cond.end, %do.end
  %10 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags9 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %10, i32 0, i32 3
  %11 = load i16, i16* %_flags9, align 8
  %conv10 = sext i16 %11 to i32
  %cmp11 = icmp eq i32 %conv10, 0
  br i1 %cmp11, label %if.then13, label %if.end26

if.then13:                                        ; preds = %if.end8
  %12 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags214 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %12, i32 0, i32 23
  %13 = load i32, i32* %_flags214, align 4
  %and15 = and i32 %13, 1
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.end25, label %if.then17

if.then17:                                        ; preds = %if.then13
  %14 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags18 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %14, i32 0, i32 3
  %15 = load i16, i16* %_flags18, align 8
  %conv19 = sext i16 %15 to i32
  %and20 = and i32 %conv19, 512
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %if.then17
  br label %cond.end24

cond.false23:                                     ; preds = %if.then17
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true22
  br label %if.end25

if.end25:                                         ; preds = %cond.end24, %if.then13
  store i32 0, i32* %retval, align 4
  br label %return

if.end26:                                         ; preds = %if.end8
  %16 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %17 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__sflush_r(%struct._reent* %16, %struct.__sFILE* %17) #4
  store i32 %call, i32* %r, align 4
  %18 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_close = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %18, i32 0, i32 11
  %19 = load i32 (%struct._reent*, i8*)*, i32 (%struct._reent*, i8*)** %_close, align 8
  %cmp27 = icmp ne i32 (%struct._reent*, i8*)* %19, null
  br i1 %cmp27, label %land.lhs.true29, label %if.end35

land.lhs.true29:                                  ; preds = %if.end26
  %20 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_close30 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %20, i32 0, i32 11
  %21 = load i32 (%struct._reent*, i8*)*, i32 (%struct._reent*, i8*)** %_close30, align 8
  %22 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %23 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %23, i32 0, i32 7
  %24 = load i8*, i8** %_cookie, align 8
  %call31 = call i32 %21(%struct._reent* %22, i8* %24) #5
  %cmp32 = icmp slt i32 %call31, 0
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %land.lhs.true29
  store i32 -1, i32* %r, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %land.lhs.true29, %if.end26
  %25 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags36 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %25, i32 0, i32 3
  %26 = load i16, i16* %_flags36, align 8
  %conv37 = sext i16 %26 to i32
  %and38 = and i32 %conv37, 128
  %tobool39 = icmp ne i32 %and38, 0
  br i1 %tobool39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end35
  %27 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %28 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %28, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  %29 = load i8*, i8** %_base, align 8
  call fastcc void @_free_r(%struct._reent* %27, i8* %29) #4
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.end35
  %30 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %30, i32 0, i32 12
  %_base42 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub, i32 0, i32 0
  %31 = load i8*, i8** %_base42, align 8
  %cmp43 = icmp ne i8* %31, null
  br i1 %cmp43, label %if.then45, label %if.end56

if.then45:                                        ; preds = %if.end41
  %32 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub46 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %32, i32 0, i32 12
  %_base47 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub46, i32 0, i32 0
  %33 = load i8*, i8** %_base47, align 8
  %34 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ubuf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %34, i32 0, i32 15
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %_ubuf, i64 0, i64 0
  %cmp48 = icmp ne i8* %33, %arraydecay
  br i1 %cmp48, label %if.then50, label %if.end53

if.then50:                                        ; preds = %if.then45
  %35 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %36 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub51 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %36, i32 0, i32 12
  %_base52 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub51, i32 0, i32 0
  %37 = load i8*, i8** %_base52, align 8
  call fastcc void @_free_r(%struct._reent* %35, i8* %37) #4
  br label %if.end53

if.end53:                                         ; preds = %if.then50, %if.then45
  %38 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_ub54 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %38, i32 0, i32 12
  %_base55 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_ub54, i32 0, i32 0
  store i8* null, i8** %_base55, align 8
  br label %if.end56

if.end56:                                         ; preds = %if.end53, %if.end41
  %39 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_lb = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %39, i32 0, i32 17
  %_base57 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_lb, i32 0, i32 0
  %40 = load i8*, i8** %_base57, align 8
  %cmp58 = icmp ne i8* %40, null
  br i1 %cmp58, label %if.then60, label %if.end65

if.then60:                                        ; preds = %if.end56
  %41 = load %struct._reent*, %struct._reent** %rptr.addr, align 8
  %42 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_lb61 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %42, i32 0, i32 17
  %_base62 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_lb61, i32 0, i32 0
  %43 = load i8*, i8** %_base62, align 8
  call fastcc void @_free_r(%struct._reent* %41, i8* %43) #4
  %44 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_lb63 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %44, i32 0, i32 17
  %_base64 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_lb63, i32 0, i32 0
  store i8* null, i8** %_base64, align 8
  br label %if.end65

if.end65:                                         ; preds = %if.then60, %if.end56
  call fastcc void @__sfp_lock_acquire() #4
  %45 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags66 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %45, i32 0, i32 3
  store i16 0, i16* %_flags66, align 8
  %46 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags267 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %46, i32 0, i32 23
  %47 = load i32, i32* %_flags267, align 4
  %and68 = and i32 %47, 1
  %tobool69 = icmp ne i32 %and68, 0
  br i1 %tobool69, label %if.end78, label %if.then70

if.then70:                                        ; preds = %if.end65
  %48 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags71 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %48, i32 0, i32 3
  %49 = load i16, i16* %_flags71, align 8
  %conv72 = sext i16 %49 to i32
  %and73 = and i32 %conv72, 512
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %cond.true75, label %cond.false76

cond.true75:                                      ; preds = %if.then70
  br label %cond.end77

cond.false76:                                     ; preds = %if.then70
  br label %cond.end77

cond.end77:                                       ; preds = %cond.false76, %cond.true75
  br label %if.end78

if.end78:                                         ; preds = %cond.end77, %if.end65
  call fastcc void @__sfp_lock_release() #4
  %50 = load i32, i32* %r, align 4
  store i32 %50, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end78, %if.end25, %if.then
  %51 = load i32, i32* %retval, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fclose(%struct.__sFILE* %fp) local_unnamed_addr #1 {
entry:
  %fp.addr = alloca %struct.__sFILE*, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call i32 @_fclose_r(%struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct.__sFILE* %0) #4
  ret i32 %call
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__fputwc(%struct._reent* %ptr, i32 %wc, %struct.__sFILE* %fp) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %wc.addr = alloca i32, align 4
  %fp.addr = alloca %struct.__sFILE*, align 8
  %buf = alloca [1 x i8], align 1
  %i = alloca i64, align 8
  %len = alloca i64, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %wc, i32* %wc.addr, align 4
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__locale_mb_cur_max() #4
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %0 = load i32, i32* %wc.addr, align 4
  %cmp1 = icmp sgt i32 %0, 0
  br i1 %cmp1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %land.lhs.true
  %1 = load i32, i32* %wc.addr, align 4
  %cmp3 = icmp sle i32 %1, 255
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true2
  %2 = load i32, i32* %wc.addr, align 4
  %conv = trunc i32 %2 to i8
  %arraydecay = getelementptr inbounds [1 x i8], [1 x i8]* %buf, i64 0, i64 0
  store i8 %conv, i8* %arraydecay, align 1
  store i64 1, i64* %len, align 8
  br label %if.end11

if.else:                                          ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %3 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %arraydecay4 = getelementptr inbounds [1 x i8], [1 x i8]* %buf, i64 0, i64 0
  %4 = load i32, i32* %wc.addr, align 4
  %5 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_mbstate = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 22
  %call5 = call fastcc i64 @_wcrtomb_r(%struct._reent* %3, i8* %arraydecay4, i32 %4, %struct._mbstate_t* %_mbstate) #4
  store i64 %call5, i64* %len, align 8
  %cmp6 = icmp eq i64 %call5, -1
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.else
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %6, i32 0, i32 3
  %7 = load i16, i16* %_flags, align 8
  %conv9 = sext i16 %7 to i32
  %or = or i32 %conv9, 64
  %conv10 = trunc i32 %or to i16
  store i16 %conv10, i16* %_flags, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end11
  %8 = load i64, i64* %i, align 8
  %9 = load i64, i64* %len, align 8
  %cmp12 = icmp ult i64 %8, %9
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %11 = load i64, i64* %i, align 8
  %arrayidx = getelementptr inbounds [1 x i8], [1 x i8]* %buf, i64 0, i64 %11
  %12 = load i8, i8* %arrayidx, align 1
  %conv14 = zext i8 %12 to i32
  %13 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call15 = call fastcc i32 @__sputc_r(%struct._reent* %10, i32 %conv14, %struct.__sFILE* %13) #4
  %cmp16 = icmp eq i32 %call15, -1
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %for.body
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %14 = load i64, i64* %i, align 8
  %inc = add i64 %14, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* %wc.addr, align 4
  store i32 %15, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then18, %if.then8
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__sputc_r(%struct._reent* %_ptr, i32 %_c, %struct.__sFILE* %_p) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %_ptr.addr = alloca %struct._reent*, align 8
  %_c.addr = alloca i32, align 4
  %_p.addr = alloca %struct.__sFILE*, align 8
  store %struct._reent* %_ptr, %struct._reent** %_ptr.addr, align 8
  store i32 %_c, i32* %_c.addr, align 4
  store %struct.__sFILE* %_p, %struct.__sFILE** %_p.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %_p.addr, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 2
  %1 = load i32, i32* %_w, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %_w, align 4
  %cmp = icmp sge i32 %dec, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %_p.addr, align 8
  %_w1 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %2, i32 0, i32 2
  %3 = load i32, i32* %_w1, align 4
  %4 = load %struct.__sFILE*, %struct.__sFILE** %_p.addr, align 8
  %_lbfsize = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 6
  %5 = load i32, i32* %_lbfsize, align 8
  %cmp2 = icmp sge i32 %3, %5
  br i1 %cmp2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %lor.lhs.false
  %6 = load i32, i32* %_c.addr, align 4
  %conv = trunc i32 %6 to i8
  %conv3 = sext i8 %conv to i32
  %cmp4 = icmp ne i32 %conv3, 10
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %_c.addr, align 4
  %conv6 = trunc i32 %7 to i8
  %8 = load %struct.__sFILE*, %struct.__sFILE** %_p.addr, align 8
  %_p7 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %8, i32 0, i32 0
  %9 = load i8*, i8** %_p7, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %_p7, align 8
  store i8 %conv6, i8* %9, align 1
  %conv8 = zext i8 %conv6 to i32
  store i32 %conv8, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %10 = load %struct._reent*, %struct._reent** %_ptr.addr, align 8
  %11 = load i32, i32* %_c.addr, align 4
  %12 = load %struct.__sFILE*, %struct.__sFILE** %_p.addr, align 8
  %call = call fastcc i32 @__swbuf_r(%struct._reent* %10, i32 %11, %struct.__sFILE* %12) #4
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @_fputwc_r(%struct._reent* %ptr, i32 %wc, %struct.__sFILE* %fp) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %wc.addr = alloca i32, align 4
  %fp.addr = alloca %struct.__sFILE*, align 8
  %r = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %wc, i32* %wc.addr, align 4
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %0, i32 0, i32 23
  %1 = load i32, i32* %_flags2, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %2, i32 0, i32 3
  %3 = load i16, i16* %_flags, align 8
  %conv = sext i16 %3 to i32
  %and1 = and i32 %conv, 512
  %tobool2 = icmp ne i32 %and1, 0
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %4 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags3 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 3
  %5 = load i16, i16* %_flags3, align 8
  %conv4 = sext i16 %5 to i32
  %and5 = and i32 %conv4, 8192
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.end13, label %if.then7

if.then7:                                         ; preds = %do.body
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags8 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %6, i32 0, i32 3
  %7 = load i16, i16* %_flags8, align 8
  %conv9 = sext i16 %7 to i32
  %or = or i32 %conv9, 8192
  %conv10 = trunc i32 %or to i16
  store i16 %conv10, i16* %_flags8, align 8
  %8 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags211 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %8, i32 0, i32 23
  %9 = load i32, i32* %_flags211, align 4
  %or12 = or i32 %9, 8192
  store i32 %or12, i32* %_flags211, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then7, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end13
  %10 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %11 = load i32, i32* %wc.addr, align 4
  %12 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__fputwc(%struct._reent* %10, i32 %11, %struct.__sFILE* %12) #4
  store i32 %call, i32* %r, align 4
  %13 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags214 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %13, i32 0, i32 23
  %14 = load i32, i32* %_flags214, align 4
  %and15 = and i32 %14, 1
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.end25, label %if.then17

if.then17:                                        ; preds = %do.end
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags18 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 3
  %16 = load i16, i16* %_flags18, align 8
  %conv19 = sext i16 %16 to i32
  %and20 = and i32 %conv19, 512
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %if.then17
  br label %cond.end24

cond.false23:                                     ; preds = %if.then17
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true22
  br label %if.end25

if.end25:                                         ; preds = %cond.end24, %do.end
  %17 = load i32, i32* %r, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fputwc(i32 %wc, %struct.__sFILE* %fp) local_unnamed_addr #1 {
entry:
  %wc.addr = alloca i32, align 4
  %fp.addr = alloca %struct.__sFILE*, align 8
  %reent = alloca %struct._reent*, align 8
  %_check_init_ptr = alloca %struct._reent*, align 8
  store i32 %wc, i32* %wc.addr, align 4
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store %struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct._reent** %reent, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct._reent*, %struct._reent** %reent, align 8
  store %struct._reent* %0, %struct._reent** %_check_init_ptr, align 8
  %1 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %tobool = icmp ne %struct._reent* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %2 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %2, i32 0, i32 8
  %3 = load i32, i32* %__sdidinit, align 8
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  call fastcc void @__sinit(%struct._reent* %4) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load %struct._reent*, %struct._reent** %reent, align 8
  %6 = load i32, i32* %wc.addr, align 4
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @_fputwc_r(%struct._reent* %5, i32 %6, %struct.__sFILE* %7) #4
  ret i32 %call
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @_fstat_r(%struct._reent* %ptr, i32 %fd, %struct.stat* %pstat) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fd.addr = alloca i32, align 4
  %pstat.addr = alloca %struct.stat*, align 8
  %ret = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.stat* %pstat, %struct.stat** %pstat.addr, align 8
  store i32 0, i32* @errno, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load %struct.stat*, %struct.stat** %pstat.addr, align 8
  %call = call i32 @fstat(i32 %0, %struct.stat* %1) #4
  store i32 %call, i32* %ret, align 4
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @errno, align 4
  %cmp1 = icmp ne i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* @errno, align 4
  %4 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %4, i32 0, i32 0
  store i32 %3, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load i32, i32* %ret, align 4
  ret i32 %5
}

declare dso_local i32 @fstat(i32, %struct.stat*) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__sfvwrite_r(%struct._reent* %ptr, %struct.__sFILE* %fp, %struct.__suio* %uio) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %fp.addr = alloca %struct.__sFILE*, align 8
  %uio.addr = alloca %struct.__suio*, align 8
  %len = alloca i64, align 8
  %p = alloca i8*, align 8
  %iov = alloca %struct.__siov*, align 8
  %w = alloca i32, align 4
  %s = alloca i32, align 4
  %nl = alloca i8*, align 8
  %nlknown = alloca i32, align 4
  %nldist = alloca i32, align 4
  %str = alloca i8*, align 8
  %curpos = alloca i32, align 4
  %newsize = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  store %struct.__suio* %uio, %struct.__suio** %uio.addr, align 8
  store i8* null, i8** %p, align 8
  %0 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid = getelementptr inbounds %struct.__suio, %struct.__suio* %0, i32 0, i32 2
  %1 = load i64, i64* %uio_resid, align 8
  store i64 %1, i64* %len, align 8
  %cmp = icmp eq i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %2, i32 0, i32 3
  %3 = load i16, i16* %_flags, align 8
  %conv = sext i16 %3 to i32
  %and = and i32 %conv, 8
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %4, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  %5 = load i8*, i8** %_base, align 8
  %cmp3 = icmp eq i8* %5, null
  br i1 %cmp3, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end
  %6 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__swsetup_r(%struct._reent* %6, %struct.__sFILE* %7) #4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %land.lhs.true
  store i32 -1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %8 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_iov = getelementptr inbounds %struct.__suio, %struct.__suio* %8, i32 0, i32 0
  %9 = load %struct.__siov*, %struct.__siov** %uio_iov, align 8
  store %struct.__siov* %9, %struct.__siov** %iov, align 8
  store i64 0, i64* %len, align 8
  %10 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags7 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %10, i32 0, i32 3
  %11 = load i16, i16* %_flags7, align 8
  %conv8 = sext i16 %11 to i32
  %and9 = and i32 %conv8, 2
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.end6
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then11
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.body
  %12 = load i64, i64* %len, align 8
  %cmp12 = icmp eq i64 %12, 0
  br i1 %cmp12, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %13 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_base = getelementptr inbounds %struct.__siov, %struct.__siov* %13, i32 0, i32 0
  %14 = load i8*, i8** %iov_base, align 8
  store i8* %14, i8** %p, align 8
  %15 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_len = getelementptr inbounds %struct.__siov, %struct.__siov* %15, i32 0, i32 1
  %16 = load i64, i64* %iov_len, align 8
  store i64 %16, i64* %len, align 8
  %17 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %incdec.ptr = getelementptr inbounds %struct.__siov, %struct.__siov* %17, i32 1
  store %struct.__siov* %incdec.ptr, %struct.__siov** %iov, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_write = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %18, i32 0, i32 9
  %19 = load i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)** %_write, align 8
  %20 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %21 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %21, i32 0, i32 7
  %22 = load i8*, i8** %_cookie, align 8
  %23 = load i8*, i8** %p, align 8
  %24 = load i64, i64* %len, align 8
  %cmp14 = icmp ult i64 %24, 2147482624
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.end
  %25 = load i64, i64* %len, align 8
  br label %cond.end

cond.false:                                       ; preds = %while.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %25, %cond.true ], [ 2147482624, %cond.false ]
  %conv16 = trunc i64 %cond to i32
  %call17 = call i32 %19(%struct._reent* %20, i8* %22, i8* %23, i32 %conv16) #5
  store i32 %call17, i32* %w, align 4
  %26 = load i32, i32* %w, align 4
  %cmp18 = icmp sle i32 %26, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %cond.end
  br label %err

if.end21:                                         ; preds = %cond.end
  %27 = load i32, i32* %w, align 4
  %28 = load i8*, i8** %p, align 8
  %idx.ext = sext i32 %27 to i64
  %add.ptr = getelementptr inbounds i8, i8* %28, i64 %idx.ext
  store i8* %add.ptr, i8** %p, align 8
  %29 = load i32, i32* %w, align 4
  %conv22 = sext i32 %29 to i64
  %30 = load i64, i64* %len, align 8
  %sub = sub i64 %30, %conv22
  store i64 %sub, i64* %len, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end21
  %31 = load i32, i32* %w, align 4
  %conv23 = sext i32 %31 to i64
  %32 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid24 = getelementptr inbounds %struct.__suio, %struct.__suio* %32, i32 0, i32 2
  %33 = load i64, i64* %uio_resid24, align 8
  %sub25 = sub i64 %33, %conv23
  store i64 %sub25, i64* %uio_resid24, align 8
  %cmp26 = icmp ne i64 %sub25, 0
  br i1 %cmp26, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end307

if.else:                                          ; preds = %if.end6
  %34 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags28 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %34, i32 0, i32 3
  %35 = load i16, i16* %_flags28, align 8
  %conv29 = sext i16 %35 to i32
  %and30 = and i32 %conv29, 1
  %cmp31 = icmp eq i32 %and30, 0
  br i1 %cmp31, label %if.then33, label %if.else205

if.then33:                                        ; preds = %if.else
  br label %do.body34

do.body34:                                        ; preds = %do.cond198, %if.then33
  br label %while.cond35

while.cond35:                                     ; preds = %while.body38, %do.body34
  %36 = load i64, i64* %len, align 8
  %cmp36 = icmp eq i64 %36, 0
  br i1 %cmp36, label %while.body38, label %while.end42

while.body38:                                     ; preds = %while.cond35
  %37 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_base39 = getelementptr inbounds %struct.__siov, %struct.__siov* %37, i32 0, i32 0
  %38 = load i8*, i8** %iov_base39, align 8
  store i8* %38, i8** %p, align 8
  %39 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_len40 = getelementptr inbounds %struct.__siov, %struct.__siov* %39, i32 0, i32 1
  %40 = load i64, i64* %iov_len40, align 8
  store i64 %40, i64* %len, align 8
  %41 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %incdec.ptr41 = getelementptr inbounds %struct.__siov, %struct.__siov* %41, i32 1
  store %struct.__siov* %incdec.ptr41, %struct.__siov** %iov, align 8
  br label %while.cond35

while.end42:                                      ; preds = %while.cond35
  %42 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %42, i32 0, i32 2
  %43 = load i32, i32* %_w, align 4
  store i32 %43, i32* %w, align 4
  %44 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags43 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %44, i32 0, i32 3
  %45 = load i16, i16* %_flags43, align 8
  %conv44 = sext i16 %45 to i32
  %and45 = and i32 %conv44, 512
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %if.then47, label %if.else133

if.then47:                                        ; preds = %while.end42
  %46 = load i64, i64* %len, align 8
  %47 = load i32, i32* %w, align 4
  %conv48 = sext i32 %47 to i64
  %cmp49 = icmp uge i64 %46, %conv48
  br i1 %cmp49, label %land.lhs.true51, label %if.end117

land.lhs.true51:                                  ; preds = %if.then47
  %48 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags52 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %48, i32 0, i32 3
  %49 = load i16, i16* %_flags52, align 8
  %conv53 = sext i16 %49 to i32
  %and54 = and i32 %conv53, 1152
  %tobool55 = icmp ne i32 %and54, 0
  br i1 %tobool55, label %if.then56, label %if.end117

if.then56:                                        ; preds = %land.lhs.true51
  %50 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %50, i32 0, i32 0
  %51 = load i8*, i8** %_p, align 8
  %52 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf57 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %52, i32 0, i32 5
  %_base58 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf57, i32 0, i32 0
  %53 = load i8*, i8** %_base58, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %51 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %53 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv59 = trunc i64 %sub.ptr.sub to i32
  store i32 %conv59, i32* %curpos, align 4
  %54 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf60 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %54, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf60, i32 0, i32 1
  %55 = load i32, i32* %_size, align 8
  %mul = mul nsw i32 %55, 3
  %div = sdiv i32 %mul, 2
  store i32 %div, i32* %newsize, align 4
  %56 = load i32, i32* %newsize, align 4
  %conv61 = sext i32 %56 to i64
  %57 = load i32, i32* %curpos, align 4
  %conv62 = sext i32 %57 to i64
  %58 = load i64, i64* %len, align 8
  %add = add i64 %conv62, %58
  %add63 = add i64 %add, 1
  %cmp64 = icmp ult i64 %conv61, %add63
  br i1 %cmp64, label %if.then66, label %if.end71

if.then66:                                        ; preds = %if.then56
  %59 = load i32, i32* %curpos, align 4
  %conv67 = sext i32 %59 to i64
  %60 = load i64, i64* %len, align 8
  %add68 = add i64 %conv67, %60
  %add69 = add i64 %add68, 1
  %conv70 = trunc i64 %add69 to i32
  store i32 %conv70, i32* %newsize, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then66, %if.then56
  %61 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags72 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %61, i32 0, i32 3
  %62 = load i16, i16* %_flags72, align 8
  %conv73 = sext i16 %62 to i32
  %and74 = and i32 %conv73, 1024
  %tobool75 = icmp ne i32 %and74, 0
  br i1 %tobool75, label %if.then76, label %if.else91

if.then76:                                        ; preds = %if.end71
  %63 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %64 = load i32, i32* %newsize, align 4
  %conv77 = sext i32 %64 to i64
  %call78 = call fastcc i8* @_malloc_r(%struct._reent* %63, i64 %conv77) #4
  store i8* %call78, i8** %str, align 8
  %65 = load i8*, i8** %str, align 8
  %tobool79 = icmp ne i8* %65, null
  br i1 %tobool79, label %if.end81, label %if.then80

if.then80:                                        ; preds = %if.then76
  %66 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %66, i32 0, i32 0
  store i32 12, i32* %_errno, align 8
  br label %err

if.end81:                                         ; preds = %if.then76
  %67 = load i8*, i8** %str, align 8
  %68 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf82 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %68, i32 0, i32 5
  %_base83 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf82, i32 0, i32 0
  %69 = load i8*, i8** %_base83, align 8
  %70 = load i32, i32* %curpos, align 4
  %conv84 = sext i32 %70 to i64
  %call85 = call i8* @memcpy(i8* %67, i8* %69, i64 %conv84) #4
  %71 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags86 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %71, i32 0, i32 3
  %72 = load i16, i16* %_flags86, align 8
  %conv87 = sext i16 %72 to i32
  %and88 = and i32 %conv87, -1025
  %or = or i32 %and88, 128
  %conv89 = trunc i32 %or to i16
  %73 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags90 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %73, i32 0, i32 3
  store i16 %conv89, i16* %_flags90, align 8
  br label %if.end106

if.else91:                                        ; preds = %if.end71
  %74 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %75 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf92 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %75, i32 0, i32 5
  %_base93 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf92, i32 0, i32 0
  %76 = load i8*, i8** %_base93, align 8
  %77 = load i32, i32* %newsize, align 4
  %conv94 = sext i32 %77 to i64
  %call95 = call fastcc i8* @_realloc_r(%struct._reent* %74, i8* %76, i64 %conv94) #4
  store i8* %call95, i8** %str, align 8
  %78 = load i8*, i8** %str, align 8
  %tobool96 = icmp ne i8* %78, null
  br i1 %tobool96, label %if.end105, label %if.then97

if.then97:                                        ; preds = %if.else91
  %79 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %80 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf98 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %80, i32 0, i32 5
  %_base99 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf98, i32 0, i32 0
  %81 = load i8*, i8** %_base99, align 8
  call fastcc void @_free_r(%struct._reent* %79, i8* %81) #4
  %82 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags100 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %82, i32 0, i32 3
  %83 = load i16, i16* %_flags100, align 8
  %conv101 = sext i16 %83 to i32
  %and102 = and i32 %conv101, -129
  %conv103 = trunc i32 %and102 to i16
  store i16 %conv103, i16* %_flags100, align 8
  %84 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno104 = getelementptr inbounds %struct._reent, %struct._reent* %84, i32 0, i32 0
  store i32 12, i32* %_errno104, align 8
  br label %err

if.end105:                                        ; preds = %if.else91
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.end81
  %85 = load i8*, i8** %str, align 8
  %86 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf107 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %86, i32 0, i32 5
  %_base108 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf107, i32 0, i32 0
  store i8* %85, i8** %_base108, align 8
  %87 = load i8*, i8** %str, align 8
  %88 = load i32, i32* %curpos, align 4
  %idx.ext109 = sext i32 %88 to i64
  %add.ptr110 = getelementptr inbounds i8, i8* %87, i64 %idx.ext109
  %89 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p111 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %89, i32 0, i32 0
  store i8* %add.ptr110, i8** %_p111, align 8
  %90 = load i32, i32* %newsize, align 4
  %91 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf112 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %91, i32 0, i32 5
  %_size113 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf112, i32 0, i32 1
  store i32 %90, i32* %_size113, align 8
  %92 = load i64, i64* %len, align 8
  %conv114 = trunc i64 %92 to i32
  store i32 %conv114, i32* %w, align 4
  %93 = load i32, i32* %newsize, align 4
  %94 = load i32, i32* %curpos, align 4
  %sub115 = sub nsw i32 %93, %94
  %95 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w116 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %95, i32 0, i32 2
  store i32 %sub115, i32* %_w116, align 4
  br label %if.end117

if.end117:                                        ; preds = %if.end106, %land.lhs.true51, %if.then47
  %96 = load i64, i64* %len, align 8
  %97 = load i32, i32* %w, align 4
  %conv118 = sext i32 %97 to i64
  %cmp119 = icmp ult i64 %96, %conv118
  br i1 %cmp119, label %if.then121, label %if.end123

if.then121:                                       ; preds = %if.end117
  %98 = load i64, i64* %len, align 8
  %conv122 = trunc i64 %98 to i32
  store i32 %conv122, i32* %w, align 4
  br label %if.end123

if.end123:                                        ; preds = %if.then121, %if.end117
  %99 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p124 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %99, i32 0, i32 0
  %100 = load i8*, i8** %_p124, align 8
  %101 = load i8*, i8** %p, align 8
  %102 = load i32, i32* %w, align 4
  %conv125 = sext i32 %102 to i64
  %call126 = call i8* @memmove(i8* %100, i8* %101, i64 %conv125) #4
  %103 = load i32, i32* %w, align 4
  %104 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w127 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %104, i32 0, i32 2
  %105 = load i32, i32* %_w127, align 4
  %sub128 = sub nsw i32 %105, %103
  store i32 %sub128, i32* %_w127, align 4
  %106 = load i32, i32* %w, align 4
  %107 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p129 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %107, i32 0, i32 0
  %108 = load i8*, i8** %_p129, align 8
  %idx.ext130 = sext i32 %106 to i64
  %add.ptr131 = getelementptr inbounds i8, i8* %108, i64 %idx.ext130
  store i8* %add.ptr131, i8** %_p129, align 8
  %109 = load i64, i64* %len, align 8
  %conv132 = trunc i64 %109 to i32
  store i32 %conv132, i32* %w, align 4
  br label %if.end193

if.else133:                                       ; preds = %while.end42
  %110 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p134 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %110, i32 0, i32 0
  %111 = load i8*, i8** %_p134, align 8
  %112 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf135 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %112, i32 0, i32 5
  %_base136 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf135, i32 0, i32 0
  %113 = load i8*, i8** %_base136, align 8
  %cmp137 = icmp ugt i8* %111, %113
  br i1 %cmp137, label %if.then145, label %lor.lhs.false139

lor.lhs.false139:                                 ; preds = %if.else133
  %114 = load i64, i64* %len, align 8
  %115 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf140 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %115, i32 0, i32 5
  %_size141 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf140, i32 0, i32 1
  %116 = load i32, i32* %_size141, align 8
  %conv142 = sext i32 %116 to i64
  %cmp143 = icmp ult i64 %114, %conv142
  br i1 %cmp143, label %if.then145, label %if.else171

if.then145:                                       ; preds = %lor.lhs.false139, %if.else133
  %117 = load i64, i64* %len, align 8
  %118 = load i32, i32* %w, align 4
  %conv146 = sext i32 %118 to i64
  %cmp147 = icmp ult i64 %117, %conv146
  br i1 %cmp147, label %cond.true149, label %cond.false150

cond.true149:                                     ; preds = %if.then145
  %119 = load i64, i64* %len, align 8
  br label %cond.end152

cond.false150:                                    ; preds = %if.then145
  %120 = load i32, i32* %w, align 4
  %conv151 = sext i32 %120 to i64
  br label %cond.end152

cond.end152:                                      ; preds = %cond.false150, %cond.true149
  %cond153 = phi i64 [ %119, %cond.true149 ], [ %conv151, %cond.false150 ]
  %conv154 = trunc i64 %cond153 to i32
  store i32 %conv154, i32* %w, align 4
  %121 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p155 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %121, i32 0, i32 0
  %122 = load i8*, i8** %_p155, align 8
  %123 = load i8*, i8** %p, align 8
  %124 = load i32, i32* %w, align 4
  %conv156 = sext i32 %124 to i64
  %call157 = call i8* @memmove(i8* %122, i8* %123, i64 %conv156) #4
  %125 = load i32, i32* %w, align 4
  %126 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w158 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %126, i32 0, i32 2
  %127 = load i32, i32* %_w158, align 4
  %sub159 = sub nsw i32 %127, %125
  store i32 %sub159, i32* %_w158, align 4
  %128 = load i32, i32* %w, align 4
  %129 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p160 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %129, i32 0, i32 0
  %130 = load i8*, i8** %_p160, align 8
  %idx.ext161 = sext i32 %128 to i64
  %add.ptr162 = getelementptr inbounds i8, i8* %130, i64 %idx.ext161
  store i8* %add.ptr162, i8** %_p160, align 8
  %131 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w163 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %131, i32 0, i32 2
  %132 = load i32, i32* %_w163, align 4
  %cmp164 = icmp eq i32 %132, 0
  br i1 %cmp164, label %land.lhs.true166, label %if.end170

land.lhs.true166:                                 ; preds = %cond.end152
  %133 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %134 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call167 = call i32 @_fflush_r(%struct._reent* %133, %struct.__sFILE* %134) #4
  %tobool168 = icmp ne i32 %call167, 0
  br i1 %tobool168, label %if.then169, label %if.end170

if.then169:                                       ; preds = %land.lhs.true166
  br label %err

if.end170:                                        ; preds = %land.lhs.true166, %cond.end152
  br label %if.end192

if.else171:                                       ; preds = %lor.lhs.false139
  %135 = load i64, i64* %len, align 8
  %cmp172 = icmp ult i64 %135, 2147483647
  br i1 %cmp172, label %cond.true174, label %cond.false175

cond.true174:                                     ; preds = %if.else171
  %136 = load i64, i64* %len, align 8
  br label %cond.end176

cond.false175:                                    ; preds = %if.else171
  br label %cond.end176

cond.end176:                                      ; preds = %cond.false175, %cond.true174
  %cond177 = phi i64 [ %136, %cond.true174 ], [ 2147483647, %cond.false175 ]
  %conv178 = trunc i64 %cond177 to i32
  %137 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf179 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %137, i32 0, i32 5
  %_size180 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf179, i32 0, i32 1
  %138 = load i32, i32* %_size180, align 8
  %div181 = sdiv i32 %conv178, %138
  %139 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf182 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %139, i32 0, i32 5
  %_size183 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf182, i32 0, i32 1
  %140 = load i32, i32* %_size183, align 8
  %mul184 = mul nsw i32 %div181, %140
  store i32 %mul184, i32* %w, align 4
  %141 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_write185 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %141, i32 0, i32 9
  %142 = load i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)** %_write185, align 8
  %143 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %144 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie186 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %144, i32 0, i32 7
  %145 = load i8*, i8** %_cookie186, align 8
  %146 = load i8*, i8** %p, align 8
  %147 = load i32, i32* %w, align 4
  %call187 = call i32 %142(%struct._reent* %143, i8* %145, i8* %146, i32 %147) #5
  store i32 %call187, i32* %w, align 4
  %148 = load i32, i32* %w, align 4
  %cmp188 = icmp sle i32 %148, 0
  br i1 %cmp188, label %if.then190, label %if.end191

if.then190:                                       ; preds = %cond.end176
  br label %err

if.end191:                                        ; preds = %cond.end176
  br label %if.end192

if.end192:                                        ; preds = %if.end191, %if.end170
  br label %if.end193

if.end193:                                        ; preds = %if.end192, %if.end123
  %149 = load i32, i32* %w, align 4
  %150 = load i8*, i8** %p, align 8
  %idx.ext194 = sext i32 %149 to i64
  %add.ptr195 = getelementptr inbounds i8, i8* %150, i64 %idx.ext194
  store i8* %add.ptr195, i8** %p, align 8
  %151 = load i32, i32* %w, align 4
  %conv196 = sext i32 %151 to i64
  %152 = load i64, i64* %len, align 8
  %sub197 = sub i64 %152, %conv196
  store i64 %sub197, i64* %len, align 8
  br label %do.cond198

do.cond198:                                       ; preds = %if.end193
  %153 = load i32, i32* %w, align 4
  %conv199 = sext i32 %153 to i64
  %154 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid200 = getelementptr inbounds %struct.__suio, %struct.__suio* %154, i32 0, i32 2
  %155 = load i64, i64* %uio_resid200, align 8
  %sub201 = sub i64 %155, %conv199
  store i64 %sub201, i64* %uio_resid200, align 8
  %cmp202 = icmp ne i64 %sub201, 0
  br i1 %cmp202, label %do.body34, label %do.end204

do.end204:                                        ; preds = %do.cond198
  br label %if.end306

if.else205:                                       ; preds = %if.else
  store i32 0, i32* %nlknown, align 4
  store i32 0, i32* %nldist, align 4
  br label %do.body206

do.body206:                                       ; preds = %do.cond299, %if.else205
  br label %while.cond207

while.cond207:                                    ; preds = %while.body210, %do.body206
  %156 = load i64, i64* %len, align 8
  %cmp208 = icmp eq i64 %156, 0
  br i1 %cmp208, label %while.body210, label %while.end214

while.body210:                                    ; preds = %while.cond207
  store i32 0, i32* %nlknown, align 4
  %157 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_base211 = getelementptr inbounds %struct.__siov, %struct.__siov* %157, i32 0, i32 0
  %158 = load i8*, i8** %iov_base211, align 8
  store i8* %158, i8** %p, align 8
  %159 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %iov_len212 = getelementptr inbounds %struct.__siov, %struct.__siov* %159, i32 0, i32 1
  %160 = load i64, i64* %iov_len212, align 8
  store i64 %160, i64* %len, align 8
  %161 = load %struct.__siov*, %struct.__siov** %iov, align 8
  %incdec.ptr213 = getelementptr inbounds %struct.__siov, %struct.__siov* %161, i32 1
  store %struct.__siov* %incdec.ptr213, %struct.__siov** %iov, align 8
  br label %while.cond207

while.end214:                                     ; preds = %while.cond207
  %162 = load i32, i32* %nlknown, align 4
  %tobool215 = icmp ne i32 %162, 0
  br i1 %tobool215, label %if.end229, label %if.then216

if.then216:                                       ; preds = %while.end214
  %163 = load i8*, i8** %p, align 8
  %164 = load i64, i64* %len, align 8
  %call217 = call i8* @memchr(i8* %163, i32 10, i64 %164) #4
  store i8* %call217, i8** %nl, align 8
  %165 = load i8*, i8** %nl, align 8
  %tobool218 = icmp ne i8* %165, null
  br i1 %tobool218, label %cond.true219, label %cond.false224

cond.true219:                                     ; preds = %if.then216
  %166 = load i8*, i8** %nl, align 8
  %add.ptr220 = getelementptr inbounds i8, i8* %166, i64 1
  %167 = load i8*, i8** %p, align 8
  %sub.ptr.lhs.cast221 = ptrtoint i8* %add.ptr220 to i64
  %sub.ptr.rhs.cast222 = ptrtoint i8* %167 to i64
  %sub.ptr.sub223 = sub i64 %sub.ptr.lhs.cast221, %sub.ptr.rhs.cast222
  br label %cond.end226

cond.false224:                                    ; preds = %if.then216
  %168 = load i64, i64* %len, align 8
  %add225 = add i64 %168, 1
  br label %cond.end226

cond.end226:                                      ; preds = %cond.false224, %cond.true219
  %cond227 = phi i64 [ %sub.ptr.sub223, %cond.true219 ], [ %add225, %cond.false224 ]
  %conv228 = trunc i64 %cond227 to i32
  store i32 %conv228, i32* %nldist, align 4
  store i32 1, i32* %nlknown, align 4
  br label %if.end229

if.end229:                                        ; preds = %cond.end226, %while.end214
  %169 = load i64, i64* %len, align 8
  %170 = load i32, i32* %nldist, align 4
  %conv230 = sext i32 %170 to i64
  %cmp231 = icmp ult i64 %169, %conv230
  br i1 %cmp231, label %cond.true233, label %cond.false234

cond.true233:                                     ; preds = %if.end229
  %171 = load i64, i64* %len, align 8
  br label %cond.end236

cond.false234:                                    ; preds = %if.end229
  %172 = load i32, i32* %nldist, align 4
  %conv235 = sext i32 %172 to i64
  br label %cond.end236

cond.end236:                                      ; preds = %cond.false234, %cond.true233
  %cond237 = phi i64 [ %171, %cond.true233 ], [ %conv235, %cond.false234 ]
  %conv238 = trunc i64 %cond237 to i32
  store i32 %conv238, i32* %s, align 4
  %173 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w239 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %173, i32 0, i32 2
  %174 = load i32, i32* %_w239, align 4
  %175 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf240 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %175, i32 0, i32 5
  %_size241 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf240, i32 0, i32 1
  %176 = load i32, i32* %_size241, align 8
  %add242 = add nsw i32 %174, %176
  store i32 %add242, i32* %w, align 4
  %177 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p243 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %177, i32 0, i32 0
  %178 = load i8*, i8** %_p243, align 8
  %179 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf244 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %179, i32 0, i32 5
  %_base245 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf244, i32 0, i32 0
  %180 = load i8*, i8** %_base245, align 8
  %cmp246 = icmp ugt i8* %178, %180
  br i1 %cmp246, label %land.lhs.true248, label %if.else262

land.lhs.true248:                                 ; preds = %cond.end236
  %181 = load i32, i32* %s, align 4
  %182 = load i32, i32* %w, align 4
  %cmp249 = icmp sgt i32 %181, %182
  br i1 %cmp249, label %if.then251, label %if.else262

if.then251:                                       ; preds = %land.lhs.true248
  %183 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p252 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %183, i32 0, i32 0
  %184 = load i8*, i8** %_p252, align 8
  %185 = load i8*, i8** %p, align 8
  %186 = load i32, i32* %w, align 4
  %conv253 = sext i32 %186 to i64
  %call254 = call i8* @memmove(i8* %184, i8* %185, i64 %conv253) #4
  %187 = load i32, i32* %w, align 4
  %188 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p255 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %188, i32 0, i32 0
  %189 = load i8*, i8** %_p255, align 8
  %idx.ext256 = sext i32 %187 to i64
  %add.ptr257 = getelementptr inbounds i8, i8* %189, i64 %idx.ext256
  store i8* %add.ptr257, i8** %_p255, align 8
  %190 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %191 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call258 = call i32 @_fflush_r(%struct._reent* %190, %struct.__sFILE* %191) #4
  %tobool259 = icmp ne i32 %call258, 0
  br i1 %tobool259, label %if.then260, label %if.end261

if.then260:                                       ; preds = %if.then251
  br label %err

if.end261:                                        ; preds = %if.then251
  br label %if.end285

if.else262:                                       ; preds = %land.lhs.true248, %cond.end236
  %192 = load i32, i32* %s, align 4
  %193 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf263 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %193, i32 0, i32 5
  %_size264 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf263, i32 0, i32 1
  %194 = load i32, i32* %_size264, align 8
  store i32 %194, i32* %w, align 4
  %cmp265 = icmp sge i32 %192, %194
  br i1 %cmp265, label %if.then267, label %if.else275

if.then267:                                       ; preds = %if.else262
  %195 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_write268 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %195, i32 0, i32 9
  %196 = load i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)** %_write268, align 8
  %197 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %198 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_cookie269 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %198, i32 0, i32 7
  %199 = load i8*, i8** %_cookie269, align 8
  %200 = load i8*, i8** %p, align 8
  %201 = load i32, i32* %w, align 4
  %call270 = call i32 %196(%struct._reent* %197, i8* %199, i8* %200, i32 %201) #5
  store i32 %call270, i32* %w, align 4
  %202 = load i32, i32* %w, align 4
  %cmp271 = icmp sle i32 %202, 0
  br i1 %cmp271, label %if.then273, label %if.end274

if.then273:                                       ; preds = %if.then267
  br label %err

if.end274:                                        ; preds = %if.then267
  br label %if.end284

if.else275:                                       ; preds = %if.else262
  %203 = load i32, i32* %s, align 4
  store i32 %203, i32* %w, align 4
  %204 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p276 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %204, i32 0, i32 0
  %205 = load i8*, i8** %_p276, align 8
  %206 = load i8*, i8** %p, align 8
  %207 = load i32, i32* %w, align 4
  %conv277 = sext i32 %207 to i64
  %call278 = call i8* @memmove(i8* %205, i8* %206, i64 %conv277) #4
  %208 = load i32, i32* %w, align 4
  %209 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w279 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %209, i32 0, i32 2
  %210 = load i32, i32* %_w279, align 4
  %sub280 = sub nsw i32 %210, %208
  store i32 %sub280, i32* %_w279, align 4
  %211 = load i32, i32* %w, align 4
  %212 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p281 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %212, i32 0, i32 0
  %213 = load i8*, i8** %_p281, align 8
  %idx.ext282 = sext i32 %211 to i64
  %add.ptr283 = getelementptr inbounds i8, i8* %213, i64 %idx.ext282
  store i8* %add.ptr283, i8** %_p281, align 8
  br label %if.end284

if.end284:                                        ; preds = %if.else275, %if.end274
  br label %if.end285

if.end285:                                        ; preds = %if.end284, %if.end261
  %214 = load i32, i32* %w, align 4
  %215 = load i32, i32* %nldist, align 4
  %sub286 = sub nsw i32 %215, %214
  store i32 %sub286, i32* %nldist, align 4
  %cmp287 = icmp eq i32 %sub286, 0
  br i1 %cmp287, label %if.then289, label %if.end294

if.then289:                                       ; preds = %if.end285
  %216 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %217 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call290 = call i32 @_fflush_r(%struct._reent* %216, %struct.__sFILE* %217) #4
  %tobool291 = icmp ne i32 %call290, 0
  br i1 %tobool291, label %if.then292, label %if.end293

if.then292:                                       ; preds = %if.then289
  br label %err

if.end293:                                        ; preds = %if.then289
  store i32 0, i32* %nlknown, align 4
  br label %if.end294

if.end294:                                        ; preds = %if.end293, %if.end285
  %218 = load i32, i32* %w, align 4
  %219 = load i8*, i8** %p, align 8
  %idx.ext295 = sext i32 %218 to i64
  %add.ptr296 = getelementptr inbounds i8, i8* %219, i64 %idx.ext295
  store i8* %add.ptr296, i8** %p, align 8
  %220 = load i32, i32* %w, align 4
  %conv297 = sext i32 %220 to i64
  %221 = load i64, i64* %len, align 8
  %sub298 = sub i64 %221, %conv297
  store i64 %sub298, i64* %len, align 8
  br label %do.cond299

do.cond299:                                       ; preds = %if.end294
  %222 = load i32, i32* %w, align 4
  %conv300 = sext i32 %222 to i64
  %223 = load %struct.__suio*, %struct.__suio** %uio.addr, align 8
  %uio_resid301 = getelementptr inbounds %struct.__suio, %struct.__suio* %223, i32 0, i32 2
  %224 = load i64, i64* %uio_resid301, align 8
  %sub302 = sub i64 %224, %conv300
  store i64 %sub302, i64* %uio_resid301, align 8
  %cmp303 = icmp ne i64 %sub302, 0
  br i1 %cmp303, label %do.body206, label %do.end305

do.end305:                                        ; preds = %do.cond299
  br label %if.end306

if.end306:                                        ; preds = %do.end305, %do.end204
  br label %if.end307

if.end307:                                        ; preds = %if.end306, %do.end
  store i32 0, i32* %retval, align 4
  br label %return

err:                                              ; preds = %if.then292, %if.then273, %if.then260, %if.then190, %if.then169, %if.then97, %if.then80, %if.then20
  %225 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags308 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %225, i32 0, i32 3
  %226 = load i16, i16* %_flags308, align 8
  %conv309 = sext i16 %226 to i32
  %or310 = or i32 %conv309, 64
  %conv311 = trunc i32 %or310 to i16
  store i16 %conv311, i16* %_flags308, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %err, %if.end307, %if.then5, %if.then
  %227 = load i32, i32* %retval, align 4
  ret i32 %227
}

declare dso_local i8* @memcpy(i8*, i8*, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @_isatty_r(%struct._reent* %ptr, i32 %fd) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fd.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i32 0, i32* @errno, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 @isatty(i32 %0) #4
  store i32 %call, i32* %ret, align 4
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @errno, align 4
  %cmp1 = icmp ne i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @errno, align 4
  %3 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %3, i32 0, i32 0
  store i32 %2, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load i32, i32* %ret, align 4
  ret i32 %4
}

declare dso_local i32 @isatty(i32) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i8* @_setlocale_r(%struct._reent.263* %p, i32 %category, i8* %locale) unnamed_addr #1 {
entry:
  %retval = alloca i8*, align 8
  %p.addr = alloca %struct._reent.263*, align 8
  %category.addr = alloca i32, align 4
  %locale.addr = alloca i8*, align 8
  store %struct._reent.263* %p, %struct._reent.263** %p.addr, align 8
  store i32 %category, i32* %category.addr, align 4
  store i8* %locale, i8** %locale.addr, align 8
  %0 = load i8*, i8** %locale.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %locale.addr, align 8
  %call = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2.75, i64 0, i64 0)) #4
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %2 = load i8*, i8** %locale.addr, align 8
  %call2 = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.76, i64 0, i64 0)) #4
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true
  %3 = load i8*, i8** %locale.addr, align 8
  %call5 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.77, i64 0, i64 0)) #4
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %land.lhs.true4
  store i8* null, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %land.lhs.true4, %land.lhs.true, %if.then
  br label %if.end8

if.end8:                                          ; preds = %if.end, %entry
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.76, i64 0, i64 0), i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end8, %if.then7
  %4 = load i8*, i8** %retval, align 8
  ret i8* %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__locale_mb_cur_max() unnamed_addr #1 {
entry:
  call fastcc void @__get_current_locale() #4
  %0 = load i8, i8* getelementptr (%struct.__locale_t.256, %struct.__locale_t.256* bitcast ({ [7 x [32 x i8]], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }* @__global_locale to %struct.__locale_t.256*), i32 0, i32 6, i64 0), align 8
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__get_current_locale() unnamed_addr #1 {
entry:
  call fastcc void @__get_global_locale() #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__get_global_locale() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @setlocale(i32 %category, i8* %locale) local_unnamed_addr #1 {
entry:
  %category.addr = alloca i32, align 4
  %locale.addr = alloca i8*, align 8
  store i32 %category, i32* %category.addr, align 4
  store i8* %locale, i8** %locale.addr, align 8
  %0 = load %struct._reent.263*, %struct._reent.263** bitcast (%struct._reent** @_impure_ptr to %struct._reent.263**), align 8
  %1 = load i32, i32* %category.addr, align 4
  %2 = load i8*, i8** %locale.addr, align 8
  %call = call fastcc i8* @_setlocale_r(%struct._reent.263* %0, i32 %1, i8* %2) #4
  ret i8* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @_lseek_r(%struct._reent* %ptr, i32 %fd, i64 %pos, i32 %whence) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fd.addr = alloca i32, align 4
  %pos.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  %ret = alloca i64, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i64 %pos, i64* %pos.addr, align 8
  store i32 %whence, i32* %whence.addr, align 4
  store i32 0, i32* @errno, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i64, i64* %pos.addr, align 8
  %2 = load i32, i32* %whence.addr, align 4
  %call = call i64 @lseek(i32 %0, i64 %1, i32 %2) #4
  store i64 %call, i64* %ret, align 8
  %cmp = icmp eq i64 %call, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* @errno, align 4
  %cmp1 = icmp ne i32 %3, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* @errno, align 4
  %5 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %5, i32 0, i32 0
  store i32 %4, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load i64, i64* %ret, align 8
  ret i64 %6
}

declare dso_local i64 @lseek(i32, i64, i32) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__ascii_mbtowc(%struct._reent.286* %r, i32* %pwc, i8* %s, i64 %n, %struct._mbstate_t* %state) #1 {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca %struct._reent.286*, align 8
  %pwc.addr = alloca i32*, align 8
  %s.addr = alloca i8*, align 8
  %n.addr = alloca i64, align 8
  %state.addr = alloca %struct._mbstate_t*, align 8
  %dummy = alloca i32, align 4
  %t = alloca i8*, align 8
  store %struct._reent.286* %r, %struct._reent.286** %r.addr, align 8
  store i32* %pwc, i32** %pwc.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  store i64 %n, i64* %n.addr, align 8
  store %struct._mbstate_t* %state, %struct._mbstate_t** %state.addr, align 8
  %0 = load i8*, i8** %s.addr, align 8
  store i8* %0, i8** %t, align 8
  %1 = load i32*, i32** %pwc.addr, align 8
  %cmp = icmp eq i32* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32* %dummy, i32** %pwc.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %s.addr, align 8
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %3 = load i64, i64* %n.addr, align 8
  %cmp4 = icmp eq i64 %3, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  store i32 -2, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end3
  %4 = load i8*, i8** %t, align 8
  %5 = load i8, i8* %4, align 1
  %conv = zext i8 %5 to i32
  %6 = load i32*, i32** %pwc.addr, align 8
  store i32 %conv, i32* %6, align 4
  %7 = load i8*, i8** %t, align 8
  %8 = load i8, i8* %7, align 1
  %conv7 = zext i8 %8 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end6
  store i32 0, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end6
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then10, %if.then5, %if.then2
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @memmove(i8* %dst_void, i8* %src_void, i64 %length) local_unnamed_addr #1 {
entry:
  %dst_void.addr = alloca i8*, align 8
  %src_void.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %dst = alloca i8*, align 8
  %src = alloca i8*, align 8
  %aligned_dst = alloca i64*, align 8
  %aligned_src = alloca i64*, align 8
  store i8* %dst_void, i8** %dst_void.addr, align 8
  store i8* %src_void, i8** %src_void.addr, align 8
  store i64 %length, i64* %length.addr, align 8
  %0 = load i8*, i8** %dst_void.addr, align 8
  store i8* %0, i8** %dst, align 8
  %1 = load i8*, i8** %src_void.addr, align 8
  store i8* %1, i8** %src, align 8
  %2 = load i8*, i8** %src, align 8
  %3 = load i8*, i8** %dst, align 8
  %cmp = icmp ult i8* %2, %3
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %dst, align 8
  %5 = load i8*, i8** %src, align 8
  %6 = load i64, i64* %length.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %6
  %cmp1 = icmp ult i8* %4, %add.ptr
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %7 = load i64, i64* %length.addr, align 8
  %8 = load i8*, i8** %src, align 8
  %add.ptr2 = getelementptr inbounds i8, i8* %8, i64 %7
  store i8* %add.ptr2, i8** %src, align 8
  %9 = load i64, i64* %length.addr, align 8
  %10 = load i8*, i8** %dst, align 8
  %add.ptr3 = getelementptr inbounds i8, i8* %10, i64 %9
  store i8* %add.ptr3, i8** %dst, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %11 = load i64, i64* %length.addr, align 8
  %dec = add i64 %11, -1
  store i64 %dec, i64* %length.addr, align 8
  %tobool = icmp ne i64 %11, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %12 = load i8*, i8** %src, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 -1
  store i8* %incdec.ptr, i8** %src, align 8
  %13 = load i8, i8* %incdec.ptr, align 1
  %14 = load i8*, i8** %dst, align 8
  %incdec.ptr4 = getelementptr inbounds i8, i8* %14, i32 -1
  store i8* %incdec.ptr4, i8** %dst, align 8
  store i8 %13, i8* %incdec.ptr4, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end36

if.else:                                          ; preds = %land.lhs.true, %entry
  %15 = load i64, i64* %length.addr, align 8
  %cmp5 = icmp ult i64 %15, 32
  br i1 %cmp5, label %if.end, label %land.lhs.true6

land.lhs.true6:                                   ; preds = %if.else
  %16 = load i8*, i8** %src, align 8
  %17 = ptrtoint i8* %16 to i64
  %and = and i64 %17, 7
  %18 = load i8*, i8** %dst, align 8
  %19 = ptrtoint i8* %18 to i64
  %and7 = and i64 %19, 7
  %or = or i64 %and, %and7
  %tobool8 = icmp ne i64 %or, 0
  br i1 %tobool8, label %if.end, label %if.then9

if.then9:                                         ; preds = %land.lhs.true6
  %20 = load i8*, i8** %dst, align 8
  %21 = bitcast i8* %20 to i64*
  store i64* %21, i64** %aligned_dst, align 8
  %22 = load i8*, i8** %src, align 8
  %23 = bitcast i8* %22 to i64*
  store i64* %23, i64** %aligned_src, align 8
  br label %while.cond10

while.cond10:                                     ; preds = %while.body12, %if.then9
  %24 = load i64, i64* %length.addr, align 8
  %cmp11 = icmp uge i64 %24, 32
  br i1 %cmp11, label %while.body12, label %while.end21

while.body12:                                     ; preds = %while.cond10
  %25 = load i64*, i64** %aligned_src, align 8
  %incdec.ptr13 = getelementptr inbounds i64, i64* %25, i32 1
  store i64* %incdec.ptr13, i64** %aligned_src, align 8
  %26 = load i64, i64* %25, align 8
  %27 = load i64*, i64** %aligned_dst, align 8
  %incdec.ptr14 = getelementptr inbounds i64, i64* %27, i32 1
  store i64* %incdec.ptr14, i64** %aligned_dst, align 8
  store i64 %26, i64* %27, align 8
  %28 = load i64*, i64** %aligned_src, align 8
  %incdec.ptr15 = getelementptr inbounds i64, i64* %28, i32 1
  store i64* %incdec.ptr15, i64** %aligned_src, align 8
  %29 = load i64, i64* %28, align 8
  %30 = load i64*, i64** %aligned_dst, align 8
  %incdec.ptr16 = getelementptr inbounds i64, i64* %30, i32 1
  store i64* %incdec.ptr16, i64** %aligned_dst, align 8
  store i64 %29, i64* %30, align 8
  %31 = load i64*, i64** %aligned_src, align 8
  %incdec.ptr17 = getelementptr inbounds i64, i64* %31, i32 1
  store i64* %incdec.ptr17, i64** %aligned_src, align 8
  %32 = load i64, i64* %31, align 8
  %33 = load i64*, i64** %aligned_dst, align 8
  %incdec.ptr18 = getelementptr inbounds i64, i64* %33, i32 1
  store i64* %incdec.ptr18, i64** %aligned_dst, align 8
  store i64 %32, i64* %33, align 8
  %34 = load i64*, i64** %aligned_src, align 8
  %incdec.ptr19 = getelementptr inbounds i64, i64* %34, i32 1
  store i64* %incdec.ptr19, i64** %aligned_src, align 8
  %35 = load i64, i64* %34, align 8
  %36 = load i64*, i64** %aligned_dst, align 8
  %incdec.ptr20 = getelementptr inbounds i64, i64* %36, i32 1
  store i64* %incdec.ptr20, i64** %aligned_dst, align 8
  store i64 %35, i64* %36, align 8
  %37 = load i64, i64* %length.addr, align 8
  %sub = sub i64 %37, 32
  store i64 %sub, i64* %length.addr, align 8
  br label %while.cond10

while.end21:                                      ; preds = %while.cond10
  br label %while.cond22

while.cond22:                                     ; preds = %while.body24, %while.end21
  %38 = load i64, i64* %length.addr, align 8
  %cmp23 = icmp uge i64 %38, 8
  br i1 %cmp23, label %while.body24, label %while.end28

while.body24:                                     ; preds = %while.cond22
  %39 = load i64*, i64** %aligned_src, align 8
  %incdec.ptr25 = getelementptr inbounds i64, i64* %39, i32 1
  store i64* %incdec.ptr25, i64** %aligned_src, align 8
  %40 = load i64, i64* %39, align 8
  %41 = load i64*, i64** %aligned_dst, align 8
  %incdec.ptr26 = getelementptr inbounds i64, i64* %41, i32 1
  store i64* %incdec.ptr26, i64** %aligned_dst, align 8
  store i64 %40, i64* %41, align 8
  %42 = load i64, i64* %length.addr, align 8
  %sub27 = sub i64 %42, 8
  store i64 %sub27, i64* %length.addr, align 8
  br label %while.cond22

while.end28:                                      ; preds = %while.cond22
  %43 = load i64*, i64** %aligned_dst, align 8
  %44 = bitcast i64* %43 to i8*
  store i8* %44, i8** %dst, align 8
  %45 = load i64*, i64** %aligned_src, align 8
  %46 = bitcast i64* %45 to i8*
  store i8* %46, i8** %src, align 8
  br label %if.end

if.end:                                           ; preds = %while.end28, %land.lhs.true6, %if.else
  br label %while.cond29

while.cond29:                                     ; preds = %while.body32, %if.end
  %47 = load i64, i64* %length.addr, align 8
  %dec30 = add i64 %47, -1
  store i64 %dec30, i64* %length.addr, align 8
  %tobool31 = icmp ne i64 %47, 0
  br i1 %tobool31, label %while.body32, label %while.end35

while.body32:                                     ; preds = %while.cond29
  %48 = load i8*, i8** %src, align 8
  %incdec.ptr33 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr33, i8** %src, align 8
  %49 = load i8, i8* %48, align 1
  %50 = load i8*, i8** %dst, align 8
  %incdec.ptr34 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %incdec.ptr34, i8** %dst, align 8
  store i8 %49, i8* %50, align 1
  br label %while.cond29

while.end35:                                      ; preds = %while.cond29
  br label %if.end36

if.end36:                                         ; preds = %while.end35, %while.end
  %51 = load i8*, i8** %dst_void.addr, align 8
  ret i8* %51
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @_read_r(%struct._reent* %ptr, i32 %fd, i8* %buf, i64 %cnt) unnamed_addr #1 {
entry:
  %ptr.addr = alloca %struct._reent*, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %cnt.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i64 %cnt, i64* %cnt.addr, align 8
  store i32 0, i32* @errno, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 8
  %2 = load i64, i64* %cnt.addr, align 8
  %call = call i32 @read(i32 %0, i8* %1, i64 %2) #4
  %conv = sext i32 %call to i64
  store i64 %conv, i64* %ret, align 8
  %cmp = icmp eq i64 %conv, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* @errno, align 4
  %cmp2 = icmp ne i32 %3, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* @errno, align 4
  %5 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %5, i32 0, i32 0
  store i32 %4, i32* %_errno, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load i64, i64* %ret, align 8
  ret i64 %6
}

declare dso_local i32 @read(i32, i8*, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i8* @_realloc_r(%struct._reent* %reent_ptr, i8* %oldmem, i64 %bytes) unnamed_addr #1 {
entry:
  %retval = alloca i8*, align 8
  %reent_ptr.addr = alloca %struct._reent*, align 8
  %oldmem.addr = alloca i8*, align 8
  %bytes.addr = alloca i64, align 8
  %nb = alloca i64, align 8
  %oldp = alloca %struct.malloc_chunk*, align 8
  %oldsize = alloca i64, align 8
  %newp = alloca %struct.malloc_chunk*, align 8
  %newsize = alloca i64, align 8
  %newmem = alloca i8*, align 8
  %next = alloca %struct.malloc_chunk*, align 8
  %nextsize = alloca i64, align 8
  %prev = alloca %struct.malloc_chunk*, align 8
  %prevsize = alloca i64, align 8
  %remainder = alloca %struct.malloc_chunk*, align 8
  %remainder_size = alloca i64, align 8
  %bck = alloca %struct.malloc_chunk*, align 8
  %fwd = alloca %struct.malloc_chunk*, align 8
  %mcsz = alloca i64, align 8
  %mcsrc = alloca i64*, align 8
  %mcdst = alloca i64*, align 8
  %mcsz125 = alloca i64, align 8
  %mcsrc129 = alloca i64*, align 8
  %mcdst130 = alloca i64*, align 8
  %mcsz174 = alloca i64, align 8
  %mcsrc178 = alloca i64*, align 8
  %mcdst179 = alloca i64*, align 8
  %mcsz226 = alloca i64, align 8
  %mcsrc230 = alloca i64*, align 8
  %mcdst231 = alloca i64*, align 8
  store %struct._reent* %reent_ptr, %struct._reent** %reent_ptr.addr, align 8
  store i8* %oldmem, i8** %oldmem.addr, align 8
  store i64 %bytes, i64* %bytes.addr, align 8
  %0 = load i8*, i8** %oldmem.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %2 = load i64, i64* %bytes.addr, align 8
  %call = call fastcc i8* @_malloc_r(%struct._reent* %1, i64 %2) #4
  store i8* %call, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_lock to void (%struct._reent*)*)(%struct._reent* %3) #4
  %4 = load i8*, i8** %oldmem.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -16
  %5 = bitcast i8* %add.ptr to %struct.malloc_chunk*
  store %struct.malloc_chunk* %5, %struct.malloc_chunk** %oldp, align 8
  store %struct.malloc_chunk* %5, %struct.malloc_chunk** %newp, align 8
  %6 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %6, i32 0, i32 1
  %7 = load i64, i64* %size, align 8
  %and = and i64 %7, -4
  store i64 %and, i64* %oldsize, align 8
  store i64 %and, i64* %newsize, align 8
  %8 = load i64, i64* %bytes.addr, align 8
  %add = add i64 %8, 23
  %cmp1 = icmp ult i64 %add, 47
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %9 = load i64, i64* %bytes.addr, align 8
  %add2 = add i64 %9, 23
  %and3 = and i64 %add2, -16
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 32, %cond.true ], [ %and3, %cond.false ]
  store i64 %cond, i64* %nb, align 8
  %10 = load i64, i64* %nb, align 8
  %cmp4 = icmp ugt i64 %10, 2147483647
  br i1 %cmp4, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %11 = load i64, i64* %nb, align 8
  %12 = load i64, i64* %bytes.addr, align 8
  %cmp5 = icmp ult i64 %11, %12
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %lor.lhs.false, %cond.end
  %13 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %13, i32 0, i32 0
  store i32 12, i32* %_errno, align 8
  store i8* null, i8** %retval, align 8
  br label %return

if.end7:                                          ; preds = %lor.lhs.false
  %14 = load i64, i64* %oldsize, align 8
  %15 = load i64, i64* %nb, align 8
  %cmp8 = icmp slt i64 %14, %15
  br i1 %cmp8, label %if.then9, label %if.end261

if.then9:                                         ; preds = %if.end7
  %16 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %17 = bitcast %struct.malloc_chunk* %16 to i8*
  %18 = load i64, i64* %oldsize, align 8
  %add.ptr10 = getelementptr inbounds i8, i8* %17, i64 %18
  %19 = bitcast i8* %add.ptr10 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %19, %struct.malloc_chunk** %next, align 8
  %20 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %21 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %cmp11 = icmp eq %struct.malloc_chunk* %20, %21
  br i1 %cmp11, label %if.then18, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %if.then9
  %22 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %23 = bitcast %struct.malloc_chunk* %22 to i8*
  %24 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %size13 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %24, i32 0, i32 1
  %25 = load i64, i64* %size13, align 8
  %and14 = and i64 %25, -2
  %add.ptr15 = getelementptr inbounds i8, i8* %23, i64 %and14
  %26 = bitcast i8* %add.ptr15 to %struct.malloc_chunk*
  %size16 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %26, i32 0, i32 1
  %27 = load i64, i64* %size16, align 8
  %and17 = and i64 %27, 1
  %tobool = icmp ne i64 %and17, 0
  br i1 %tobool, label %if.else44, label %if.then18

if.then18:                                        ; preds = %lor.lhs.false12, %if.then9
  %28 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %size19 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %28, i32 0, i32 1
  %29 = load i64, i64* %size19, align 8
  %and20 = and i64 %29, -4
  store i64 %and20, i64* %nextsize, align 8
  %30 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %31 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %cmp21 = icmp eq %struct.malloc_chunk* %30, %31
  br i1 %cmp21, label %if.then22, label %if.else

if.then22:                                        ; preds = %if.then18
  %32 = load i64, i64* %nextsize, align 8
  %33 = load i64, i64* %newsize, align 8
  %add23 = add i64 %32, %33
  %34 = load i64, i64* %nb, align 8
  %add24 = add i64 %34, 32
  %cmp25 = icmp sge i64 %add23, %add24
  br i1 %cmp25, label %if.then26, label %if.end35

if.then26:                                        ; preds = %if.then22
  %35 = load i64, i64* %nextsize, align 8
  %36 = load i64, i64* %newsize, align 8
  %add27 = add i64 %36, %35
  store i64 %add27, i64* %newsize, align 8
  %37 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %38 = bitcast %struct.malloc_chunk* %37 to i8*
  %39 = load i64, i64* %nb, align 8
  %add.ptr28 = getelementptr inbounds i8, i8* %38, i64 %39
  %40 = bitcast i8* %add.ptr28 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %40, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %41 = load i64, i64* %newsize, align 8
  %42 = load i64, i64* %nb, align 8
  %sub = sub i64 %41, %42
  %or = or i64 %sub, 1
  %43 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size29 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %43, i32 0, i32 1
  store i64 %or, i64* %size29, align 8
  %44 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %size30 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %44, i32 0, i32 1
  %45 = load i64, i64* %size30, align 8
  %and31 = and i64 %45, 1
  %46 = load i64, i64* %nb, align 8
  %or32 = or i64 %and31, %46
  %47 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %size33 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %47, i32 0, i32 1
  store i64 %or32, i64* %size33, align 8
  %48 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %48) #4
  %49 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %50 = bitcast %struct.malloc_chunk* %49 to i8*
  %add.ptr34 = getelementptr inbounds i8, i8* %50, i64 16
  store i8* %add.ptr34, i8** %retval, align 8
  br label %return

if.end35:                                         ; preds = %if.then22
  br label %if.end43

if.else:                                          ; preds = %if.then18
  %51 = load i64, i64* %nextsize, align 8
  %52 = load i64, i64* %newsize, align 8
  %add36 = add i64 %51, %52
  %53 = load i64, i64* %nb, align 8
  %cmp37 = icmp sge i64 %add36, %53
  br i1 %cmp37, label %if.then38, label %if.end42

if.then38:                                        ; preds = %if.else
  %54 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %bk = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %54, i32 0, i32 3
  %55 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk, align 8
  store %struct.malloc_chunk* %55, %struct.malloc_chunk** %bck, align 8
  %56 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %fd = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %56, i32 0, i32 2
  %57 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd, align 8
  store %struct.malloc_chunk* %57, %struct.malloc_chunk** %fwd, align 8
  %58 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %59 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk39 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %59, i32 0, i32 3
  store %struct.malloc_chunk* %58, %struct.malloc_chunk** %bk39, align 8
  %60 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %61 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd40 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %61, i32 0, i32 2
  store %struct.malloc_chunk* %60, %struct.malloc_chunk** %fd40, align 8
  %62 = load i64, i64* %nextsize, align 8
  %63 = load i64, i64* %newsize, align 8
  %add41 = add i64 %63, %62
  store i64 %add41, i64* %newsize, align 8
  br label %split

if.end42:                                         ; preds = %if.else
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.end35
  br label %if.end45

if.else44:                                        ; preds = %lor.lhs.false12
  store %struct.malloc_chunk* null, %struct.malloc_chunk** %next, align 8
  store i64 0, i64* %nextsize, align 8
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %if.end43
  %64 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %size46 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %64, i32 0, i32 1
  %65 = load i64, i64* %size46, align 8
  %and47 = and i64 %65, 1
  %tobool48 = icmp ne i64 %and47, 0
  br i1 %tobool48, label %if.end210, label %if.then49

if.then49:                                        ; preds = %if.end45
  %66 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %67 = bitcast %struct.malloc_chunk* %66 to i8*
  %68 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %prev_size = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %68, i32 0, i32 0
  %69 = load i64, i64* %prev_size, align 8
  %idx.neg = sub i64 0, %69
  %add.ptr50 = getelementptr inbounds i8, i8* %67, i64 %idx.neg
  %70 = bitcast i8* %add.ptr50 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %70, %struct.malloc_chunk** %prev, align 8
  %71 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %size51 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %71, i32 0, i32 1
  %72 = load i64, i64* %size51, align 8
  %and52 = and i64 %72, -4
  store i64 %and52, i64* %prevsize, align 8
  %73 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %cmp53 = icmp ne %struct.malloc_chunk* %73, null
  br i1 %cmp53, label %if.then54, label %if.end162

if.then54:                                        ; preds = %if.then49
  %74 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %75 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %cmp55 = icmp eq %struct.malloc_chunk* %74, %75
  br i1 %cmp55, label %if.then56, label %if.else108

if.then56:                                        ; preds = %if.then54
  %76 = load i64, i64* %nextsize, align 8
  %77 = load i64, i64* %prevsize, align 8
  %add57 = add i64 %76, %77
  %78 = load i64, i64* %newsize, align 8
  %add58 = add i64 %add57, %78
  %79 = load i64, i64* %nb, align 8
  %add59 = add i64 %79, 32
  %cmp60 = icmp sge i64 %add58, %add59
  br i1 %cmp60, label %if.then61, label %if.end107

if.then61:                                        ; preds = %if.then56
  %80 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %bk62 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %80, i32 0, i32 3
  %81 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk62, align 8
  store %struct.malloc_chunk* %81, %struct.malloc_chunk** %bck, align 8
  %82 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %fd63 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %82, i32 0, i32 2
  %83 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd63, align 8
  store %struct.malloc_chunk* %83, %struct.malloc_chunk** %fwd, align 8
  %84 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %85 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk64 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %85, i32 0, i32 3
  store %struct.malloc_chunk* %84, %struct.malloc_chunk** %bk64, align 8
  %86 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %87 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd65 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %87, i32 0, i32 2
  store %struct.malloc_chunk* %86, %struct.malloc_chunk** %fd65, align 8
  %88 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  store %struct.malloc_chunk* %88, %struct.malloc_chunk** %newp, align 8
  %89 = load i64, i64* %prevsize, align 8
  %90 = load i64, i64* %nextsize, align 8
  %add66 = add i64 %89, %90
  %91 = load i64, i64* %newsize, align 8
  %add67 = add i64 %91, %add66
  store i64 %add67, i64* %newsize, align 8
  %92 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %93 = bitcast %struct.malloc_chunk* %92 to i8*
  %add.ptr68 = getelementptr inbounds i8, i8* %93, i64 16
  store i8* %add.ptr68, i8** %newmem, align 8
  br label %do.body

do.body:                                          ; preds = %if.then61
  %94 = load i64, i64* %oldsize, align 8
  %sub69 = sub i64 %94, 8
  store i64 %sub69, i64* %mcsz, align 8
  %95 = load i64, i64* %mcsz, align 8
  %cmp70 = icmp ule i64 %95, 72
  br i1 %cmp70, label %if.then71, label %if.else96

if.then71:                                        ; preds = %do.body
  %96 = load i8*, i8** %oldmem.addr, align 8
  %97 = bitcast i8* %96 to i64*
  store i64* %97, i64** %mcsrc, align 8
  %98 = load i8*, i8** %newmem, align 8
  %99 = bitcast i8* %98 to i64*
  store i64* %99, i64** %mcdst, align 8
  %100 = load i64, i64* %mcsz, align 8
  %cmp72 = icmp uge i64 %100, 40
  br i1 %cmp72, label %if.then73, label %if.end91

if.then73:                                        ; preds = %if.then71
  %101 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr = getelementptr inbounds i64, i64* %101, i32 1
  store i64* %incdec.ptr, i64** %mcsrc, align 8
  %102 = load i64, i64* %101, align 8
  %103 = load i64*, i64** %mcdst, align 8
  %incdec.ptr74 = getelementptr inbounds i64, i64* %103, i32 1
  store i64* %incdec.ptr74, i64** %mcdst, align 8
  store i64 %102, i64* %103, align 8
  %104 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr75 = getelementptr inbounds i64, i64* %104, i32 1
  store i64* %incdec.ptr75, i64** %mcsrc, align 8
  %105 = load i64, i64* %104, align 8
  %106 = load i64*, i64** %mcdst, align 8
  %incdec.ptr76 = getelementptr inbounds i64, i64* %106, i32 1
  store i64* %incdec.ptr76, i64** %mcdst, align 8
  store i64 %105, i64* %106, align 8
  %107 = load i64, i64* %mcsz, align 8
  %cmp77 = icmp uge i64 %107, 56
  br i1 %cmp77, label %if.then78, label %if.end90

if.then78:                                        ; preds = %if.then73
  %108 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr79 = getelementptr inbounds i64, i64* %108, i32 1
  store i64* %incdec.ptr79, i64** %mcsrc, align 8
  %109 = load i64, i64* %108, align 8
  %110 = load i64*, i64** %mcdst, align 8
  %incdec.ptr80 = getelementptr inbounds i64, i64* %110, i32 1
  store i64* %incdec.ptr80, i64** %mcdst, align 8
  store i64 %109, i64* %110, align 8
  %111 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr81 = getelementptr inbounds i64, i64* %111, i32 1
  store i64* %incdec.ptr81, i64** %mcsrc, align 8
  %112 = load i64, i64* %111, align 8
  %113 = load i64*, i64** %mcdst, align 8
  %incdec.ptr82 = getelementptr inbounds i64, i64* %113, i32 1
  store i64* %incdec.ptr82, i64** %mcdst, align 8
  store i64 %112, i64* %113, align 8
  %114 = load i64, i64* %mcsz, align 8
  %cmp83 = icmp uge i64 %114, 72
  br i1 %cmp83, label %if.then84, label %if.end89

if.then84:                                        ; preds = %if.then78
  %115 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr85 = getelementptr inbounds i64, i64* %115, i32 1
  store i64* %incdec.ptr85, i64** %mcsrc, align 8
  %116 = load i64, i64* %115, align 8
  %117 = load i64*, i64** %mcdst, align 8
  %incdec.ptr86 = getelementptr inbounds i64, i64* %117, i32 1
  store i64* %incdec.ptr86, i64** %mcdst, align 8
  store i64 %116, i64* %117, align 8
  %118 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr87 = getelementptr inbounds i64, i64* %118, i32 1
  store i64* %incdec.ptr87, i64** %mcsrc, align 8
  %119 = load i64, i64* %118, align 8
  %120 = load i64*, i64** %mcdst, align 8
  %incdec.ptr88 = getelementptr inbounds i64, i64* %120, i32 1
  store i64* %incdec.ptr88, i64** %mcdst, align 8
  store i64 %119, i64* %120, align 8
  br label %if.end89

if.end89:                                         ; preds = %if.then84, %if.then78
  br label %if.end90

if.end90:                                         ; preds = %if.end89, %if.then73
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.then71
  %121 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr92 = getelementptr inbounds i64, i64* %121, i32 1
  store i64* %incdec.ptr92, i64** %mcsrc, align 8
  %122 = load i64, i64* %121, align 8
  %123 = load i64*, i64** %mcdst, align 8
  %incdec.ptr93 = getelementptr inbounds i64, i64* %123, i32 1
  store i64* %incdec.ptr93, i64** %mcdst, align 8
  store i64 %122, i64* %123, align 8
  %124 = load i64*, i64** %mcsrc, align 8
  %incdec.ptr94 = getelementptr inbounds i64, i64* %124, i32 1
  store i64* %incdec.ptr94, i64** %mcsrc, align 8
  %125 = load i64, i64* %124, align 8
  %126 = load i64*, i64** %mcdst, align 8
  %incdec.ptr95 = getelementptr inbounds i64, i64* %126, i32 1
  store i64* %incdec.ptr95, i64** %mcdst, align 8
  store i64 %125, i64* %126, align 8
  %127 = load i64*, i64** %mcsrc, align 8
  %128 = load i64, i64* %127, align 8
  %129 = load i64*, i64** %mcdst, align 8
  store i64 %128, i64* %129, align 8
  br label %if.end98

if.else96:                                        ; preds = %do.body
  %130 = load i8*, i8** %newmem, align 8
  %131 = load i8*, i8** %oldmem.addr, align 8
  %132 = load i64, i64* %mcsz, align 8
  %call97 = call i8* @memmove(i8* %130, i8* %131, i64 %132) #4
  br label %if.end98

if.end98:                                         ; preds = %if.else96, %if.end91
  br label %do.end

do.end:                                           ; preds = %if.end98
  %133 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %134 = bitcast %struct.malloc_chunk* %133 to i8*
  %135 = load i64, i64* %nb, align 8
  %add.ptr99 = getelementptr inbounds i8, i8* %134, i64 %135
  %136 = bitcast i8* %add.ptr99 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %136, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %137 = load i64, i64* %newsize, align 8
  %138 = load i64, i64* %nb, align 8
  %sub100 = sub i64 %137, %138
  %or101 = or i64 %sub100, 1
  %139 = load %struct.malloc_chunk*, %struct.malloc_chunk** getelementptr inbounds (%struct.malloc_chunk, %struct.malloc_chunk* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.malloc_chunk** getelementptr inbounds ([258 x %struct.malloc_chunk*], [258 x %struct.malloc_chunk*]* @__malloc_av_, i64 0, i64 2) to i8*), i64 -16) to %struct.malloc_chunk*), i32 0, i32 2), align 8
  %size102 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %139, i32 0, i32 1
  store i64 %or101, i64* %size102, align 8
  %140 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size103 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %140, i32 0, i32 1
  %141 = load i64, i64* %size103, align 8
  %and104 = and i64 %141, 1
  %142 = load i64, i64* %nb, align 8
  %or105 = or i64 %and104, %142
  %143 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size106 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %143, i32 0, i32 1
  store i64 %or105, i64* %size106, align 8
  %144 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %144) #4
  %145 = load i8*, i8** %newmem, align 8
  store i8* %145, i8** %retval, align 8
  br label %return

if.end107:                                        ; preds = %if.then56
  br label %if.end161

if.else108:                                       ; preds = %if.then54
  %146 = load i64, i64* %nextsize, align 8
  %147 = load i64, i64* %prevsize, align 8
  %add109 = add i64 %146, %147
  %148 = load i64, i64* %newsize, align 8
  %add110 = add i64 %add109, %148
  %149 = load i64, i64* %nb, align 8
  %cmp111 = icmp sge i64 %add110, %149
  br i1 %cmp111, label %if.then112, label %if.end160

if.then112:                                       ; preds = %if.else108
  %150 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %bk113 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %150, i32 0, i32 3
  %151 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk113, align 8
  store %struct.malloc_chunk* %151, %struct.malloc_chunk** %bck, align 8
  %152 = load %struct.malloc_chunk*, %struct.malloc_chunk** %next, align 8
  %fd114 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %152, i32 0, i32 2
  %153 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd114, align 8
  store %struct.malloc_chunk* %153, %struct.malloc_chunk** %fwd, align 8
  %154 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %155 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk115 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %155, i32 0, i32 3
  store %struct.malloc_chunk* %154, %struct.malloc_chunk** %bk115, align 8
  %156 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %157 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd116 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %157, i32 0, i32 2
  store %struct.malloc_chunk* %156, %struct.malloc_chunk** %fd116, align 8
  %158 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %bk117 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %158, i32 0, i32 3
  %159 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk117, align 8
  store %struct.malloc_chunk* %159, %struct.malloc_chunk** %bck, align 8
  %160 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %fd118 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %160, i32 0, i32 2
  %161 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd118, align 8
  store %struct.malloc_chunk* %161, %struct.malloc_chunk** %fwd, align 8
  %162 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %163 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk119 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %163, i32 0, i32 3
  store %struct.malloc_chunk* %162, %struct.malloc_chunk** %bk119, align 8
  %164 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %165 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd120 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %165, i32 0, i32 2
  store %struct.malloc_chunk* %164, %struct.malloc_chunk** %fd120, align 8
  %166 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  store %struct.malloc_chunk* %166, %struct.malloc_chunk** %newp, align 8
  %167 = load i64, i64* %nextsize, align 8
  %168 = load i64, i64* %prevsize, align 8
  %add121 = add i64 %167, %168
  %169 = load i64, i64* %newsize, align 8
  %add122 = add i64 %169, %add121
  store i64 %add122, i64* %newsize, align 8
  %170 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %171 = bitcast %struct.malloc_chunk* %170 to i8*
  %add.ptr123 = getelementptr inbounds i8, i8* %171, i64 16
  store i8* %add.ptr123, i8** %newmem, align 8
  br label %do.body124

do.body124:                                       ; preds = %if.then112
  %172 = load i64, i64* %oldsize, align 8
  %sub126 = sub i64 %172, 8
  store i64 %sub126, i64* %mcsz125, align 8
  %173 = load i64, i64* %mcsz125, align 8
  %cmp127 = icmp ule i64 %173, 72
  br i1 %cmp127, label %if.then128, label %if.else156

if.then128:                                       ; preds = %do.body124
  %174 = load i8*, i8** %oldmem.addr, align 8
  %175 = bitcast i8* %174 to i64*
  store i64* %175, i64** %mcsrc129, align 8
  %176 = load i8*, i8** %newmem, align 8
  %177 = bitcast i8* %176 to i64*
  store i64* %177, i64** %mcdst130, align 8
  %178 = load i64, i64* %mcsz125, align 8
  %cmp131 = icmp uge i64 %178, 40
  br i1 %cmp131, label %if.then132, label %if.end151

if.then132:                                       ; preds = %if.then128
  %179 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr133 = getelementptr inbounds i64, i64* %179, i32 1
  store i64* %incdec.ptr133, i64** %mcsrc129, align 8
  %180 = load i64, i64* %179, align 8
  %181 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr134 = getelementptr inbounds i64, i64* %181, i32 1
  store i64* %incdec.ptr134, i64** %mcdst130, align 8
  store i64 %180, i64* %181, align 8
  %182 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr135 = getelementptr inbounds i64, i64* %182, i32 1
  store i64* %incdec.ptr135, i64** %mcsrc129, align 8
  %183 = load i64, i64* %182, align 8
  %184 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr136 = getelementptr inbounds i64, i64* %184, i32 1
  store i64* %incdec.ptr136, i64** %mcdst130, align 8
  store i64 %183, i64* %184, align 8
  %185 = load i64, i64* %mcsz125, align 8
  %cmp137 = icmp uge i64 %185, 56
  br i1 %cmp137, label %if.then138, label %if.end150

if.then138:                                       ; preds = %if.then132
  %186 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr139 = getelementptr inbounds i64, i64* %186, i32 1
  store i64* %incdec.ptr139, i64** %mcsrc129, align 8
  %187 = load i64, i64* %186, align 8
  %188 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr140 = getelementptr inbounds i64, i64* %188, i32 1
  store i64* %incdec.ptr140, i64** %mcdst130, align 8
  store i64 %187, i64* %188, align 8
  %189 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr141 = getelementptr inbounds i64, i64* %189, i32 1
  store i64* %incdec.ptr141, i64** %mcsrc129, align 8
  %190 = load i64, i64* %189, align 8
  %191 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr142 = getelementptr inbounds i64, i64* %191, i32 1
  store i64* %incdec.ptr142, i64** %mcdst130, align 8
  store i64 %190, i64* %191, align 8
  %192 = load i64, i64* %mcsz125, align 8
  %cmp143 = icmp uge i64 %192, 72
  br i1 %cmp143, label %if.then144, label %if.end149

if.then144:                                       ; preds = %if.then138
  %193 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr145 = getelementptr inbounds i64, i64* %193, i32 1
  store i64* %incdec.ptr145, i64** %mcsrc129, align 8
  %194 = load i64, i64* %193, align 8
  %195 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr146 = getelementptr inbounds i64, i64* %195, i32 1
  store i64* %incdec.ptr146, i64** %mcdst130, align 8
  store i64 %194, i64* %195, align 8
  %196 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr147 = getelementptr inbounds i64, i64* %196, i32 1
  store i64* %incdec.ptr147, i64** %mcsrc129, align 8
  %197 = load i64, i64* %196, align 8
  %198 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr148 = getelementptr inbounds i64, i64* %198, i32 1
  store i64* %incdec.ptr148, i64** %mcdst130, align 8
  store i64 %197, i64* %198, align 8
  br label %if.end149

if.end149:                                        ; preds = %if.then144, %if.then138
  br label %if.end150

if.end150:                                        ; preds = %if.end149, %if.then132
  br label %if.end151

if.end151:                                        ; preds = %if.end150, %if.then128
  %199 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr152 = getelementptr inbounds i64, i64* %199, i32 1
  store i64* %incdec.ptr152, i64** %mcsrc129, align 8
  %200 = load i64, i64* %199, align 8
  %201 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr153 = getelementptr inbounds i64, i64* %201, i32 1
  store i64* %incdec.ptr153, i64** %mcdst130, align 8
  store i64 %200, i64* %201, align 8
  %202 = load i64*, i64** %mcsrc129, align 8
  %incdec.ptr154 = getelementptr inbounds i64, i64* %202, i32 1
  store i64* %incdec.ptr154, i64** %mcsrc129, align 8
  %203 = load i64, i64* %202, align 8
  %204 = load i64*, i64** %mcdst130, align 8
  %incdec.ptr155 = getelementptr inbounds i64, i64* %204, i32 1
  store i64* %incdec.ptr155, i64** %mcdst130, align 8
  store i64 %203, i64* %204, align 8
  %205 = load i64*, i64** %mcsrc129, align 8
  %206 = load i64, i64* %205, align 8
  %207 = load i64*, i64** %mcdst130, align 8
  store i64 %206, i64* %207, align 8
  br label %if.end158

if.else156:                                       ; preds = %do.body124
  %208 = load i8*, i8** %newmem, align 8
  %209 = load i8*, i8** %oldmem.addr, align 8
  %210 = load i64, i64* %mcsz125, align 8
  %call157 = call i8* @memmove(i8* %208, i8* %209, i64 %210) #4
  br label %if.end158

if.end158:                                        ; preds = %if.else156, %if.end151
  br label %do.end159

do.end159:                                        ; preds = %if.end158
  br label %split

if.end160:                                        ; preds = %if.else108
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %if.end107
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %if.then49
  %211 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %cmp163 = icmp ne %struct.malloc_chunk* %211, null
  br i1 %cmp163, label %land.lhs.true, label %if.end209

land.lhs.true:                                    ; preds = %if.end162
  %212 = load i64, i64* %prevsize, align 8
  %213 = load i64, i64* %newsize, align 8
  %add164 = add i64 %212, %213
  %214 = load i64, i64* %nb, align 8
  %cmp165 = icmp sge i64 %add164, %214
  br i1 %cmp165, label %if.then166, label %if.end209

if.then166:                                       ; preds = %land.lhs.true
  %215 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %bk167 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %215, i32 0, i32 3
  %216 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bk167, align 8
  store %struct.malloc_chunk* %216, %struct.malloc_chunk** %bck, align 8
  %217 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  %fd168 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %217, i32 0, i32 2
  %218 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fd168, align 8
  store %struct.malloc_chunk* %218, %struct.malloc_chunk** %fwd, align 8
  %219 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %220 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %bk169 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %220, i32 0, i32 3
  store %struct.malloc_chunk* %219, %struct.malloc_chunk** %bk169, align 8
  %221 = load %struct.malloc_chunk*, %struct.malloc_chunk** %fwd, align 8
  %222 = load %struct.malloc_chunk*, %struct.malloc_chunk** %bck, align 8
  %fd170 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %222, i32 0, i32 2
  store %struct.malloc_chunk* %221, %struct.malloc_chunk** %fd170, align 8
  %223 = load %struct.malloc_chunk*, %struct.malloc_chunk** %prev, align 8
  store %struct.malloc_chunk* %223, %struct.malloc_chunk** %newp, align 8
  %224 = load i64, i64* %prevsize, align 8
  %225 = load i64, i64* %newsize, align 8
  %add171 = add i64 %225, %224
  store i64 %add171, i64* %newsize, align 8
  %226 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %227 = bitcast %struct.malloc_chunk* %226 to i8*
  %add.ptr172 = getelementptr inbounds i8, i8* %227, i64 16
  store i8* %add.ptr172, i8** %newmem, align 8
  br label %do.body173

do.body173:                                       ; preds = %if.then166
  %228 = load i64, i64* %oldsize, align 8
  %sub175 = sub i64 %228, 8
  store i64 %sub175, i64* %mcsz174, align 8
  %229 = load i64, i64* %mcsz174, align 8
  %cmp176 = icmp ule i64 %229, 72
  br i1 %cmp176, label %if.then177, label %if.else205

if.then177:                                       ; preds = %do.body173
  %230 = load i8*, i8** %oldmem.addr, align 8
  %231 = bitcast i8* %230 to i64*
  store i64* %231, i64** %mcsrc178, align 8
  %232 = load i8*, i8** %newmem, align 8
  %233 = bitcast i8* %232 to i64*
  store i64* %233, i64** %mcdst179, align 8
  %234 = load i64, i64* %mcsz174, align 8
  %cmp180 = icmp uge i64 %234, 40
  br i1 %cmp180, label %if.then181, label %if.end200

if.then181:                                       ; preds = %if.then177
  %235 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr182 = getelementptr inbounds i64, i64* %235, i32 1
  store i64* %incdec.ptr182, i64** %mcsrc178, align 8
  %236 = load i64, i64* %235, align 8
  %237 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr183 = getelementptr inbounds i64, i64* %237, i32 1
  store i64* %incdec.ptr183, i64** %mcdst179, align 8
  store i64 %236, i64* %237, align 8
  %238 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr184 = getelementptr inbounds i64, i64* %238, i32 1
  store i64* %incdec.ptr184, i64** %mcsrc178, align 8
  %239 = load i64, i64* %238, align 8
  %240 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr185 = getelementptr inbounds i64, i64* %240, i32 1
  store i64* %incdec.ptr185, i64** %mcdst179, align 8
  store i64 %239, i64* %240, align 8
  %241 = load i64, i64* %mcsz174, align 8
  %cmp186 = icmp uge i64 %241, 56
  br i1 %cmp186, label %if.then187, label %if.end199

if.then187:                                       ; preds = %if.then181
  %242 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr188 = getelementptr inbounds i64, i64* %242, i32 1
  store i64* %incdec.ptr188, i64** %mcsrc178, align 8
  %243 = load i64, i64* %242, align 8
  %244 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr189 = getelementptr inbounds i64, i64* %244, i32 1
  store i64* %incdec.ptr189, i64** %mcdst179, align 8
  store i64 %243, i64* %244, align 8
  %245 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr190 = getelementptr inbounds i64, i64* %245, i32 1
  store i64* %incdec.ptr190, i64** %mcsrc178, align 8
  %246 = load i64, i64* %245, align 8
  %247 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr191 = getelementptr inbounds i64, i64* %247, i32 1
  store i64* %incdec.ptr191, i64** %mcdst179, align 8
  store i64 %246, i64* %247, align 8
  %248 = load i64, i64* %mcsz174, align 8
  %cmp192 = icmp uge i64 %248, 72
  br i1 %cmp192, label %if.then193, label %if.end198

if.then193:                                       ; preds = %if.then187
  %249 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr194 = getelementptr inbounds i64, i64* %249, i32 1
  store i64* %incdec.ptr194, i64** %mcsrc178, align 8
  %250 = load i64, i64* %249, align 8
  %251 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr195 = getelementptr inbounds i64, i64* %251, i32 1
  store i64* %incdec.ptr195, i64** %mcdst179, align 8
  store i64 %250, i64* %251, align 8
  %252 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr196 = getelementptr inbounds i64, i64* %252, i32 1
  store i64* %incdec.ptr196, i64** %mcsrc178, align 8
  %253 = load i64, i64* %252, align 8
  %254 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr197 = getelementptr inbounds i64, i64* %254, i32 1
  store i64* %incdec.ptr197, i64** %mcdst179, align 8
  store i64 %253, i64* %254, align 8
  br label %if.end198

if.end198:                                        ; preds = %if.then193, %if.then187
  br label %if.end199

if.end199:                                        ; preds = %if.end198, %if.then181
  br label %if.end200

if.end200:                                        ; preds = %if.end199, %if.then177
  %255 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr201 = getelementptr inbounds i64, i64* %255, i32 1
  store i64* %incdec.ptr201, i64** %mcsrc178, align 8
  %256 = load i64, i64* %255, align 8
  %257 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr202 = getelementptr inbounds i64, i64* %257, i32 1
  store i64* %incdec.ptr202, i64** %mcdst179, align 8
  store i64 %256, i64* %257, align 8
  %258 = load i64*, i64** %mcsrc178, align 8
  %incdec.ptr203 = getelementptr inbounds i64, i64* %258, i32 1
  store i64* %incdec.ptr203, i64** %mcsrc178, align 8
  %259 = load i64, i64* %258, align 8
  %260 = load i64*, i64** %mcdst179, align 8
  %incdec.ptr204 = getelementptr inbounds i64, i64* %260, i32 1
  store i64* %incdec.ptr204, i64** %mcdst179, align 8
  store i64 %259, i64* %260, align 8
  %261 = load i64*, i64** %mcsrc178, align 8
  %262 = load i64, i64* %261, align 8
  %263 = load i64*, i64** %mcdst179, align 8
  store i64 %262, i64* %263, align 8
  br label %if.end207

if.else205:                                       ; preds = %do.body173
  %264 = load i8*, i8** %newmem, align 8
  %265 = load i8*, i8** %oldmem.addr, align 8
  %266 = load i64, i64* %mcsz174, align 8
  %call206 = call i8* @memmove(i8* %264, i8* %265, i64 %266) #4
  br label %if.end207

if.end207:                                        ; preds = %if.else205, %if.end200
  br label %do.end208

do.end208:                                        ; preds = %if.end207
  br label %split

if.end209:                                        ; preds = %land.lhs.true, %if.end162
  br label %if.end210

if.end210:                                        ; preds = %if.end209, %if.end45
  %267 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %268 = load i64, i64* %bytes.addr, align 8
  %call211 = call fastcc i8* @_malloc_r(%struct._reent* %267, i64 %268) #4
  store i8* %call211, i8** %newmem, align 8
  %269 = load i8*, i8** %newmem, align 8
  %cmp212 = icmp eq i8* %269, null
  br i1 %cmp212, label %if.then213, label %if.end214

if.then213:                                       ; preds = %if.end210
  %270 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %270) #4
  store i8* null, i8** %retval, align 8
  br label %return

if.end214:                                        ; preds = %if.end210
  %271 = load i8*, i8** %newmem, align 8
  %add.ptr215 = getelementptr inbounds i8, i8* %271, i64 -16
  %272 = bitcast i8* %add.ptr215 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %272, %struct.malloc_chunk** %newp, align 8
  %273 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %274 = bitcast %struct.malloc_chunk* %273 to i8*
  %275 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  %size216 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %275, i32 0, i32 1
  %276 = load i64, i64* %size216, align 8
  %and217 = and i64 %276, -2
  %add.ptr218 = getelementptr inbounds i8, i8* %274, i64 %and217
  %277 = bitcast i8* %add.ptr218 to %struct.malloc_chunk*
  %cmp219 = icmp eq %struct.malloc_chunk* %272, %277
  br i1 %cmp219, label %if.then220, label %if.end224

if.then220:                                       ; preds = %if.end214
  %278 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size221 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %278, i32 0, i32 1
  %279 = load i64, i64* %size221, align 8
  %and222 = and i64 %279, -4
  %280 = load i64, i64* %newsize, align 8
  %add223 = add i64 %280, %and222
  store i64 %add223, i64* %newsize, align 8
  %281 = load %struct.malloc_chunk*, %struct.malloc_chunk** %oldp, align 8
  store %struct.malloc_chunk* %281, %struct.malloc_chunk** %newp, align 8
  br label %split

if.end224:                                        ; preds = %if.end214
  br label %do.body225

do.body225:                                       ; preds = %if.end224
  %282 = load i64, i64* %oldsize, align 8
  %sub227 = sub i64 %282, 8
  store i64 %sub227, i64* %mcsz226, align 8
  %283 = load i64, i64* %mcsz226, align 8
  %cmp228 = icmp ule i64 %283, 72
  br i1 %cmp228, label %if.then229, label %if.else257

if.then229:                                       ; preds = %do.body225
  %284 = load i8*, i8** %oldmem.addr, align 8
  %285 = bitcast i8* %284 to i64*
  store i64* %285, i64** %mcsrc230, align 8
  %286 = load i8*, i8** %newmem, align 8
  %287 = bitcast i8* %286 to i64*
  store i64* %287, i64** %mcdst231, align 8
  %288 = load i64, i64* %mcsz226, align 8
  %cmp232 = icmp uge i64 %288, 40
  br i1 %cmp232, label %if.then233, label %if.end252

if.then233:                                       ; preds = %if.then229
  %289 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr234 = getelementptr inbounds i64, i64* %289, i32 1
  store i64* %incdec.ptr234, i64** %mcsrc230, align 8
  %290 = load i64, i64* %289, align 8
  %291 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr235 = getelementptr inbounds i64, i64* %291, i32 1
  store i64* %incdec.ptr235, i64** %mcdst231, align 8
  store i64 %290, i64* %291, align 8
  %292 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr236 = getelementptr inbounds i64, i64* %292, i32 1
  store i64* %incdec.ptr236, i64** %mcsrc230, align 8
  %293 = load i64, i64* %292, align 8
  %294 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr237 = getelementptr inbounds i64, i64* %294, i32 1
  store i64* %incdec.ptr237, i64** %mcdst231, align 8
  store i64 %293, i64* %294, align 8
  %295 = load i64, i64* %mcsz226, align 8
  %cmp238 = icmp uge i64 %295, 56
  br i1 %cmp238, label %if.then239, label %if.end251

if.then239:                                       ; preds = %if.then233
  %296 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr240 = getelementptr inbounds i64, i64* %296, i32 1
  store i64* %incdec.ptr240, i64** %mcsrc230, align 8
  %297 = load i64, i64* %296, align 8
  %298 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr241 = getelementptr inbounds i64, i64* %298, i32 1
  store i64* %incdec.ptr241, i64** %mcdst231, align 8
  store i64 %297, i64* %298, align 8
  %299 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr242 = getelementptr inbounds i64, i64* %299, i32 1
  store i64* %incdec.ptr242, i64** %mcsrc230, align 8
  %300 = load i64, i64* %299, align 8
  %301 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr243 = getelementptr inbounds i64, i64* %301, i32 1
  store i64* %incdec.ptr243, i64** %mcdst231, align 8
  store i64 %300, i64* %301, align 8
  %302 = load i64, i64* %mcsz226, align 8
  %cmp244 = icmp uge i64 %302, 72
  br i1 %cmp244, label %if.then245, label %if.end250

if.then245:                                       ; preds = %if.then239
  %303 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr246 = getelementptr inbounds i64, i64* %303, i32 1
  store i64* %incdec.ptr246, i64** %mcsrc230, align 8
  %304 = load i64, i64* %303, align 8
  %305 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr247 = getelementptr inbounds i64, i64* %305, i32 1
  store i64* %incdec.ptr247, i64** %mcdst231, align 8
  store i64 %304, i64* %305, align 8
  %306 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr248 = getelementptr inbounds i64, i64* %306, i32 1
  store i64* %incdec.ptr248, i64** %mcsrc230, align 8
  %307 = load i64, i64* %306, align 8
  %308 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr249 = getelementptr inbounds i64, i64* %308, i32 1
  store i64* %incdec.ptr249, i64** %mcdst231, align 8
  store i64 %307, i64* %308, align 8
  br label %if.end250

if.end250:                                        ; preds = %if.then245, %if.then239
  br label %if.end251

if.end251:                                        ; preds = %if.end250, %if.then233
  br label %if.end252

if.end252:                                        ; preds = %if.end251, %if.then229
  %309 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr253 = getelementptr inbounds i64, i64* %309, i32 1
  store i64* %incdec.ptr253, i64** %mcsrc230, align 8
  %310 = load i64, i64* %309, align 8
  %311 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr254 = getelementptr inbounds i64, i64* %311, i32 1
  store i64* %incdec.ptr254, i64** %mcdst231, align 8
  store i64 %310, i64* %311, align 8
  %312 = load i64*, i64** %mcsrc230, align 8
  %incdec.ptr255 = getelementptr inbounds i64, i64* %312, i32 1
  store i64* %incdec.ptr255, i64** %mcsrc230, align 8
  %313 = load i64, i64* %312, align 8
  %314 = load i64*, i64** %mcdst231, align 8
  %incdec.ptr256 = getelementptr inbounds i64, i64* %314, i32 1
  store i64* %incdec.ptr256, i64** %mcdst231, align 8
  store i64 %313, i64* %314, align 8
  %315 = load i64*, i64** %mcsrc230, align 8
  %316 = load i64, i64* %315, align 8
  %317 = load i64*, i64** %mcdst231, align 8
  store i64 %316, i64* %317, align 8
  br label %if.end259

if.else257:                                       ; preds = %do.body225
  %318 = load i8*, i8** %newmem, align 8
  %319 = load i8*, i8** %oldmem.addr, align 8
  %320 = load i64, i64* %mcsz226, align 8
  %call258 = call i8* @memmove(i8* %318, i8* %319, i64 %320) #4
  br label %if.end259

if.end259:                                        ; preds = %if.else257, %if.end252
  br label %do.end260

do.end260:                                        ; preds = %if.end259
  %321 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %322 = load i8*, i8** %oldmem.addr, align 8
  call fastcc void @_free_r(%struct._reent* %321, i8* %322) #4
  %323 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %323) #4
  %324 = load i8*, i8** %newmem, align 8
  store i8* %324, i8** %retval, align 8
  br label %return

if.end261:                                        ; preds = %if.end7
  br label %split

split:                                            ; preds = %if.end261, %if.then220, %do.end208, %do.end159, %if.then38
  %325 = load i64, i64* %newsize, align 8
  %326 = load i64, i64* %nb, align 8
  %sub262 = sub i64 %325, %326
  store i64 %sub262, i64* %remainder_size, align 8
  %327 = load i64, i64* %remainder_size, align 8
  %cmp263 = icmp uge i64 %327, 32
  br i1 %cmp263, label %if.then264, label %if.else276

if.then264:                                       ; preds = %split
  %328 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %329 = bitcast %struct.malloc_chunk* %328 to i8*
  %330 = load i64, i64* %nb, align 8
  %add.ptr265 = getelementptr inbounds i8, i8* %329, i64 %330
  %331 = bitcast i8* %add.ptr265 to %struct.malloc_chunk*
  store %struct.malloc_chunk* %331, %struct.malloc_chunk** %remainder, align 8
  %332 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size266 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %332, i32 0, i32 1
  %333 = load i64, i64* %size266, align 8
  %and267 = and i64 %333, 1
  %334 = load i64, i64* %nb, align 8
  %or268 = or i64 %and267, %334
  %335 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size269 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %335, i32 0, i32 1
  store i64 %or268, i64* %size269, align 8
  %336 = load i64, i64* %remainder_size, align 8
  %or270 = or i64 %336, 1
  %337 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %size271 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %337, i32 0, i32 1
  store i64 %or270, i64* %size271, align 8
  %338 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %339 = bitcast %struct.malloc_chunk* %338 to i8*
  %340 = load i64, i64* %remainder_size, align 8
  %add.ptr272 = getelementptr inbounds i8, i8* %339, i64 %340
  %341 = bitcast i8* %add.ptr272 to %struct.malloc_chunk*
  %size273 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %341, i32 0, i32 1
  %342 = load i64, i64* %size273, align 8
  %or274 = or i64 %342, 1
  store i64 %or274, i64* %size273, align 8
  %343 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  %344 = load %struct.malloc_chunk*, %struct.malloc_chunk** %remainder, align 8
  %345 = bitcast %struct.malloc_chunk* %344 to i8*
  %add.ptr275 = getelementptr inbounds i8, i8* %345, i64 16
  call fastcc void @_free_r(%struct._reent* %343, i8* %add.ptr275) #4
  br label %if.end284

if.else276:                                       ; preds = %split
  %346 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size277 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %346, i32 0, i32 1
  %347 = load i64, i64* %size277, align 8
  %and278 = and i64 %347, 1
  %348 = load i64, i64* %newsize, align 8
  %or279 = or i64 %and278, %348
  %349 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %size280 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %349, i32 0, i32 1
  store i64 %or279, i64* %size280, align 8
  %350 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %351 = bitcast %struct.malloc_chunk* %350 to i8*
  %352 = load i64, i64* %newsize, align 8
  %add.ptr281 = getelementptr inbounds i8, i8* %351, i64 %352
  %353 = bitcast i8* %add.ptr281 to %struct.malloc_chunk*
  %size282 = getelementptr inbounds %struct.malloc_chunk, %struct.malloc_chunk* %353, i32 0, i32 1
  %354 = load i64, i64* %size282, align 8
  %or283 = or i64 %354, 1
  store i64 %or283, i64* %size282, align 8
  br label %if.end284

if.end284:                                        ; preds = %if.else276, %if.then264
  %355 = load %struct._reent*, %struct._reent** %reent_ptr.addr, align 8
  call void bitcast (void (%struct._reent.122*)* @__malloc_unlock to void (%struct._reent*)*)(%struct._reent* %355) #4
  %356 = load %struct.malloc_chunk*, %struct.malloc_chunk** %newp, align 8
  %357 = bitcast %struct.malloc_chunk* %356 to i8*
  %add.ptr285 = getelementptr inbounds i8, i8* %357, i64 16
  store i8* %add.ptr285, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end284, %do.end260, %if.then213, %do.end, %if.then26, %if.then6, %if.then
  %358 = load i8*, i8** %retval, align 8
  ret i8* %358
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @strcmp(i8* %s1, i8* %s2) local_unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %s1.addr = alloca i8*, align 8
  %s2.addr = alloca i8*, align 8
  %a1 = alloca i64*, align 8
  %a2 = alloca i64*, align 8
  store i8* %s1, i8** %s1.addr, align 8
  store i8* %s2, i8** %s2.addr, align 8
  %0 = load i8*, i8** %s1.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  %and = and i64 %1, 7
  %2 = load i8*, i8** %s2.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  %and1 = and i64 %3, 7
  %or = or i64 %and, %and1
  %tobool = icmp ne i64 %or, 0
  br i1 %tobool, label %if.end7, label %if.then

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %s1.addr, align 8
  %5 = bitcast i8* %4 to i64*
  store i64* %5, i64** %a1, align 8
  %6 = load i8*, i8** %s2.addr, align 8
  %7 = bitcast i8* %6 to i64*
  store i64* %7, i64** %a2, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then
  %8 = load i64*, i64** %a1, align 8
  %9 = load i64, i64* %8, align 8
  %10 = load i64*, i64** %a2, align 8
  %11 = load i64, i64* %10, align 8
  %cmp = icmp eq i64 %9, %11
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %12 = load i64*, i64** %a1, align 8
  %13 = load i64, i64* %12, align 8
  %sub = sub i64 %13, 72340172838076673
  %14 = load i64*, i64** %a1, align 8
  %15 = load i64, i64* %14, align 8
  %neg = xor i64 %15, -1
  %and2 = and i64 %sub, %neg
  %and3 = and i64 %and2, -9187201950435737472
  %tobool4 = icmp ne i64 %and3, 0
  br i1 %tobool4, label %if.then5, label %if.end

if.then5:                                         ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %16 = load i64*, i64** %a1, align 8
  %incdec.ptr = getelementptr inbounds i64, i64* %16, i32 1
  store i64* %incdec.ptr, i64** %a1, align 8
  %17 = load i64*, i64** %a2, align 8
  %incdec.ptr6 = getelementptr inbounds i64, i64* %17, i32 1
  store i64* %incdec.ptr6, i64** %a2, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load i64*, i64** %a1, align 8
  %19 = bitcast i64* %18 to i8*
  store i8* %19, i8** %s1.addr, align 8
  %20 = load i64*, i64** %a2, align 8
  %21 = bitcast i64* %20 to i8*
  store i8* %21, i8** %s2.addr, align 8
  br label %if.end7

if.end7:                                          ; preds = %while.end, %entry
  br label %while.cond8

while.cond8:                                      ; preds = %while.body15, %if.end7
  %22 = load i8*, i8** %s1.addr, align 8
  %23 = load i8, i8* %22, align 1
  %conv = sext i8 %23 to i32
  %cmp9 = icmp ne i32 %conv, 0
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond8
  %24 = load i8*, i8** %s1.addr, align 8
  %25 = load i8, i8* %24, align 1
  %conv11 = sext i8 %25 to i32
  %26 = load i8*, i8** %s2.addr, align 8
  %27 = load i8, i8* %26, align 1
  %conv12 = sext i8 %27 to i32
  %cmp13 = icmp eq i32 %conv11, %conv12
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond8
  %28 = phi i1 [ false, %while.cond8 ], [ %cmp13, %land.rhs ]
  br i1 %28, label %while.body15, label %while.end18

while.body15:                                     ; preds = %land.end
  %29 = load i8*, i8** %s1.addr, align 8
  %incdec.ptr16 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr16, i8** %s1.addr, align 8
  %30 = load i8*, i8** %s2.addr, align 8
  %incdec.ptr17 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr17, i8** %s2.addr, align 8
  br label %while.cond8

while.end18:                                      ; preds = %land.end
  %31 = load i8*, i8** %s1.addr, align 8
  %32 = load i8, i8* %31, align 1
  %conv19 = zext i8 %32 to i32
  %33 = load i8*, i8** %s2.addr, align 8
  %34 = load i8, i8* %33, align 1
  %conv20 = zext i8 %34 to i32
  %sub21 = sub nsw i32 %conv19, %conv20
  store i32 %sub21, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end18, %if.then5
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @__swbuf_r(%struct._reent* %ptr, i32 %c, %struct.__sFILE* %fp) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca %struct._reent*, align 8
  %c.addr = alloca i32, align 4
  %fp.addr = alloca %struct.__sFILE*, align 8
  %n = alloca i32, align 4
  %_check_init_ptr = alloca %struct._reent*, align 8
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store %struct.__sFILE* %fp, %struct.__sFILE** %fp.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  store %struct._reent* %0, %struct._reent** %_check_init_ptr, align 8
  %1 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %tobool = icmp ne %struct._reent* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %2 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  %__sdidinit = getelementptr inbounds %struct._reent, %struct._reent* %2, i32 0, i32 8
  %3 = load i32, i32* %__sdidinit, align 8
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct._reent*, %struct._reent** %_check_init_ptr, align 8
  call fastcc void @__sinit(%struct._reent* %4) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_lbfsize = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %5, i32 0, i32 6
  %6 = load i32, i32* %_lbfsize, align 8
  %7 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %7, i32 0, i32 2
  store i32 %6, i32* %_w, align 4
  %8 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %8, i32 0, i32 3
  %9 = load i16, i16* %_flags, align 8
  %conv = sext i16 %9 to i32
  %and = and i32 %conv, 8
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %land.lhs.true5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end
  %10 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %10, i32 0, i32 5
  %_base = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf, i32 0, i32 0
  %11 = load i8*, i8** %_base, align 8
  %cmp3 = icmp eq i8* %11, null
  br i1 %cmp3, label %land.lhs.true5, label %if.end8

land.lhs.true5:                                   ; preds = %lor.lhs.false, %do.end
  %12 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %13 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call = call fastcc i32 @__swsetup_r(%struct._reent* %12, %struct.__sFILE* %13) #4
  %tobool6 = icmp ne i32 %call, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %land.lhs.true5
  store i32 -1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  %14 = load i32, i32* %c.addr, align 4
  %conv9 = trunc i32 %14 to i8
  %conv10 = zext i8 %conv9 to i32
  store i32 %conv10, i32* %c.addr, align 4
  br label %do.body11

do.body11:                                        ; preds = %if.end8
  %15 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags12 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %15, i32 0, i32 3
  %16 = load i16, i16* %_flags12, align 8
  %conv13 = sext i16 %16 to i32
  %and14 = and i32 %conv13, 8192
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.end21, label %if.then16

if.then16:                                        ; preds = %do.body11
  %17 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags17 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %17, i32 0, i32 3
  %18 = load i16, i16* %_flags17, align 8
  %conv18 = sext i16 %18 to i32
  %or = or i32 %conv18, 8192
  %conv19 = trunc i32 %or to i16
  store i16 %conv19, i16* %_flags17, align 8
  %19 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags2 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %19, i32 0, i32 23
  %20 = load i32, i32* %_flags2, align 4
  %and20 = and i32 %20, -8193
  store i32 %and20, i32* %_flags2, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then16, %do.body11
  br label %do.end22

do.end22:                                         ; preds = %if.end21
  %21 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %21, i32 0, i32 0
  %22 = load i8*, i8** %_p, align 8
  %23 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf23 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %23, i32 0, i32 5
  %_base24 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf23, i32 0, i32 0
  %24 = load i8*, i8** %_base24, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %22 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %24 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv25 = trunc i64 %sub.ptr.sub to i32
  store i32 %conv25, i32* %n, align 4
  %25 = load i32, i32* %n, align 4
  %26 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf26 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %26, i32 0, i32 5
  %_size = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf26, i32 0, i32 1
  %27 = load i32, i32* %_size, align 8
  %cmp27 = icmp sge i32 %25, %27
  br i1 %cmp27, label %if.then29, label %if.end34

if.then29:                                        ; preds = %do.end22
  %28 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %29 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call30 = call i32 @_fflush_r(%struct._reent* %28, %struct.__sFILE* %29) #4
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.then29
  store i32 -1, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %if.then29
  store i32 0, i32* %n, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %do.end22
  %30 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_w35 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %30, i32 0, i32 2
  %31 = load i32, i32* %_w35, align 4
  %dec = add nsw i32 %31, -1
  store i32 %dec, i32* %_w35, align 4
  %32 = load i32, i32* %c.addr, align 4
  %conv36 = trunc i32 %32 to i8
  %33 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_p37 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %33, i32 0, i32 0
  %34 = load i8*, i8** %_p37, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr, i8** %_p37, align 8
  store i8 %conv36, i8* %34, align 1
  %35 = load i32, i32* %n, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %n, align 4
  %36 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_bf38 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %36, i32 0, i32 5
  %_size39 = getelementptr inbounds %struct.__sbuf, %struct.__sbuf* %_bf38, i32 0, i32 1
  %37 = load i32, i32* %_size39, align 8
  %cmp40 = icmp eq i32 %inc, %37
  br i1 %cmp40, label %if.then50, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %if.end34
  %38 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %_flags43 = getelementptr inbounds %struct.__sFILE, %struct.__sFILE* %38, i32 0, i32 3
  %39 = load i16, i16* %_flags43, align 8
  %conv44 = sext i16 %39 to i32
  %and45 = and i32 %conv44, 1
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %land.lhs.true47, label %if.end55

land.lhs.true47:                                  ; preds = %lor.lhs.false42
  %40 = load i32, i32* %c.addr, align 4
  %cmp48 = icmp eq i32 %40, 10
  br i1 %cmp48, label %if.then50, label %if.end55

if.then50:                                        ; preds = %land.lhs.true47, %if.end34
  %41 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %42 = load %struct.__sFILE*, %struct.__sFILE** %fp.addr, align 8
  %call51 = call i32 @_fflush_r(%struct._reent* %41, %struct.__sFILE* %42) #4
  %tobool52 = icmp ne i32 %call51, 0
  br i1 %tobool52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.then50
  store i32 -1, i32* %retval, align 4
  br label %return

if.end54:                                         ; preds = %if.then50
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %land.lhs.true47, %lor.lhs.false42
  %43 = load i32, i32* %c.addr, align 4
  store i32 %43, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end55, %if.then53, %if.then32, %if.then7
  %44 = load i32, i32* %retval, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i64 @_wcrtomb_r(%struct._reent* %ptr, i8* %s, i32 %wc, %struct._mbstate_t* %ps) unnamed_addr #1 {
entry:
  %retval = alloca i64, align 8
  %ptr.addr = alloca %struct._reent*, align 8
  %s.addr = alloca i8*, align 8
  %wc.addr = alloca i32, align 4
  %ps.addr = alloca %struct._mbstate_t*, align 8
  %retval1 = alloca i32, align 4
  %buf = alloca [10 x i8], align 1
  store %struct._reent* %ptr, %struct._reent** %ptr.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  store i32 %wc, i32* %wc.addr, align 4
  store %struct._mbstate_t* %ps, %struct._mbstate_t** %ps.addr, align 8
  store i32 0, i32* %retval1, align 4
  %0 = load i8*, i8** %s.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call fastcc void @__get_current_locale.99() #4
  %1 = load i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)** getelementptr (%struct.__locale_t, %struct.__locale_t* bitcast ({ [7 x [32 x i8]], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }* @__global_locale to %struct.__locale_t*), i32 0, i32 1), align 8
  %2 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0
  %3 = load %struct._mbstate_t*, %struct._mbstate_t** %ps.addr, align 8
  %call2 = call i32 %1(%struct._reent* %2, i8* %arraydecay, i32 0, %struct._mbstate_t* %3) #5
  store i32 %call2, i32* %retval1, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  call fastcc void @__get_current_locale.99() #4
  %4 = load i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)** getelementptr (%struct.__locale_t, %struct.__locale_t* bitcast ({ [7 x [32 x i8]], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }* @__global_locale to %struct.__locale_t*), i32 0, i32 1), align 8
  %5 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %6 = load i8*, i8** %s.addr, align 8
  %7 = load i32, i32* %wc.addr, align 4
  %8 = load %struct._mbstate_t*, %struct._mbstate_t** %ps.addr, align 8
  %call5 = call i32 %4(%struct._reent* %5, i8* %6, i32 %7, %struct._mbstate_t* %8) #5
  store i32 %call5, i32* %retval1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval1, align 4
  %cmp6 = icmp eq i32 %9, -1
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.end
  %10 = load %struct._mbstate_t*, %struct._mbstate_t** %ps.addr, align 8
  %__count = getelementptr inbounds %struct._mbstate_t, %struct._mbstate_t* %10, i32 0, i32 0
  store i32 0, i32* %__count, align 4
  %11 = load %struct._reent*, %struct._reent** %ptr.addr, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %11, i32 0, i32 0
  store i32 138, i32* %_errno, align 8
  store i64 -1, i64* %retval, align 8
  br label %return

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %retval1, align 4
  %conv = sext i32 %12 to i64
  store i64 %conv, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.else8, %if.then7
  %13 = load i64, i64* %retval, align 8
  ret i64 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__get_current_locale.99() unnamed_addr #1 {
entry:
  call fastcc void @__get_global_locale.100() #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc void @__get_global_locale.100() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @wcrtomb(i8* noalias %s, i32 %wc, %struct._mbstate_t* noalias %ps) local_unnamed_addr #1 {
entry:
  %retval = alloca i64, align 8
  %s.addr = alloca i8*, align 8
  %wc.addr = alloca i32, align 4
  %ps.addr = alloca %struct._mbstate_t*, align 8
  %retval1 = alloca i32, align 4
  %reent = alloca %struct._reent*, align 8
  %buf = alloca [10 x i8], align 1
  store i8* %s, i8** %s.addr, align 8
  store i32 %wc, i32* %wc.addr, align 4
  store %struct._mbstate_t* %ps, %struct._mbstate_t** %ps.addr, align 8
  store i32 0, i32* %retval1, align 4
  store %struct._reent* bitcast ({ i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, { %struct.anon, [144 x i8] }, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }* @impure_data to %struct._reent*), %struct._reent** %reent, align 8
  %0 = load i8*, i8** %s.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call fastcc void @__get_current_locale.99() #4
  %1 = load i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)** getelementptr (%struct.__locale_t, %struct.__locale_t* bitcast ({ [7 x [32 x i8]], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }* @__global_locale to %struct.__locale_t*), i32 0, i32 1), align 8
  %2 = load %struct._reent*, %struct._reent** %reent, align 8
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0
  %3 = load %struct._mbstate_t*, %struct._mbstate_t** %ps.addr, align 8
  %call2 = call i32 %1(%struct._reent* %2, i8* %arraydecay, i32 0, %struct._mbstate_t* %3) #5
  store i32 %call2, i32* %retval1, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  call fastcc void @__get_current_locale.99() #4
  %4 = load i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent*, i8*, i32, %struct._mbstate_t*)** getelementptr (%struct.__locale_t, %struct.__locale_t* bitcast ({ [7 x [32 x i8]], i32 (%struct._reent.263*, i8*, i32, %struct._mbstate_t*)*, i32 (%struct._reent.263*, i32*, i8*, i64, %struct._mbstate_t*)*, i32, i8*, %struct.lconv, [2 x i8], [32 x i8], [32 x i8] }* @__global_locale to %struct.__locale_t*), i32 0, i32 1), align 8
  %5 = load %struct._reent*, %struct._reent** %reent, align 8
  %6 = load i8*, i8** %s.addr, align 8
  %7 = load i32, i32* %wc.addr, align 4
  %8 = load %struct._mbstate_t*, %struct._mbstate_t** %ps.addr, align 8
  %call5 = call i32 %4(%struct._reent* %5, i8* %6, i32 %7, %struct._mbstate_t* %8) #5
  store i32 %call5, i32* %retval1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval1, align 4
  %cmp6 = icmp eq i32 %9, -1
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.end
  %10 = load %struct._mbstate_t*, %struct._mbstate_t** %ps.addr, align 8
  %__count = getelementptr inbounds %struct._mbstate_t, %struct._mbstate_t* %10, i32 0, i32 0
  store i32 0, i32* %__count, align 4
  %11 = load %struct._reent*, %struct._reent** %reent, align 8
  %_errno = getelementptr inbounds %struct._reent, %struct._reent* %11, i32 0, i32 0
  store i32 138, i32* %_errno, align 8
  store i64 -1, i64* %retval, align 8
  br label %return

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %retval1, align 4
  %conv = sext i32 %12 to i64
  store i64 %conv, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.else8, %if.then7
  %13 = load i64, i64* %retval, align 8
  ret i64 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__ascii_wctomb(%struct._reent.263* %r, i8* %s, i32 %_wchar, %struct._mbstate_t* %state) #1 {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca %struct._reent.263*, align 8
  %s.addr = alloca i8*, align 8
  %_wchar.addr = alloca i32, align 4
  %state.addr = alloca %struct._mbstate_t*, align 8
  %wchar = alloca i32, align 4
  store %struct._reent.263* %r, %struct._reent.263** %r.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  store i32 %_wchar, i32* %_wchar.addr, align 4
  store %struct._mbstate_t* %state, %struct._mbstate_t** %state.addr, align 8
  %0 = load i32, i32* %_wchar.addr, align 4
  store i32 %0, i32* %wchar, align 4
  %1 = load i8*, i8** %s.addr, align 8
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %wchar, align 4
  %conv = zext i32 %2 to i64
  %cmp1 = icmp uge i64 %conv, 256
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %3 = load %struct._reent.263*, %struct._reent.263** %r.addr, align 8
  %_errno = getelementptr inbounds %struct._reent.263, %struct._reent.263* %3, i32 0, i32 0
  store i32 138, i32* %_errno, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %wchar, align 4
  %conv5 = trunc i32 %4 to i8
  %5 = load i8*, i8** %s.addr, align 8
  store i8 %conv5, i8* %5, align 1
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin "no-builtins" }
attributes #5 = { nobuiltin }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"ThinLTO", i32 0}
!3 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!4 = !{i32 1, !"LTOPostLink", i32 1}
