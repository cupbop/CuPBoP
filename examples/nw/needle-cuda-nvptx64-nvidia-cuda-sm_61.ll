; ModuleID = 'needle-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "needle.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ20needle_cuda_shared_1PiS_iiiiE4temp = internal addrspace(3) global [17 x [17 x i32]] undef, align 4
@_ZZ20needle_cuda_shared_1PiS_iiiiE3ref = internal addrspace(3) global [16 x [16 x i32]] undef, align 4
@_ZZ20needle_cuda_shared_2PiS_iiiiE4temp = internal addrspace(3) global [17 x [17 x i32]] undef, align 4
@_ZZ20needle_cuda_shared_2PiS_iiiiE3ref = internal addrspace(3) global [16 x [16 x i32]] undef, align 4

; Function Attrs: convergent noinline nounwind optnone
define weak dso_local i32 @cudaMalloc(i8** %p, i64 %s) #0 {
entry:
  %p.addr = alloca i8**, align 8
  %s.addr = alloca i64, align 8
  store i8** %p, i8*** %p.addr, align 8
  store i64 %s, i64* %s.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone
define weak dso_local i32 @cudaFuncGetAttributes(%struct.cudaFuncAttributes* %p, i8* %c) #0 {
entry:
  %p.addr = alloca %struct.cudaFuncAttributes*, align 8
  %c.addr = alloca i8*, align 8
  store %struct.cudaFuncAttributes* %p, %struct.cudaFuncAttributes** %p.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone
define weak dso_local i32 @cudaDeviceGetAttribute(i32* %value, i32 %attr, i32 %device) #0 {
entry:
  %value.addr = alloca i32*, align 8
  %attr.addr = alloca i32, align 4
  %device.addr = alloca i32, align 4
  store i32* %value, i32** %value.addr, align 8
  store i32 %attr, i32* %attr.addr, align 4
  store i32 %device, i32* %device.addr, align 4
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone
define weak dso_local i32 @cudaGetDevice(i32* %device) #0 {
entry:
  %device.addr = alloca i32*, align 8
  store i32* %device, i32** %device.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone
define weak dso_local i32 @cudaOccupancyMaxActiveBlocksPerMultiprocessor(i32* %numBlocks, i8* %func, i32 %blockSize, i64 %dynamicSmemSize) #0 {
entry:
  %numBlocks.addr = alloca i32*, align 8
  %func.addr = alloca i8*, align 8
  %blockSize.addr = alloca i32, align 4
  %dynamicSmemSize.addr = alloca i64, align 8
  store i32* %numBlocks, i32** %numBlocks.addr, align 8
  store i8* %func, i8** %func.addr, align 8
  store i32 %blockSize, i32* %blockSize.addr, align 4
  store i64 %dynamicSmemSize, i64* %dynamicSmemSize.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone
