; ModuleID = 'main_sum_merge.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arg1 = alloca i32, align 4
  %arg2 = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %arg1, align 4
  store i32 2, i32* %arg2, align 4
  %2 = load i32* %arg1, align 4
  %3 = load i32* %arg2, align 4
  %4 = call i32 (i32, i32, ...)* bitcast (i32 (i32, i32)* @sum to i32 (i32, i32, ...)*)(i32 %2, i32 %3)
  store i32 %4, i32* %ret, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @sum(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
