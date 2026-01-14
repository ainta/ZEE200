; ModuleID = 'segtree.c'
source_filename = "segtree.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Node = type { i32, i32, i32 }

@N = dso_local constant i32 100000, align 4
@t = common dso_local global [100000 x %struct.Node] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Init(i32 %0, i32 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load i32, i32* %4, align 4
  %9 = load i32, i32* %6, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Node, %struct.Node* %11, i32 0, i32 1
  store i32 %8, i32* %12, align 4
  %13 = load i32, i32* %5, align 4
  %14 = load i32, i32* %6, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Node, %struct.Node* %16, i32 0, i32 2
  store i32 %13, i32* %17, align 4
  %18 = load i32, i32* %4, align 4
  %19 = load i32, i32* %5, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %26

21:                                               ; preds = %3
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Node, %struct.Node* %24, i32 0, i32 0
  store i32 1, i32* %25, align 4
  br label %59

26:                                               ; preds = %3
  %27 = load i32, i32* %4, align 4
  %28 = load i32, i32* %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = ashr i32 %29, 1
  store i32 %30, i32* %7, align 4
  %31 = load i32, i32* %4, align 4
  %32 = load i32, i32* %7, align 4
  %33 = load i32, i32* %6, align 4
  %34 = mul nsw i32 %33, 2
  call void @Init(i32 %31, i32 %32, i32 %34)
  %35 = load i32, i32* %7, align 4
  %36 = add nsw i32 %35, 1
  %37 = load i32, i32* %5, align 4
  %38 = load i32, i32* %6, align 4
  %39 = mul nsw i32 %38, 2
  %40 = add nsw i32 %39, 1
  call void @Init(i32 %36, i32 %37, i32 %40)
  %41 = load i32, i32* %6, align 4
  %42 = mul nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %43
  %45 = getelementptr inbounds %struct.Node, %struct.Node* %44, i32 0, i32 0
  %46 = load i32, i32* %45, align 4
  %47 = load i32, i32* %6, align 4
  %48 = mul nsw i32 %47, 2
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %50
  %52 = getelementptr inbounds %struct.Node, %struct.Node* %51, i32 0, i32 0
  %53 = load i32, i32* %52, align 4
  %54 = add nsw i32 %46, %53
  %55 = load i32, i32* %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.Node, %struct.Node* %57, i32 0, i32 0
  store i32 %54, i32* %58, align 4
  br label %59

59:                                               ; preds = %26, %21
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @Quote(i32 %0, i32 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %6, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  store i32 0, i32* %4, align 4
  br label %78

13:                                               ; preds = %3
  %14 = load i32, i32* %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Node, %struct.Node* %16, i32 0, i32 1
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %5, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %35

21:                                               ; preds = %13
  %22 = load i32, i32* %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Node, %struct.Node* %24, i32 0, i32 2
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %6, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %35

29:                                               ; preds = %21
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.Node, %struct.Node* %32, i32 0, i32 0
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %4, align 4
  br label %78

35:                                               ; preds = %21, %13
  %36 = load i32, i32* %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.Node, %struct.Node* %38, i32 0, i32 1
  %40 = load i32, i32* %39, align 4
  %41 = load i32, i32* %7, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100000 x %struct.Node], [100000 x %struct.Node]* @t, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.Node, %struct.Node* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 4
  %46 = add nsw i32 %40, %45
  %47 = ashr i32 %46, 1
  store i32 %47, i32* %8, align 4
  %48 = load i32, i32* %5, align 4
  %49 = load i32, i32* %6, align 4
  %50 = load i32, i32* %8, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %54

52:                                               ; preds = %35
  %53 = load i32, i32* %6, align 4
  br label %56

54:                                               ; preds = %35
  %55 = load i32, i32* %8, align 4
  br label %56

56:                                               ; preds = %54, %52
  %57 = phi i32 [ %53, %52 ], [ %55, %54 ]
  %58 = load i32, i32* %7, align 4
  %59 = mul nsw i32 %58, 2
  %60 = call i32 @Quote(i32 %48, i32 %57, i32 %59)
  %61 = load i32, i32* %8, align 4
  %62 = add nsw i32 %61, 1
  %63 = load i32, i32* %5, align 4
  %64 = icmp sgt i32 %62, %63
  br i1 %64, label %65, label %68

65:                                               ; preds = %56
  %66 = load i32, i32* %8, align 4
  %67 = add nsw i32 %66, 1
  br label %70

68:                                               ; preds = %56
  %69 = load i32, i32* %5, align 4
  br label %70

70:                                               ; preds = %68, %65
  %71 = phi i32 [ %67, %65 ], [ %69, %68 ]
  %72 = load i32, i32* %6, align 4
  %73 = load i32, i32* %7, align 4
  %74 = mul nsw i32 %73, 2
  %75 = add nsw i32 %74, 1
  %76 = call i32 @Quote(i32 %71, i32 %72, i32 %75)
  %77 = add nsw i32 %60, %76
  store i32 %77, i32* %4, align 4
  br label %78

78:                                               ; preds = %70, %29, %12
  %79 = load i32, i32* %4, align 4
  ret i32 %79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @Init(i32 1, i32 100, i32 1)
  %3 = call i32 @Quote(i32 20, i32 40, i32 1)
  store i32 %3, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  ret i32 %4
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 "}
