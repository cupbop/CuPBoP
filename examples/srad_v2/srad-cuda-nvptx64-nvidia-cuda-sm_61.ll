; ModuleID = 'srad-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "srad.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_gridDim_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

$_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv = comdat any

$_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@gridDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_gridDim_t, align 1
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE13c_cuda_result = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE4temp = internal addrspace(3) global [16 x [16 x float]] undef, align 4

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
define dso_local void @_Z11srad_cuda_1PfS_S_S_S_S_iif(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %q0sqr) #0 {
entry:
  %E_C.addr = alloca float*, align 8
  %W_C.addr = alloca float*, align 8
  %N_C.addr = alloca float*, align 8
  %S_C.addr = alloca float*, align 8
  %J_cuda.addr = alloca float*, align 8
  %C_cuda.addr = alloca float*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %q0sqr.addr = alloca float, align 4
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_n = alloca i32, align 4
  %index_s = alloca i32, align 4
  %index_w = alloca i32, align 4
  %index_e = alloca i32, align 4
  %n = alloca float, align 4
  %w = alloca float, align 4
  %e = alloca float, align 4
  %s = alloca float, align 4
  %jc = alloca float, align 4
  %g2 = alloca float, align 4
  %l = alloca float, align 4
  %num = alloca float, align 4
  %den = alloca float, align 4
  %qsqr = alloca float, align 4
  %c = alloca float, align 4
  store float* %E_C, float** %E_C.addr, align 8
  store float* %W_C, float** %W_C.addr, align 8
  store float* %N_C, float** %N_C.addr, align 8
  store float* %S_C, float** %S_C.addr, align 8
  store float* %J_cuda, float** %J_cuda.addr, align 8
  store float* %C_cuda, float** %C_cuda.addr, align 8
  store i32 %cols, i32* %cols.addr, align 4
  store i32 %rows, i32* %rows.addr, align 4
  store float %q0sqr, float* %q0sqr.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %bx, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #2
  store i32 %call1, i32* %by, align 4
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call2, i32* %tx, align 4
  %call3 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  store i32 %call3, i32* %ty, align 4
  %0 = load i32, i32* %cols.addr, align 4
  %mul = mul nsw i32 %0, 16
  %1 = load i32, i32* %by, align 4
  %mul4 = mul nsw i32 %mul, %1
  %2 = load i32, i32* %bx, align 4
  %mul5 = mul nsw i32 16, %2
  %add = add nsw i32 %mul4, %mul5
  %3 = load i32, i32* %cols.addr, align 4
  %4 = load i32, i32* %ty, align 4
  %mul6 = mul nsw i32 %3, %4
  %add7 = add nsw i32 %add, %mul6
  %5 = load i32, i32* %tx, align 4
  %add8 = add nsw i32 %add7, %5
  store i32 %add8, i32* %index, align 4
  %6 = load i32, i32* %cols.addr, align 4
  %mul9 = mul nsw i32 %6, 16
  %7 = load i32, i32* %by, align 4
  %mul10 = mul nsw i32 %mul9, %7
  %8 = load i32, i32* %bx, align 4
  %mul11 = mul nsw i32 16, %8
  %add12 = add nsw i32 %mul10, %mul11
  %9 = load i32, i32* %tx, align 4
  %add13 = add nsw i32 %add12, %9
  %10 = load i32, i32* %cols.addr, align 4
  %sub = sub nsw i32 %add13, %10
  store i32 %sub, i32* %index_n, align 4
  %11 = load i32, i32* %cols.addr, align 4
  %mul14 = mul nsw i32 %11, 16
  %12 = load i32, i32* %by, align 4
  %mul15 = mul nsw i32 %mul14, %12
  %13 = load i32, i32* %bx, align 4
  %mul16 = mul nsw i32 16, %13
  %add17 = add nsw i32 %mul15, %mul16
  %14 = load i32, i32* %cols.addr, align 4
  %mul18 = mul nsw i32 %14, 16
  %add19 = add nsw i32 %add17, %mul18
  %15 = load i32, i32* %tx, align 4
  %add20 = add nsw i32 %add19, %15
  store i32 %add20, i32* %index_s, align 4
  %16 = load i32, i32* %cols.addr, align 4
  %mul21 = mul nsw i32 %16, 16
  %17 = load i32, i32* %by, align 4
  %mul22 = mul nsw i32 %mul21, %17
  %18 = load i32, i32* %bx, align 4
  %mul23 = mul nsw i32 16, %18
  %add24 = add nsw i32 %mul22, %mul23
  %19 = load i32, i32* %cols.addr, align 4
  %20 = load i32, i32* %ty, align 4
  %mul25 = mul nsw i32 %19, %20
  %add26 = add nsw i32 %add24, %mul25
  %sub27 = sub nsw i32 %add26, 1
  store i32 %sub27, i32* %index_w, align 4
  %21 = load i32, i32* %cols.addr, align 4
  %mul28 = mul nsw i32 %21, 16
  %22 = load i32, i32* %by, align 4
  %mul29 = mul nsw i32 %mul28, %22
  %23 = load i32, i32* %bx, align 4
  %mul30 = mul nsw i32 16, %23
  %add31 = add nsw i32 %mul29, %mul30
  %24 = load i32, i32* %cols.addr, align 4
  %25 = load i32, i32* %ty, align 4
  %mul32 = mul nsw i32 %24, %25
  %add33 = add nsw i32 %add31, %mul32
  %add34 = add nsw i32 %add33, 16
  store i32 %add34, i32* %index_e, align 4
  %26 = load float*, float** %J_cuda.addr, align 8
  %27 = load i32, i32* %index_n, align 4
  %idxprom = sext i32 %27 to i64
  %arrayidx = getelementptr inbounds float, float* %26, i64 %idxprom
  %28 = load float, float* %arrayidx, align 4
  %29 = load i32, i32* %ty, align 4
  %idxprom35 = sext i32 %29 to i64
  %arrayidx36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom35
  %30 = load i32, i32* %tx, align 4
  %idxprom37 = sext i32 %30 to i64
  %arrayidx38 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx36, i64 0, i64 %idxprom37
  store float %28, float* %arrayidx38, align 4
  %31 = load float*, float** %J_cuda.addr, align 8
  %32 = load i32, i32* %index_s, align 4
  %idxprom39 = sext i32 %32 to i64
  %arrayidx40 = getelementptr inbounds float, float* %31, i64 %idxprom39
  %33 = load float, float* %arrayidx40, align 4
  %34 = load i32, i32* %ty, align 4
  %idxprom41 = sext i32 %34 to i64
  %arrayidx42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom41
  %35 = load i32, i32* %tx, align 4
  %idxprom43 = sext i32 %35 to i64
  %arrayidx44 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx42, i64 0, i64 %idxprom43
  store float %33, float* %arrayidx44, align 4
  %36 = load i32, i32* %by, align 4
  %cmp = icmp eq i32 %36, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %37 = load float*, float** %J_cuda.addr, align 8
  %38 = load i32, i32* %bx, align 4
  %mul45 = mul nsw i32 16, %38
  %39 = load i32, i32* %tx, align 4
  %add46 = add nsw i32 %mul45, %39
  %idxprom47 = sext i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds float, float* %37, i64 %idxprom47
  %40 = load float, float* %arrayidx48, align 4
  %41 = load i32, i32* %ty, align 4
  %idxprom49 = sext i32 %41 to i64
  %arrayidx50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom49
  %42 = load i32, i32* %tx, align 4
  %idxprom51 = sext i32 %42 to i64
  %arrayidx52 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx50, i64 0, i64 %idxprom51
  store float %40, float* %arrayidx52, align 4
  br label %if.end72

if.else:                                          ; preds = %entry
  %43 = load i32, i32* %by, align 4
  %call53 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv() #2
  %sub54 = sub i32 %call53, 1
  %cmp55 = icmp eq i32 %43, %sub54
  br i1 %cmp55, label %if.then56, label %if.end

