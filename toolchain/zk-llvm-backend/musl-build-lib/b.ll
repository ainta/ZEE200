; ModuleID = 'a.out.0.5.precodegen.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.pollfd = type { i32, i16, i16 }
%struct.__libc = type { i32, i32, i32, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.builtin_tls = type { i8, %struct.__pthread, [16 x i8*] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, %struct.__locale_struct*, [1 x i32], i8*, i8*, i64, i64* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.Elf64_Phdr = type { i32, i32, i64, i64, i64, i64, i64, i64 }

@.str = private unnamed_addr constant [14 x i8] c"jioadi %d %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__const.__init_libc.pfd = private unnamed_addr constant [3 x %struct.pollfd] [%struct.pollfd zeroinitializer, %struct.pollfd { i32 1, i16 0, i16 0 }, %struct.pollfd { i32 2, i16 0, i16 0 }], align 16
@.str.1.2 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@__init_array_start = extern_weak dso_local hidden constant void ()*, align 8
@__init_array_end = extern_weak dso_local hidden constant void ()*, align 8
@__fini_array_end = extern_weak dso_local hidden constant void ()*, align 8
@__fini_array_start = extern_weak dso_local hidden constant void ()*, align 8
@__sysinfo = internal unnamed_addr global i64 0, align 8
@__progname = dso_local global i8* null, align 8
@__progname_full = dso_local global i8* null, align 8
@__libc = internal global %struct.__libc zeroinitializer, align 8
@__environ = dso_local global i8** null, align 8
@__thread_list_lock = internal global i32 0, align 4
@_DYNAMIC = extern_weak dso_local hidden constant [0 x i64], align 8
@main_tls = internal global %struct.tls_module zeroinitializer, align 8
@builtin_tls = internal global [1 x %struct.builtin_tls] zeroinitializer, align 16
@__default_stacksize = internal unnamed_addr global i32 131072, align 4

@program_invocation_short_name = weak dso_local alias i8*, i8** @__progname
@program_invocation_name = weak dso_local alias i8*, i8** @__progname_full
@_environ = weak dso_local alias i8**, i8*** @__environ
@environ = weak dso_local alias i8**, i8*** @__environ

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 111, i32 90999)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @__init_libc(i8** %envp, i8* %pn) unnamed_addr #1 {
entry:
  %envp.addr = alloca i8**, align 8
  %pn.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %auxv = alloca i64*, align 8
  %aux = alloca [38 x i64], align 16
  %pfd = alloca [3 x %struct.pollfd], align 16
  %r = alloca i32, align 4
  store i8** %envp, i8*** %envp.addr, align 8
  store i8* %pn, i8** %pn.addr, align 8
  %0 = bitcast [38 x i64]* %aux to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 304, i1 false)
  %1 = load i8**, i8*** %envp.addr, align 8
  store i8** %1, i8*** @__environ, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8**, i8*** %envp.addr, align 8
  %3 = load i64, i64* %i, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 %3
  %4 = load i8*, i8** %arrayidx, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8
  %inc = add i64 %5, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i8**, i8*** %envp.addr, align 8
  %7 = load i64, i64* %i, align 8
  %add.ptr = getelementptr inbounds i8*, i8** %6, i64 %7
  %add.ptr1 = getelementptr inbounds i8*, i8** %add.ptr, i64 1
  %8 = bitcast i8** %add.ptr1 to i8*
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %auxv, align 8
  store i64* %9, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 4), align 8
  store i64 0, i64* %i, align 8
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc10, %for.end
  %10 = load i64*, i64** %auxv, align 8
  %11 = load i64, i64* %i, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %10, i64 %11
  %12 = load i64, i64* %arrayidx3, align 8
  %tobool4 = icmp ne i64 %12, 0
  br i1 %tobool4, label %for.body5, label %for.end12

for.body5:                                        ; preds = %for.cond2
  %13 = load i64*, i64** %auxv, align 8
  %14 = load i64, i64* %i, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %13, i64 %14
  %15 = load i64, i64* %arrayidx6, align 8
  %cmp = icmp ult i64 %15, 38
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body5
  %16 = load i64*, i64** %auxv, align 8
  %17 = load i64, i64* %i, align 8
  %add = add i64 %17, 1
  %arrayidx7 = getelementptr inbounds i64, i64* %16, i64 %add
  %18 = load i64, i64* %arrayidx7, align 8
  %19 = load i64*, i64** %auxv, align 8
  %20 = load i64, i64* %i, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %19, i64 %20
  %21 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 %21
  store i64 %18, i64* %arrayidx9, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body5
  br label %for.inc10

for.inc10:                                        ; preds = %if.end
  %22 = load i64, i64* %i, align 8
  %add11 = add i64 %22, 2
  store i64 %add11, i64* %i, align 8
  br label %for.cond2

