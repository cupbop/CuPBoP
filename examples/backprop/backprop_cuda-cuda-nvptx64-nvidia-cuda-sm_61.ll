; ModuleID = 'backprop_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "backprop_cuda.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node = internal addrspace(3) global [16 x float] undef, align 4
@_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@"$str" = private addrspace(1) constant [11 x i8] c"__CUDA_FTZ\00"

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
define dso_local void @_Z22bpnn_layerforward_CUDAPfS_S_S_ii(float* %input_cuda, float* %output_hidden_cuda, float* %input_hidden_cuda, float* %hidden_partial_sum, i32 %in, i32 %hid) #0 {
entry:
  %input_cuda.addr = alloca float*, align 8
  %output_hidden_cuda.addr = alloca float*, align 8
  %input_hidden_cuda.addr = alloca float*, align 8
  %hidden_partial_sum.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %hid.addr = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_in = alloca i32, align 4
  %i = alloca i32, align 4
  %power_two = alloca i32, align 4
  store float* %input_cuda, float** %input_cuda.addr, align 8
  store float* %output_hidden_cuda, float** %output_hidden_cuda.addr, align 8
  store float* %input_hidden_cuda, float** %input_hidden_cuda.addr, align 8
  store float* %hidden_partial_sum, float** %hidden_partial_sum.addr, align 8
  store i32 %in, i32* %in.addr, align 4
  store i32 %hid, i32* %hid.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #2
  store i32 %call, i32* %by, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %tx, align 4
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  store i32 %call2, i32* %ty, align 4
  %0 = load i32, i32* %hid.addr, align 4
  %add = add nsw i32 %0, 1
  %mul = mul nsw i32 %add, 16
  %1 = load i32, i32* %by, align 4
  %mul3 = mul nsw i32 %mul, %1
  %2 = load i32, i32* %hid.addr, align 4
  %add4 = add nsw i32 %2, 1
  %3 = load i32, i32* %ty, align 4
  %mul5 = mul nsw i32 %add4, %3
  %add6 = add nsw i32 %mul3, %mul5
  %4 = load i32, i32* %tx, align 4
  %add7 = add nsw i32 %add6, %4
  %add8 = add nsw i32 %add7, 1
  %5 = load i32, i32* %hid.addr, align 4
  %add9 = add nsw i32 %5, 1
  %add10 = add nsw i32 %add8, %add9
  store i32 %add10, i32* %index, align 4
  %6 = load i32, i32* %by, align 4
  %mul11 = mul nsw i32 16, %6
  %7 = load i32, i32* %ty, align 4
  %add12 = add nsw i32 %mul11, %7
  %add13 = add nsw i32 %add12, 1
  store i32 %add13, i32* %index_in, align 4
  %8 = load i32, i32* %tx, align 4
  %cmp = icmp eq i32 %8, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load float*, float** %input_cuda.addr, align 8
  %10 = load i32, i32* %index_in, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds float, float* %9, i64 %idxprom
  %11 = load float, float* %arrayidx, align 4
  %12 = load i32, i32* %ty, align 4
  %idxprom14 = sext i32 %12 to i64
  %arrayidx15 = getelementptr inbounds [16 x float], [16 x float]* addrspacecast ([16 x float] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node to [16 x float]*), i64 0, i64 %idxprom14
  store float %11, float* %arrayidx15, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.nvvm.barrier0()
  %13 = load float*, float** %input_hidden_cuda.addr, align 8
  %14 = load i32, i32* %index, align 4
  %idxprom16 = sext i32 %14 to i64
  %arrayidx17 = getelementptr inbounds float, float* %13, i64 %idxprom16
  %15 = load float, float* %arrayidx17, align 4
  %16 = load i32, i32* %ty, align 4
  %idxprom18 = sext i32 %16 to i64
  %arrayidx19 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom18
  %17 = load i32, i32* %tx, align 4
  %idxprom20 = sext i32 %17 to i64
  %arrayidx21 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx19, i64 0, i64 %idxprom20
  store float %15, float* %arrayidx21, align 4
  call void @llvm.nvvm.barrier0()
  %18 = load i32, i32* %ty, align 4
  %idxprom22 = sext i32 %18 to i64
  %arrayidx23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom22
  %19 = load i32, i32* %tx, align 4
  %idxprom24 = sext i32 %19 to i64
  %arrayidx25 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx23, i64 0, i64 %idxprom24
  %20 = load float, float* %arrayidx25, align 4
  %21 = load i32, i32* %ty, align 4
  %idxprom26 = sext i32 %21 to i64
  %arrayidx27 = getelementptr inbounds [16 x float], [16 x float]* addrspacecast ([16 x float] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node to [16 x float]*), i64 0, i64 %idxprom26
  %22 = load float, float* %arrayidx27, align 4
  %mul28 = fmul contract float %20, %22
  %23 = load i32, i32* %ty, align 4
  %idxprom29 = sext i32 %23 to i64
  %arrayidx30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom29
  %24 = load i32, i32* %tx, align 4
  %idxprom31 = sext i32 %24 to i64
  %arrayidx32 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx30, i64 0, i64 %idxprom31
  store float %mul28, float* %arrayidx32, align 4
  call void @llvm.nvvm.barrier0()
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %25 = load i32, i32* %i, align 4
  %conv = sitofp i32 %25 to float
  %call33 = call float @_ZL7__log2ff(float 1.600000e+01) #2
  %cmp34 = fcmp ole float %conv, %call33
  br i1 %cmp34, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %i, align 4
  %conv35 = sitofp i32 %26 to float
  %call36 = call float @_ZL6__powfff(float 2.000000e+00, float %conv35) #2
  %conv37 = fptosi float %call36 to i32
  store i32 %conv37, i32* %power_two, align 4
  %27 = load i32, i32* %ty, align 4
  %28 = load i32, i32* %power_two, align 4
  %rem = srem i32 %27, %28
  %cmp38 = icmp eq i32 %rem, 0
  br i1 %cmp38, label %if.then39, label %if.end54

