; ModuleID = 'test_asm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @func7(i64 %p1, i64 %p2) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %out = alloca i64, align 8
  %sum = alloca i64, align 8
  %minus = alloca i64, align 8
  store i64 %p1, i64* %1, align 8
  store i64 %p2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = add nsw i64 %3, %4
  store i64 %5, i64* %sum, align 8
  %6 = load i64* %1, align 8
  %7 = load i64* %2, align 8
  %8 = sub nsw i64 %6, %7
  store i64 %8, i64* %minus, align 8
  %9 = load i64* %sum, align 8
  %10 = load i64* %minus, align 8
  %11 = call i64 asm "add %rsi, %rdi\0A\09mov %rdi, %rax\0A\09", "=r,r,r,~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %9, i64 %10) #1, !srcloc !1
  store i64 %11, i64* %out, align 8
  %12 = load i64* %out, align 8
  ret i64 %12
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
!1 = metadata !{i32 140, i32 159, i32 185}