if.then56:                                        ; preds = %if.else
  %44 = load float*, float** %J_cuda.addr, align 8
  %45 = load i32, i32* %cols.addr, align 4
  %mul57 = mul nsw i32 %45, 16
  %call58 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv() #2
  %sub59 = sub i32 %call58, 1
  %mul60 = mul i32 %mul57, %sub59
  %46 = load i32, i32* %bx, align 4
  %mul61 = mul nsw i32 16, %46
  %add62 = add i32 %mul60, %mul61
  %47 = load i32, i32* %cols.addr, align 4
  %mul63 = mul nsw i32 %47, 15
  %add64 = add i32 %add62, %mul63
  %48 = load i32, i32* %tx, align 4
  %add65 = add i32 %add64, %48
  %idxprom66 = zext i32 %add65 to i64
  %arrayidx67 = getelementptr inbounds float, float* %44, i64 %idxprom66
  %49 = load float, float* %arrayidx67, align 4
  %50 = load i32, i32* %ty, align 4
  %idxprom68 = sext i32 %50 to i64
  %arrayidx69 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom68
  %51 = load i32, i32* %tx, align 4
  %idxprom70 = sext i32 %51 to i64
  %arrayidx71 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx69, i64 0, i64 %idxprom70
  store float %49, float* %arrayidx71, align 4
  br label %if.end

if.end:                                           ; preds = %if.then56, %if.else
  br label %if.end72

if.end72:                                         ; preds = %if.end, %if.then
  call void @llvm.nvvm.barrier0()
  %52 = load float*, float** %J_cuda.addr, align 8
  %53 = load i32, i32* %index_w, align 4
  %idxprom73 = sext i32 %53 to i64
  %arrayidx74 = getelementptr inbounds float, float* %52, i64 %idxprom73
  %54 = load float, float* %arrayidx74, align 4
  %55 = load i32, i32* %ty, align 4
  %idxprom75 = sext i32 %55 to i64
  %arrayidx76 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom75
  %56 = load i32, i32* %tx, align 4
  %idxprom77 = sext i32 %56 to i64
  %arrayidx78 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx76, i64 0, i64 %idxprom77
  store float %54, float* %arrayidx78, align 4
  %57 = load float*, float** %J_cuda.addr, align 8
  %58 = load i32, i32* %index_e, align 4
  %idxprom79 = sext i32 %58 to i64
  %arrayidx80 = getelementptr inbounds float, float* %57, i64 %idxprom79
  %59 = load float, float* %arrayidx80, align 4
  %60 = load i32, i32* %ty, align 4
  %idxprom81 = sext i32 %60 to i64
  %arrayidx82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom81
  %61 = load i32, i32* %tx, align 4
  %idxprom83 = sext i32 %61 to i64
  %arrayidx84 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx82, i64 0, i64 %idxprom83
  store float %59, float* %arrayidx84, align 4
  %62 = load i32, i32* %bx, align 4
  %cmp85 = icmp eq i32 %62, 0
  br i1 %cmp85, label %if.then86, label %if.else97

if.then86:                                        ; preds = %if.end72
  %63 = load float*, float** %J_cuda.addr, align 8
  %64 = load i32, i32* %cols.addr, align 4
  %mul87 = mul nsw i32 %64, 16
  %65 = load i32, i32* %by, align 4
  %mul88 = mul nsw i32 %mul87, %65
  %66 = load i32, i32* %cols.addr, align 4
  %67 = load i32, i32* %ty, align 4
  %mul89 = mul nsw i32 %66, %67
  %add90 = add nsw i32 %mul88, %mul89
  %idxprom91 = sext i32 %add90 to i64
  %arrayidx92 = getelementptr inbounds float, float* %63, i64 %idxprom91
  %68 = load float, float* %arrayidx92, align 4
  %69 = load i32, i32* %ty, align 4
  %idxprom93 = sext i32 %69 to i64
  %arrayidx94 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom93
  %70 = load i32, i32* %tx, align 4
  %idxprom95 = sext i32 %70 to i64
  %arrayidx96 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx94, i64 0, i64 %idxprom95
  store float %68, float* %arrayidx96, align 4
  br label %if.end119

if.else97:                                        ; preds = %if.end72
  %71 = load i32, i32* %bx, align 4
  %call98 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #2
  %sub99 = sub i32 %call98, 1
  %cmp100 = icmp eq i32 %71, %sub99
  br i1 %cmp100, label %if.then101, label %if.end118

if.then101:                                       ; preds = %if.else97
  %72 = load float*, float** %J_cuda.addr, align 8
  %73 = load i32, i32* %cols.addr, align 4
  %mul102 = mul nsw i32 %73, 16
  %74 = load i32, i32* %by, align 4
  %mul103 = mul nsw i32 %mul102, %74
  %call104 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #2
  %sub105 = sub i32 %call104, 1
  %mul106 = mul i32 16, %sub105
  %add107 = add i32 %mul103, %mul106
  %75 = load i32, i32* %cols.addr, align 4
  %76 = load i32, i32* %ty, align 4
  %mul108 = mul nsw i32 %75, %76
  %add109 = add i32 %add107, %mul108
  %add110 = add i32 %add109, 16
  %sub111 = sub i32 %add110, 1
  %idxprom112 = zext i32 %sub111 to i64
  %arrayidx113 = getelementptr inbounds float, float* %72, i64 %idxprom112
  %77 = load float, float* %arrayidx113, align 4
  %78 = load i32, i32* %ty, align 4
  %idxprom114 = sext i32 %78 to i64
  %arrayidx115 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom114
  %79 = load i32, i32* %tx, align 4
  %idxprom116 = sext i32 %79 to i64
  %arrayidx117 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx115, i64 0, i64 %idxprom116
  store float %77, float* %arrayidx117, align 4
  br label %if.end118

if.end118:                                        ; preds = %if.then101, %if.else97
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %if.then86
  call void @llvm.nvvm.barrier0()
  %80 = load float*, float** %J_cuda.addr, align 8
  %81 = load i32, i32* %index, align 4
  %idxprom120 = sext i32 %81 to i64
  %arrayidx121 = getelementptr inbounds float, float* %80, i64 %idxprom120
  %82 = load float, float* %arrayidx121, align 4
  %83 = load i32, i32* %ty, align 4
  %idxprom122 = sext i32 %83 to i64
  %arrayidx123 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom122
  %84 = load i32, i32* %tx, align 4
  %idxprom124 = sext i32 %84 to i64
  %arrayidx125 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx123, i64 0, i64 %idxprom124
  store float %82, float* %arrayidx125, align 4
  call void @llvm.nvvm.barrier0()
  %85 = load i32, i32* %ty, align 4
  %idxprom126 = sext i32 %85 to i64
  %arrayidx127 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom126
  %86 = load i32, i32* %tx, align 4
  %idxprom128 = sext i32 %86 to i64
  %arrayidx129 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx127, i64 0, i64 %idxprom128
  %87 = load float, float* %arrayidx129, align 4
  store float %87, float* %jc, align 4
  %88 = load i32, i32* %ty, align 4
  %cmp130 = icmp eq i32 %88, 0
  br i1 %cmp130, label %land.lhs.true, label %if.else155

land.lhs.true:                                    ; preds = %if.end119
  %89 = load i32, i32* %tx, align 4
  %cmp131 = icmp eq i32 %89, 0
  br i1 %cmp131, label %if.then132, label %if.else155

