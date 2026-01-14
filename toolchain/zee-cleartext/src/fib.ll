; ModuleID = 'fib.c'
source_filename = "fib.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @Fib(i32 %index) #0 {
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
  %call = call i32 @Fib(i32 %sub)
  %3 = load i32, i32* %index.addr, align 4
  %sub2 = sub nsw i32 %3, 2
  %call3 = call i32 @Fib(i32 %sub2)
  %add = add nsw i32 %call, %call3
  store i32 %add, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %input = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = call i32 asm sideeffect "INPUT\09$0\0A\09", "=r,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  store i32 %0, i32* %input, align 4
  %1 = load i32, i32* %input, align 4
  %call = call i32 @Fib(i32 %1)
  store i32 %call, i32* %res, align 4
  %2 = load i32, i32* %res, align 4
  call void asm sideeffect "OUTPUT\09$0\0A\09", "r,~{dirflag},~{fpsr},~{flags}"(i32 %2) #1, !srcloc !4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.0 "}
!3 = !{i32 149, i32 161}
!4 = !{i32 229, i32 242}