for.end12:                                        ; preds = %for.cond2
  %arrayidx13 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 16
  %23 = load i64, i64* %arrayidx13, align 16
  %arrayidx14 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 32
  %24 = load i64, i64* %arrayidx14, align 16
  %tobool15 = icmp ne i64 %24, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %for.end12
  %arrayidx17 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 32
  %25 = load i64, i64* %arrayidx17, align 16
  store i64 %25, i64* @__sysinfo, align 8
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %for.end12
  %arrayidx19 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 6
  %26 = load i64, i64* %arrayidx19, align 16
  store i64 %26, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 9), align 8
  %27 = load i8*, i8** %pn.addr, align 8
  %tobool20 = icmp ne i8* %27, null
  br i1 %tobool20, label %if.end23, label %if.then21

if.then21:                                        ; preds = %if.end18
  %arrayidx22 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 31
  %28 = load i64, i64* %arrayidx22, align 8
  %29 = inttoptr i64 %28 to i8*
  store i8* %29, i8** %pn.addr, align 8
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end18
  %30 = load i8*, i8** %pn.addr, align 8
  %tobool24 = icmp ne i8* %30, null
  br i1 %tobool24, label %if.end26, label %if.then25

if.then25:                                        ; preds = %if.end23
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8** %pn.addr, align 8
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  %31 = load i8*, i8** %pn.addr, align 8
  store i8* %31, i8** @__progname_full, align 8
  store i8* %31, i8** @__progname, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc38, %if.end26
  %32 = load i8*, i8** %pn.addr, align 8
  %33 = load i64, i64* %i, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %32, i64 %33
  %34 = load i8, i8* %arrayidx28, align 1
  %tobool29 = icmp ne i8 %34, 0
  br i1 %tobool29, label %for.body30, label %for.end40

for.body30:                                       ; preds = %for.cond27
  %35 = load i8*, i8** %pn.addr, align 8
  %36 = load i64, i64* %i, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %35, i64 %36
  %37 = load i8, i8* %arrayidx31, align 1
  %conv = sext i8 %37 to i32
  %cmp32 = icmp eq i32 %conv, 47
  br i1 %cmp32, label %if.then34, label %if.end37

if.then34:                                        ; preds = %for.body30
  %38 = load i8*, i8** %pn.addr, align 8
  %39 = load i64, i64* %i, align 8
  %add.ptr35 = getelementptr inbounds i8, i8* %38, i64 %39
  %add.ptr36 = getelementptr inbounds i8, i8* %add.ptr35, i64 1
  store i8* %add.ptr36, i8** @__progname, align 8
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %for.body30
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %40 = load i64, i64* %i, align 8
  %inc39 = add i64 %40, 1
  store i64 %inc39, i64* %i, align 8
  br label %for.cond27

for.end40:                                        ; preds = %for.cond27
  %arraydecay = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 0
  call fastcc void @static_init_tls(i64* %arraydecay) #5
  %arrayidx41 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 25
  %41 = load i64, i64* %arrayidx41, align 8
  %42 = inttoptr i64 %41 to i8*
  call fastcc void @dummy1(i8* %42) #5
  %arrayidx42 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 11
  %43 = load i64, i64* %arrayidx42, align 8
  %arrayidx43 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 12
  %44 = load i64, i64* %arrayidx43, align 16
  %cmp44 = icmp eq i64 %43, %44
  br i1 %cmp44, label %land.lhs.true, label %if.end54

land.lhs.true:                                    ; preds = %for.end40
  %arrayidx46 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 13
  %45 = load i64, i64* %arrayidx46, align 8
  %arrayidx47 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 14
  %46 = load i64, i64* %arrayidx47, align 16
  %cmp48 = icmp eq i64 %45, %46
  br i1 %cmp48, label %land.lhs.true50, label %if.end54

land.lhs.true50:                                  ; preds = %land.lhs.true
  %arrayidx51 = getelementptr inbounds [38 x i64], [38 x i64]* %aux, i64 0, i64 23
  %47 = load i64, i64* %arrayidx51, align 8
  %tobool52 = icmp ne i64 %47, 0
  br i1 %tobool52, label %if.end54, label %if.then53

if.then53:                                        ; preds = %land.lhs.true50
  br label %return