if.then132:                                       ; preds = %land.lhs.true
  %90 = load i32, i32* %ty, align 4
  %idxprom133 = sext i32 %90 to i64
  %arrayidx134 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom133
  %91 = load i32, i32* %tx, align 4
  %idxprom135 = sext i32 %91 to i64
  %arrayidx136 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx134, i64 0, i64 %idxprom135
  %92 = load float, float* %arrayidx136, align 4
  %93 = load float, float* %jc, align 4
  %sub137 = fsub contract float %92, %93
  store float %sub137, float* %n, align 4
  %94 = load i32, i32* %ty, align 4
  %add138 = add nsw i32 %94, 1
  %idxprom139 = sext i32 %add138 to i64
  %arrayidx140 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom139
  %95 = load i32, i32* %tx, align 4
  %idxprom141 = sext i32 %95 to i64
  %arrayidx142 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx140, i64 0, i64 %idxprom141
  %96 = load float, float* %arrayidx142, align 4
  %97 = load float, float* %jc, align 4
  %sub143 = fsub contract float %96, %97
  store float %sub143, float* %s, align 4
  %98 = load i32, i32* %ty, align 4
  %idxprom144 = sext i32 %98 to i64
  %arrayidx145 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom144
  %99 = load i32, i32* %tx, align 4
  %idxprom146 = sext i32 %99 to i64
  %arrayidx147 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx145, i64 0, i64 %idxprom146
  %100 = load float, float* %arrayidx147, align 4
  %101 = load float, float* %jc, align 4
  %sub148 = fsub contract float %100, %101
  store float %sub148, float* %w, align 4
  %102 = load i32, i32* %ty, align 4
  %idxprom149 = sext i32 %102 to i64
  %arrayidx150 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom149
  %103 = load i32, i32* %tx, align 4
  %add151 = add nsw i32 %103, 1
  %idxprom152 = sext i32 %add151 to i64
  %arrayidx153 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx150, i64 0, i64 %idxprom152
  %104 = load float, float* %arrayidx153, align 4
  %105 = load float, float* %jc, align 4
  %sub154 = fsub contract float %104, %105
  store float %sub154, float* %e, align 4
  br label %if.end372

if.else155:                                       ; preds = %land.lhs.true, %if.end119
  %106 = load i32, i32* %ty, align 4
  %cmp156 = icmp eq i32 %106, 0
  br i1 %cmp156, label %land.lhs.true157, label %if.else182

land.lhs.true157:                                 ; preds = %if.else155
  %107 = load i32, i32* %tx, align 4
  %cmp158 = icmp eq i32 %107, 15
  br i1 %cmp158, label %if.then159, label %if.else182

if.then159:                                       ; preds = %land.lhs.true157
  %108 = load i32, i32* %ty, align 4
  %idxprom160 = sext i32 %108 to i64
  %arrayidx161 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom160
  %109 = load i32, i32* %tx, align 4
  %idxprom162 = sext i32 %109 to i64
  %arrayidx163 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx161, i64 0, i64 %idxprom162
  %110 = load float, float* %arrayidx163, align 4
  %111 = load float, float* %jc, align 4
  %sub164 = fsub contract float %110, %111
  store float %sub164, float* %n, align 4
  %112 = load i32, i32* %ty, align 4
  %add165 = add nsw i32 %112, 1
  %idxprom166 = sext i32 %add165 to i64
  %arrayidx167 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom166
  %113 = load i32, i32* %tx, align 4
  %idxprom168 = sext i32 %113 to i64
  %arrayidx169 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx167, i64 0, i64 %idxprom168
  %114 = load float, float* %arrayidx169, align 4
  %115 = load float, float* %jc, align 4
  %sub170 = fsub contract float %114, %115
  store float %sub170, float* %s, align 4
  %116 = load i32, i32* %ty, align 4
  %idxprom171 = sext i32 %116 to i64
  %arrayidx172 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom171
  %117 = load i32, i32* %tx, align 4
  %sub173 = sub nsw i32 %117, 1
  %idxprom174 = sext i32 %sub173 to i64
  %arrayidx175 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx172, i64 0, i64 %idxprom174
  %118 = load float, float* %arrayidx175, align 4
  %119 = load float, float* %jc, align 4
  %sub176 = fsub contract float %118, %119
  store float %sub176, float* %w, align 4
  %120 = load i32, i32* %ty, align 4
  %idxprom177 = sext i32 %120 to i64
  %arrayidx178 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom177
  %121 = load i32, i32* %tx, align 4
  %idxprom179 = sext i32 %121 to i64
  %arrayidx180 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx178, i64 0, i64 %idxprom179
  %122 = load float, float* %arrayidx180, align 4
  %123 = load float, float* %jc, align 4
  %sub181 = fsub contract float %122, %123
  store float %sub181, float* %e, align 4
  br label %if.end371

if.else182:                                       ; preds = %land.lhs.true157, %if.else155
  %124 = load i32, i32* %ty, align 4
  %cmp183 = icmp eq i32 %124, 15
  br i1 %cmp183, label %land.lhs.true184, label %if.else209

land.lhs.true184:                                 ; preds = %if.else182
  %125 = load i32, i32* %tx, align 4
  %cmp185 = icmp eq i32 %125, 15
  br i1 %cmp185, label %if.then186, label %if.else209

if.then186:                                       ; preds = %land.lhs.true184
  %126 = load i32, i32* %ty, align 4
  %sub187 = sub nsw i32 %126, 1
  %idxprom188 = sext i32 %sub187 to i64
  %arrayidx189 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom188
  %127 = load i32, i32* %tx, align 4
  %idxprom190 = sext i32 %127 to i64
  %arrayidx191 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx189, i64 0, i64 %idxprom190
  %128 = load float, float* %arrayidx191, align 4
  %129 = load float, float* %jc, align 4
  %sub192 = fsub contract float %128, %129
  store float %sub192, float* %n, align 4
  %130 = load i32, i32* %ty, align 4
  %idxprom193 = sext i32 %130 to i64
  %arrayidx194 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom193
  %131 = load i32, i32* %tx, align 4
  %idxprom195 = sext i32 %131 to i64
  %arrayidx196 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx194, i64 0, i64 %idxprom195
  %132 = load float, float* %arrayidx196, align 4
  %133 = load float, float* %jc, align 4
  %sub197 = fsub contract float %132, %133
  store float %sub197, float* %s, align 4
  %134 = load i32, i32* %ty, align 4
  %idxprom198 = sext i32 %134 to i64
  %arrayidx199 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom198
  %135 = load i32, i32* %tx, align 4
  %sub200 = sub nsw i32 %135, 1
  %idxprom201 = sext i32 %sub200 to i64
  %arrayidx202 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx199, i64 0, i64 %idxprom201
  %136 = load float, float* %arrayidx202, align 4
  %137 = load float, float* %jc, align 4
  %sub203 = fsub contract float %136, %137
  store float %sub203, float* %w, align 4
  %138 = load i32, i32* %ty, align 4
  %idxprom204 = sext i32 %138 to i64
  %arrayidx205 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom204
  %139 = load i32, i32* %tx, align 4
  %idxprom206 = sext i32 %139 to i64
  %arrayidx207 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx205, i64 0, i64 %idxprom206
  %140 = load float, float* %arrayidx207, align 4
  %141 = load float, float* %jc, align 4
  %sub208 = fsub contract float %140, %141
  store float %sub208, float* %e, align 4
  br label %if.end370

if.else209:                                       ; preds = %land.lhs.true184, %if.else182
  %142 = load i32, i32* %ty, align 4
  %cmp210 = icmp eq i32 %142, 15
  br i1 %cmp210, label %land.lhs.true211, label %if.else236

land.lhs.true211:                                 ; preds = %if.else209
  %143 = load i32, i32* %tx, align 4
  %cmp212 = icmp eq i32 %143, 0
  br i1 %cmp212, label %if.then213, label %if.else236

if.then213:                                       ; preds = %land.lhs.true211
  %144 = load i32, i32* %ty, align 4
  %sub214 = sub nsw i32 %144, 1
  %idxprom215 = sext i32 %sub214 to i64
  %arrayidx216 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom215
  %145 = load i32, i32* %tx, align 4
  %idxprom217 = sext i32 %145 to i64
  %arrayidx218 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx216, i64 0, i64 %idxprom217
  %146 = load float, float* %arrayidx218, align 4
  %147 = load float, float* %jc, align 4
  %sub219 = fsub contract float %146, %147
  store float %sub219, float* %n, align 4
  %148 = load i32, i32* %ty, align 4
  %idxprom220 = sext i32 %148 to i64
  %arrayidx221 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom220
  %149 = load i32, i32* %tx, align 4
  %idxprom222 = sext i32 %149 to i64
  %arrayidx223 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx221, i64 0, i64 %idxprom222
  %150 = load float, float* %arrayidx223, align 4
  %151 = load float, float* %jc, align 4
  %sub224 = fsub contract float %150, %151
  store float %sub224, float* %s, align 4
  %152 = load i32, i32* %ty, align 4
  %idxprom225 = sext i32 %152 to i64
  %arrayidx226 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom225
  %153 = load i32, i32* %tx, align 4
  %idxprom227 = sext i32 %153 to i64
  %arrayidx228 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx226, i64 0, i64 %idxprom227
  %154 = load float, float* %arrayidx228, align 4
  %155 = load float, float* %jc, align 4
  %sub229 = fsub contract float %154, %155
  store float %sub229, float* %w, align 4
  %156 = load i32, i32* %ty, align 4
  %idxprom230 = sext i32 %156 to i64
  %arrayidx231 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom230
  %157 = load i32, i32* %tx, align 4
  %add232 = add nsw i32 %157, 1
  %idxprom233 = sext i32 %add232 to i64
  %arrayidx234 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx231, i64 0, i64 %idxprom233
  %158 = load float, float* %arrayidx234, align 4
  %159 = load float, float* %jc, align 4
  %sub235 = fsub contract float %158, %159
  store float %sub235, float* %e, align 4
  br label %if.end369