if.then39:                                        ; preds = %for.body
  %29 = load i32, i32* %ty, align 4
  %idxprom40 = sext i32 %29 to i64
  %arrayidx41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom40
  %30 = load i32, i32* %tx, align 4
  %idxprom42 = sext i32 %30 to i64
  %arrayidx43 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx41, i64 0, i64 %idxprom42
  %31 = load float, float* %arrayidx43, align 4
  %32 = load i32, i32* %ty, align 4
  %33 = load i32, i32* %power_two, align 4
  %div = sdiv i32 %33, 2
  %add44 = add nsw i32 %32, %div
  %idxprom45 = sext i32 %add44 to i64
  %arrayidx46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom45
  %34 = load i32, i32* %tx, align 4
  %idxprom47 = sext i32 %34 to i64
  %arrayidx48 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx46, i64 0, i64 %idxprom47
  %35 = load float, float* %arrayidx48, align 4
  %add49 = fadd contract float %31, %35
  %36 = load i32, i32* %ty, align 4
  %idxprom50 = sext i32 %36 to i64
  %arrayidx51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom50
  %37 = load i32, i32* %tx, align 4
  %idxprom52 = sext i32 %37 to i64
  %arrayidx53 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx51, i64 0, i64 %idxprom52
  store float %add49, float* %arrayidx53, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then39, %for.body
  call void @llvm.nvvm.barrier0()
  br label %for.inc

for.inc:                                          ; preds = %if.end54
  %38 = load i32, i32* %i, align 4
  %inc = add nsw i32 %38, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %39 = load i32, i32* %ty, align 4
  %idxprom55 = sext i32 %39 to i64
  %arrayidx56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom55
  %40 = load i32, i32* %tx, align 4
  %idxprom57 = sext i32 %40 to i64
  %arrayidx58 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx56, i64 0, i64 %idxprom57
  %41 = load float, float* %arrayidx58, align 4
  %42 = load float*, float** %input_hidden_cuda.addr, align 8
  %43 = load i32, i32* %index, align 4
  %idxprom59 = sext i32 %43 to i64
  %arrayidx60 = getelementptr inbounds float, float* %42, i64 %idxprom59
  store float %41, float* %arrayidx60, align 4
  call void @llvm.nvvm.barrier0()
  %44 = load i32, i32* %tx, align 4
  %cmp61 = icmp eq i32 %44, 0
  br i1 %cmp61, label %if.then62, label %if.end71

