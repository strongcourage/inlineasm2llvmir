; ModuleID = 'inline_asm.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str1 = private constant [15 x i8] c"divide by zero\00", align 1
@.str2 = private constant [8 x i8] c"div.err\00", align 1
@.str3 = private constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private constant [16 x i8] c"overshift error\00", align 1
@.str25 = private constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private constant [14 x i8] c"invalid range\00", align 1
@.str28 = private constant [5 x i8] c"user\00", align 1

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %arg1 = alloca i32
  %arg2 = alloca i32
  %add = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %1 = load i32* %arg1, align 4, !dbg !122
  %2 = load i32* %arg2, align 4, !dbg !122
  %asmtmp = call i32 asm "addl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %1, i32 %2) nounwind, !dbg !122
  store i32 %asmtmp, i32* %add, !dbg !122
  store i32 0, i32* %0, align 4, !dbg !124
  %3 = load i32* %0, align 4, !dbg !124
  store i32 %3, i32* %retval, align 4, !dbg !124
  %retval1 = load i32* %retval, !dbg !124
  ret i32 %retval1, !dbg !124
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !125
  br i1 %0, label %bb, label %return, !dbg !125

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) noreturn nounwind, !dbg !1
  unreachable, !dbg !127

return:                                           ; preds = %entry
  ret void, !dbg !128
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @klee_int(i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %x1 = bitcast i32* %x to i8*, !dbg !129
  call void @klee_make_symbolic(i8* %x1, i64 4, i8* %name) nounwind, !dbg !129
  %0 = load i32* %x, align 4, !dbg !130
  ret i32 %0, !dbg !130
}

declare void @klee_make_symbolic(i8*, i64, i8*)

define void @klee_overshift_check(i64 %bitWidth, i64 %shift) nounwind {
entry:
  %0 = icmp ult i64 %shift, %bitWidth, !dbg !131
  br i1 %0, label %return, label %bb, !dbg !131

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) noreturn nounwind, !dbg 
  unreachable, !dbg !133

return:                                           ; preds = %entry
  ret void, !dbg !134
}

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %0 = icmp slt i32 %start, %end, !dbg !135
  br i1 %0, label %bb1, label %bb, !dbg !135

bb:                                               ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) noreturn nounwind, !dbg !136
  unreachable, !dbg !136

bb1:                                              ; preds = %entry
  %1 = add nsw i32 %start, 1, !dbg !137
  %2 = icmp eq i32 %1, %end, !dbg !137
  br i1 %2, label %bb8, label %bb3, !dbg !137

bb3:                                              ; preds = %bb1
  %x4 = bitcast i32* %x to i8*, !dbg !138
  call void @klee_make_symbolic(i8* %x4, i64 4, i8* %name) nounwind, !dbg !138
  %3 = icmp eq i32 %start, 0, !dbg !139
  %4 = load i32* %x, align 4, !dbg !140
  br i1 %3, label %bb5, label %bb6, !dbg !139

bb5:                                              ; preds = %bb3
  %5 = icmp ult i32 %4, %end, !dbg !140
  %6 = zext i1 %5 to i64, !dbg !140
  call void @klee_assume(i64 %6) nounwind, !dbg !140
  br label %bb7, !dbg !140

bb6:                                              ; preds = %bb3
  %7 = icmp sge i32 %4, %start, !dbg !141
  %8 = zext i1 %7 to i64, !dbg !141
  call void @klee_assume(i64 %8) nounwind, !dbg !141
  %9 = load i32* %x, align 4, !dbg !142
  %10 = icmp slt i32 %9, %end, !dbg !142
  %11 = zext i1 %10 to i64, !dbg !142
  call void @klee_assume(i64 %11) nounwind, !dbg !142
  br label %bb7, !dbg !142

bb7:                                              ; preds = %bb6, %bb5
  %12 = load i32* %x, align 4, !dbg !143
  br label %bb8, !dbg !143

bb8:                                              ; preds = %bb7, %bb1
  %.0 = phi i32 [ %12, %bb7 ], [ %start, %bb1 ]
  ret i32 %.0, !dbg !144
}

declare void @klee_assume(i64)