if.else236:                                       ; preds = %land.lhs.true211, %if.else209
  %160 = load i32, i32* %ty, align 4
  %cmp237 = icmp eq i32 %160, 0
  br i1 %cmp237, label %if.then238, label %if.else262

if.then238:                                       ; preds = %if.else236
  %161 = load i32, i32* %ty, align 4
  %idxprom239 = sext i32 %161 to i64
  %arrayidx240 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5north to [16 x [16 x float]]*), i64 0, i64 %idxprom239
  %162 = load i32, i32* %tx, align 4
  %idxprom241 = sext i32 %162 to i64
  %arrayidx242 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx240, i64 0, i64 %idxprom241
  %163 = load float, float* %arrayidx242, align 4
  %164 = load float, float* %jc, align 4
  %sub243 = fsub contract float %163, %164
  store float %sub243, float* %n, align 4
  %165 = load i32, i32* %ty, align 4
  %add244 = add nsw i32 %165, 1
  %idxprom245 = sext i32 %add244 to i64
  %arrayidx246 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom245
  %166 = load i32, i32* %tx, align 4
  %idxprom247 = sext i32 %166 to i64
  %arrayidx248 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx246, i64 0, i64 %idxprom247
  %167 = load float, float* %arrayidx248, align 4
  %168 = load float, float* %jc, align 4
  %sub249 = fsub contract float %167, %168
  store float %sub249, float* %s, align 4
  %169 = load i32, i32* %ty, align 4
  %idxprom250 = sext i32 %169 to i64
  %arrayidx251 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom250
  %170 = load i32, i32* %tx, align 4
  %sub252 = sub nsw i32 %170, 1
  %idxprom253 = sext i32 %sub252 to i64
  %arrayidx254 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx251, i64 0, i64 %idxprom253
  %171 = load float, float* %arrayidx254, align 4
  %172 = load float, float* %jc, align 4
  %sub255 = fsub contract float %171, %172
  store float %sub255, float* %w, align 4
  %173 = load i32, i32* %ty, align 4
  %idxprom256 = sext i32 %173 to i64
  %arrayidx257 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom256
  %174 = load i32, i32* %tx, align 4
  %add258 = add nsw i32 %174, 1
  %idxprom259 = sext i32 %add258 to i64
  %arrayidx260 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx257, i64 0, i64 %idxprom259
  %175 = load float, float* %arrayidx260, align 4
  %176 = load float, float* %jc, align 4
  %sub261 = fsub contract float %175, %176
  store float %sub261, float* %e, align 4
  br label %if.end368

if.else262:                                       ; preds = %if.else236
  %177 = load i32, i32* %tx, align 4
  %cmp263 = icmp eq i32 %177, 15
  br i1 %cmp263, label %if.then264, label %if.else288

if.then264:                                       ; preds = %if.else262
  %178 = load i32, i32* %ty, align 4
  %sub265 = sub nsw i32 %178, 1
  %idxprom266 = sext i32 %sub265 to i64
  %arrayidx267 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom266
  %179 = load i32, i32* %tx, align 4
  %idxprom268 = sext i32 %179 to i64
  %arrayidx269 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx267, i64 0, i64 %idxprom268
  %180 = load float, float* %arrayidx269, align 4
  %181 = load float, float* %jc, align 4
  %sub270 = fsub contract float %180, %181
  store float %sub270, float* %n, align 4
  %182 = load i32, i32* %ty, align 4
  %add271 = add nsw i32 %182, 1
  %idxprom272 = sext i32 %add271 to i64
  %arrayidx273 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom272
  %183 = load i32, i32* %tx, align 4
  %idxprom274 = sext i32 %183 to i64
  %arrayidx275 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx273, i64 0, i64 %idxprom274
  %184 = load float, float* %arrayidx275, align 4
  %185 = load float, float* %jc, align 4
  %sub276 = fsub contract float %184, %185
  store float %sub276, float* %s, align 4
  %186 = load i32, i32* %ty, align 4
  %idxprom277 = sext i32 %186 to i64
  %arrayidx278 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom277
  %187 = load i32, i32* %tx, align 4
  %sub279 = sub nsw i32 %187, 1
  %idxprom280 = sext i32 %sub279 to i64
  %arrayidx281 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx278, i64 0, i64 %idxprom280
  %188 = load float, float* %arrayidx281, align 4
  %189 = load float, float* %jc, align 4
  %sub282 = fsub contract float %188, %189
  store float %sub282, float* %w, align 4
  %190 = load i32, i32* %ty, align 4
  %idxprom283 = sext i32 %190 to i64
  %arrayidx284 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4east to [16 x [16 x float]]*), i64 0, i64 %idxprom283
  %191 = load i32, i32* %tx, align 4
  %idxprom285 = sext i32 %191 to i64
  %arrayidx286 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx284, i64 0, i64 %idxprom285
  %192 = load float, float* %arrayidx286, align 4
  %193 = load float, float* %jc, align 4
  %sub287 = fsub contract float %192, %193
  store float %sub287, float* %e, align 4
  br label %if.end367

if.else288:                                       ; preds = %if.else262
  %194 = load i32, i32* %ty, align 4
  %cmp289 = icmp eq i32 %194, 15
  br i1 %cmp289, label %if.then290, label %if.else314

if.then290:                                       ; preds = %if.else288
  %195 = load i32, i32* %ty, align 4
  %sub291 = sub nsw i32 %195, 1
  %idxprom292 = sext i32 %sub291 to i64
  %arrayidx293 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom292
  %196 = load i32, i32* %tx, align 4
  %idxprom294 = sext i32 %196 to i64
  %arrayidx295 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx293, i64 0, i64 %idxprom294
  %197 = load float, float* %arrayidx295, align 4
  %198 = load float, float* %jc, align 4
  %sub296 = fsub contract float %197, %198
  store float %sub296, float* %n, align 4
  %199 = load i32, i32* %ty, align 4
  %idxprom297 = sext i32 %199 to i64
  %arrayidx298 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE5south to [16 x [16 x float]]*), i64 0, i64 %idxprom297
  %200 = load i32, i32* %tx, align 4
  %idxprom299 = sext i32 %200 to i64
  %arrayidx300 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx298, i64 0, i64 %idxprom299
  %201 = load float, float* %arrayidx300, align 4
  %202 = load float, float* %jc, align 4
  %sub301 = fsub contract float %201, %202
  store float %sub301, float* %s, align 4
  %203 = load i32, i32* %ty, align 4
  %idxprom302 = sext i32 %203 to i64
  %arrayidx303 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom302
  %204 = load i32, i32* %tx, align 4
  %sub304 = sub nsw i32 %204, 1
  %idxprom305 = sext i32 %sub304 to i64
  %arrayidx306 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx303, i64 0, i64 %idxprom305
  %205 = load float, float* %arrayidx306, align 4
  %206 = load float, float* %jc, align 4
  %sub307 = fsub contract float %205, %206
  store float %sub307, float* %w, align 4
  %207 = load i32, i32* %ty, align 4
  %idxprom308 = sext i32 %207 to i64
  %arrayidx309 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom308
  %208 = load i32, i32* %tx, align 4
  %add310 = add nsw i32 %208, 1
  %idxprom311 = sext i32 %add310 to i64
  %arrayidx312 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx309, i64 0, i64 %idxprom311
  %209 = load float, float* %arrayidx312, align 4
  %210 = load float, float* %jc, align 4
  %sub313 = fsub contract float %209, %210
  store float %sub313, float* %e, align 4
  br label %if.end366

