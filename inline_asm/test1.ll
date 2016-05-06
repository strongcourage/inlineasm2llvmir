; ModuleID = 'test1.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arg1 = alloca i64, align 8
  %arg2 = alloca i64, align 8
  %ret = alloca i64, align 8
  store i32 0, i32* %1
  store i64 1, i64* %arg1, align 8
  store i64 2, i64* %arg2, align 8
  store i64 0, i64* %ret, align 8
  %2 = load i64* %arg1, align 8
  %3 = load i64* %arg2, align 8
  %aaa = call i64 @manh_dung(i64 %2, i64 %3, i64 %2, i64 %2, i64 %2, i64 %2)
  store i64 %aaa, i64* %ret, align 8
  ret i32 0
}

define private i64 @manh_dung(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
