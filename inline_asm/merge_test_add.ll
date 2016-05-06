; ModuleID = 'merge_test_add.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_x64_64_stackptr = global i64 0, align 8

@_x86_64_entry = alias i64 (i64, i64, i64, i64, i64, i64)* @_x86_64_lifted_function_0

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

; Function Attrs: nounwind readonly uwtable
define i64 @_x86_64_getstack_64() #1 {
  %1 = load i64* @_x64_64_stackptr, align 8, !tbaa !1
  ret i64 %1
}

; Function Attrs: nounwind uwtable
define void @_x86_64_setstack_64(i64 %sp) #2 {
  store i64 %sp, i64* @_x64_64_stackptr, align 8, !tbaa !1
  ret void
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @_x86_64_booland_1(i1 zeroext %x, i1 zeroext %y) #3 {
  %y. = and i1 %x, %y
  ret i1 %y.
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @_x86_64_boolor_1(i1 zeroext %x, i1 zeroext %y) #3 {
  %.y = or i1 %x, %y
  ret i1 %.y
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @_x86_64_booliff_1(i1 zeroext %x, i1 zeroext %y) #3 {
  %tmp = xor i1 %x, %y
  %1 = xor i1 %tmp, true
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_0(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_1(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 true
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r)
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: nounwind readnone
declare i64 @llvm.ctpop.i64(i64) #5

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1)
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ctpop.i32(i32) #5

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2)
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2)
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_getaddr_64(i64 %base, i64 %scale, i64 %index, i64 %disp) #4 {
  %1 = inttoptr i64 %base to i8*
  %2 = mul i64 %index, %scale
  %.sum = add i64 %2, %disp
  %3 = getelementptr inbounds i8* %1, i64 %.sum
  %4 = ptrtoint i8* %3 to i64
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readonly uwtable
define i64 @_x86_64_read_64(i64 %addr) #6 {
  %1 = inttoptr i64 %addr to i64*
  %2 = load i64* %1, align 8, !tbaa !1
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind uwtable
define void @_x86_64_write_64(i64 %addr, i64 %x) #7 {
  %1 = inttoptr i64 %addr to i64*
  store i64 %x, i64* %1, align 8, !tbaa !1
  ret void
}

; Function Attrs: alwaysinline inlinehint nounwind readonly uwtable
define i64 @_x86_64_read_32(i64 %addr) #6 {
  %1 = inttoptr i64 %addr to i32*
  %2 = load i32* %1, align 4, !tbaa !5
  %3 = zext i32 %2 to i64
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind uwtable
define void @_x86_64_write_32(i64 %addr, i64 %x) #7 {
  %1 = trunc i64 %x to i32
  %2 = inttoptr i64 %addr to i32*
  store i32 %1, i32* %2, align 4, !tbaa !5
  ret void
}

; Function Attrs: alwaysinline inlinehint nounwind readonly uwtable
define i64 @_x86_64_read_16(i64 %addr) #6 {
  %1 = inttoptr i64 %addr to i16*
  %2 = load i16* %1, align 2, !tbaa !7
  %3 = zext i16 %2 to i64
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind uwtable
define void @_x86_64_write_16(i64 %addr, i64 %x) #7 {
  %1 = trunc i64 %x to i16
  %2 = inttoptr i64 %addr to i16*
  store i16 %1, i16* %2, align 2, !tbaa !7
  ret void
}