if.else314:                                       ; preds = %if.else288
  %211 = load i32, i32* %tx, align 4
  %cmp315 = icmp eq i32 %211, 0
  br i1 %cmp315, label %if.then316, label %if.else340

if.then316:                                       ; preds = %if.else314
  %212 = load i32, i32* %ty, align 4
  %sub317 = sub nsw i32 %212, 1
  %idxprom318 = sext i32 %sub317 to i64
  %arrayidx319 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom318
  %213 = load i32, i32* %tx, align 4
  %idxprom320 = sext i32 %213 to i64
  %arrayidx321 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx319, i64 0, i64 %idxprom320
  %214 = load float, float* %arrayidx321, align 4
  %215 = load float, float* %jc, align 4
  %sub322 = fsub contract float %214, %215
  store float %sub322, float* %n, align 4
  %216 = load i32, i32* %ty, align 4
  %add323 = add nsw i32 %216, 1
  %idxprom324 = sext i32 %add323 to i64
  %arrayidx325 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom324
  %217 = load i32, i32* %tx, align 4
  %idxprom326 = sext i32 %217 to i64
  %arrayidx327 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx325, i64 0, i64 %idxprom326
  %218 = load float, float* %arrayidx327, align 4
  %219 = load float, float* %jc, align 4
  %sub328 = fsub contract float %218, %219
  store float %sub328, float* %s, align 4
  %220 = load i32, i32* %ty, align 4
  %idxprom329 = sext i32 %220 to i64
  %arrayidx330 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4west to [16 x [16 x float]]*), i64 0, i64 %idxprom329
  %221 = load i32, i32* %tx, align 4
  %idxprom331 = sext i32 %221 to i64
  %arrayidx332 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx330, i64 0, i64 %idxprom331
  %222 = load float, float* %arrayidx332, align 4
  %223 = load float, float* %jc, align 4
  %sub333 = fsub contract float %222, %223
  store float %sub333, float* %w, align 4
  %224 = load i32, i32* %ty, align 4
  %idxprom334 = sext i32 %224 to i64
  %arrayidx335 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom334
  %225 = load i32, i32* %tx, align 4
  %add336 = add nsw i32 %225, 1
  %idxprom337 = sext i32 %add336 to i64
  %arrayidx338 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx335, i64 0, i64 %idxprom337
  %226 = load float, float* %arrayidx338, align 4
  %227 = load float, float* %jc, align 4
  %sub339 = fsub contract float %226, %227
  store float %sub339, float* %e, align 4
  br label %if.end365

if.else340:                                       ; preds = %if.else314
  %228 = load i32, i32* %ty, align 4
  %sub341 = sub nsw i32 %228, 1
  %idxprom342 = sext i32 %sub341 to i64
  %arrayidx343 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom342
  %229 = load i32, i32* %tx, align 4
  %idxprom344 = sext i32 %229 to i64
  %arrayidx345 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx343, i64 0, i64 %idxprom344
  %230 = load float, float* %arrayidx345, align 4
  %231 = load float, float* %jc, align 4
  %sub346 = fsub contract float %230, %231
  store float %sub346, float* %n, align 4
  %232 = load i32, i32* %ty, align 4
  %add347 = add nsw i32 %232, 1
  %idxprom348 = sext i32 %add347 to i64
  %arrayidx349 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom348
  %233 = load i32, i32* %tx, align 4
  %idxprom350 = sext i32 %233 to i64
  %arrayidx351 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx349, i64 0, i64 %idxprom350
  %234 = load float, float* %arrayidx351, align 4
  %235 = load float, float* %jc, align 4
  %sub352 = fsub contract float %234, %235
  store float %sub352, float* %s, align 4
  %236 = load i32, i32* %ty, align 4
  %idxprom353 = sext i32 %236 to i64
  %arrayidx354 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom353
  %237 = load i32, i32* %tx, align 4
  %sub355 = sub nsw i32 %237, 1
  %idxprom356 = sext i32 %sub355 to i64
  %arrayidx357 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx354, i64 0, i64 %idxprom356
  %238 = load float, float* %arrayidx357, align 4
  %239 = load float, float* %jc, align 4
  %sub358 = fsub contract float %238, %239
  store float %sub358, float* %w, align 4
  %240 = load i32, i32* %ty, align 4
  %idxprom359 = sext i32 %240 to i64
  %arrayidx360 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom359
  %241 = load i32, i32* %tx, align 4
  %add361 = add nsw i32 %241, 1
  %idxprom362 = sext i32 %add361 to i64
  %arrayidx363 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx360, i64 0, i64 %idxprom362
  %242 = load float, float* %arrayidx363, align 4
  %243 = load float, float* %jc, align 4
  %sub364 = fsub contract float %242, %243
  store float %sub364, float* %e, align 4
  br label %if.end365

if.end365:                                        ; preds = %if.else340, %if.then316
  br label %if.end366

if.end366:                                        ; preds = %if.end365, %if.then290
  br label %if.end367

if.end367:                                        ; preds = %if.end366, %if.then264
  br label %if.end368

if.end368:                                        ; preds = %if.end367, %if.then238
  br label %if.end369

if.end369:                                        ; preds = %if.end368, %if.then213
  br label %if.end370

if.end370:                                        ; preds = %if.end369, %if.then186
  br label %if.end371

if.end371:                                        ; preds = %if.end370, %if.then159
  br label %if.end372

if.end372:                                        ; preds = %if.end371, %if.then132
  %244 = load float, float* %n, align 4
  %245 = load float, float* %n, align 4
  %mul373 = fmul contract float %244, %245
  %246 = load float, float* %s, align 4
  %247 = load float, float* %s, align 4
  %mul374 = fmul contract float %246, %247
  %add375 = fadd contract float %mul373, %mul374
  %248 = load float, float* %w, align 4
  %249 = load float, float* %w, align 4
  %mul376 = fmul contract float %248, %249
  %add377 = fadd contract float %add375, %mul376
  %250 = load float, float* %e, align 4
  %251 = load float, float* %e, align 4
  %mul378 = fmul contract float %250, %251
  %add379 = fadd contract float %add377, %mul378
  %252 = load float, float* %jc, align 4
  %253 = load float, float* %jc, align 4
  %mul380 = fmul contract float %252, %253
  %div = fdiv float %add379, %mul380
  store float %div, float* %g2, align 4
  %254 = load float, float* %n, align 4
  %255 = load float, float* %s, align 4
  %add381 = fadd contract float %254, %255
  %256 = load float, float* %w, align 4
  %add382 = fadd contract float %add381, %256
  %257 = load float, float* %e, align 4
  %add383 = fadd contract float %add382, %257
  %258 = load float, float* %jc, align 4
  %div384 = fdiv float %add383, %258
  store float %div384, float* %l, align 4
  %259 = load float, float* %g2, align 4
  %conv = fpext float %259 to double
  %mul385 = fmul contract double 5.000000e-01, %conv
  %260 = load float, float* %l, align 4
  %261 = load float, float* %l, align 4
  %mul386 = fmul contract float %260, %261
  %conv387 = fpext float %mul386 to double
  %mul388 = fmul contract double 6.250000e-02, %conv387
  %sub389 = fsub contract double %mul385, %mul388
  %conv390 = fptrunc double %sub389 to float
  store float %conv390, float* %num, align 4
  %262 = load float, float* %l, align 4
  %conv391 = fpext float %262 to double
  %mul392 = fmul contract double 2.500000e-01, %conv391
  %add393 = fadd contract double 1.000000e+00, %mul392
  %conv394 = fptrunc double %add393 to float
  store float %conv394, float* %den, align 4
  %263 = load float, float* %num, align 4
  %264 = load float, float* %den, align 4
  %265 = load float, float* %den, align 4
  %mul395 = fmul contract float %264, %265
  %div396 = fdiv float %263, %mul395
  store float %div396, float* %qsqr, align 4
  %266 = load float, float* %qsqr, align 4
  %267 = load float, float* %q0sqr.addr, align 4
  %sub397 = fsub contract float %266, %267
  %268 = load float, float* %q0sqr.addr, align 4
  %269 = load float, float* %q0sqr.addr, align 4
  %add398 = fadd contract float 1.000000e+00, %269
  %mul399 = fmul contract float %268, %add398
  %div400 = fdiv float %sub397, %mul399
  store float %div400, float* %den, align 4
  %270 = load float, float* %den, align 4
  %conv401 = fpext float %270 to double
  %add402 = fadd contract double 1.000000e+00, %conv401
  %div403 = fdiv double 1.000000e+00, %add402
  %conv404 = fptrunc double %div403 to float
  store float %conv404, float* %c, align 4
  %271 = load float, float* %c, align 4
  %cmp405 = fcmp olt float %271, 0.000000e+00
  br i1 %cmp405, label %if.then406, label %if.else411