if.then62:                                        ; preds = %for.end
  %45 = load i32, i32* %tx, align 4
  %idxprom63 = sext i32 %45 to i64
  %arrayidx64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix to [16 x [16 x float]]*), i64 0, i64 %idxprom63
  %46 = load i32, i32* %ty, align 4
  %idxprom65 = sext i32 %46 to i64
  %arrayidx66 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx64, i64 0, i64 %idxprom65
  %47 = load float, float* %arrayidx66, align 4
  %48 = load float*, float** %hidden_partial_sum.addr, align 8
  %49 = load i32, i32* %by, align 4
  %50 = load i32, i32* %hid.addr, align 4
  %mul67 = mul nsw i32 %49, %50
  %51 = load i32, i32* %ty, align 4
  %add68 = add nsw i32 %mul67, %51
  %idxprom69 = sext i32 %add68 to i64
  %arrayidx70 = getelementptr inbounds float, float* %48, i64 %idxprom69
  store float %47, float* %arrayidx70, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then62, %for.end
  ret void
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

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: alwaysinline convergent nounwind
define internal float @_ZL7__log2ff(float %__a) #1 {
entry:
  %__a.addr = alloca float, align 4
  store float %__a, float* %__a.addr, align 4
  %0 = load float, float* %__a.addr, align 4
  %call = call float @__nv_fast_log2f(float %0) #2
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal float @_ZL6__powfff(float %__a, float %__b) #1 {
entry:
  %__a.addr = alloca float, align 4
  %__b.addr = alloca float, align 4
  store float %__a, float* %__a.addr, align 4
  store float %__b, float* %__b.addr, align 4
  %0 = load float, float* %__a.addr, align 4
  %1 = load float, float* %__b.addr, align 4
  %call = call float @__nv_fast_powf(float %0, float %1) #2
  ret float %call
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float* %delta, i32 %hid, float* %ly, i32 %in, float* %w, float* %oldw) #0 {
entry:
  %delta.addr = alloca float*, align 8
  %hid.addr = alloca i32, align 4
  %ly.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %w.addr = alloca float*, align 8
  %oldw.addr = alloca float*, align 8
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %index = alloca i32, align 4
  %index_y = alloca i32, align 4
  %index_x = alloca i32, align 4
  store float* %delta, float** %delta.addr, align 8
  store i32 %hid, i32* %hid.addr, align 4
  store float* %ly, float** %ly.addr, align 8
  store i32 %in, i32* %in.addr, align 4
  store float* %w, float** %w.addr, align 8
  store float* %oldw, float** %oldw.addr, align 8
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #2
  store i32 %call, i32* %by, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %tx, align 4
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  store i32 %call2, i32* %ty, align 4
  %0 = load i32, i32* %hid.addr, align 4
  %add = add nsw i32 %0, 1
  %mul = mul nsw i32 %add, 16
  %1 = load i32, i32* %by, align 4
  %mul3 = mul nsw i32 %mul, %1
  %2 = load i32, i32* %hid.addr, align 4
  %add4 = add nsw i32 %2, 1
  %3 = load i32, i32* %ty, align 4
  %mul5 = mul nsw i32 %add4, %3
  %add6 = add nsw i32 %mul3, %mul5
  %4 = load i32, i32* %tx, align 4
  %add7 = add nsw i32 %add6, %4
  %add8 = add nsw i32 %add7, 1
  %5 = load i32, i32* %hid.addr, align 4
  %add9 = add nsw i32 %5, 1
  %add10 = add nsw i32 %add8, %add9
  store i32 %add10, i32* %index, align 4
  %6 = load i32, i32* %by, align 4
  %mul11 = mul nsw i32 16, %6
  %7 = load i32, i32* %ty, align 4
  %add12 = add nsw i32 %mul11, %7
  %add13 = add nsw i32 %add12, 1
  store i32 %add13, i32* %index_y, align 4
  %8 = load i32, i32* %tx, align 4
  %add14 = add nsw i32 %8, 1
  store i32 %add14, i32* %index_x, align 4
  %9 = load float*, float** %delta.addr, align 8
  %10 = load i32, i32* %index_x, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds float, float* %9, i64 %idxprom
  %11 = load float, float* %arrayidx, align 4
  %conv = fpext float %11 to double
  %mul15 = fmul contract double 3.000000e-01, %conv
  %12 = load float*, float** %ly.addr, align 8
  %13 = load i32, i32* %index_y, align 4
  %idxprom16 = sext i32 %13 to i64
  %arrayidx17 = getelementptr inbounds float, float* %12, i64 %idxprom16
  %14 = load float, float* %arrayidx17, align 4
  %conv18 = fpext float %14 to double
  %mul19 = fmul contract double %mul15, %conv18
  %15 = load float*, float** %oldw.addr, align 8
  %16 = load i32, i32* %index, align 4
  %idxprom20 = sext i32 %16 to i64
  %arrayidx21 = getelementptr inbounds float, float* %15, i64 %idxprom20
  %17 = load float, float* %arrayidx21, align 4
  %conv22 = fpext float %17 to double
  %mul23 = fmul contract double 3.000000e-01, %conv22
  %add24 = fadd contract double %mul19, %mul23
  %18 = load float*, float** %w.addr, align 8
  %19 = load i32, i32* %index, align 4
  %idxprom25 = sext i32 %19 to i64
  %arrayidx26 = getelementptr inbounds float, float* %18, i64 %idxprom25
  %20 = load float, float* %arrayidx26, align 4
  %conv27 = fpext float %20 to double
  %add28 = fadd contract double %conv27, %add24
  %conv29 = fptrunc double %add28 to float
  store float %conv29, float* %arrayidx26, align 4
  %21 = load float*, float** %delta.addr, align 8
  %22 = load i32, i32* %index_x, align 4
  %idxprom30 = sext i32 %22 to i64
  %arrayidx31 = getelementptr inbounds float, float* %21, i64 %idxprom30
  %23 = load float, float* %arrayidx31, align 4
  %conv32 = fpext float %23 to double
  %mul33 = fmul contract double 3.000000e-01, %conv32
  %24 = load float*, float** %ly.addr, align 8
  %25 = load i32, i32* %index_y, align 4
  %idxprom34 = sext i32 %25 to i64
  %arrayidx35 = getelementptr inbounds float, float* %24, i64 %idxprom34
  %26 = load float, float* %arrayidx35, align 4
  %conv36 = fpext float %26 to double
  %mul37 = fmul contract double %mul33, %conv36
  %27 = load float*, float** %oldw.addr, align 8
  %28 = load i32, i32* %index, align 4
  %idxprom38 = sext i32 %28 to i64
  %arrayidx39 = getelementptr inbounds float, float* %27, i64 %idxprom38
  %29 = load float, float* %arrayidx39, align 4
  %conv40 = fpext float %29 to double
  %mul41 = fmul contract double 3.000000e-01, %conv40
  %add42 = fadd contract double %mul37, %mul41
  %conv43 = fptrunc double %add42 to float
  %30 = load float*, float** %oldw.addr, align 8
  %31 = load i32, i32* %index, align 4
  %idxprom44 = sext i32 %31 to i64
  %arrayidx45 = getelementptr inbounds float, float* %30, i64 %idxprom44
  store float %conv43, float* %arrayidx45, align 4
  call void @llvm.nvvm.barrier0()
  %32 = load i32, i32* %ty, align 4
  %cmp = icmp eq i32 %32, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %33 = load i32, i32* %by, align 4
  %cmp46 = icmp eq i32 %33, 0
  br i1 %cmp46, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %34 = load float*, float** %delta.addr, align 8
  %35 = load i32, i32* %index_x, align 4
  %idxprom47 = sext i32 %35 to i64
  %arrayidx48 = getelementptr inbounds float, float* %34, i64 %idxprom47
  %36 = load float, float* %arrayidx48, align 4
  %conv49 = fpext float %36 to double
  %mul50 = fmul contract double 3.000000e-01, %conv49
  %37 = load float*, float** %oldw.addr, align 8
  %38 = load i32, i32* %index_x, align 4
  %idxprom51 = sext i32 %38 to i64
  %arrayidx52 = getelementptr inbounds float, float* %37, i64 %idxprom51
  %39 = load float, float* %arrayidx52, align 4
  %conv53 = fpext float %39 to double
  %mul54 = fmul contract double 3.000000e-01, %conv53
  %add55 = fadd contract double %mul50, %mul54
  %40 = load float*, float** %w.addr, align 8
  %41 = load i32, i32* %index_x, align 4
  %idxprom56 = sext i32 %41 to i64
  %arrayidx57 = getelementptr inbounds float, float* %40, i64 %idxprom56
  %42 = load float, float* %arrayidx57, align 4
  %conv58 = fpext float %42 to double
  %add59 = fadd contract double %conv58, %add55
  %conv60 = fptrunc double %add59 to float
  store float %conv60, float* %arrayidx57, align 4
  %43 = load float*, float** %delta.addr, align 8
  %44 = load i32, i32* %index_x, align 4
  %idxprom61 = sext i32 %44 to i64
  %arrayidx62 = getelementptr inbounds float, float* %43, i64 %idxprom61
  %45 = load float, float* %arrayidx62, align 4
  %conv63 = fpext float %45 to double
  %mul64 = fmul contract double 3.000000e-01, %conv63
  %46 = load float*, float** %oldw.addr, align 8
  %47 = load i32, i32* %index_x, align 4
  %idxprom65 = sext i32 %47 to i64
  %arrayidx66 = getelementptr inbounds float, float* %46, i64 %idxprom65
  %48 = load float, float* %arrayidx66, align 4
  %conv67 = fpext float %48 to double
  %mul68 = fmul contract double 3.000000e-01, %conv67
  %add69 = fadd contract double %mul64, %mul68
  %conv70 = fptrunc double %add69 to float
  %49 = load float*, float** %oldw.addr, align 8
  %50 = load i32, i32* %index_x, align 4
  %idxprom71 = sext i32 %50 to i64
  %arrayidx72 = getelementptr inbounds float, float* %49, i64 %idxprom71
  store float %conv70, float* %arrayidx72, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