if.end54:                                         ; preds = %land.lhs.true50, %land.lhs.true, %for.end40
  %48 = bitcast [3 x %struct.pollfd]* %pfd to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %48, i8* align 16 bitcast ([3 x %struct.pollfd]* @__const.__init_libc.pfd to i8*), i64 24, i1 false)
  %arraydecay55 = getelementptr inbounds [3 x %struct.pollfd], [3 x %struct.pollfd]* %pfd, i64 0, i64 0
  %49 = ptrtoint %struct.pollfd* %arraydecay55 to i64
  %call = call fastcc i64 @__syscall3(i64 %49) #5
  %conv56 = trunc i64 %call to i32
  store i32 %conv56, i32* %r, align 4
  %50 = load i32, i32* %r, align 4
  %cmp57 = icmp slt i32 %50, 0
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end54
  call fastcc void @a_crash() #5
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.end54
  store i64 0, i64* %i, align 8
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc75, %if.end60
  %51 = load i64, i64* %i, align 8
  %cmp62 = icmp ult i64 %51, 3
  br i1 %cmp62, label %for.body64, label %for.end77

for.body64:                                       ; preds = %for.cond61
  %52 = load i64, i64* %i, align 8
  %arrayidx65 = getelementptr inbounds [3 x %struct.pollfd], [3 x %struct.pollfd]* %pfd, i64 0, i64 %52
  %revents = getelementptr inbounds %struct.pollfd, %struct.pollfd* %arrayidx65, i32 0, i32 2
  %53 = load i16, i16* %revents, align 2
  %conv66 = sext i16 %53 to i32
  %and = and i32 %conv66, 32
  %tobool67 = icmp ne i32 %and, 0
  br i1 %tobool67, label %if.then68, label %if.end74

if.then68:                                        ; preds = %for.body64
  %call69 = call fastcc i64 @__syscall2() #5
  %cmp70 = icmp slt i64 %call69, 0
  br i1 %cmp70, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.then68
  call fastcc void @a_crash() #5
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %if.then68
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %for.body64
  br label %for.inc75

for.inc75:                                        ; preds = %if.end74
  %54 = load i64, i64* %i, align 8
  %inc76 = add i64 %54, 1
  store i64 %inc76, i64* %i, align 8
  br label %for.cond61

for.end77:                                        ; preds = %for.cond61
  store i32 1, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 2), align 8
  br label %return

return:                                           ; preds = %for.end77, %if.then53
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone
define internal fastcc i64 @__syscall3(i64 %a1) unnamed_addr #1 {
entry:
  %n.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %a2.addr = alloca i64, align 8
  %a3.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  store i64 7, i64* %n.addr, align 8
  store i64 %a1, i64* %a1.addr, align 8
  store i64 3, i64* %a2.addr, align 8
  store i64 0, i64* %a3.addr, align 8
  %0 = load i64, i64* %n.addr, align 8
  %1 = load i64, i64* %a1.addr, align 8
  %2 = load i64, i64* %a2.addr, align 8
  %3 = load i64, i64* %a3.addr, align 8
  ret i64 0
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @a_crash() unnamed_addr #1 {
entry:
  call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !6
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal fastcc i64 @__syscall2() unnamed_addr #1 {
entry:
  %n.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %a2.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  store i64 2, i64* %n.addr, align 8
  store i64 ptrtoint ([10 x i8]* @.str.1.2 to i64), i64* %a1.addr, align 8
  store i64 2, i64* %a2.addr, align 8
  %0 = load i64, i64* %n.addr, align 8
  %1 = load i64, i64* %a1.addr, align 8
  %2 = load i64, i64* %a2.addr, align 8
  ret i64 0
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @dummy1(i8* %p) unnamed_addr #1 {
entry:
  %p.addr = alloca i8*, align 8
  store i8* %p, i8** %p.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @__libc_start_main(i32 (i32, i8**, i8**)* %main, i32 %argc, i8** %argv) local_unnamed_addr #1 {
entry:
  %main.addr = alloca i32 (i32, i8**, i8**)*, align 8
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %envp = alloca i8**, align 8
  %stage2 = alloca i32 (i32 (i32, i8**, i8**)*, i32, i8**)*, align 8
  store i32 (i32, i8**, i8**)* %main, i32 (i32, i8**, i8**)** %main.addr, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %1 = load i32, i32* %argc.addr, align 4
  %idx.ext = sext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8*, i8** %0, i64 %idx.ext
  %add.ptr1 = getelementptr inbounds i8*, i8** %add.ptr, i64 1
  store i8** %add.ptr1, i8*** %envp, align 8
  %2 = load i8**, i8*** %envp, align 8
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 0
  %4 = load i8*, i8** %arrayidx, align 8
  call fastcc void @__init_libc(i8** %2, i8* %4) #5
  store i32 (i32 (i32, i8**, i8**)*, i32, i8**)* @libc_start_main_stage2, i32 (i32 (i32, i8**, i8**)*, i32, i8**)** %stage2, align 8
  %5 = load i32 (i32 (i32, i8**, i8**)*, i32, i8**)*, i32 (i32 (i32, i8**, i8**)*, i32, i8**)** %stage2, align 8
  %6 = call i32 (i32 (i32, i8**, i8**)*, i32, i8**)* asm "", "=r,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 (i32 (i32, i8**, i8**)*, i32, i8**)* %5) #6, !srcloc !8
  store i32 (i32 (i32, i8**, i8**)*, i32, i8**)* %6, i32 (i32 (i32, i8**, i8**)*, i32, i8**)** %stage2, align 8
  %7 = load i32 (i32 (i32, i8**, i8**)*, i32, i8**)*, i32 (i32 (i32, i8**, i8**)*, i32, i8**)** %stage2, align 8
  %8 = load i32 (i32, i8**, i8**)*, i32 (i32, i8**, i8**)** %main.addr, align 8
  %9 = load i32, i32* %argc.addr, align 4
  %10 = load i8**, i8*** %argv.addr, align 8
  %call = call i32 %7(i32 (i32, i8**, i8**)* %8, i32 %9, i8** %10) #7
  ret i32 %call
}