if.then406:                                       ; preds = %if.end372
  %272 = load i32, i32* %ty, align 4
  %idxprom407 = sext i32 %272 to i64
  %arrayidx408 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom407
  %273 = load i32, i32* %tx, align 4
  %idxprom409 = sext i32 %273 to i64
  %arrayidx410 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx408, i64 0, i64 %idxprom409
  store float 0.000000e+00, float* %arrayidx410, align 4
  br label %if.end424

if.else411:                                       ; preds = %if.end372
  %274 = load float, float* %c, align 4
  %cmp412 = fcmp ogt float %274, 1.000000e+00
  br i1 %cmp412, label %if.then413, label %if.else418

if.then413:                                       ; preds = %if.else411
  %275 = load i32, i32* %ty, align 4
  %idxprom414 = sext i32 %275 to i64
  %arrayidx415 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom414
  %276 = load i32, i32* %tx, align 4
  %idxprom416 = sext i32 %276 to i64
  %arrayidx417 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx415, i64 0, i64 %idxprom416
  store float 1.000000e+00, float* %arrayidx417, align 4
  br label %if.end423

if.else418:                                       ; preds = %if.else411
  %277 = load float, float* %c, align 4
  %278 = load i32, i32* %ty, align 4
  %idxprom419 = sext i32 %278 to i64
  %arrayidx420 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom419
  %279 = load i32, i32* %tx, align 4
  %idxprom421 = sext i32 %279 to i64
  %arrayidx422 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx420, i64 0, i64 %idxprom421
  store float %277, float* %arrayidx422, align 4
  br label %if.end423

if.end423:                                        ; preds = %if.else418, %if.then413
  br label %if.end424

if.end424:                                        ; preds = %if.end423, %if.then406
  call void @llvm.nvvm.barrier0()
  %280 = load i32, i32* %ty, align 4
  %idxprom425 = sext i32 %280 to i64
  %arrayidx426 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_1PfS_S_S_S_S_iifE11temp_result to [16 x [16 x float]]*), i64 0, i64 %idxprom425
  %281 = load i32, i32* %tx, align 4
  %idxprom427 = sext i32 %281 to i64
  %arrayidx428 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx426, i64 0, i64 %idxprom427
  %282 = load float, float* %arrayidx428, align 4
  %283 = load float*, float** %C_cuda.addr, align 8
  %284 = load i32, i32* %index, align 4
  %idxprom429 = sext i32 %284 to i64
  %arrayidx430 = getelementptr inbounds float, float* %283, i64 %idxprom429
  store float %282, float* %arrayidx430, align 4
  %285 = load float, float* %e, align 4
  %286 = load float*, float** %E_C.addr, align 8
  %287 = load i32, i32* %index, align 4
  %idxprom431 = sext i32 %287 to i64
  %arrayidx432 = getelementptr inbounds float, float* %286, i64 %idxprom431
  store float %285, float* %arrayidx432, align 4
  %288 = load float, float* %w, align 4
  %289 = load float*, float** %W_C.addr, align 8
  %290 = load i32, i32* %index, align 4
  %idxprom433 = sext i32 %290 to i64
  %arrayidx434 = getelementptr inbounds float, float* %289, i64 %idxprom433
  store float %288, float* %arrayidx434, align 4
  %291 = load float, float* %s, align 4
  %292 = load float*, float** %S_C.addr, align 8
  %293 = load i32, i32* %index, align 4
  %idxprom435 = sext i32 %293 to i64
  %arrayidx436 = getelementptr inbounds float, float* %292, i64 %idxprom435
  store float %291, float* %arrayidx436, align 4
  %294 = load float, float* %n, align 4
  %295 = load float*, float** %N_C.addr, align 8
  %296 = load i32, i32* %index, align 4
  %idxprom437 = sext i32 %296 to i64
  %arrayidx438 = getelementptr inbounds float, float* %295, i64 %idxprom437
  store float %294, float* %arrayidx438, align 4
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y()
  ret i32 %0
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
  ret i32 %0
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z11srad_cuda_2PfS_S_S_S_S_iiff(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %lambda, float %q0sqr) #0 {
entry:
  %E_C.addr = alloca float*, align 8
  %W_C.addr = alloca float*, align 8
  %N_C.addr = alloca float*, align 8
  %S_C.addr = alloca float*, align 8
  %J_cuda.addr = alloca float*, align 8
  %C_cuda.addr = alloca float*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %lambda.addr = alloca float, align 4
  %q0sqr.addr = alloca float, align 4
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_s = alloca i32, align 4
  %index_e = alloca i32, align 4
  %cc = alloca float, align 4
  %cn = alloca float, align 4
  %cs = alloca float, align 4
  %ce = alloca float, align 4
  %cw = alloca float, align 4
  %d_sum = alloca float, align 4
  store float* %E_C, float** %E_C.addr, align 8
  store float* %W_C, float** %W_C.addr, align 8
  store float* %N_C, float** %N_C.addr, align 8
  store float* %S_C, float** %S_C.addr, align 8
  store float* %J_cuda, float** %J_cuda.addr, align 8
  store float* %C_cuda, float** %C_cuda.addr, align 8
  store i32 %cols, i32* %cols.addr, align 4
  store i32 %rows, i32* %rows.addr, align 4
  store float %lambda, float* %lambda.addr, align 4
  store float %q0sqr, float* %q0sqr.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %bx, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #2
  store i32 %call1, i32* %by, align 4
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call2, i32* %tx, align 4
  %call3 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  store i32 %call3, i32* %ty, align 4
  %0 = load i32, i32* %cols.addr, align 4
  %mul = mul nsw i32 %0, 16
  %1 = load i32, i32* %by, align 4
  %mul4 = mul nsw i32 %mul, %1
  %2 = load i32, i32* %bx, align 4
  %mul5 = mul nsw i32 16, %2
  %add = add nsw i32 %mul4, %mul5
  %3 = load i32, i32* %cols.addr, align 4
  %4 = load i32, i32* %ty, align 4
  %mul6 = mul nsw i32 %3, %4
  %add7 = add nsw i32 %add, %mul6
  %5 = load i32, i32* %tx, align 4
  %add8 = add nsw i32 %add7, %5
  store i32 %add8, i32* %index, align 4
  %6 = load i32, i32* %cols.addr, align 4
  %mul9 = mul nsw i32 %6, 16
  %7 = load i32, i32* %by, align 4
  %mul10 = mul nsw i32 %mul9, %7
  %8 = load i32, i32* %bx, align 4
  %mul11 = mul nsw i32 16, %8
  %add12 = add nsw i32 %mul10, %mul11
  %9 = load i32, i32* %cols.addr, align 4
  %mul13 = mul nsw i32 %9, 16
  %add14 = add nsw i32 %add12, %mul13
  %10 = load i32, i32* %tx, align 4
  %add15 = add nsw i32 %add14, %10
  store i32 %add15, i32* %index_s, align 4
  %11 = load i32, i32* %cols.addr, align 4
  %mul16 = mul nsw i32 %11, 16
  %12 = load i32, i32* %by, align 4
  %mul17 = mul nsw i32 %mul16, %12
  %13 = load i32, i32* %bx, align 4
  %mul18 = mul nsw i32 16, %13
  %add19 = add nsw i32 %mul17, %mul18
  %14 = load i32, i32* %cols.addr, align 4
  %15 = load i32, i32* %ty, align 4
  %mul20 = mul nsw i32 %14, %15
  %add21 = add nsw i32 %add19, %mul20
  %add22 = add nsw i32 %add21, 16
  store i32 %add22, i32* %index_e, align 4
  %16 = load float*, float** %J_cuda.addr, align 8
  %17 = load i32, i32* %index, align 4
  %idxprom = sext i32 %17 to i64
  %arrayidx = getelementptr inbounds float, float* %16, i64 %idxprom
  %18 = load float, float* %arrayidx, align 4
  %19 = load i32, i32* %ty, align 4
  %idxprom23 = sext i32 %19 to i64
  %arrayidx24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom23
  %20 = load i32, i32* %tx, align 4
  %idxprom25 = sext i32 %20 to i64
  %arrayidx26 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx24, i64 0, i64 %idxprom25
  store float %18, float* %arrayidx26, align 4
  call void @llvm.nvvm.barrier0()
  %21 = load float*, float** %C_cuda.addr, align 8
  %22 = load i32, i32* %index_s, align 4
  %idxprom27 = sext i32 %22 to i64
  %arrayidx28 = getelementptr inbounds float, float* %21, i64 %idxprom27
  %23 = load float, float* %arrayidx28, align 4
  %24 = load i32, i32* %ty, align 4
  %idxprom29 = sext i32 %24 to i64
  %arrayidx30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom29
  %25 = load i32, i32* %tx, align 4
  %idxprom31 = sext i32 %25 to i64
  %arrayidx32 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx30, i64 0, i64 %idxprom31
  store float %23, float* %arrayidx32, align 4
  %26 = load i32, i32* %by, align 4
  %call33 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv() #2
  %sub = sub i32 %call33, 1
  %cmp = icmp eq i32 %26, %sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %27 = load float*, float** %C_cuda.addr, align 8
  %28 = load i32, i32* %cols.addr, align 4
  %mul34 = mul nsw i32 %28, 16
  %call35 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_yEv() #2
  %sub36 = sub i32 %call35, 1
  %mul37 = mul i32 %mul34, %sub36
  %29 = load i32, i32* %bx, align 4
  %mul38 = mul nsw i32 16, %29
  %add39 = add i32 %mul37, %mul38
  %30 = load i32, i32* %cols.addr, align 4
  %mul40 = mul nsw i32 %30, 15
  %add41 = add i32 %add39, %mul40
  %31 = load i32, i32* %tx, align 4
  %add42 = add i32 %add41, %31
  %idxprom43 = zext i32 %add42 to i64
  %arrayidx44 = getelementptr inbounds float, float* %27, i64 %idxprom43
  %32 = load float, float* %arrayidx44, align 4
  %33 = load i32, i32* %ty, align 4
  %idxprom45 = sext i32 %33 to i64
  %arrayidx46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom45
  %34 = load i32, i32* %tx, align 4
  %idxprom47 = sext i32 %34 to i64
  %arrayidx48 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx46, i64 0, i64 %idxprom47
  store float %32, float* %arrayidx48, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.nvvm.barrier0()
  %35 = load float*, float** %C_cuda.addr, align 8
  %36 = load i32, i32* %index_e, align 4
  %idxprom49 = sext i32 %36 to i64
  %arrayidx50 = getelementptr inbounds float, float* %35, i64 %idxprom49
  %37 = load float, float* %arrayidx50, align 4
  %38 = load i32, i32* %ty, align 4
  %idxprom51 = sext i32 %38 to i64
  %arrayidx52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom51
  %39 = load i32, i32* %tx, align 4
  %idxprom53 = sext i32 %39 to i64
  %arrayidx54 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx52, i64 0, i64 %idxprom53
  store float %37, float* %arrayidx54, align 4
  %40 = load i32, i32* %bx, align 4
  %call55 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #2
  %sub56 = sub i32 %call55, 1
  %cmp57 = icmp eq i32 %40, %sub56
  br i1 %cmp57, label %if.then58, label %if.end75