; Function Attrs: alwaysinline convergent inlinehint nounwind
define internal float @__nv_fast_log2f(float %a) #4 {
  %call.i = call i32 @__nvvm_reflect(i8* addrspacecast (i8 addrspace(1)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(1)* @"$str", i32 0, i32 0) to i8*))
  %1 = icmp ne i32 %call.i, 0
  br i1 %1, label %2, label %4

2:                                                ; preds = %0
  %3 = call float @llvm.nvvm.lg2.approx.ftz.f(float %a)
  br label %__nvvm_builtin_log2f.exit

4:                                                ; preds = %0
  %5 = call float @llvm.nvvm.lg2.approx.f(float %a)
  br label %__nvvm_builtin_log2f.exit

__nvvm_builtin_log2f.exit:                        ; preds = %4, %2
  %retval.0.i = phi float [ %3, %2 ], [ %5, %4 ]
  ret float %retval.0.i
}

; Function Attrs: convergent nounwind
declare i32 @__nvvm_reflect(i8*) #5

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.lg2.approx.ftz.f(float) #3

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.lg2.approx.f(float) #3

; Function Attrs: alwaysinline convergent inlinehint nounwind
define internal float @__nv_fast_powf(float %a, float %b) #4 {
  %call.i.i = call i32 @__nvvm_reflect(i8* addrspacecast (i8 addrspace(1)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(1)* @"$str", i32 0, i32 0) to i8*))
  %1 = icmp ne i32 %call.i.i, 0
  br i1 %1, label %2, label %4