; Function Attrs: noinline noreturn nounwind optnone
define internal i32 @libc_start_main_stage2(i32 (i32, i8**, i8**)* %main, i32 %argc, i8** %argv) #3 {
entry:
  %main.addr = alloca i32 (i32, i8**, i8**)*, align 8
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %envp = alloca i8**, align 8
  store i32 (i32, i8**, i8**)* %main, i32 (i32, i8**, i8**)** %main.addr, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %1 = load i32, i32* %argc.addr, align 4
  %idx.ext = sext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8*, i8** %0, i64 %idx.ext
  %add.ptr1 = getelementptr inbounds i8*, i8** %add.ptr, i64 1
  store i8** %add.ptr1, i8*** %envp, align 8
  call fastcc void @libc_start_init() #5
  %2 = load i32 (i32, i8**, i8**)*, i32 (i32, i8**, i8**)** %main.addr, align 8
  %3 = load i32, i32* %argc.addr, align 4
  %4 = load i8**, i8*** %argv.addr, align 8
  %5 = load i8**, i8*** %envp, align 8
  %call = call i32 %2(i32 %3, i8** %4, i8** %5) #7
  call void @exit(i32 %call) #8
  unreachable
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @libc_start_init() unnamed_addr #1 {
entry:
  %a = alloca i64, align 8
  call void @_init() #5
  store i64 ptrtoint (void ()** @__init_array_start to i64), i64* %a, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %a, align 8
  %cmp = icmp ult i64 %0, ptrtoint (void ()** @__init_array_end to i64)
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %a, align 8
  %2 = inttoptr i64 %1 to void ()**
  %3 = load void ()*, void ()** %2, align 8
  call void %3() #7
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %a, align 8
  %add = add i64 %4, 8
  store i64 %add, i64* %a, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @_init() local_unnamed_addr

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @exit(i32 %code) local_unnamed_addr #3 {
entry:
  %code.addr = alloca i32, align 4
  store i32 %code, i32* %code.addr, align 4
  call void @dummy() #5
  call fastcc void @libc_exit_fini() #5
  call void (...) bitcast (void ()* @dummy to void (...)*)() #5
  %0 = load i32, i32* %code.addr, align 4
  call void @_Exit(i32 %0) #8
  unreachable
}

; Function Attrs: noinline nounwind optnone
define internal void @dummy() unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @libc_exit_fini() unnamed_addr #1 {
entry:
  %a = alloca i64, align 8
  store i64 ptrtoint (void ()** @__fini_array_end to i64), i64* %a, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %a, align 8
  %cmp = icmp ugt i64 %0, ptrtoint (void ()** @__fini_array_start to i64)
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %a, align 8
  %sub = sub i64 %1, 8
  %2 = inttoptr i64 %sub to void (...)**
  %3 = load void (...)*, void (...)** %2, align 8
  call void (...) %3() #7
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %a, align 8
  %sub1 = sub i64 %4, 8
  store i64 %sub1, i64* %a, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void (...) @_fini() #5
  ret void
}

declare void @_fini(...) local_unnamed_addr

; Function Attrs: noinline nounwind optnone
define dso_local i32 @printf(i8* noalias %fmt, ...) local_unnamed_addr #1 {
entry:
  %fmt.addr = alloca i8*, align 8
  %res = alloca i32, align 4
  store i8* %fmt, i8** %fmt.addr, align 8
  %0 = call i32 asm sideeffect "INPUT\09$0\0A\09", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !9
  store i32 %0, i32* %res, align 4
  %1 = load i32, i32* %res, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind optnone
