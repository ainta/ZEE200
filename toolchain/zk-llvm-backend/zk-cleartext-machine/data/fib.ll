; ModuleID = 'a.out.0.5.precodegen.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define internal fastcc i32 @Fib(i32 %index) unnamed_addr #0 {
entry:
  %retval = alloca i32, align 4
  %index.addr = alloca i32, align 4
  store i32 %index, i32* %index.addr, align 4
  %0 = load i32, i32* %index.addr, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %index.addr, align 4
  %cmp1 = icmp eq i32 %1, 2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  %2 = load i32, i32* %index.addr, align 4
  %sub = sub nsw i32 %2, 1
  %call = call fastcc i32 @Fib(i32 %sub)
  %3 = load i32, i32* %index.addr, align 4
  %sub2 = sub nsw i32 %3, 2
  %call3 = call fastcc i32 @Fib(i32 %sub2)
  %add = add nsw i32 %call, %call3
  store i32 %add, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %retval = alloca i32, align 4
  %in = alloca i32, align 4
  %out = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call fastcc i32 @ZKInput()
  store i32 %call, i32* %in, align 4
  %0 = load i32, i32* %in, align 4
  %call1 = call fastcc i32 @Fib(i32 %0)
  store i32 %call1, i32* %out, align 4
  %1 = load i32, i32* %out, align 4
  call fastcc void @ZKOutput(i32 %1)
  store i32 0, i32* %res, align 4
  %2 = load i32, i32* %res, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone
define internal fastcc i32 @ZKInput() unnamed_addr #0 {
entry:
  %res = alloca i32, align 4
  %0 = call i32 asm sideeffect "INPUT\09$0\0A\09", "=r,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !6
  store i32 %0, i32* %res, align 4
  %1 = load i32, i32* %res, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind optnone
define internal fastcc void @ZKOutput(i32 %data) unnamed_addr #0 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  %0 = load i32, i32* %data.addr, align 4
  call void asm sideeffect "OUTPUT\09$0\0A\09", "r,~{dirflag},~{fpsr},~{flags}"(i32 %0) #1, !srcloc !7
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"NumRegisterParameters", i32 0}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 1, !"ThinLTO", i32 0}
!4 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!5 = !{i32 1, !"LTOPostLink", i32 1}
!6 = !{i32 61, i32 73}
!7 = !{i32 157, i32 170}