2:                                                ; preds = %0
  %3 = call float @llvm.nvvm.lg2.approx.ftz.f(float %a)
  br label %__nv_fast_log2f.exit

4:                                                ; preds = %0
  %5 = call float @llvm.nvvm.lg2.approx.f(float %a)
  br label %__nv_fast_log2f.exit

__nv_fast_log2f.exit:                             ; preds = %4, %2
  %retval.0.i.i = phi float [ %3, %2 ], [ %5, %4 ]
  %6 = fmul float %b, %retval.0.i.i
  %call.i.i1 = call i32 @__nvvm_reflect(i8* addrspacecast (i8 addrspace(1)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(1)* @"$str", i32 0, i32 0) to i8*))
  %7 = icmp ne i32 %call.i.i1, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %__nv_fast_log2f.exit
  %9 = call float @llvm.nvvm.ex2.approx.ftz.f(float %6)
  br label %__nv_exp2f.exit

10:                                               ; preds = %__nv_fast_log2f.exit
  %11 = call float @llvm.nvvm.ex2.approx.f(float %6)
  br label %__nv_exp2f.exit

__nv_exp2f.exit:                                  ; preds = %10, %8
  %retval.0.i.i2 = phi float [ %9, %8 ], [ %11, %10 ]
  ret float %retval.0.i.i2
}

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #3

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.ex2.approx.f(float) #3

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { alwaysinline convergent inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !6, !5, !7, !7, !7, !7, !8, !8, !7}
!llvm.ident = !{!9}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (float*, float*, float*, float*, i32, i32)* @_Z22bpnn_layerforward_CUDAPfS_S_S_ii, !"kernel", i32 1}
!4 = !{void (float*, i32, float*, i32, float*, float*)* @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = !{i32 1, i32 4}