define internal fastcc i32 @__init_tp(i8* %p) unnamed_addr #1 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca i8*, align 8
  %td = alloca %struct.__pthread*, align 8
  %r = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  %0 = load i8*, i8** %p.addr, align 8
  %1 = bitcast i8* %0 to %struct.__pthread*
  store %struct.__pthread* %1, %struct.__pthread** %td, align 8
  %2 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %3 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %self = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i32 0, i32 0
  store %struct.__pthread* %2, %struct.__pthread** %self, align 8
  %4 = load i8*, i8** %p.addr, align 8
  %call = call i32 @__set_thread_area(i8* %4) #5
  store i32 %call, i32* %r, align 4
  %5 = load i32, i32* %r, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %r, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  store i32 1, i32* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 0), align 8
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %7 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %detach_state = getelementptr inbounds %struct.__pthread, %struct.__pthread* %7, i32 0, i32 9
  store volatile i32 1, i32* %detach_state, align 8
  %call3 = call fastcc i64 @__syscall1() #5
  %conv = trunc i64 %call3 to i32
  %8 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %tid = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i32 0, i32 7
  store i32 %conv, i32* %tid, align 8
  %9 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %locale = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i32 0, i32 24
  store %struct.__locale_struct* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 10), %struct.__locale_struct** %locale, align 8
  %10 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %robust_list = getelementptr inbounds %struct.__pthread, %struct.__pthread* %10, i32 0, i32 22
  %head = getelementptr inbounds %struct.anon, %struct.anon* %robust_list, i32 0, i32 0
  %11 = bitcast i8** %head to i8*
  %12 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %robust_list4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %12, i32 0, i32 22
  %head5 = getelementptr inbounds %struct.anon, %struct.anon* %robust_list4, i32 0, i32 0
  store volatile i8* %11, i8** %head5, align 8
  %13 = load i64, i64* @__sysinfo, align 8
  %14 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %sysinfo = getelementptr inbounds %struct.__pthread, %struct.__pthread* %14, i32 0, i32 4
  store i64 %13, i64* %sysinfo, align 8
  %15 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %16 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %prev = getelementptr inbounds %struct.__pthread, %struct.__pthread* %16, i32 0, i32 2
  store %struct.__pthread* %15, %struct.__pthread** %prev, align 8
  %17 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %next = getelementptr inbounds %struct.__pthread, %struct.__pthread* %17, i32 0, i32 3
  store %struct.__pthread* %15, %struct.__pthread** %next, align 8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

declare hidden i32 @__set_thread_area(i8*) local_unnamed_addr #4

; Function Attrs: noinline nounwind optnone
define internal fastcc i64 @__syscall1() unnamed_addr #1 {
entry:
  %n.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  store i64 218, i64* %n.addr, align 8
  store i64 ptrtoint (i32* @__thread_list_lock to i64), i64* %a1.addr, align 8
  %0 = load i64, i64* %n.addr, align 8
  %1 = load i64, i64* %a1.addr, align 8
  ret i64 0
}

