; ModuleID = 'a.out.0.5.precodegen.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %retval = alloca i32, align 4
  %sum = alloca i32, align 4
  %cnt = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %sum, align 4
  %call = call fastcc i32 @ZKInput()
  store i32 %call, i32* %cnt, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %cnt, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %cnt, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call fastcc i32 @ZKInput()
  store i32 %call1, i32* %tmp, align 4
  %1 = load i32, i32* %tmp, align 4
  %2 = load i32, i32* %sum, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, i32* %sum, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load i32, i32* %sum, align 4
  call fastcc void @ZKOutput(i32 %3)
  ret i32 0
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
