; ModuleID = 'lifted_inline_asm.bc'

define i64 @lifted_inline_asm(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = call i64 asm "add %rsi, %rdi\0A\09mov %rdi, %rax\0A\09", "=r,r,r,~{cc},~{dirflag},~{fpsr},~{flags}"(i64 %0, i64 %1)
  ret i64 %6
}