; Function Attrs: noinline nounwind optnone
define internal fastcc i8* @__copy_tls(i8* %mem) unnamed_addr #1 {
entry:
  %mem.addr = alloca i8*, align 8
  %td = alloca %struct.__pthread*, align 8
  %p = alloca %struct.tls_module*, align 8
  %i = alloca i64, align 8
  %dtv = alloca i64*, align 8
  store i8* %mem, i8** %mem.addr, align 8
  %0 = load i8*, i8** %mem.addr, align 8
  %1 = bitcast i8* %0 to i64*
  store i64* %1, i64** %dtv, align 8
  %2 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 6), align 8
  %sub = sub i64 %2, 224
  %3 = load i8*, i8** %mem.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %sub
  store i8* %add.ptr, i8** %mem.addr, align 8
  %4 = load i8*, i8** %mem.addr, align 8
  %5 = ptrtoint i8* %4 to i64
  %6 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 7), align 8
  %sub1 = sub i64 %6, 1
  %and = and i64 %5, %sub1
  %7 = load i8*, i8** %mem.addr, align 8
  %idx.neg = sub i64 0, %and
  %add.ptr2 = getelementptr inbounds i8, i8* %7, i64 %idx.neg
  store i8* %add.ptr2, i8** %mem.addr, align 8
  %8 = load i8*, i8** %mem.addr, align 8
  %9 = bitcast i8* %8 to %struct.__pthread*
  store %struct.__pthread* %9, %struct.__pthread** %td, align 8
  store i64 1, i64* %i, align 8
  %10 = load %struct.tls_module*, %struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 5), align 8
  store %struct.tls_module* %10, %struct.tls_module** %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load %struct.tls_module*, %struct.tls_module** %p, align 8
  %tobool = icmp ne %struct.tls_module* %11, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %mem.addr, align 8
  %13 = load %struct.tls_module*, %struct.tls_module** %p, align 8
  %offset = getelementptr inbounds %struct.tls_module, %struct.tls_module* %13, i32 0, i32 5
  %14 = load i64, i64* %offset, align 8
  %idx.neg3 = sub i64 0, %14
  %add.ptr4 = getelementptr inbounds i8, i8* %12, i64 %idx.neg3
  %15 = ptrtoint i8* %add.ptr4 to i64
  %add = add i64 %15, 0
  %16 = load i64*, i64** %dtv, align 8
  %17 = load i64, i64* %i, align 8
  %arrayidx = getelementptr inbounds i64, i64* %16, i64 %17
  store i64 %add, i64* %arrayidx, align 8
  %18 = load i8*, i8** %mem.addr, align 8
  %19 = load %struct.tls_module*, %struct.tls_module** %p, align 8
  %offset5 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %19, i32 0, i32 5
  %20 = load i64, i64* %offset5, align 8
  %idx.neg6 = sub i64 0, %20
  %add.ptr7 = getelementptr inbounds i8, i8* %18, i64 %idx.neg6
  %21 = load %struct.tls_module*, %struct.tls_module** %p, align 8
  %image = getelementptr inbounds %struct.tls_module, %struct.tls_module* %21, i32 0, i32 1
  %22 = load i8*, i8** %image, align 8
  %23 = load %struct.tls_module*, %struct.tls_module** %p, align 8
  %len = getelementptr inbounds %struct.tls_module, %struct.tls_module* %23, i32 0, i32 2
  %24 = load i64, i64* %len, align 8
  %call = call i8* @memcpy(i8* %add.ptr7, i8* %22, i64 %24) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i64, i64* %i, align 8
  %inc = add i64 %25, 1
  store i64 %inc, i64* %i, align 8
  %26 = load %struct.tls_module*, %struct.tls_module** %p, align 8
  %next = getelementptr inbounds %struct.tls_module, %struct.tls_module* %26, i32 0, i32 0
  %27 = load %struct.tls_module*, %struct.tls_module** %next, align 8
  store %struct.tls_module* %27, %struct.tls_module** %p, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %28 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 8), align 8
  %29 = load i64*, i64** %dtv, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %29, i64 0
  store i64 %28, i64* %arrayidx8, align 8
  %30 = load i64*, i64** %dtv, align 8
  %31 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %dtv_copy = getelementptr inbounds %struct.__pthread, %struct.__pthread* %31, i32 0, i32 29
  store i64* %30, i64** %dtv_copy, align 8
  %32 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %dtv9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %32, i32 0, i32 1
  store i64* %30, i64** %dtv9, align 8
  %33 = load %struct.__pthread*, %struct.__pthread** %td, align 8
  %34 = bitcast %struct.__pthread* %33 to i8*
  ret i8* %34
}

declare dso_local i8* @memcpy(i8*, i8*, i64) local_unnamed_addr #4

; Function Attrs: noinline nounwind optnone
define internal fastcc void @static_init_tls(i64* %aux) unnamed_addr #1 {
entry:
  %aux.addr = alloca i64*, align 8
  %p = alloca i8*, align 8
  %n = alloca i64, align 8
  %phdr = alloca %struct.Elf64_Phdr*, align 8
  %tls_phdr = alloca %struct.Elf64_Phdr*, align 8
  %base = alloca i64, align 8
  %mem = alloca i8*, align 8
  store i64* %aux, i64** %aux.addr, align 8
  store %struct.Elf64_Phdr* null, %struct.Elf64_Phdr** %tls_phdr, align 8
  store i64 0, i64* %base, align 8
  %0 = load i64*, i64** %aux.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 3
  %1 = load i64, i64* %arrayidx, align 8
  %2 = inttoptr i64 %1 to i8*
  store i8* %2, i8** %p, align 8
  %3 = load i64*, i64** %aux.addr, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 5
  %4 = load i64, i64* %arrayidx1, align 8
  store i64 %4, i64* %n, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %n, align 8
  %tobool = icmp ne i64 %5, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %p, align 8
  %7 = bitcast i8* %6 to %struct.Elf64_Phdr*
  store %struct.Elf64_Phdr* %7, %struct.Elf64_Phdr** %phdr, align 8
  %8 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_type = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %8, i32 0, i32 0
  %9 = load i32, i32* %p_type, align 8
  %cmp = icmp eq i32 %9, 6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %10 = load i64*, i64** %aux.addr, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 3
  %11 = load i64, i64* %arrayidx2, align 8
  %12 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_vaddr = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %12, i32 0, i32 3
  %13 = load i64, i64* %p_vaddr, align 8
  %sub = sub i64 %11, %13
  store i64 %sub, i64* %base, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %14 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_type3 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %14, i32 0, i32 0
  %15 = load i32, i32* %p_type3, align 8
  %cmp4 = icmp eq i32 %15, 2
  br i1 %cmp4, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %if.end
  br i1 icmp ne (i64* getelementptr inbounds ([0 x i64], [0 x i64]* @_DYNAMIC, i64 0, i64 0), i64* null), label %if.then5, label %if.end8

