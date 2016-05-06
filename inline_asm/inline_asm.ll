; ModuleID = 'inline_asm.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arg1 = alloca i32, align 4
  %arg2 = alloca i32, align 4
  %add = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32* %arg1, align 4
  %3 = load i32* %arg2, align 4
  %4 = call i32 asm "addl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %2, i32 %3) #1, !srcloc !1
  store i32 %4, i32* %add, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
!1 = metadata !{i32 51}