if.then58:                                        ; preds = %if.end
  %41 = load float*, float** %C_cuda.addr, align 8
  %42 = load i32, i32* %cols.addr, align 4
  %mul59 = mul nsw i32 %42, 16
  %43 = load i32, i32* %by, align 4
  %mul60 = mul nsw i32 %mul59, %43
  %call61 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #2
  %sub62 = sub i32 %call61, 1
  %mul63 = mul i32 16, %sub62
  %add64 = add i32 %mul60, %mul63
  %44 = load i32, i32* %cols.addr, align 4
  %45 = load i32, i32* %ty, align 4
  %mul65 = mul nsw i32 %44, %45
  %add66 = add i32 %add64, %mul65
  %add67 = add i32 %add66, 16
  %sub68 = sub i32 %add67, 1
  %idxprom69 = zext i32 %sub68 to i64
  %arrayidx70 = getelementptr inbounds float, float* %41, i64 %idxprom69
  %46 = load float, float* %arrayidx70, align 4
  %47 = load i32, i32* %ty, align 4
  %idxprom71 = sext i32 %47 to i64
  %arrayidx72 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom71
  %48 = load i32, i32* %tx, align 4
  %idxprom73 = sext i32 %48 to i64
  %arrayidx74 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx72, i64 0, i64 %idxprom73
  store float %46, float* %arrayidx74, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.then58, %if.end
  call void @llvm.nvvm.barrier0()
  %49 = load float*, float** %C_cuda.addr, align 8
  %50 = load i32, i32* %index, align 4
  %idxprom76 = sext i32 %50 to i64
  %arrayidx77 = getelementptr inbounds float, float* %49, i64 %idxprom76
  %51 = load float, float* %arrayidx77, align 4
  %52 = load i32, i32* %ty, align 4
  %idxprom78 = sext i32 %52 to i64
  %arrayidx79 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom78
  %53 = load i32, i32* %tx, align 4
  %idxprom80 = sext i32 %53 to i64
  %arrayidx81 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx79, i64 0, i64 %idxprom80
  store float %51, float* %arrayidx81, align 4
  call void @llvm.nvvm.barrier0()
  %54 = load i32, i32* %ty, align 4
  %idxprom82 = sext i32 %54 to i64
  %arrayidx83 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom82
  %55 = load i32, i32* %tx, align 4
  %idxprom84 = sext i32 %55 to i64
  %arrayidx85 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx83, i64 0, i64 %idxprom84
  %56 = load float, float* %arrayidx85, align 4
  store float %56, float* %cc, align 4
  %57 = load i32, i32* %ty, align 4
  %cmp86 = icmp eq i32 %57, 15
  br i1 %cmp86, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end75
  %58 = load i32, i32* %tx, align 4
  %cmp87 = icmp eq i32 %58, 15
  br i1 %cmp87, label %if.then88, label %if.else

if.then88:                                        ; preds = %land.lhs.true
  %59 = load float, float* %cc, align 4
  store float %59, float* %cn, align 4
  %60 = load i32, i32* %ty, align 4
  %idxprom89 = sext i32 %60 to i64
  %arrayidx90 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom89
  %61 = load i32, i32* %tx, align 4
  %idxprom91 = sext i32 %61 to i64
  %arrayidx92 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx90, i64 0, i64 %idxprom91
  %62 = load float, float* %arrayidx92, align 4
  store float %62, float* %cs, align 4
  %63 = load float, float* %cc, align 4
  store float %63, float* %cw, align 4
  %64 = load i32, i32* %ty, align 4
  %idxprom93 = sext i32 %64 to i64
  %arrayidx94 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom93
  %65 = load i32, i32* %tx, align 4
  %idxprom95 = sext i32 %65 to i64
  %arrayidx96 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx94, i64 0, i64 %idxprom95
  %66 = load float, float* %arrayidx96, align 4
  store float %66, float* %ce, align 4
  br label %if.end133

if.else:                                          ; preds = %land.lhs.true, %if.end75
  %67 = load i32, i32* %tx, align 4
  %cmp97 = icmp eq i32 %67, 15
  br i1 %cmp97, label %if.then98, label %if.else108