if.then5:                                         ; preds = %land.lhs.true
  %16 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_vaddr6 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %16, i32 0, i32 3
  %17 = load i64, i64* %p_vaddr6, align 8
  %sub7 = sub i64 ptrtoint ([0 x i64]* @_DYNAMIC to i64), %17
  store i64 %sub7, i64* %base, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then5, %land.lhs.true, %if.end
  %18 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_type9 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %18, i32 0, i32 0
  %19 = load i32, i32* %p_type9, align 8
  %cmp10 = icmp eq i32 %19, 7
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  %20 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  store %struct.Elf64_Phdr* %20, %struct.Elf64_Phdr** %tls_phdr, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end8
  %21 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_type13 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %21, i32 0, i32 0
  %22 = load i32, i32* %p_type13, align 8
  %cmp14 = icmp eq i32 %22, 1685382481
  br i1 %cmp14, label %land.lhs.true15, label %if.end24

land.lhs.true15:                                  ; preds = %if.end12
  %23 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_memsz = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %23, i32 0, i32 6
  %24 = load i64, i64* %p_memsz, align 8
  %25 = load i32, i32* @__default_stacksize, align 4
  %conv = zext i32 %25 to i64
  %cmp16 = icmp ugt i64 %24, %conv
  br i1 %cmp16, label %if.then18, label %if.end24

if.then18:                                        ; preds = %land.lhs.true15
  %26 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_memsz19 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %26, i32 0, i32 6
  %27 = load i64, i64* %p_memsz19, align 8
  %cmp20 = icmp ult i64 %27, 8388608
  br i1 %cmp20, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then18
  %28 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %phdr, align 8
  %p_memsz22 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %28, i32 0, i32 6
  %29 = load i64, i64* %p_memsz22, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.then18
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %29, %cond.true ], [ 8388608, %cond.false ]
  %conv23 = trunc i64 %cond to i32
  store i32 %conv23, i32* @__default_stacksize, align 4
  br label %if.end24

if.end24:                                         ; preds = %cond.end, %land.lhs.true15, %if.end12
  br label %for.inc

for.inc:                                          ; preds = %if.end24
  %30 = load i64, i64* %n, align 8
  %dec = add i64 %30, -1
  store i64 %dec, i64* %n, align 8
  %31 = load i64*, i64** %aux.addr, align 8
  %arrayidx25 = getelementptr inbounds i64, i64* %31, i64 4
  %32 = load i64, i64* %arrayidx25, align 8
  %33 = load i8*, i8** %p, align 8
  %add.ptr = getelementptr inbounds i8, i8* %33, i64 %32
  store i8* %add.ptr, i8** %p, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %34 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %tls_phdr, align 8
  %tobool26 = icmp ne %struct.Elf64_Phdr* %34, null
  br i1 %tobool26, label %if.then27, label %if.end30

if.then27:                                        ; preds = %for.end
  %35 = load i64, i64* %base, align 8
  %36 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %tls_phdr, align 8
  %p_vaddr28 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %36, i32 0, i32 3
  %37 = load i64, i64* %p_vaddr28, align 8
  %add = add i64 %35, %37
  %38 = inttoptr i64 %add to i8*
  store i8* %38, i8** getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 1), align 8
  %39 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %tls_phdr, align 8
  %p_filesz = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %39, i32 0, i32 5
  %40 = load i64, i64* %p_filesz, align 8
  store i64 %40, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 2), align 8
  %41 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %tls_phdr, align 8
  %p_memsz29 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %41, i32 0, i32 6
  %42 = load i64, i64* %p_memsz29, align 8
  store i64 %42, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 3), align 8
  %43 = load %struct.Elf64_Phdr*, %struct.Elf64_Phdr** %tls_phdr, align 8
  %p_align = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %43, i32 0, i32 7
  %44 = load i64, i64* %p_align, align 8
  store i64 %44, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 4), align 8
  store i64 1, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 8), align 8
  store %struct.tls_module* @main_tls, %struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 5), align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %for.end
  %45 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 3), align 8
  %sub31 = sub i64 0, %45
  %46 = load i8*, i8** getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 1), align 8
  %47 = ptrtoint i8* %46 to i64
  %sub32 = sub i64 %sub31, %47
  %48 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 4), align 8
  %sub33 = sub i64 %48, 1
  %and = and i64 %sub32, %sub33
  %49 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 3), align 8
  %add34 = add i64 %49, %and
  store i64 %add34, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 3), align 8
  %50 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 3), align 8
  store i64 %50, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 5), align 8
  %51 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 4), align 8
  %cmp35 = icmp ult i64 %51, 8
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end30
  store i64 8, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 4), align 8
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end30
  %52 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 4), align 8
  store i64 %52, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 7), align 8
  %53 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 3), align 8
  %add39 = add i64 240, %53
  %54 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i32 0, i32 4), align 8
  %add40 = add i64 %add39, %54
  %add41 = add i64 %add40, 8
  %sub42 = sub i64 %add41, 1
  %and43 = and i64 %sub42, -8
  store i64 %and43, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 6), align 8
  %55 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 6), align 8
  %cmp44 = icmp ugt i64 %55, 360
  br i1 %cmp44, label %if.then46, label %if.else

