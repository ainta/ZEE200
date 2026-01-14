; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp sgt i32 %4, %5
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  ret i32 0

8:                                                ; preds = %7, %0
  ret i32 0
}