define weak dso_local i32 @cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(i32* %numBlocks, i8* %func, i32 %blockSize, i64 %dynamicSmemSize, i32 %flags) #0 {
entry:
  %numBlocks.addr = alloca i32*, align 8
  %func.addr = alloca i8*, align 8
  %blockSize.addr = alloca i32, align 4
  %dynamicSmemSize.addr = alloca i64, align 8
  %flags.addr = alloca i32, align 4
  store i32* %numBlocks, i32** %numBlocks.addr, align 8
  store i8* %func, i8** %func.addr, align 8
  store i32 %blockSize, i32* %blockSize.addr, align 4
  store i64 %dynamicSmemSize, i64* %dynamicSmemSize.addr, align 8
  store i32 %flags, i32* %flags.addr, align 4
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local i32 @_Z14maximum_deviceiii(i32 %a, i32 %b, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %cmp = icmp sle i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4
  store i32 %2, i32* %k, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %a.addr, align 4
  store i32 %3, i32* %k, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %k, align 4
  %5 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp sle i32 %4, %5
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  %6 = load i32, i32* %c.addr, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

if.else3:                                         ; preds = %if.end
  %7 = load i32, i32* %k, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z20needle_cuda_shared_1PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #0 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %b_index_x = alloca i32, align 4
  %b_index_y = alloca i32, align 4
  %index = alloca i32, align 4
  %index_n = alloca i32, align 4
  %index_w = alloca i32, align 4
  %index_nw = alloca i32, align 4
  %ty = alloca i32, align 4
  %m = alloca i32, align 4
  %t_index_x = alloca i32, align 4
  %t_index_y = alloca i32, align 4
  %m90 = alloca i32, align 4
  %t_index_x96 = alloca i32, align 4
  %t_index_y99 = alloca i32, align 4
  %ty134 = alloca i32, align 4
  store i32* %referrence, i32** %referrence.addr, align 8
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8
  store i32 %cols, i32* %cols.addr, align 4
  store i32 %penalty, i32* %penalty.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %block_width, i32* %block_width.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %bx, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %tx, align 4
  %0 = load i32, i32* %bx, align 4
  store i32 %0, i32* %b_index_x, align 4
  %1 = load i32, i32* %i.addr, align 4
  %sub = sub nsw i32 %1, 1
  %2 = load i32, i32* %bx, align 4
  %sub2 = sub nsw i32 %sub, %2
  store i32 %sub2, i32* %b_index_y, align 4
  %3 = load i32, i32* %cols.addr, align 4
  %mul = mul nsw i32 %3, 16
  %4 = load i32, i32* %b_index_y, align 4
  %mul3 = mul nsw i32 %mul, %4
  %5 = load i32, i32* %b_index_x, align 4
  %mul4 = mul nsw i32 16, %5
  %add = add nsw i32 %mul3, %mul4
  %6 = load i32, i32* %tx, align 4
  %add5 = add nsw i32 %add, %6
  %7 = load i32, i32* %cols.addr, align 4
  %add6 = add nsw i32 %7, 1
  %add7 = add nsw i32 %add5, %add6
  store i32 %add7, i32* %index, align 4
  %8 = load i32, i32* %cols.addr, align 4
  %mul8 = mul nsw i32 %8, 16
  %9 = load i32, i32* %b_index_y, align 4
  %mul9 = mul nsw i32 %mul8, %9
  %10 = load i32, i32* %b_index_x, align 4
  %mul10 = mul nsw i32 16, %10
  %add11 = add nsw i32 %mul9, %mul10
  %11 = load i32, i32* %tx, align 4
  %add12 = add nsw i32 %add11, %11
  %add13 = add nsw i32 %add12, 1
  store i32 %add13, i32* %index_n, align 4
  %12 = load i32, i32* %cols.addr, align 4
  %mul14 = mul nsw i32 %12, 16
  %13 = load i32, i32* %b_index_y, align 4
  %mul15 = mul nsw i32 %mul14, %13
  %14 = load i32, i32* %b_index_x, align 4
  %mul16 = mul nsw i32 16, %14
  %add17 = add nsw i32 %mul15, %mul16
  %15 = load i32, i32* %cols.addr, align 4
  %add18 = add nsw i32 %add17, %15
  store i32 %add18, i32* %index_w, align 4
  %16 = load i32, i32* %cols.addr, align 4
  %mul19 = mul nsw i32 %16, 16
  %17 = load i32, i32* %b_index_y, align 4
  %mul20 = mul nsw i32 %mul19, %17
  %18 = load i32, i32* %b_index_x, align 4
  %mul21 = mul nsw i32 16, %18
  %add22 = add nsw i32 %mul20, %mul21
  store i32 %add22, i32* %index_nw, align 4
  %19 = load i32, i32* %tx, align 4
  %cmp = icmp eq i32 %19, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %20 = load i32*, i32** %matrix_cuda.addr, align 8
  %21 = load i32, i32* %index_nw, align 4
  %idxprom = sext i32 %21 to i64
  %arrayidx = getelementptr inbounds i32, i32* %20, i64 %idxprom
  %22 = load i32, i32* %arrayidx, align 4
  %23 = load i32, i32* %tx, align 4
  %idxprom23 = sext i32 %23 to i64
  %arrayidx24 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx24, i64 0, i64 0
  store i32 %22, i32* %arrayidx25, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %ty, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %24 = load i32, i32* %ty, align 4
  %cmp26 = icmp slt i32 %24, 16
  br i1 %cmp26, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load i32*, i32** %referrence.addr, align 8
  %26 = load i32, i32* %index, align 4
  %27 = load i32, i32* %cols.addr, align 4
  %28 = load i32, i32* %ty, align 4
  %mul27 = mul nsw i32 %27, %28
  %add28 = add nsw i32 %26, %mul27
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds i32, i32* %25, i64 %idxprom29
  %29 = load i32, i32* %arrayidx30, align 4
  %30 = load i32, i32* %ty, align 4
  %idxprom31 = sext i32 %30 to i64
  %arrayidx32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom31
  %31 = load i32, i32* %tx, align 4
  %idxprom33 = sext i32 %31 to i64
  %arrayidx34 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx32, i64 0, i64 %idxprom33
  store i32 %29, i32* %arrayidx34, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %ty, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %ty, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0()
  %33 = load i32*, i32** %matrix_cuda.addr, align 8
  %34 = load i32, i32* %index_w, align 4
  %35 = load i32, i32* %cols.addr, align 4
  %36 = load i32, i32* %tx, align 4
  %mul35 = mul nsw i32 %35, %36
  %add36 = add nsw i32 %34, %mul35
  %idxprom37 = sext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds i32, i32* %33, i64 %idxprom37
  %37 = load i32, i32* %arrayidx38, align 4
  %38 = load i32, i32* %tx, align 4
  %add39 = add nsw i32 %38, 1
  %idxprom40 = sext i32 %add39 to i64
  %arrayidx41 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom40
  %arrayidx42 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx41, i64 0, i64 0
  store i32 %37, i32* %arrayidx42, align 4
  call void @llvm.nvvm.barrier0()
  %39 = load i32*, i32** %matrix_cuda.addr, align 8
  %40 = load i32, i32* %index_n, align 4
  %idxprom43 = sext i32 %40 to i64
  %arrayidx44 = getelementptr inbounds i32, i32* %39, i64 %idxprom43
  %41 = load i32, i32* %arrayidx44, align 4
  %42 = load i32, i32* %tx, align 4
  %add45 = add nsw i32 %42, 1
  %idxprom46 = sext i32 %add45 to i64
  %arrayidx47 = getelementptr inbounds [17 x i32], [17 x i32]* getelementptr inbounds ([17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 0), i64 0, i64 %idxprom46
  store i32 %41, i32* %arrayidx47, align 4
  call void @llvm.nvvm.barrier0()
  store i32 0, i32* %m, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc87, %for.end
  %43 = load i32, i32* %m, align 4
  %cmp49 = icmp slt i32 %43, 16
  br i1 %cmp49, label %for.body50, label %for.end89

for.body50:                                       ; preds = %for.cond48
  %44 = load i32, i32* %tx, align 4
  %45 = load i32, i32* %m, align 4
  %cmp51 = icmp sle i32 %44, %45
  br i1 %cmp51, label %if.then52, label %if.end86

if.then52:                                        ; preds = %for.body50
  %46 = load i32, i32* %tx, align 4
  %add53 = add nsw i32 %46, 1
  store i32 %add53, i32* %t_index_x, align 4
  %47 = load i32, i32* %m, align 4
  %48 = load i32, i32* %tx, align 4
  %sub54 = sub nsw i32 %47, %48
  %add55 = add nsw i32 %sub54, 1
  store i32 %add55, i32* %t_index_y, align 4
  %49 = load i32, i32* %t_index_y, align 4
  %sub56 = sub nsw i32 %49, 1
  %idxprom57 = sext i32 %sub56 to i64
  %arrayidx58 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom57
  %50 = load i32, i32* %t_index_x, align 4
  %sub59 = sub nsw i32 %50, 1
  %idxprom60 = sext i32 %sub59 to i64
  %arrayidx61 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx58, i64 0, i64 %idxprom60
  %51 = load i32, i32* %arrayidx61, align 4
  %52 = load i32, i32* %t_index_y, align 4
  %sub62 = sub nsw i32 %52, 1
  %idxprom63 = sext i32 %sub62 to i64
  %arrayidx64 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom63
  %53 = load i32, i32* %t_index_x, align 4
  %sub65 = sub nsw i32 %53, 1
  %idxprom66 = sext i32 %sub65 to i64
  %arrayidx67 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx64, i64 0, i64 %idxprom66
  %54 = load i32, i32* %arrayidx67, align 4
  %add68 = add nsw i32 %51, %54
  %55 = load i32, i32* %t_index_y, align 4
  %idxprom69 = sext i32 %55 to i64
  %arrayidx70 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom69
  %56 = load i32, i32* %t_index_x, align 4
  %sub71 = sub nsw i32 %56, 1
  %idxprom72 = sext i32 %sub71 to i64
  %arrayidx73 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx70, i64 0, i64 %idxprom72
  %57 = load i32, i32* %arrayidx73, align 4
  %58 = load i32, i32* %penalty.addr, align 4
  %sub74 = sub nsw i32 %57, %58
  %59 = load i32, i32* %t_index_y, align 4
  %sub75 = sub nsw i32 %59, 1
  %idxprom76 = sext i32 %sub75 to i64
  %arrayidx77 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom76
  %60 = load i32, i32* %t_index_x, align 4
  %idxprom78 = sext i32 %60 to i64
  %arrayidx79 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx77, i64 0, i64 %idxprom78
  %61 = load i32, i32* %arrayidx79, align 4
  %62 = load i32, i32* %penalty.addr, align 4
  %sub80 = sub nsw i32 %61, %62
  %call81 = call i32 @_Z14maximum_deviceiii(i32 %add68, i32 %sub74, i32 %sub80) #2
  %63 = load i32, i32* %t_index_y, align 4
  %idxprom82 = sext i32 %63 to i64
  %arrayidx83 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom82
  %64 = load i32, i32* %t_index_x, align 4
  %idxprom84 = sext i32 %64 to i64
  %arrayidx85 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx83, i64 0, i64 %idxprom84
  store i32 %call81, i32* %arrayidx85, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.then52, %for.body50
  call void @llvm.nvvm.barrier0()
  br label %for.inc87

for.inc87:                                        ; preds = %if.end86
  %65 = load i32, i32* %m, align 4
  %inc88 = add nsw i32 %65, 1
  store i32 %inc88, i32* %m, align 4
  br label %for.cond48

for.end89:                                        ; preds = %for.cond48
  store i32 14, i32* %m90, align 4
  br label %for.cond91

for.cond91:                                       ; preds = %for.inc132, %for.end89
  %66 = load i32, i32* %m90, align 4
  %cmp92 = icmp sge i32 %66, 0
  br i1 %cmp92, label %for.body93, label %for.end133

for.body93:                                       ; preds = %for.cond91
  %67 = load i32, i32* %tx, align 4
  %68 = load i32, i32* %m90, align 4
  %cmp94 = icmp sle i32 %67, %68
  br i1 %cmp94, label %if.then95, label %if.end131

if.then95:                                        ; preds = %for.body93
  %69 = load i32, i32* %tx, align 4
  %add97 = add nsw i32 %69, 16
  %70 = load i32, i32* %m90, align 4
  %sub98 = sub nsw i32 %add97, %70
  store i32 %sub98, i32* %t_index_x96, align 4
  %71 = load i32, i32* %tx, align 4
  %sub100 = sub nsw i32 16, %71
  store i32 %sub100, i32* %t_index_y99, align 4
  %72 = load i32, i32* %t_index_y99, align 4
  %sub101 = sub nsw i32 %72, 1
  %idxprom102 = sext i32 %sub101 to i64
  %arrayidx103 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom102
  %73 = load i32, i32* %t_index_x96, align 4
  %sub104 = sub nsw i32 %73, 1
  %idxprom105 = sext i32 %sub104 to i64
  %arrayidx106 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx103, i64 0, i64 %idxprom105
  %74 = load i32, i32* %arrayidx106, align 4
  %75 = load i32, i32* %t_index_y99, align 4
  %sub107 = sub nsw i32 %75, 1
  %idxprom108 = sext i32 %sub107 to i64
  %arrayidx109 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom108
  %76 = load i32, i32* %t_index_x96, align 4
  %sub110 = sub nsw i32 %76, 1
  %idxprom111 = sext i32 %sub110 to i64
  %arrayidx112 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx109, i64 0, i64 %idxprom111
  %77 = load i32, i32* %arrayidx112, align 4
  %add113 = add nsw i32 %74, %77
  %78 = load i32, i32* %t_index_y99, align 4
  %idxprom114 = sext i32 %78 to i64
  %arrayidx115 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom114
  %79 = load i32, i32* %t_index_x96, align 4
  %sub116 = sub nsw i32 %79, 1
  %idxprom117 = sext i32 %sub116 to i64
  %arrayidx118 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx115, i64 0, i64 %idxprom117
  %80 = load i32, i32* %arrayidx118, align 4
  %81 = load i32, i32* %penalty.addr, align 4
  %sub119 = sub nsw i32 %80, %81
  %82 = load i32, i32* %t_index_y99, align 4
  %sub120 = sub nsw i32 %82, 1
  %idxprom121 = sext i32 %sub120 to i64
  %arrayidx122 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom121
  %83 = load i32, i32* %t_index_x96, align 4
  %idxprom123 = sext i32 %83 to i64
  %arrayidx124 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx122, i64 0, i64 %idxprom123
  %84 = load i32, i32* %arrayidx124, align 4
  %85 = load i32, i32* %penalty.addr, align 4
  %sub125 = sub nsw i32 %84, %85
  %call126 = call i32 @_Z14maximum_deviceiii(i32 %add113, i32 %sub119, i32 %sub125) #2
  %86 = load i32, i32* %t_index_y99, align 4
  %idxprom127 = sext i32 %86 to i64
  %arrayidx128 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom127
  %87 = load i32, i32* %t_index_x96, align 4
  %idxprom129 = sext i32 %87 to i64
  %arrayidx130 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx128, i64 0, i64 %idxprom129
  store i32 %call126, i32* %arrayidx130, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.then95, %for.body93
  call void @llvm.nvvm.barrier0()
  br label %for.inc132

for.inc132:                                       ; preds = %if.end131
  %88 = load i32, i32* %m90, align 4
  %dec = add nsw i32 %88, -1
  store i32 %dec, i32* %m90, align 4
  br label %for.cond91

for.end133:                                       ; preds = %for.cond91
  store i32 0, i32* %ty134, align 4
  br label %for.cond135

for.cond135:                                      ; preds = %for.inc148, %for.end133
  %89 = load i32, i32* %ty134, align 4
  %cmp136 = icmp slt i32 %89, 16
  br i1 %cmp136, label %for.body137, label %for.end150

for.body137:                                      ; preds = %for.cond135
  %90 = load i32, i32* %ty134, align 4
  %add138 = add nsw i32 %90, 1
  %idxprom139 = sext i32 %add138 to i64
  %arrayidx140 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom139
  %91 = load i32, i32* %tx, align 4
  %add141 = add nsw i32 %91, 1
  %idxprom142 = sext i32 %add141 to i64
  %arrayidx143 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx140, i64 0, i64 %idxprom142
  %92 = load i32, i32* %arrayidx143, align 4
  %93 = load i32*, i32** %matrix_cuda.addr, align 8
  %94 = load i32, i32* %index, align 4
  %95 = load i32, i32* %ty134, align 4
  %96 = load i32, i32* %cols.addr, align 4
  %mul144 = mul nsw i32 %95, %96
  %add145 = add nsw i32 %94, %mul144
  %idxprom146 = sext i32 %add145 to i64
  %arrayidx147 = getelementptr inbounds i32, i32* %93, i64 %idxprom146
  store i32 %92, i32* %arrayidx147, align 4
  br label %for.inc148

for.inc148:                                       ; preds = %for.body137
  %97 = load i32, i32* %ty134, align 4
  %inc149 = add nsw i32 %97, 1
  store i32 %inc149, i32* %ty134, align 4
  br label %for.cond135

for.end150:                                       ; preds = %for.cond135
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %0
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z20needle_cuda_shared_2PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #0 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %b_index_x = alloca i32, align 4
  %b_index_y = alloca i32, align 4
  %index = alloca i32, align 4
  %index_n = alloca i32, align 4
  %index_w = alloca i32, align 4
  %index_nw = alloca i32, align 4
  %ty = alloca i32, align 4
  %m = alloca i32, align 4
  %t_index_x = alloca i32, align 4
  %t_index_y = alloca i32, align 4
  %m92 = alloca i32, align 4
  %t_index_x98 = alloca i32, align 4
  %t_index_y101 = alloca i32, align 4
  %ty136 = alloca i32, align 4
  store i32* %referrence, i32** %referrence.addr, align 8
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8
  store i32 %cols, i32* %cols.addr, align 4
  store i32 %penalty, i32* %penalty.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %block_width, i32* %block_width.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %bx, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %tx, align 4
  %0 = load i32, i32* %bx, align 4
  %1 = load i32, i32* %block_width.addr, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32, i32* %i.addr, align 4
  %sub = sub nsw i32 %add, %2
  store i32 %sub, i32* %b_index_x, align 4
  %3 = load i32, i32* %block_width.addr, align 4
  %4 = load i32, i32* %bx, align 4
  %sub2 = sub nsw i32 %3, %4
  %sub3 = sub nsw i32 %sub2, 1
  store i32 %sub3, i32* %b_index_y, align 4
  %5 = load i32, i32* %cols.addr, align 4
  %mul = mul nsw i32 %5, 16
  %6 = load i32, i32* %b_index_y, align 4
  %mul4 = mul nsw i32 %mul, %6
  %7 = load i32, i32* %b_index_x, align 4
  %mul5 = mul nsw i32 16, %7
  %add6 = add nsw i32 %mul4, %mul5
  %8 = load i32, i32* %tx, align 4
  %add7 = add nsw i32 %add6, %8
  %9 = load i32, i32* %cols.addr, align 4
  %add8 = add nsw i32 %9, 1
  %add9 = add nsw i32 %add7, %add8
  store i32 %add9, i32* %index, align 4
  %10 = load i32, i32* %cols.addr, align 4
  %mul10 = mul nsw i32 %10, 16
  %11 = load i32, i32* %b_index_y, align 4
  %mul11 = mul nsw i32 %mul10, %11
  %12 = load i32, i32* %b_index_x, align 4
  %mul12 = mul nsw i32 16, %12
  %add13 = add nsw i32 %mul11, %mul12
  %13 = load i32, i32* %tx, align 4
  %add14 = add nsw i32 %add13, %13
  %add15 = add nsw i32 %add14, 1
  store i32 %add15, i32* %index_n, align 4
  %14 = load i32, i32* %cols.addr, align 4
  %mul16 = mul nsw i32 %14, 16
  %15 = load i32, i32* %b_index_y, align 4
  %mul17 = mul nsw i32 %mul16, %15
  %16 = load i32, i32* %b_index_x, align 4
  %mul18 = mul nsw i32 16, %16
  %add19 = add nsw i32 %mul17, %mul18
  %17 = load i32, i32* %cols.addr, align 4
  %add20 = add nsw i32 %add19, %17
  store i32 %add20, i32* %index_w, align 4
  %18 = load i32, i32* %cols.addr, align 4
  %mul21 = mul nsw i32 %18, 16
  %19 = load i32, i32* %b_index_y, align 4
  %mul22 = mul nsw i32 %mul21, %19
  %20 = load i32, i32* %b_index_x, align 4
  %mul23 = mul nsw i32 16, %20
  %add24 = add nsw i32 %mul22, %mul23
  store i32 %add24, i32* %index_nw, align 4
  store i32 0, i32* %ty, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %21 = load i32, i32* %ty, align 4
  %cmp = icmp slt i32 %21, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load i32*, i32** %referrence.addr, align 8
  %23 = load i32, i32* %index, align 4
  %24 = load i32, i32* %cols.addr, align 4
  %25 = load i32, i32* %ty, align 4
  %mul25 = mul nsw i32 %24, %25
  %add26 = add nsw i32 %23, %mul25
  %idxprom = sext i32 %add26 to i64
  %arrayidx = getelementptr inbounds i32, i32* %22, i64 %idxprom
  %26 = load i32, i32* %arrayidx, align 4
  %27 = load i32, i32* %ty, align 4
  %idxprom27 = sext i32 %27 to i64
  %arrayidx28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom27
  %28 = load i32, i32* %tx, align 4
  %idxprom29 = sext i32 %28 to i64
  %arrayidx30 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx28, i64 0, i64 %idxprom29
  store i32 %26, i32* %arrayidx30, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %29 = load i32, i32* %ty, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %ty, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0()
  %30 = load i32, i32* %tx, align 4
  %cmp31 = icmp eq i32 %30, 0
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %31 = load i32*, i32** %matrix_cuda.addr, align 8
  %32 = load i32, i32* %index_nw, align 4
  %idxprom32 = sext i32 %32 to i64
  %arrayidx33 = getelementptr inbounds i32, i32* %31, i64 %idxprom32
  %33 = load i32, i32* %arrayidx33, align 4
  %34 = load i32, i32* %tx, align 4
  %idxprom34 = sext i32 %34 to i64
  %arrayidx35 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom34
  %arrayidx36 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx35, i64 0, i64 0
  store i32 %33, i32* %arrayidx36, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %35 = load i32*, i32** %matrix_cuda.addr, align 8
  %36 = load i32, i32* %index_w, align 4
  %37 = load i32, i32* %cols.addr, align 4
  %38 = load i32, i32* %tx, align 4
  %mul37 = mul nsw i32 %37, %38
  %add38 = add nsw i32 %36, %mul37
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds i32, i32* %35, i64 %idxprom39
  %39 = load i32, i32* %arrayidx40, align 4
  %40 = load i32, i32* %tx, align 4
  %add41 = add nsw i32 %40, 1
  %idxprom42 = sext i32 %add41 to i64
  %arrayidx43 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom42
  %arrayidx44 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx43, i64 0, i64 0
  store i32 %39, i32* %arrayidx44, align 4
  call void @llvm.nvvm.barrier0()
  %41 = load i32*, i32** %matrix_cuda.addr, align 8
  %42 = load i32, i32* %index_n, align 4
  %idxprom45 = sext i32 %42 to i64
  %arrayidx46 = getelementptr inbounds i32, i32* %41, i64 %idxprom45
  %43 = load i32, i32* %arrayidx46, align 4
  %44 = load i32, i32* %tx, align 4
  %add47 = add nsw i32 %44, 1
  %idxprom48 = sext i32 %add47 to i64
  %arrayidx49 = getelementptr inbounds [17 x i32], [17 x i32]* getelementptr inbounds ([17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 0), i64 0, i64 %idxprom48
  store i32 %43, i32* %arrayidx49, align 4
  call void @llvm.nvvm.barrier0()
  store i32 0, i32* %m, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc89, %if.end
  %45 = load i32, i32* %m, align 4
  %cmp51 = icmp slt i32 %45, 16
  br i1 %cmp51, label %for.body52, label %for.end91

for.body52:                                       ; preds = %for.cond50
  %46 = load i32, i32* %tx, align 4
  %47 = load i32, i32* %m, align 4
  %cmp53 = icmp sle i32 %46, %47
  br i1 %cmp53, label %if.then54, label %if.end88

if.then54:                                        ; preds = %for.body52
  %48 = load i32, i32* %tx, align 4
  %add55 = add nsw i32 %48, 1
  store i32 %add55, i32* %t_index_x, align 4
  %49 = load i32, i32* %m, align 4
  %50 = load i32, i32* %tx, align 4
  %sub56 = sub nsw i32 %49, %50
  %add57 = add nsw i32 %sub56, 1
  store i32 %add57, i32* %t_index_y, align 4
  %51 = load i32, i32* %t_index_y, align 4
  %sub58 = sub nsw i32 %51, 1
  %idxprom59 = sext i32 %sub58 to i64
  %arrayidx60 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom59
  %52 = load i32, i32* %t_index_x, align 4
  %sub61 = sub nsw i32 %52, 1
  %idxprom62 = sext i32 %sub61 to i64
  %arrayidx63 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx60, i64 0, i64 %idxprom62
  %53 = load i32, i32* %arrayidx63, align 4
  %54 = load i32, i32* %t_index_y, align 4
  %sub64 = sub nsw i32 %54, 1
  %idxprom65 = sext i32 %sub64 to i64
  %arrayidx66 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom65
  %55 = load i32, i32* %t_index_x, align 4
  %sub67 = sub nsw i32 %55, 1
  %idxprom68 = sext i32 %sub67 to i64
  %arrayidx69 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx66, i64 0, i64 %idxprom68
  %56 = load i32, i32* %arrayidx69, align 4
  %add70 = add nsw i32 %53, %56
  %57 = load i32, i32* %t_index_y, align 4
  %idxprom71 = sext i32 %57 to i64
  %arrayidx72 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom71
  %58 = load i32, i32* %t_index_x, align 4
  %sub73 = sub nsw i32 %58, 1
  %idxprom74 = sext i32 %sub73 to i64
  %arrayidx75 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx72, i64 0, i64 %idxprom74
  %59 = load i32, i32* %arrayidx75, align 4
  %60 = load i32, i32* %penalty.addr, align 4
  %sub76 = sub nsw i32 %59, %60
  %61 = load i32, i32* %t_index_y, align 4
  %sub77 = sub nsw i32 %61, 1
  %idxprom78 = sext i32 %sub77 to i64
  %arrayidx79 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom78
  %62 = load i32, i32* %t_index_x, align 4
  %idxprom80 = sext i32 %62 to i64
  %arrayidx81 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx79, i64 0, i64 %idxprom80
  %63 = load i32, i32* %arrayidx81, align 4
  %64 = load i32, i32* %penalty.addr, align 4
  %sub82 = sub nsw i32 %63, %64
  %call83 = call i32 @_Z14maximum_deviceiii(i32 %add70, i32 %sub76, i32 %sub82) #2
  %65 = load i32, i32* %t_index_y, align 4
  %idxprom84 = sext i32 %65 to i64
  %arrayidx85 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom84
  %66 = load i32, i32* %t_index_x, align 4
  %idxprom86 = sext i32 %66 to i64
  %arrayidx87 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx85, i64 0, i64 %idxprom86
  store i32 %call83, i32* %arrayidx87, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.then54, %for.body52
  call void @llvm.nvvm.barrier0()
  br label %for.inc89

for.inc89:                                        ; preds = %if.end88
  %67 = load i32, i32* %m, align 4
  %inc90 = add nsw i32 %67, 1
  store i32 %inc90, i32* %m, align 4
  br label %for.cond50

for.end91:                                        ; preds = %for.cond50
  store i32 14, i32* %m92, align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc134, %for.end91
  %68 = load i32, i32* %m92, align 4
  %cmp94 = icmp sge i32 %68, 0
  br i1 %cmp94, label %for.body95, label %for.end135

for.body95:                                       ; preds = %for.cond93
  %69 = load i32, i32* %tx, align 4
  %70 = load i32, i32* %m92, align 4
  %cmp96 = icmp sle i32 %69, %70
  br i1 %cmp96, label %if.then97, label %if.end133

if.then97:                                        ; preds = %for.body95
  %71 = load i32, i32* %tx, align 4
  %add99 = add nsw i32 %71, 16
  %72 = load i32, i32* %m92, align 4
  %sub100 = sub nsw i32 %add99, %72
  store i32 %sub100, i32* %t_index_x98, align 4
  %73 = load i32, i32* %tx, align 4
  %sub102 = sub nsw i32 16, %73
  store i32 %sub102, i32* %t_index_y101, align 4
  %74 = load i32, i32* %t_index_y101, align 4
  %sub103 = sub nsw i32 %74, 1
  %idxprom104 = sext i32 %sub103 to i64
  %arrayidx105 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom104
  %75 = load i32, i32* %t_index_x98, align 4
  %sub106 = sub nsw i32 %75, 1
  %idxprom107 = sext i32 %sub106 to i64
  %arrayidx108 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx105, i64 0, i64 %idxprom107
  %76 = load i32, i32* %arrayidx108, align 4
  %77 = load i32, i32* %t_index_y101, align 4
  %sub109 = sub nsw i32 %77, 1
  %idxprom110 = sext i32 %sub109 to i64
  %arrayidx111 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* addrspacecast ([16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref to [16 x [16 x i32]]*), i64 0, i64 %idxprom110
  %78 = load i32, i32* %t_index_x98, align 4
  %sub112 = sub nsw i32 %78, 1
  %idxprom113 = sext i32 %sub112 to i64
  %arrayidx114 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx111, i64 0, i64 %idxprom113
  %79 = load i32, i32* %arrayidx114, align 4
  %add115 = add nsw i32 %76, %79
  %80 = load i32, i32* %t_index_y101, align 4
  %idxprom116 = sext i32 %80 to i64
  %arrayidx117 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom116
  %81 = load i32, i32* %t_index_x98, align 4
  %sub118 = sub nsw i32 %81, 1
  %idxprom119 = sext i32 %sub118 to i64
  %arrayidx120 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx117, i64 0, i64 %idxprom119
  %82 = load i32, i32* %arrayidx120, align 4
  %83 = load i32, i32* %penalty.addr, align 4
  %sub121 = sub nsw i32 %82, %83
  %84 = load i32, i32* %t_index_y101, align 4
  %sub122 = sub nsw i32 %84, 1
  %idxprom123 = sext i32 %sub122 to i64
  %arrayidx124 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom123
  %85 = load i32, i32* %t_index_x98, align 4
  %idxprom125 = sext i32 %85 to i64
  %arrayidx126 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx124, i64 0, i64 %idxprom125
  %86 = load i32, i32* %arrayidx126, align 4
  %87 = load i32, i32* %penalty.addr, align 4
  %sub127 = sub nsw i32 %86, %87
  %call128 = call i32 @_Z14maximum_deviceiii(i32 %add115, i32 %sub121, i32 %sub127) #2
  %88 = load i32, i32* %t_index_y101, align 4
  %idxprom129 = sext i32 %88 to i64
  %arrayidx130 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom129
  %89 = load i32, i32* %t_index_x98, align 4
  %idxprom131 = sext i32 %89 to i64
  %arrayidx132 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx130, i64 0, i64 %idxprom131
  store i32 %call128, i32* %arrayidx132, align 4
  br label %if.end133

if.end133:                                        ; preds = %if.then97, %for.body95
  call void @llvm.nvvm.barrier0()
  br label %for.inc134

for.inc134:                                       ; preds = %if.end133
  %90 = load i32, i32* %m92, align 4
  %dec = add nsw i32 %90, -1
  store i32 %dec, i32* %m92, align 4
  br label %for.cond93

for.end135:                                       ; preds = %for.cond93
  store i32 0, i32* %ty136, align 4
  br label %for.cond137

for.cond137:                                      ; preds = %for.inc150, %for.end135
  %91 = load i32, i32* %ty136, align 4
  %cmp138 = icmp slt i32 %91, 16
  br i1 %cmp138, label %for.body139, label %for.end152

for.body139:                                      ; preds = %for.cond137
  %92 = load i32, i32* %ty136, align 4
  %add140 = add nsw i32 %92, 1
  %idxprom141 = sext i32 %add140 to i64
  %arrayidx142 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]]* addrspacecast ([17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp to [17 x [17 x i32]]*), i64 0, i64 %idxprom141
  %93 = load i32, i32* %tx, align 4
  %add143 = add nsw i32 %93, 1
  %idxprom144 = sext i32 %add143 to i64
  %arrayidx145 = getelementptr inbounds [17 x i32], [17 x i32]* %arrayidx142, i64 0, i64 %idxprom144
  %94 = load i32, i32* %arrayidx145, align 4
  %95 = load i32*, i32** %matrix_cuda.addr, align 8
  %96 = load i32, i32* %index, align 4
  %97 = load i32, i32* %ty136, align 4
  %98 = load i32, i32* %cols.addr, align 4
  %mul146 = mul nsw i32 %97, %98
  %add147 = add nsw i32 %96, %mul146
  %idxprom148 = sext i32 %add147 to i64
  %arrayidx149 = getelementptr inbounds i32, i32* %95, i64 %idxprom148
  store i32 %94, i32* %arrayidx149, align 4
  br label %for.inc150

for.inc150:                                       ; preds = %for.body139
  %99 = load i32, i32* %ty136, align 4
  %inc151 = add nsw i32 %99, 1
  store i32 %inc151, i32* %ty136, align 4
  br label %for.cond137

for.end152:                                       ; preds = %for.cond137
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind readnone }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !6, !5, !7, !7, !7, !7, !8, !8, !7}
!llvm.ident = !{!9}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_1PiS_iiii, !"kernel", i32 1}
!4 = !{void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_2PiS_iiii, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = !{i32 1, i32 4}