if.then46:                                        ; preds = %if.end38
  %56 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i32 0, i32 6), align 8
  %call = call fastcc i64 @__syscall6(i64 %56) #5
  %57 = inttoptr i64 %call to i8*
  store i8* %57, i8** %mem, align 8
  br label %if.end47

if.else:                                          ; preds = %if.end38
  store i8* getelementptr inbounds ([1 x %struct.builtin_tls], [1 x %struct.builtin_tls]* @builtin_tls, i32 0, i32 0, i32 0), i8** %mem, align 8
  br label %if.end47

if.end47:                                         ; preds = %if.else, %if.then46
  %58 = load i8*, i8** %mem, align 8
  %call48 = call fastcc i8* @__copy_tls(i8* %58) #5
  %call49 = call fastcc i32 @__init_tp(i8* %call48) #5
  %cmp50 = icmp slt i32 %call49, 0
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end47
  call fastcc void @a_crash.21() #5
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %if.end47
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal fastcc i64 @__syscall6(i64 %a2) unnamed_addr #1 {
entry:
  %n.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %a2.addr = alloca i64, align 8
  %a3.addr = alloca i64, align 8
  %a4.addr = alloca i64, align 8
  %a5.addr = alloca i64, align 8
  %a6.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  %r10 = alloca i64, align 8
  %r8 = alloca i64, align 8
  %r9 = alloca i64, align 8
  store i64 9, i64* %n.addr, align 8
  store i64 0, i64* %a1.addr, align 8
  store i64 %a2, i64* %a2.addr, align 8
  store i64 3, i64* %a3.addr, align 8
  store i64 34, i64* %a4.addr, align 8
  store i64 -1, i64* %a5.addr, align 8
  store i64 0, i64* %a6.addr, align 8
  %0 = load i64, i64* %a4.addr, align 8
  store i64 %0, i64* %r10, align 8
  %1 = load i64, i64* %a5.addr, align 8
  store i64 %1, i64* %r8, align 8
  %2 = load i64, i64* %a6.addr, align 8
  store i64 %2, i64* %r9, align 8
  %3 = load i64, i64* %n.addr, align 8
  %4 = load i64, i64* %a1.addr, align 8
  %5 = load i64, i64* %a2.addr, align 8
  %6 = load i64, i64* %a3.addr, align 8
  %7 = load i64, i64* %r10, align 8
  %8 = load i64, i64* %r8, align 8
  %9 = load i64, i64* %r9, align 8
  ret i64 0
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @a_crash.21() unnamed_addr #1 {
entry:
  call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !12
  ret void
}

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @_Exit(i32 %ec) local_unnamed_addr #3 {
entry:
  %ec.addr = alloca i32, align 4
  store i32 %ec, i32* %ec.addr, align 4
  %0 = load i32, i32* %ec.addr, align 4
  %conv = sext i32 %0 to i64
  call fastcc void @__syscall1.24(i64 231, i64 %conv) #5
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %1 = load i32, i32* %ec.addr, align 4
  %conv1 = sext i32 %1 to i64
  call fastcc void @__syscall1.24(i64 60, i64 %conv1) #5
  br label %for.cond
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @__syscall1.24(i64 %n, i64 %a1) unnamed_addr #1 {
entry:
  %n.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %ret = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 %a1, i64* %a1.addr, align 8
  %0 = load i64, i64* %n.addr, align 8
  %1 = load i64, i64* %a1.addr, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noinline noreturn nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin }
attributes #8 = { nobuiltin noreturn "no-builtins" }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"ThinLTO", i32 0}
!3 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!4 = !{i32 1, !"LTOPostLink", i32 1}
!5 = !{i32 206109}
!6 = !{i32 215360}
!7 = !{i32 205897}
!8 = !{i32 2274}
!9 = !{i32 137, i32 149}
!10 = !{i32 323734}
!11 = !{i32 325111}
!12 = !{i32 333383}
!13 = !{i32 59794}
