; ModuleID = 'inline_asm_new.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @sum(i32 %x, i32 %y) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !15), !dbg !16
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !17), !dbg !18
  %1 = tail call i32 asm "addl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %x, i32 %y) #2, !dbg !19, !srcloc !20
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !21), !dbg !22
  ret i32 %1, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !24, i64 0, metadata !25) #2, !dbg !27
  tail call void @llvm.dbg.value(metadata !24, i64 0, metadata !28) #2, !dbg !29
  %1 = tail call i32 asm "addl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 undef, i32 undef) #2, !dbg !30, !srcloc !20
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !31) #2, !dbg !32
  ret i32 0, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/dungnguyen/trident/tests/static_lift/bin_tests/x86_64/inline_asm/inline_asm_new.c] [DW_LANG_C99]
!1 = metadata !{metadata !"inline_asm_new.c", metadata !"/home/dungnguyen/trident/tests/static_lift/bin_tests/x86_64/inline_asm"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sum", metadata !"sum", metadata !"", i32 1, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @sum, null, null, metadata !2, i32 1} ; [ DW_TAG_subprogram ] [line 1] [def] [sum]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/dungnguyen/trident/tests/static_lift/bin_tests/x86_64/inline_asm/inline_asm_new.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 9, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777217, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 1]
!16 = metadata !{i32 1, i32 13, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554433, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 1]
!18 = metadata !{i32 1, i32 20, metadata !4, null}
!19 = metadata !{i32 3, i32 2, metadata !4, null}
!20 = metadata !{i32 47}
!21 = metadata !{i32 786688, metadata !4, metadata !"ret", metadata !5, i32 2, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 2]
!22 = metadata !{i32 2, i32 6, metadata !4, null}
!23 = metadata !{i32 6, i32 2, metadata !4, null}
!24 = metadata !{i32 undef}
!25 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777217, metadata !8, i32 0, metadata !26} ; [ DW_TAG_arg_variable ] [x] [line 1]
!26 = metadata !{i32 13, i32 8, metadata !9, null}
!27 = metadata !{i32 1, i32 13, metadata !4, metadata !26}
!28 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554433, metadata !8, i32 0, metadata !26} ; [ DW_TAG_arg_variable ] [y] [line 1]
!29 = metadata !{i32 1, i32 20, metadata !4, metadata !26}
!30 = metadata !{i32 3, i32 2, metadata !4, metadata !26}
!31 = metadata !{i32 786688, metadata !4, metadata !"ret", metadata !5, i32 2, metadata !8, i32 0, metadata !26} ; [ DW_TAG_auto_variable ] [ret] [line 2]
!32 = metadata !{i32 2, i32 6, metadata !4, metadata !26}
!33 = metadata !{i32 15, i32 2, metadata !9, null}