define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) nounwind {
entry:
  %0 = icmp eq i64 %len, 0, !dbg !145
  br i1 %0, label %bb2, label %bb, !dbg !145

bb:                                               ; preds = %bb, %entry
  %indvar = phi i64 [ %indvar.next, %bb ], [ 0, %entry ]
  %dest.05 = getelementptr i8* %destaddr, i64 %indvar
  %src.06 = getelementptr i8* %srcaddr, i64 %indvar
  %1 = load i8* %src.06, align 1, !dbg !146
  store i8 %1, i8* %dest.05, align 1, !dbg !146
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %len
  br i1 %exitcond1, label %bb1.bb2_crit_edge, label %bb, !dbg !145

bb1.bb2_crit_edge:                                ; preds = %bb
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %bb2

bb2:                                              ; preds = %bb1.bb2_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %bb1.bb2_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !147
}

!llvm.dbg.sp = !{!0, !6, !12, !21, !27, !36, !45, !54, !63}
!llvm.dbg.lv.klee_div_zero_check = !{!73}
!llvm.dbg.lv.klee_int = !{!74, !75}
!llvm.dbg.lv.klee_overshift_check = !{!77, !78}
!llvm.dbg.lv.klee_range = !{!79, !80, !81, !82}
!llvm.dbg.lv.memcpy = !{!84, !85, !86, !87, !91}
!llvm.dbg.lv.memmove = !{!94, !95, !96, !97, !101}
!llvm.dbg.lv.mempcpy = !{!104, !105, !106, !107, !111}
!llvm.dbg.lv.memset = !{!114, !115, !116, !117}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 1, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"inline_asm.c", metadata !"/home/dungnguyen/angelix/src/klee/examples/inline_asm/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"inline_asm.c", metadata !"/home/dungnguyen/angelix/src/klee/examples/inline_asm/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TA
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !7, i32 12, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @kle
!7 = metadata !{i32 589865, metadata !"klee_div_zero_check.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !8} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [
!9 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{null, metadata !11}
!11 = metadata !{i32 589860, metadata !7, metadata !"long long int", metadata !7, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 589870, i32 0, metadata !13, metadata !"klee_int", metadata !"klee_int", metadata !"klee_int", metadata !13, i32 13, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 589865, metadata !"klee_int.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !14} ; [ DW_TAG_file_type ]
!14 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_int.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_co
!15 = metadata !{i32 589845, metadata !13, metadata !"", metadata !13, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null} ; [ DW_TAG_subroutine_type ]
!16 = metadata !{metadata !17, metadata !18}
!17 = metadata !{i32 589860, metadata !13, metadata !"int", metadata !13, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!18 = metadata !{i32 589839, metadata !13, metadata !"", metadata !13, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ]
!19 = metadata !{i32 589862, metadata !13, metadata !"", metadata !13, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ]
!20 = metadata !{i32 589860, metadata !13, metadata !"char", metadata !13, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 589870, i32 0, metadata !22, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !22, i32 20, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64
!22 = metadata !{i32 589865, metadata !"klee_overshift_check.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !23} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_overshift_check.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ;
!24 = metadata !{i32 589845, metadata !22, metadata !"", metadata !22, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{null, metadata !26, metadata !26}
!26 = metadata !{i32 589860, metadata !22, metadata !"long long unsigned int", metadata !22, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 589870, i32 0, metadata !28, metadata !"klee_range", metadata !"klee_range", metadata !"klee_range", metadata !28, i32 13, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range} ; [ D
!28 = metadata !{i32 589865, metadata !"klee_range.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !29} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_range.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_
!30 = metadata !{i32 589845, metadata !28, metadata !"", metadata !28, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{metadata !32, metadata !32, metadata !32, metadata !33}
!32 = metadata !{i32 589860, metadata !28, metadata !"int", metadata !28, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!33 = metadata !{i32 589839, metadata !28, metadata !"", metadata !28, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 589862, metadata !28, metadata !"", metadata !28, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !35} ; [ DW_TAG_const_type ]
!35 = metadata !{i32 589860, metadata !28, metadata !"char", metadata !28, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!36 = metadata !{i32 589870, i32 0, metadata !37, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !37, i32 12, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !38} ; [ DW_TAG_file_type ]
!38 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_comp
!39 = metadata !{i32 589845, metadata !37, metadata !"", metadata !37, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null} ; [ DW_TAG_subroutine_type ]
!40 = metadata !{metadata !41, metadata !41, metadata !41, metadata !42}
!41 = metadata !{i32 589839, metadata !37, metadata !"", metadata !37, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!42 = metadata !{i32 589846, metadata !43, metadata !"size_t", metadata !43, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ]
!43 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/dungnguyen/angelix/build/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !38} ; [ DW_TAG_file_type ]
!44 = metadata !{i32 589860, metadata !37, metadata !"long unsigned int", metadata !37, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!45 = metadata !{i32 589870, i32 0, metadata !46, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !46, i32 12, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!46 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !47} ; [ DW_TAG_file_type ]
!47 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_com
!48 = metadata !{i32 589845, metadata !46, metadata !"", metadata !46, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null} ; [ DW_TAG_subroutine_type ]
!49 = metadata !{metadata !50, metadata !50, metadata !50, metadata !51}
!50 = metadata !{i32 589839, metadata !46, metadata !"", metadata !46, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!51 = metadata !{i32 589846, metadata !52, metadata !"size_t", metadata !52, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/dungnguyen/angelix/build/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !47} ; [ DW_TAG_file_type ]
!53 = metadata !{i32 589860, metadata !46, metadata !"long unsigned int", metadata !46, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!54 = metadata !{i32 589870, i32 0, metadata !55, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !55, i32 11, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_subpro
!55 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !56} ; [ DW_TAG_file_type ]
!56 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_com
!57 = metadata !{i32 589845, metadata !55, metadata !"", metadata !55, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null} ; [ DW_TAG_subroutine_type ]
!58 = metadata !{metadata !59, metadata !59, metadata !59, metadata !60}
!59 = metadata !{i32 589839, metadata !55, metadata !"", metadata !55, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 589846, metadata !61, metadata !"size_t", metadata !61, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_typedef ]
!61 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/dungnguyen/angelix/build/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !56} ; [ DW_TAG_file_type ]
!62 = metadata !{i32 589860, metadata !55, metadata !"long unsigned int", metadata !55, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!63 = metadata !{i32 589870, i32 0, metadata !64, metadata !"memset", metadata !"memset", metadata !"memset", metadata !64, i32 11, metadata !66, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!64 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !65} ; [ DW_TAG_file_type ]
!65 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/dungnguyen/angelix/src/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_comp
!66 = metadata !{i32 589845, metadata !64, metadata !"", metadata !64, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, null} ; [ DW_TAG_subroutine_type ]
!67 = metadata !{metadata !68, metadata !68, metadata !69, metadata !70}
!68 = metadata !{i32 589839, metadata !64, metadata !"", metadata !64, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 589860, metadata !64, metadata !"int", metadata !64, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!70 = metadata !{i32 589846, metadata !71, metadata !"size_t", metadata !71, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !72} ; [ DW_TAG_typedef ]
!71 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/dungnguyen/angelix/build/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !65} ; [ DW_TAG_file_type ]
!72 = metadata !{i32 589860, metadata !64, metadata !"long unsigned int", metadata !64, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!73 = metadata !{i32 590081, metadata !6, metadata !"z", metadata !7, i32 12, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!74 = metadata !{i32 590081, metadata !12, metadata !"name", metadata !13, i32 13, metadata !18, i32 0} ; [ DW_TAG_arg_variable ]
!75 = metadata !{i32 590080, metadata !76, metadata !"x", metadata !13, i32 14, metadata !17, i32 0} ; [ DW_TAG_auto_variable ]
!76 = metadata !{i32 589835, metadata !12, i32 13, i32 0, metadata !13, i32 0} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 590081, metadata !21, metadata !"bitWidth", metadata !22, i32 20, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!78 = metadata !{i32 590081, metadata !21, metadata !"shift", metadata !22, i32 20, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!79 = metadata !{i32 590081, metadata !27, metadata !"start", metadata !28, i32 13, metadata !32, i32 0} ; [ DW_TAG_arg_variable ]
!80 = metadata !{i32 590081, metadata !27, metadata !"end", metadata !28, i32 13, metadata !32, i32 0} ; [ DW_TAG_arg_variable ]
!81 = metadata !{i32 590081, metadata !27, metadata !"name", metadata !28, i32 13, metadata !33, i32 0} ; [ DW_TAG_arg_variable ]
!82 = metadata !{i32 590080, metadata !83, metadata !"x", metadata !28, i32 14, metadata !32, i32 0} ; [ DW_TAG_auto_variable ]
!83 = metadata !{i32 589835, metadata !27, i32 13, i32 0, metadata !28, i32 0} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 590081, metadata !36, metadata !"destaddr", metadata !37, i32 12, metadata !41, i32 0} ; [ DW_TAG_arg_variable ]
!85 = metadata !{i32 590081, metadata !36, metadata !"srcaddr", metadata !37, i32 12, metadata !41, i32 0} ; [ DW_TAG_arg_variable ]
!86 = metadata !{i32 590081, metadata !36, metadata !"len", metadata !37, i32 12, metadata !42, i32 0} ; [ DW_TAG_arg_variable ]
!87 = metadata !{i32 590080, metadata !88, metadata !"dest", metadata !37, i32 13, metadata !89, i32 0} ; [ DW_TAG_auto_variable ]
!88 = metadata !{i32 589835, metadata !36, i32 12, i32 0, metadata !37, i32 0} ; [ DW_TAG_lexical_block ]
!89 = metadata !{i32 589839, metadata !37, metadata !"", metadata !37, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !90} ; [ DW_TAG_pointer_type ]
!90 = metadata !{i32 589860, metadata !37, metadata !"char", metadata !37, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!91 = metadata !{i32 590080, metadata !88, metadata !"src", metadata !37, i32 14, metadata !92, i32 0} ; [ DW_TAG_auto_variable ]
!92 = metadata !{i32 589839, metadata !37, metadata !"", metadata !37, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_pointer_type ]
!93 = metadata !{i32 589862, metadata !37, metadata !"", metadata !37, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !90} ; [ DW_TAG_const_type ]
!94 = metadata !{i32 590081, metadata !45, metadata !"dst", metadata !46, i32 12, metadata !50, i32 0} ; [ DW_TAG_arg_variable ]
!95 = metadata !{i32 590081, metadata !45, metadata !"src", metadata !46, i32 12, metadata !50, i32 0} ; [ DW_TAG_arg_variable ]
!96 = metadata !{i32 590081, metadata !45, metadata !"count", metadata !46, i32 12, metadata !51, i32 0} ; [ DW_TAG_arg_variable ]
!97 = metadata !{i32 590080, metadata !98, metadata !"a", metadata !46, i32 13, metadata !99, i32 0} ; [ DW_TAG_auto_variable ]
!98 = metadata !{i32 589835, metadata !45, i32 12, i32 0, metadata !46, i32 0} ; [ DW_TAG_lexical_block ]
!99 = metadata !{i32 589839, metadata !46, metadata !"", metadata !46, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !100} ; [ DW_TAG_pointer_type ]
!100 = metadata !{i32 589860, metadata !46, metadata !"char", metadata !46, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!101 = metadata !{i32 590080, metadata !98, metadata !"b", metadata !46, i32 14, metadata !102, i32 0} ; [ DW_TAG_auto_variable ]
!102 = metadata !{i32 589839, metadata !46, metadata !"", metadata !46, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ]
!103 = metadata !{i32 589862, metadata !46, metadata !"", metadata !46, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !100} ; [ DW_TAG_const_type ]
!104 = metadata !{i32 590081, metadata !54, metadata !"destaddr", metadata !55, i32 11, metadata !59, i32 0} ; [ DW_TAG_arg_variable ]
!105 = metadata !{i32 590081, metadata !54, metadata !"srcaddr", metadata !55, i32 11, metadata !59, i32 0} ; [ DW_TAG_arg_variable ]
!106 = metadata !{i32 590081, metadata !54, metadata !"len", metadata !55, i32 11, metadata !60, i32 0} ; [ DW_TAG_arg_variable ]
!107 = metadata !{i32 590080, metadata !108, metadata !"dest", metadata !55, i32 12, metadata !109, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 589835, metadata !54, i32 11, i32 0, metadata !55, i32 0} ; [ DW_TAG_lexical_block ]
!109 = metadata !{i32 589839, metadata !55, metadata !"", metadata !55, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ]
!110 = metadata !{i32 589860, metadata !55, metadata !"char", metadata !55, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!111 = metadata !{i32 590080, metadata !108, metadata !"src", metadata !55, i32 13, metadata !112, i32 0} ; [ DW_TAG_auto_variable ]
!112 = metadata !{i32 589839, metadata !55, metadata !"", metadata !55, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !113} ; [ DW_TAG_pointer_type ]
!113 = metadata !{i32 589862, metadata !55, metadata !"", metadata !55, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !110} ; [ DW_TAG_const_type ]
!114 = metadata !{i32 590081, metadata !63, metadata !"dst", metadata !64, i32 11, metadata !68, i32 0} ; [ DW_TAG_arg_variable ]
!115 = metadata !{i32 590081, metadata !63, metadata !"s", metadata !64, i32 11, metadata !69, i32 0} ; [ DW_TAG_arg_variable ]
!116 = metadata !{i32 590081, metadata !63, metadata !"count", metadata !64, i32 11, metadata !70, i32 0} ; [ DW_TAG_arg_variable ]
!117 = metadata !{i32 590080, metadata !118, metadata !"a", metadata !64, i32 12, metadata !119, i32 0} ; [ DW_TAG_auto_variable ]
!118 = metadata !{i32 589835, metadata !63, i32 11, i32 0, metadata !64, i32 0} ; [ DW_TAG_lexical_block ]
!119 = metadata !{i32 589839, metadata !64, metadata !"", metadata !64, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !120} ; [ DW_TAG_pointer_type ]
!120 = metadata !{i32 589877, metadata !64, metadata !"", metadata !64, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !121} ; [ DW_TAG_volatile_type ]
!121 = metadata !{i32 589860, metadata !64, metadata !"char", metadata !64, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!122 = metadata !{i32 3, i32 0, metadata !123, null}
!123 = metadata !{i32 589835, metadata !0, i32 1, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!124 = metadata !{i32 7, i32 0, metadata !123, null}
!125 = metadata !{i32 13, i32 0, metadata !126, null}
!126 = metadata !{i32 589835, metadata !6, i32 12, i32 0, metadata !7, i32 0} ; [ DW_TAG_lexical_block ]
!127 = metadata !{i32 14, i32 0, metadata !126, null}
!128 = metadata !{i32 15, i32 0, metadata !126, null}
!129 = metadata !{i32 15, i32 0, metadata !76, null}
!130 = metadata !{i32 16, i32 0, metadata !76, null}
!131 = metadata !{i32 21, i32 0, metadata !132, null}
!132 = metadata !{i32 589835, metadata !21, i32 20, i32 0, metadata !22, i32 0} ; [ DW_TAG_lexical_block ]
!133 = metadata !{i32 27, i32 0, metadata !132, null}
!134 = metadata !{i32 29, i32 0, metadata !132, null}
!135 = metadata !{i32 16, i32 0, metadata !83, null}
!136 = metadata !{i32 17, i32 0, metadata !83, null}
!137 = metadata !{i32 19, i32 0, metadata !83, null}
!138 = metadata !{i32 22, i32 0, metadata !83, null}
!139 = metadata !{i32 25, i32 0, metadata !83, null}
!140 = metadata !{i32 26, i32 0, metadata !83, null}
!141 = metadata !{i32 28, i32 0, metadata !83, null}
!142 = metadata !{i32 29, i32 0, metadata !83, null}
!143 = metadata !{i32 32, i32 0, metadata !83, null}
!144 = metadata !{i32 20, i32 0, metadata !83, null}
!145 = metadata !{i32 15, i32 0, metadata !108, null}
!146 = metadata !{i32 16, i32 0, metadata !108, null}
!147 = metadata !{i32 17, i32 0, metadata !108, null}