if.then98:                                        ; preds = %if.else
  %68 = load float, float* %cc, align 4
  store float %68, float* %cn, align 4
  %69 = load i32, i32* %ty, align 4
  %add99 = add nsw i32 %69, 1
  %idxprom100 = sext i32 %add99 to i64
  %arrayidx101 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom100
  %70 = load i32, i32* %tx, align 4
  %idxprom102 = sext i32 %70 to i64
  %arrayidx103 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx101, i64 0, i64 %idxprom102
  %71 = load float, float* %arrayidx103, align 4
  store float %71, float* %cs, align 4
  %72 = load float, float* %cc, align 4
  store float %72, float* %cw, align 4
  %73 = load i32, i32* %ty, align 4
  %idxprom104 = sext i32 %73 to i64
  %arrayidx105 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE6east_c to [16 x [16 x float]]*), i64 0, i64 %idxprom104
  %74 = load i32, i32* %tx, align 4
  %idxprom106 = sext i32 %74 to i64
  %arrayidx107 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx105, i64 0, i64 %idxprom106
  %75 = load float, float* %arrayidx107, align 4
  store float %75, float* %ce, align 4
  br label %if.end132

if.else108:                                       ; preds = %if.else
  %76 = load i32, i32* %ty, align 4
  %cmp109 = icmp eq i32 %76, 15
  br i1 %cmp109, label %if.then110, label %if.else120

if.then110:                                       ; preds = %if.else108
  %77 = load float, float* %cc, align 4
  store float %77, float* %cn, align 4
  %78 = load i32, i32* %ty, align 4
  %idxprom111 = sext i32 %78 to i64
  %arrayidx112 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE7south_c to [16 x [16 x float]]*), i64 0, i64 %idxprom111
  %79 = load i32, i32* %tx, align 4
  %idxprom113 = sext i32 %79 to i64
  %arrayidx114 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx112, i64 0, i64 %idxprom113
  %80 = load float, float* %arrayidx114, align 4
  store float %80, float* %cs, align 4
  %81 = load float, float* %cc, align 4
  store float %81, float* %cw, align 4
  %82 = load i32, i32* %ty, align 4
  %idxprom115 = sext i32 %82 to i64
  %arrayidx116 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom115
  %83 = load i32, i32* %tx, align 4
  %add117 = add nsw i32 %83, 1
  %idxprom118 = sext i32 %add117 to i64
  %arrayidx119 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx116, i64 0, i64 %idxprom118
  %84 = load float, float* %arrayidx119, align 4
  store float %84, float* %ce, align 4
  br label %if.end131

if.else120:                                       ; preds = %if.else108
  %85 = load float, float* %cc, align 4
  store float %85, float* %cn, align 4
  %86 = load i32, i32* %ty, align 4
  %add121 = add nsw i32 %86, 1
  %idxprom122 = sext i32 %add121 to i64
  %arrayidx123 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom122
  %87 = load i32, i32* %tx, align 4
  %idxprom124 = sext i32 %87 to i64
  %arrayidx125 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx123, i64 0, i64 %idxprom124
  %88 = load float, float* %arrayidx125, align 4
  store float %88, float* %cs, align 4
  %89 = load float, float* %cc, align 4
  store float %89, float* %cw, align 4
  %90 = load i32, i32* %ty, align 4
  %idxprom126 = sext i32 %90 to i64
  %arrayidx127 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE11c_cuda_temp to [16 x [16 x float]]*), i64 0, i64 %idxprom126
  %91 = load i32, i32* %tx, align 4
  %add128 = add nsw i32 %91, 1
  %idxprom129 = sext i32 %add128 to i64
  %arrayidx130 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx127, i64 0, i64 %idxprom129
  %92 = load float, float* %arrayidx130, align 4
  store float %92, float* %ce, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.else120, %if.then110
  br label %if.end132

if.end132:                                        ; preds = %if.end131, %if.then98
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %if.then88
  %93 = load float, float* %cn, align 4
  %94 = load float*, float** %N_C.addr, align 8
  %95 = load i32, i32* %index, align 4
  %idxprom134 = sext i32 %95 to i64
  %arrayidx135 = getelementptr inbounds float, float* %94, i64 %idxprom134
  %96 = load float, float* %arrayidx135, align 4
  %mul136 = fmul contract float %93, %96
  %97 = load float, float* %cs, align 4
  %98 = load float*, float** %S_C.addr, align 8
  %99 = load i32, i32* %index, align 4
  %idxprom137 = sext i32 %99 to i64
  %arrayidx138 = getelementptr inbounds float, float* %98, i64 %idxprom137
  %100 = load float, float* %arrayidx138, align 4
  %mul139 = fmul contract float %97, %100
  %add140 = fadd contract float %mul136, %mul139
  %101 = load float, float* %cw, align 4
  %102 = load float*, float** %W_C.addr, align 8
  %103 = load i32, i32* %index, align 4
  %idxprom141 = sext i32 %103 to i64
  %arrayidx142 = getelementptr inbounds float, float* %102, i64 %idxprom141
  %104 = load float, float* %arrayidx142, align 4
  %mul143 = fmul contract float %101, %104
  %add144 = fadd contract float %add140, %mul143
  %105 = load float, float* %ce, align 4
  %106 = load float*, float** %E_C.addr, align 8
  %107 = load i32, i32* %index, align 4
  %idxprom145 = sext i32 %107 to i64
  %arrayidx146 = getelementptr inbounds float, float* %106, i64 %idxprom145
  %108 = load float, float* %arrayidx146, align 4
  %mul147 = fmul contract float %105, %108
  %add148 = fadd contract float %add144, %mul147
  store float %add148, float* %d_sum, align 4
  %109 = load i32, i32* %ty, align 4
  %idxprom149 = sext i32 %109 to i64
  %arrayidx150 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE4temp to [16 x [16 x float]]*), i64 0, i64 %idxprom149
  %110 = load i32, i32* %tx, align 4
  %idxprom151 = sext i32 %110 to i64
  %arrayidx152 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx150, i64 0, i64 %idxprom151
  %111 = load float, float* %arrayidx152, align 4
  %conv = fpext float %111 to double
  %112 = load float, float* %lambda.addr, align 4
  %conv153 = fpext float %112 to double
  %mul154 = fmul contract double 2.500000e-01, %conv153
  %113 = load float, float* %d_sum, align 4
  %conv155 = fpext float %113 to double
  %mul156 = fmul contract double %mul154, %conv155
  %add157 = fadd contract double %conv, %mul156
  %conv158 = fptrunc double %add157 to float
  %114 = load i32, i32* %ty, align 4
  %idxprom159 = sext i32 %114 to i64
  %arrayidx160 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE13c_cuda_result to [16 x [16 x float]]*), i64 0, i64 %idxprom159
  %115 = load i32, i32* %tx, align 4
  %idxprom161 = sext i32 %115 to i64
  %arrayidx162 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx160, i64 0, i64 %idxprom161
  store float %conv158, float* %arrayidx162, align 4
  call void @llvm.nvvm.barrier0()
  %116 = load i32, i32* %ty, align 4
  %idxprom163 = sext i32 %116 to i64
  %arrayidx164 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ11srad_cuda_2PfS_S_S_S_S_iiffE13c_cuda_result to [16 x [16 x float]]*), i64 0, i64 %idxprom163
  %117 = load i32, i32* %tx, align 4
  %idxprom165 = sext i32 %117 to i64
  %arrayidx166 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx164, i64 0, i64 %idxprom165
  %118 = load float, float* %arrayidx166, align 4
  %119 = load float*, float** %J_cuda.addr, align 8
  %120 = load i32, i32* %index, align 4
  %idxprom167 = sext i32 %120 to i64
  %arrayidx168 = getelementptr inbounds float, float* %119, i64 %idxprom167
  store float %118, float* %arrayidx168, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3

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
!3 = !{void (float*, float*, float*, float*, float*, float*, i32, i32, float)* @_Z11srad_cuda_1PfS_S_S_S_S_iif, !"kernel", i32 1}
!4 = !{void (float*, float*, float*, float*, float*, float*, i32, i32, float, float)* @_Z11srad_cuda_2PfS_S_S_S_S_iiff, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = !{i32 1, i32 4}