; Function Attrs: alwaysinline inlinehint nounwind readonly uwtable
define i64 @_x86_64_read_8(i64 %addr) #6 {
  %1 = inttoptr i64 %addr to i8*
  %2 = load i8* %1, align 1, !tbaa !9
  %3 = zext i8 %2 to i64
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind uwtable
define void @_x86_64_write_8(i64 %addr, i64 %x) #7 {
  %1 = trunc i64 %x to i8
  %2 = inttoptr i64 %addr to i8*
  store i8 %1, i8* %2, align 1, !tbaa !9
  ret void
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_push_64(i64 %sp) #4 {
  %1 = add i64 %sp, -8
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_push_32(i64 %sp) #4 {
  %1 = add i64 %sp, -4
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_push_16(i64 %sp) #4 {
  %1 = add i64 %sp, -2
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_push_8(i64 %sp) #4 {
  %1 = add i64 %sp, -1
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_pop_64(i64 %sp) #4 {
  %1 = add i64 %sp, 8
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_pop_32(i64 %sp) #4 {
  %1 = add i64 %sp, 4
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_pop_16(i64 %sp) #4 {
  %1 = add i64 %sp, 2
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_pop_8(i64 %sp) #4 {
  %1 = add i64 %sp, 1
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_mov_64(i64 %x, i64 %y) #4 {
  ret i64 %y
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_mov_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 4294967295
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_mov_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 65535
  %2 = and i64 %x, -65536
  %3 = or i64 %1, %2
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_mov_8(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  %2 = and i64 %x, -65536
  %3 = or i64 %1, %2
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sext32_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 4294967295
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sext16_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 65535
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sext8_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sext16_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 65535
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sext8_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sext8_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  %2 = and i64 %x, -65536
  %3 = or i64 %1, %2
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_zext32_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 4294967295
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_zext16_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 65535
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_zext8_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_zext16_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 65535
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_zext8_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_zext8_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  %2 = and i64 %x, -65536
  %3 = or i64 %1, %2
  ret i64 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_add_64(i64 %x, i64 %y) #4 {
  %1 = add i64 %y, %x
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: nounwind readnone
declare zeroext i1 @_x86_64_setflag_UNDEFINED(i64, i64, i64) #8

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  %y.lobit = lshr i64 %y, 63
  %2 = icmp sgt i64 %x, -1
  %or.cond = and i1 %1, %2
  %3 = icmp eq i64 %y.lobit, 0
  %or.cond1 = and i1 %or.cond, %3
  %brmerge = or i1 %or.cond1, %1
  br i1 %brmerge, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = icmp ne i64 %y.lobit, 0
  %not. = xor i1 %2, true
  %. = and i1 %5, %not.
  ret i1 %.

; <label>:6                                       ; preds = %0
  ret i1 %or.cond1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp ult i64 %r, %x
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_add_32(i64 %x, i64 %y) #4 {
  %1 = add i64 %y, %x
  %2 = and i64 %1, 4294967295
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  %3 = trunc i64 %y to i32
  %.lobit1 = lshr i32 %3, 31
  %.lobit.mask = and i64 %x, 2147483648
  %4 = icmp eq i64 %.lobit.mask, 0
  %or.cond = and i1 %2, %4
  %5 = icmp eq i32 %.lobit1, 0
  %or.cond2 = and i1 %or.cond, %5
  %brmerge = or i1 %or.cond2, %2
  br i1 %brmerge, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = icmp ne i32 %.lobit1, 0
  %not. = xor i1 %4, true
  %. = and i1 %7, %not.
  ret i1 %.

; <label>:8                                       ; preds = %0
  ret i1 %or.cond2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = trunc i64 %x to i32
  %3 = icmp ult i32 %1, %2
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_add_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 65535
  %2 = and i64 %y, 65535
  %3 = add nuw nsw i64 %2, %1
  %4 = and i64 %x, -65536
  %5 = or i64 %3, %4
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask, 0
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %2, 15
  %4 = and i64 %x, 32768
  %5 = icmp eq i64 %4, 0
  %or.cond = and i1 %1, %5
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  %or.cond6 = and i1 %or.cond, %7
  %brmerge = or i1 %or.cond6, %1
  br i1 %brmerge, label %10, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ne i32 %6, 0
  %not. = xor i1 %5, true
  %. = and i1 %9, %not.
  ret i1 %.

; <label>:10                                      ; preds = %0
  ret i1 %or.cond6
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = trunc i64 %x to i32
  %4 = and i32 %3, 65535
  %5 = icmp ult i32 %2, %4
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_add_8(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 255
  %2 = and i64 %y, 255
  %3 = add nuw nsw i64 %2, %1
  %4 = and i64 %x, -256
  %5 = or i64 %3, %4
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask, 0
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %2, 7
  %4 = and i64 %x, 128
  %5 = icmp eq i64 %4, 0
  %or.cond = and i1 %1, %5
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  %or.cond6 = and i1 %or.cond, %7
  %brmerge = or i1 %or.cond6, %1
  br i1 %brmerge, label %10, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ne i32 %6, 0
  %not. = xor i1 %5, true
  %. = and i1 %9, %not.
  ret i1 %.

; <label>:10                                      ; preds = %0
  ret i1 %or.cond6
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_add_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = trunc i64 %x to i32
  %4 = and i32 %3, 255
  %5 = icmp ult i32 %2, %4
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sub_64(i64 %x, i64 %y) #4 {
  %1 = sub i64 %x, %y
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  %y.lobit.i = lshr i64 %y, 63
  %2 = icmp sgt i64 %x, -1
  %or.cond.i = and i1 %1, %2
  %3 = icmp eq i64 %y.lobit.i, 0
  %or.cond1.i = and i1 %or.cond.i, %3
  %brmerge.i = or i1 %or.cond1.i, %1
  br i1 %brmerge.i, label %_x86_64_add_setflag_OF_64.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = icmp ne i64 %y.lobit.i, 0
  %not..i = xor i1 %2, true
  %..i = and i1 %5, %not..i
  br label %_x86_64_add_setflag_OF_64.exit

_x86_64_add_setflag_OF_64.exit:                   ; preds = %4, %0
  %6 = phi i1 [ %..i, %4 ], [ %or.cond1.i, %0 ]
  ret i1 %6
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp ugt i64 %r, %x
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sub_32(i64 %x, i64 %y) #4 {
  %1 = sub i64 %x, %y
  %2 = and i64 %1, 4294967295
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  %3 = trunc i64 %y to i32
  %.lobit1.i = lshr i32 %3, 31
  %.lobit.mask.i = and i64 %x, 2147483648
  %4 = icmp eq i64 %.lobit.mask.i, 0
  %or.cond.i = and i1 %2, %4
  %5 = icmp eq i32 %.lobit1.i, 0
  %or.cond2.i = and i1 %or.cond.i, %5
  %brmerge.i = or i1 %or.cond2.i, %2
  br i1 %brmerge.i, label %_x86_64_add_setflag_OF_32.exit, label %6

; <label>:6                                       ; preds = %0
  %7 = icmp ne i32 %.lobit1.i, 0
  %not..i = xor i1 %4, true
  %..i = and i1 %7, %not..i
  br label %_x86_64_add_setflag_OF_32.exit

_x86_64_add_setflag_OF_32.exit:                   ; preds = %6, %0
  %8 = phi i1 [ %..i, %6 ], [ %or.cond2.i, %0 ]
  ret i1 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = trunc i64 %x to i32
  %3 = icmp ugt i32 %1, %2
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sub_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 65535
  %2 = and i64 %y, 65535
  %3 = sub i64 %1, %2
  %4 = and i64 %x, -65536
  %5 = or i64 %3, %4
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %2, 15
  %4 = and i64 %x, 32768
  %5 = icmp eq i64 %4, 0
  %or.cond.i = and i1 %1, %5
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  %or.cond6.i = and i1 %or.cond.i, %7
  %brmerge.i = or i1 %or.cond6.i, %1
  br i1 %brmerge.i, label %_x86_64_add_setflag_OF_16.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ne i32 %6, 0
  %not..i = xor i1 %5, true
  %..i = and i1 %9, %not..i
  br label %_x86_64_add_setflag_OF_16.exit

_x86_64_add_setflag_OF_16.exit:                   ; preds = %8, %0
  %10 = phi i1 [ %..i, %8 ], [ %or.cond6.i, %0 ]
  ret i1 %10
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = trunc i64 %x to i32
  %4 = and i32 %3, 65535
  %5 = icmp ugt i32 %2, %4
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sub_8(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 255
  %2 = and i64 %y, 255
  %3 = sub i64 %1, %2
  %4 = and i64 %x, -256
  %5 = or i64 %3, %4
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %2, 7
  %4 = and i64 %x, 128
  %5 = icmp eq i64 %4, 0
  %or.cond.i = and i1 %1, %5
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  %or.cond6.i = and i1 %or.cond.i, %7
  %brmerge.i = or i1 %or.cond6.i, %1
  br i1 %brmerge.i, label %_x86_64_add_setflag_OF_8.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ne i32 %6, 0
  %not..i = xor i1 %5, true
  %..i = and i1 %9, %not..i
  br label %_x86_64_add_setflag_OF_8.exit

_x86_64_add_setflag_OF_8.exit:                    ; preds = %8, %0
  %10 = phi i1 [ %..i, %8 ], [ %or.cond6.i, %0 ]
  ret i1 %10
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sub_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = trunc i64 %x to i32
  %4 = and i32 %3, 255
  %5 = icmp ugt i32 %2, %4
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_64(i64 %x, i64 %y) #4 {
  %1 = mul nsw i64 %y, %x
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_hi_64(i64 %x, i64 %y) #4 {
  %1 = zext i64 %x to i128
  %2 = zext i64 %y to i128
  %3 = mul nsw i128 %2, %1
  %4 = lshr i128 %3, 64
  %5 = trunc i128 %4 to i64
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_32(i64 %x, i64 %y) #4 {
  %1 = shl i64 %x, 32
  %sext = mul i64 %1, %y
  %2 = ashr exact i64 %sext, 32
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_hi_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 4294967295
  %2 = and i64 %y, 4294967295
  %3 = mul nsw i64 %2, %1
  %4 = lshr i64 %3, 32
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_16(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %sext = shl i32 %1, 16
  %2 = ashr exact i32 %sext, 16
  %3 = trunc i64 %y to i32
  %sext1 = shl i32 %3, 16
  %4 = ashr exact i32 %sext1, 16
  %5 = mul nsw i32 %4, %2
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -65536
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_hi_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 65535
  %2 = and i64 %y, 65535
  %3 = mul i64 %2, %1
  %4 = lshr i64 %3, 16
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_8(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %sext = shl i32 %1, 24
  %2 = ashr exact i32 %sext, 24
  %3 = trunc i64 %y to i32
  %sext1 = shl i32 %3, 24
  %4 = ashr exact i32 %sext1, 24
  %5 = mul nsw i32 %4, %2
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -256
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_smul_hi_8(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 255
  %2 = and i64 %y, 255
  %3 = mul i64 %2, %1
  %4 = lshr i64 %3, 8
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_smul_hi_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_xor_64(i64 %x, i64 %y) #4 {
  %1 = xor i64 %y, %x
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_xor_32(i64 %x, i64 %y) #4 {
  %1 = xor i64 %y, %x
  %2 = and i64 %1, 4294967295
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_xor_16(i64 %x, i64 %y) #4 {
  %1 = xor i64 %y, %x
  %2 = and i64 %1, 65535
  %3 = and i64 %x, -65536
  %4 = or i64 %2, %3
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_xor_8(i64 %x, i64 %y) #4 {
  %1 = xor i64 %y, %x
  %2 = and i64 %1, 255
  %3 = and i64 %x, -256
  %4 = or i64 %2, %3
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_xor_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_and_64(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, %x
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_and_32(i64 %x, i64 %y) #4 {
  %1 = and i64 %x, 4294967295
  %2 = and i64 %1, %y
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_and_16(i64 %x, i64 %y) #4 {
  %1 = or i64 %y, -65536
  %2 = and i64 %1, %x
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_and_8(i64 %x, i64 %y) #4 {
  %1 = or i64 %y, -256
  %2 = and i64 %1, %x
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_and_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_or_64(i64 %x, i64 %y) #4 {
  %1 = or i64 %y, %x
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_or_32(i64 %x, i64 %y) #4 {
  %1 = or i64 %y, %x
  %2 = and i64 %1, 4294967295
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_or_16(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 65535
  %2 = or i64 %1, %x
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_or_8(i64 %x, i64 %y) #4 {
  %1 = and i64 %y, 255
  %2 = or i64 %1, %x
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_or_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sll_64(i64 %x, i64 %y) #4 {
  %1 = shl i64 %x, %y
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sll_32(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = trunc i64 %y to i32
  %3 = shl i32 %1, %2
  %4 = zext i32 %3 to i64
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sll_16(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = and i32 %1, 65535
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 65535
  %5 = shl i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -65536
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sll_8(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = and i32 %1, 255
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 255
  %5 = shl i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -256
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sll_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_srl_64(i64 %x, i64 %y) #4 {
  %1 = lshr i64 %x, %y
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_srl_32(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %1, %2
  %4 = zext i32 %3 to i64
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_srl_16(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = and i32 %1, 65535
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 65535
  %5 = lshr i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -65536
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_srl_8(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = and i32 %1, 255
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 255
  %5 = lshr i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -256
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_srl_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sla_64(i64 %x, i64 %y) #4 {
  %1 = shl i64 %x, %y
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sla_32(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = trunc i64 %y to i32
  %3 = shl i32 %1, %2
  %4 = sext i32 %3 to i64
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sla_16(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %sext = shl i32 %1, 16
  %2 = ashr exact i32 %sext, 16
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 65535
  %5 = shl i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -65536
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sla_8(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %sext = shl i32 %1, 24
  %2 = ashr exact i32 %sext, 24
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 255
  %5 = shl i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -256
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sla_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sra_64(i64 %x, i64 %y) #4 {
  %1 = ashr i64 %x, %y
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sra_32(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %2 = trunc i64 %y to i32
  %3 = ashr i32 %1, %2
  %4 = sext i32 %3 to i64
  ret i64 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sra_16(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %sext = shl i32 %1, 16
  %2 = ashr exact i32 %sext, 16
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 65535
  %5 = ashr i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -65536
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_sra_8(i64 %x, i64 %y) #4 {
  %1 = trunc i64 %x to i32
  %sext = shl i32 %1, 24
  %2 = ashr exact i32 %sext, 24
  %3 = trunc i64 %y to i32
  %4 = and i32 %3, 255
  %5 = ashr i32 %2, %4
  %6 = sext i32 %5 to i64
  %7 = and i64 %x, -256
  %8 = or i64 %6, %7
  ret i64 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_sra_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_cmp_64(i64 %r, i64 %x) #4 {
  %1 = sub i64 %r, %x
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  %y.lobit.i.i = lshr i64 %y, 63
  %2 = icmp sgt i64 %x, -1
  %or.cond.i.i = and i1 %1, %2
  %3 = icmp eq i64 %y.lobit.i.i, 0
  %or.cond1.i.i = and i1 %or.cond.i.i, %3
  %brmerge.i.i = or i1 %or.cond1.i.i, %1
  br i1 %brmerge.i.i, label %_x86_64_sub_setflag_OF_64.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = icmp ne i64 %y.lobit.i.i, 0
  %not..i.i = xor i1 %2, true
  %..i.i = and i1 %5, %not..i.i
  br label %_x86_64_sub_setflag_OF_64.exit

_x86_64_sub_setflag_OF_64.exit:                   ; preds = %4, %0
  %6 = phi i1 [ %..i.i, %4 ], [ %or.cond1.i.i, %0 ]
  ret i1 %6
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp ugt i64 %r, %x
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_cmp_32(i64 %r, i64 %x) #4 {
  %1 = sub i64 %r, %x
  %2 = and i64 %1, 4294967295
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  %3 = trunc i64 %y to i32
  %.lobit1.i.i = lshr i32 %3, 31
  %.lobit.mask.i.i = and i64 %x, 2147483648
  %4 = icmp eq i64 %.lobit.mask.i.i, 0
  %or.cond.i.i = and i1 %2, %4
  %5 = icmp eq i32 %.lobit1.i.i, 0
  %or.cond2.i.i = and i1 %or.cond.i.i, %5
  %brmerge.i.i = or i1 %or.cond2.i.i, %2
  br i1 %brmerge.i.i, label %_x86_64_sub_setflag_OF_32.exit, label %6

; <label>:6                                       ; preds = %0
  %7 = icmp ne i32 %.lobit1.i.i, 0
  %not..i.i = xor i1 %4, true
  %..i.i = and i1 %7, %not..i.i
  br label %_x86_64_sub_setflag_OF_32.exit

_x86_64_sub_setflag_OF_32.exit:                   ; preds = %6, %0
  %8 = phi i1 [ %..i.i, %6 ], [ %or.cond2.i.i, %0 ]
  ret i1 %8
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = trunc i64 %x to i32
  %3 = icmp ugt i32 %1, %2
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_cmp_16(i64 %r, i64 %x) #4 {
  %1 = and i64 %r, 65535
  %2 = and i64 %x, 65535
  %3 = sub i64 %1, %2
  %4 = and i64 %r, -65536
  %5 = or i64 %3, %4
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i.i, 0
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %2, 15
  %4 = and i64 %x, 32768
  %5 = icmp eq i64 %4, 0
  %or.cond.i.i = and i1 %1, %5
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  %or.cond6.i.i = and i1 %or.cond.i.i, %7
  %brmerge.i.i = or i1 %or.cond6.i.i, %1
  br i1 %brmerge.i.i, label %_x86_64_sub_setflag_OF_16.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ne i32 %6, 0
  %not..i.i = xor i1 %5, true
  %..i.i = and i1 %9, %not..i.i
  br label %_x86_64_sub_setflag_OF_16.exit

_x86_64_sub_setflag_OF_16.exit:                   ; preds = %8, %0
  %10 = phi i1 [ %..i.i, %8 ], [ %or.cond6.i.i, %0 ]
  ret i1 %10
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = trunc i64 %x to i32
  %4 = and i32 %3, 65535
  %5 = icmp ugt i32 %2, %4
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_cmp_8(i64 %r, i64 %x) #4 {
  %1 = and i64 %r, 255
  %2 = and i64 %x, 255
  %3 = sub i64 %1, %2
  %4 = and i64 %r, -256
  %5 = or i64 %3, %4
  ret i64 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i.i, 0
  %2 = trunc i64 %y to i32
  %3 = lshr i32 %2, 7
  %4 = and i64 %x, 128
  %5 = icmp eq i64 %4, 0
  %or.cond.i.i = and i1 %1, %5
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  %or.cond6.i.i = and i1 %or.cond.i.i, %7
  %brmerge.i.i = or i1 %or.cond6.i.i, %1
  br i1 %brmerge.i.i, label %_x86_64_sub_setflag_OF_8.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ne i32 %6, 0
  %not..i.i = xor i1 %5, true
  %..i.i = and i1 %9, %not..i.i
  br label %_x86_64_sub_setflag_OF_8.exit

_x86_64_sub_setflag_OF_8.exit:                    ; preds = %8, %0
  %10 = phi i1 [ %..i.i, %8 ], [ %or.cond6.i.i, %0 ]
  ret i1 %10
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_cmp_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = trunc i64 %x to i32
  %4 = and i32 %3, 255
  %5 = icmp ugt i32 %2, %4
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_test_64(i64 %r, i64 %x) #4 {
  %1 = and i64 %x, %r
  ret i64 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_AF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_SF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp slt i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_ZF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = icmp eq i64 %r, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_OF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_PF_64(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call i64 @llvm.ctpop.i64(i64 %r) #9
  %2 = and i64 %1, 1
  %3 = icmp ne i64 %2, 0
  ret i1 %3
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_CF_64(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_test_32(i64 %r, i64 %x) #4 {
  %1 = and i64 %r, 4294967295
  %2 = and i64 %1, %x
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_AF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_SF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp slt i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_ZF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = icmp eq i32 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_OF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_PF_32(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = tail call i32 @llvm.ctpop.i32(i32 %1) #9
  %3 = and i32 %2, 1
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_CF_32(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_test_16(i64 %r, i64 %x) #4 {
  %1 = or i64 %x, -65536
  %2 = and i64 %1, %r
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_AF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_SF_16(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i.i = and i64 %r, 32768
  %1 = icmp ne i64 %sext.mask.i.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_ZF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 65535
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_OF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_PF_16(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 65535
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_CF_16(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define i64 @_x86_64_test_8(i64 %r, i64 %x) #4 {
  %1 = or i64 %x, -256
  %2 = and i64 %1, %r
  ret i64 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_AF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = tail call zeroext i1 @_x86_64_setflag_UNDEFINED(i64 %r, i64 %x, i64 %y) #5
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_SF_8(i64 %r, i64 %x, i64 %y) #4 {
  %sext.mask.i.i = and i64 %r, 128
  %1 = icmp ne i64 %sext.mask.i.i, 0
  ret i1 %1
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_ZF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = and i64 %r, 255
  %2 = icmp eq i64 %1, 0
  ret i1 %2
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_OF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_PF_8(i64 %r, i64 %x, i64 %y) #4 {
  %1 = trunc i64 %r to i32
  %2 = and i32 %1, 255
  %3 = tail call i32 @llvm.ctpop.i32(i32 %2) #9
  %4 = and i32 %3, 1
  %5 = icmp ne i32 %4, 0
  ret i1 %5
}

; Function Attrs: alwaysinline inlinehint nounwind readnone uwtable
define zeroext i1 @_x86_64_test_setflag_CF_8(i64 %r, i64 %x, i64 %y) #4 {
  ret i1 false
}

; Function Attrs: nounwind readnone uwtable
define i64 @_x86_64_dummy(i64 %x) #3 {
  %1 = tail call zeroext i1 @_x86_64_UNDEFINED_1() #5
  %2 = zext i1 %1 to i64
  %3 = add i64 %2, %x
  %4 = tail call i64 @_x86_64_UNDEFINED_64() #5
  %5 = add i64 %3, %4
  %6 = tail call zeroext i1 @_x86_64_UNKNOWN_1() #5
  %7 = zext i1 %6 to i64
  %8 = add i64 %5, %7
  %9 = tail call i64 @_x86_64_UNKNOWN_64() #5
  %10 = add i64 %8, %9
  ret i64 %10
}

; Function Attrs: nounwind readnone
declare zeroext i1 @_x86_64_UNDEFINED_1() #8

; Function Attrs: nounwind readnone
declare i64 @_x86_64_UNDEFINED_64() #8

; Function Attrs: nounwind readnone
declare zeroext i1 @_x86_64_UNKNOWN_1() #8

; Function Attrs: nounwind readnone
declare i64 @_x86_64_UNKNOWN_64() #8

; Function Attrs: nounwind readnone
define i64 @_x86_64_lifted_function_0(i64 %RDI_, i64 %RSI_, i64 %RDX_, i64 %RCX_, i64 %R8_, i64 %R9_) #5 {
  %RAX_ = tail call i64 @_x86_64_UNDEFINED_64()
  %RBX_ = tail call i64 @_x86_64_UNKNOWN_64()
  %1 = add i64 %RBX_, %RAX_
  %2 = and i64 %1, 4294967295
  ret i64 %2
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { alwaysinline inlinehint nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { alwaysinline inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { alwaysinline inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"long", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"int", metadata !3, i64 0}
!7 = metadata !{metadata !8, metadata !8, i64 0}
!8 = metadata !{metadata !"short", metadata !3, i64 0}
!9 = metadata !{metadata !3, metadata !3, i64 0}
