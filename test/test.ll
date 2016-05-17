; ModuleID = 'test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @func7(i64 %p1, i64 %p2) #0 {
  %1 = add nsw i64 %p2, %p1
  %2 = sub nsw i64 %p1, %p2
  %3 = tail call i64 asm "add %rsi, %rdi\0A\09mov %rdi, %rax\0A\09", "=r,r,r,~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %1, i64 %2) #1, !srcloc !1
  ret i64 %3
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
!1 = metadata !{i32 118, i32 137, i32 163}
