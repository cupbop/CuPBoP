; ModuleID = 'lud_kernel-cuda-nvptx64-nvidia-cuda-sm_50.bc'
source_filename = "cuda/lud_kernel.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

@_ZZ12lud_diagonalPfiiE6shadow = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ13lud_perimeterPfiiE3dia = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ13lud_perimeterPfiiE8peri_row = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ13lud_perimeterPfiiE8peri_col = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@_ZZ12lud_internalPfiiE8peri_row = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ12lud_internalPfiiE8peri_col = internal addrspace(3) global [16 x [16 x float]] undef, align 4

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
define dso_local void @_Z12lud_diagonalPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array_offset = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  store i32 %offset, i32* %offset.addr, align 4
  %0 = load i32, i32* %offset.addr, align 4
  %1 = load i32, i32* %matrix_dim.addr, align 4
  %mul = mul nsw i32 %0, %1
  %2 = load i32, i32* %offset.addr, align 4
  %add = add nsw i32 %mul, %2
  store i32 %add, i32* %array_offset, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %3, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** %m.addr, align 8
  %5 = load i32, i32* %array_offset, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add1 = add i32 %5, %call
  %idxprom = zext i32 %add1 to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %6 = load float, float* %arrayidx, align 4
  %7 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %7 to i64
  %arrayidx3 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom2
  %call4 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom5 = zext i32 %call4 to i64
  %arrayidx6 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx3, i64 0, i64 %idxprom5
  store float %6, float* %arrayidx6, align 4
  %8 = load i32, i32* %matrix_dim.addr, align 4
  %9 = load i32, i32* %array_offset, align 4
  %add7 = add nsw i32 %9, %8
  store i32 %add7, i32* %array_offset, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.nvvm.barrier0()
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc72, %for.end
  %11 = load i32, i32* %i, align 4
  %cmp9 = icmp slt i32 %11, 15
  br i1 %cmp9, label %for.body10, label %for.end74

for.body10:                                       ; preds = %for.cond8
  %call11 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %12 = load i32, i32* %i, align 4
  %cmp12 = icmp ugt i32 %call11, %12
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.body10
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc31, %if.then
  %13 = load i32, i32* %j, align 4
  %14 = load i32, i32* %i, align 4
  %cmp14 = icmp slt i32 %13, %14
  br i1 %cmp14, label %for.body15, label %for.end33

for.body15:                                       ; preds = %for.cond13
  %call16 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom17 = zext i32 %call16 to i64
  %arrayidx18 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom17
  %15 = load i32, i32* %j, align 4
  %idxprom19 = sext i32 %15 to i64
  %arrayidx20 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx18, i64 0, i64 %idxprom19
  %16 = load float, float* %arrayidx20, align 4
  %17 = load i32, i32* %j, align 4
  %idxprom21 = sext i32 %17 to i64
  %arrayidx22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom21
  %18 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %18 to i64
  %arrayidx24 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx22, i64 0, i64 %idxprom23
  %19 = load float, float* %arrayidx24, align 4
  %mul25 = fmul contract float %16, %19
  %call26 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom27 = zext i32 %call26 to i64
  %arrayidx28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom27
  %20 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %20 to i64
  %arrayidx30 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx28, i64 0, i64 %idxprom29
  %21 = load float, float* %arrayidx30, align 4
  %sub = fsub contract float %21, %mul25
  store float %sub, float* %arrayidx30, align 4
  br label %for.inc31

for.inc31:                                        ; preds = %for.body15
  %22 = load i32, i32* %j, align 4
  %inc32 = add nsw i32 %22, 1
  store i32 %inc32, i32* %j, align 4
  br label %for.cond13

for.end33:                                        ; preds = %for.cond13
  %23 = load i32, i32* %i, align 4
  %idxprom34 = sext i32 %23 to i64
  %arrayidx35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom34
  %24 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %24 to i64
  %arrayidx37 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx35, i64 0, i64 %idxprom36
  %25 = load float, float* %arrayidx37, align 4
  %call38 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom39 = zext i32 %call38 to i64
  %arrayidx40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom39
  %26 = load i32, i32* %i, align 4
  %idxprom41 = sext i32 %26 to i64
  %arrayidx42 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx40, i64 0, i64 %idxprom41
  %27 = load float, float* %arrayidx42, align 4
  %div = fdiv float %27, %25
  store float %div, float* %arrayidx42, align 4
  br label %if.end

if.end:                                           ; preds = %for.end33, %for.body10
  call void @llvm.nvvm.barrier0()
  %call43 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %28 = load i32, i32* %i, align 4
  %cmp44 = icmp ugt i32 %call43, %28
  br i1 %cmp44, label %if.then45, label %if.end71

if.then45:                                        ; preds = %if.end
  store i32 0, i32* %j, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc68, %if.then45
  %29 = load i32, i32* %j, align 4
  %30 = load i32, i32* %i, align 4
  %add47 = add nsw i32 %30, 1
  %cmp48 = icmp slt i32 %29, %add47
  br i1 %cmp48, label %for.body49, label %for.end70

for.body49:                                       ; preds = %for.cond46
  %31 = load i32, i32* %i, align 4
  %add50 = add nsw i32 %31, 1
  %idxprom51 = sext i32 %add50 to i64
  %arrayidx52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom51
  %32 = load i32, i32* %j, align 4
  %idxprom53 = sext i32 %32 to i64
  %arrayidx54 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx52, i64 0, i64 %idxprom53
  %33 = load float, float* %arrayidx54, align 4
  %34 = load i32, i32* %j, align 4
  %idxprom55 = sext i32 %34 to i64
  %arrayidx56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom55
  %call57 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom58 = zext i32 %call57 to i64
  %arrayidx59 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx56, i64 0, i64 %idxprom58
  %35 = load float, float* %arrayidx59, align 4
  %mul60 = fmul contract float %33, %35
  %36 = load i32, i32* %i, align 4
  %add61 = add nsw i32 %36, 1
  %idxprom62 = sext i32 %add61 to i64
  %arrayidx63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom62
  %call64 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom65 = zext i32 %call64 to i64
  %arrayidx66 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx63, i64 0, i64 %idxprom65
  %37 = load float, float* %arrayidx66, align 4
  %sub67 = fsub contract float %37, %mul60
  store float %sub67, float* %arrayidx66, align 4
  br label %for.inc68

for.inc68:                                        ; preds = %for.body49
  %38 = load i32, i32* %j, align 4
  %inc69 = add nsw i32 %38, 1
  store i32 %inc69, i32* %j, align 4
  br label %for.cond46

for.end70:                                        ; preds = %for.cond46
  br label %if.end71

if.end71:                                         ; preds = %for.end70, %if.end
  call void @llvm.nvvm.barrier0()
  br label %for.inc72

for.inc72:                                        ; preds = %if.end71
  %39 = load i32, i32* %i, align 4
  %inc73 = add nsw i32 %39, 1
  store i32 %inc73, i32* %i, align 4
  br label %for.cond8

for.end74:                                        ; preds = %for.cond8
  %40 = load i32, i32* %offset.addr, align 4
  %add75 = add nsw i32 %40, 1
  %41 = load i32, i32* %matrix_dim.addr, align 4
  %mul76 = mul nsw i32 %add75, %41
  %42 = load i32, i32* %offset.addr, align 4
  %add77 = add nsw i32 %mul76, %42
  store i32 %add77, i32* %array_offset, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc91, %for.end74
  %43 = load i32, i32* %i, align 4
  %cmp79 = icmp slt i32 %43, 16
  br i1 %cmp79, label %for.body80, label %for.end93

for.body80:                                       ; preds = %for.cond78
  %44 = load i32, i32* %i, align 4
  %idxprom81 = sext i32 %44 to i64
  %arrayidx82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to [16 x [16 x float]]*), i64 0, i64 %idxprom81
  %call83 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom84 = zext i32 %call83 to i64
  %arrayidx85 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx82, i64 0, i64 %idxprom84
  %45 = load float, float* %arrayidx85, align 4
  %46 = load float*, float** %m.addr, align 8
  %47 = load i32, i32* %array_offset, align 4
  %call86 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add87 = add i32 %47, %call86
  %idxprom88 = zext i32 %add87 to i64
  %arrayidx89 = getelementptr inbounds float, float* %46, i64 %idxprom88
  store float %45, float* %arrayidx89, align 4
  %48 = load i32, i32* %matrix_dim.addr, align 4
  %49 = load i32, i32* %array_offset, align 4
  %add90 = add nsw i32 %49, %48
  store i32 %add90, i32* %array_offset, align 4
  br label %for.inc91

for.inc91:                                        ; preds = %for.body80
  %50 = load i32, i32* %i, align 4
  %inc92 = add nsw i32 %50, 1
  store i32 %inc92, i32* %i, align 4
  br label %for.cond78

for.end93:                                        ; preds = %for.cond78
  ret void
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
define dso_local void @_Z13lud_perimeterPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array_offset = alloca i32, align 4
  %idx = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  store i32 %offset, i32* %offset.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %cmp = icmp ult i32 %call, 16
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %idx, align 4
  %0 = load i32, i32* %offset.addr, align 4
  %1 = load i32, i32* %matrix_dim.addr, align 4
  %mul = mul nsw i32 %0, %1
  %2 = load i32, i32* %offset.addr, align 4
  %add = add nsw i32 %mul, %2
  store i32 %add, i32* %array_offset, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 8
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** %m.addr, align 8
  %5 = load i32, i32* %array_offset, align 4
  %6 = load i32, i32* %idx, align 4
  %add3 = add nsw i32 %5, %6
  %idxprom = sext i32 %add3 to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %7 = load float, float* %arrayidx, align 4
  %8 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom4
  %9 = load i32, i32* %idx, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx5, i64 0, i64 %idxprom6
  store float %7, float* %arrayidx7, align 4
  %10 = load i32, i32* %matrix_dim.addr, align 4
  %11 = load i32, i32* %array_offset, align 4
  %add8 = add nsw i32 %11, %10
  store i32 %add8, i32* %array_offset, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %offset.addr, align 4
  %14 = load i32, i32* %matrix_dim.addr, align 4
  %mul9 = mul nsw i32 %13, %14
  %15 = load i32, i32* %offset.addr, align 4
  %add10 = add nsw i32 %mul9, %15
  store i32 %add10, i32* %array_offset, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc26, %for.end
  %16 = load i32, i32* %i, align 4
  %cmp12 = icmp slt i32 %16, 16
  br i1 %cmp12, label %for.body13, label %for.end28

for.body13:                                       ; preds = %for.cond11
  %17 = load float*, float** %m.addr, align 8
  %18 = load i32, i32* %array_offset, align 4
  %call14 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %add15 = add i32 %call14, 1
  %mul16 = mul i32 %add15, 16
  %add17 = add i32 %18, %mul16
  %19 = load i32, i32* %idx, align 4
  %add18 = add i32 %add17, %19
  %idxprom19 = zext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds float, float* %17, i64 %idxprom19
  %20 = load float, float* %arrayidx20, align 4
  %21 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %21 to i64
  %arrayidx22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom21
  %22 = load i32, i32* %idx, align 4
  %idxprom23 = sext i32 %22 to i64
  %arrayidx24 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx22, i64 0, i64 %idxprom23
  store float %20, float* %arrayidx24, align 4
  %23 = load i32, i32* %matrix_dim.addr, align 4
  %24 = load i32, i32* %array_offset, align 4
  %add25 = add nsw i32 %24, %23
  store i32 %add25, i32* %array_offset, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %for.body13
  %25 = load i32, i32* %i, align 4
  %inc27 = add nsw i32 %25, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond11

for.end28:                                        ; preds = %for.cond11
  br label %if.end

if.else:                                          ; preds = %entry
  %call29 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %sub = sub i32 %call29, 16
  store i32 %sub, i32* %idx, align 4
  %26 = load i32, i32* %offset.addr, align 4
  %add30 = add nsw i32 %26, 8
  %27 = load i32, i32* %matrix_dim.addr, align 4
  %mul31 = mul nsw i32 %add30, %27
  %28 = load i32, i32* %offset.addr, align 4
  %add32 = add nsw i32 %mul31, %28
  store i32 %add32, i32* %array_offset, align 4
  store i32 8, i32* %i, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc44, %if.else
  %29 = load i32, i32* %i, align 4
  %cmp34 = icmp slt i32 %29, 16
  br i1 %cmp34, label %for.body35, label %for.end46

for.body35:                                       ; preds = %for.cond33
  %30 = load float*, float** %m.addr, align 8
  %31 = load i32, i32* %array_offset, align 4
  %32 = load i32, i32* %idx, align 4
  %add36 = add nsw i32 %31, %32
  %idxprom37 = sext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds float, float* %30, i64 %idxprom37
  %33 = load float, float* %arrayidx38, align 4
  %34 = load i32, i32* %i, align 4
  %idxprom39 = sext i32 %34 to i64
  %arrayidx40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom39
  %35 = load i32, i32* %idx, align 4
  %idxprom41 = sext i32 %35 to i64
  %arrayidx42 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx40, i64 0, i64 %idxprom41
  store float %33, float* %arrayidx42, align 4
  %36 = load i32, i32* %matrix_dim.addr, align 4
  %37 = load i32, i32* %array_offset, align 4
  %add43 = add nsw i32 %37, %36
  store i32 %add43, i32* %array_offset, align 4
  br label %for.inc44

for.inc44:                                        ; preds = %for.body35
  %38 = load i32, i32* %i, align 4
  %inc45 = add nsw i32 %38, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond33

for.end46:                                        ; preds = %for.cond33
  %39 = load i32, i32* %offset.addr, align 4
  %call47 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %add48 = add i32 %call47, 1
  %mul49 = mul i32 %add48, 16
  %add50 = add i32 %39, %mul49
  %40 = load i32, i32* %matrix_dim.addr, align 4
  %mul51 = mul i32 %add50, %40
  %41 = load i32, i32* %offset.addr, align 4
  %add52 = add i32 %mul51, %41
  store i32 %add52, i32* %array_offset, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc64, %for.end46
  %42 = load i32, i32* %i, align 4
  %cmp54 = icmp slt i32 %42, 16
  br i1 %cmp54, label %for.body55, label %for.end66

for.body55:                                       ; preds = %for.cond53
  %43 = load float*, float** %m.addr, align 8
  %44 = load i32, i32* %array_offset, align 4
  %45 = load i32, i32* %idx, align 4
  %add56 = add nsw i32 %44, %45
  %idxprom57 = sext i32 %add56 to i64
  %arrayidx58 = getelementptr inbounds float, float* %43, i64 %idxprom57
  %46 = load float, float* %arrayidx58, align 4
  %47 = load i32, i32* %i, align 4
  %idxprom59 = sext i32 %47 to i64
  %arrayidx60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom59
  %48 = load i32, i32* %idx, align 4
  %idxprom61 = sext i32 %48 to i64
  %arrayidx62 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx60, i64 0, i64 %idxprom61
  store float %46, float* %arrayidx62, align 4
  %49 = load i32, i32* %matrix_dim.addr, align 4
  %50 = load i32, i32* %array_offset, align 4
  %add63 = add nsw i32 %50, %49
  store i32 %add63, i32* %array_offset, align 4
  br label %for.inc64

for.inc64:                                        ; preds = %for.body55
  %51 = load i32, i32* %i, align 4
  %inc65 = add nsw i32 %51, 1
  store i32 %inc65, i32* %i, align 4
  br label %for.cond53

for.end66:                                        ; preds = %for.cond53
  br label %if.end

if.end:                                           ; preds = %for.end66, %for.end28
  call void @llvm.nvvm.barrier0()
  %call67 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %cmp68 = icmp ult i32 %call67, 16
  br i1 %cmp68, label %if.then69, label %if.else97

if.then69:                                        ; preds = %if.end
  %call70 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call70, i32* %idx, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc94, %if.then69
  %52 = load i32, i32* %i, align 4
  %cmp72 = icmp slt i32 %52, 16
  br i1 %cmp72, label %for.body73, label %for.end96

for.body73:                                       ; preds = %for.cond71
  store i32 0, i32* %j, align 4
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc91, %for.body73
  %53 = load i32, i32* %j, align 4
  %54 = load i32, i32* %i, align 4
  %cmp75 = icmp slt i32 %53, %54
  br i1 %cmp75, label %for.body76, label %for.end93

for.body76:                                       ; preds = %for.cond74
  %55 = load i32, i32* %i, align 4
  %idxprom77 = sext i32 %55 to i64
  %arrayidx78 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom77
  %56 = load i32, i32* %j, align 4
  %idxprom79 = sext i32 %56 to i64
  %arrayidx80 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx78, i64 0, i64 %idxprom79
  %57 = load float, float* %arrayidx80, align 4
  %58 = load i32, i32* %j, align 4
  %idxprom81 = sext i32 %58 to i64
  %arrayidx82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom81
  %59 = load i32, i32* %idx, align 4
  %idxprom83 = sext i32 %59 to i64
  %arrayidx84 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx82, i64 0, i64 %idxprom83
  %60 = load float, float* %arrayidx84, align 4
  %mul85 = fmul contract float %57, %60
  %61 = load i32, i32* %i, align 4
  %idxprom86 = sext i32 %61 to i64
  %arrayidx87 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom86
  %62 = load i32, i32* %idx, align 4
  %idxprom88 = sext i32 %62 to i64
  %arrayidx89 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx87, i64 0, i64 %idxprom88
  %63 = load float, float* %arrayidx89, align 4
  %sub90 = fsub contract float %63, %mul85
  store float %sub90, float* %arrayidx89, align 4
  br label %for.inc91

for.inc91:                                        ; preds = %for.body76
  %64 = load i32, i32* %j, align 4
  %inc92 = add nsw i32 %64, 1
  store i32 %inc92, i32* %j, align 4
  br label %for.cond74

for.end93:                                        ; preds = %for.cond74
  br label %for.inc94

for.inc94:                                        ; preds = %for.end93
  %65 = load i32, i32* %i, align 4
  %inc95 = add nsw i32 %65, 1
  store i32 %inc95, i32* %i, align 4
  br label %for.cond71

for.end96:                                        ; preds = %for.cond71
  br label %if.end134

if.else97:                                        ; preds = %if.end
  %call98 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %sub99 = sub i32 %call98, 16
  store i32 %sub99, i32* %idx, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc131, %if.else97
  %66 = load i32, i32* %i, align 4
  %cmp101 = icmp slt i32 %66, 16
  br i1 %cmp101, label %for.body102, label %for.end133

for.body102:                                      ; preds = %for.cond100
  store i32 0, i32* %j, align 4
  br label %for.cond103

for.cond103:                                      ; preds = %for.inc120, %for.body102
  %67 = load i32, i32* %j, align 4
  %68 = load i32, i32* %i, align 4
  %cmp104 = icmp slt i32 %67, %68
  br i1 %cmp104, label %for.body105, label %for.end122

for.body105:                                      ; preds = %for.cond103
  %69 = load i32, i32* %idx, align 4
  %idxprom106 = sext i32 %69 to i64
  %arrayidx107 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom106
  %70 = load i32, i32* %j, align 4
  %idxprom108 = sext i32 %70 to i64
  %arrayidx109 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx107, i64 0, i64 %idxprom108
  %71 = load float, float* %arrayidx109, align 4
  %72 = load i32, i32* %j, align 4
  %idxprom110 = sext i32 %72 to i64
  %arrayidx111 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom110
  %73 = load i32, i32* %i, align 4
  %idxprom112 = sext i32 %73 to i64
  %arrayidx113 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx111, i64 0, i64 %idxprom112
  %74 = load float, float* %arrayidx113, align 4
  %mul114 = fmul contract float %71, %74
  %75 = load i32, i32* %idx, align 4
  %idxprom115 = sext i32 %75 to i64
  %arrayidx116 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom115
  %76 = load i32, i32* %i, align 4
  %idxprom117 = sext i32 %76 to i64
  %arrayidx118 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx116, i64 0, i64 %idxprom117
  %77 = load float, float* %arrayidx118, align 4
  %sub119 = fsub contract float %77, %mul114
  store float %sub119, float* %arrayidx118, align 4
  br label %for.inc120

for.inc120:                                       ; preds = %for.body105
  %78 = load i32, i32* %j, align 4
  %inc121 = add nsw i32 %78, 1
  store i32 %inc121, i32* %j, align 4
  br label %for.cond103

for.end122:                                       ; preds = %for.cond103
  %79 = load i32, i32* %i, align 4
  %idxprom123 = sext i32 %79 to i64
  %arrayidx124 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to [16 x [16 x float]]*), i64 0, i64 %idxprom123
  %80 = load i32, i32* %i, align 4
  %idxprom125 = sext i32 %80 to i64
  %arrayidx126 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx124, i64 0, i64 %idxprom125
  %81 = load float, float* %arrayidx126, align 4
  %82 = load i32, i32* %idx, align 4
  %idxprom127 = sext i32 %82 to i64
  %arrayidx128 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom127
  %83 = load i32, i32* %i, align 4
  %idxprom129 = sext i32 %83 to i64
  %arrayidx130 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx128, i64 0, i64 %idxprom129
  %84 = load float, float* %arrayidx130, align 4
  %div = fdiv float %84, %81
  store float %div, float* %arrayidx130, align 4
  br label %for.inc131

for.inc131:                                       ; preds = %for.end122
  %85 = load i32, i32* %i, align 4
  %inc132 = add nsw i32 %85, 1
  store i32 %inc132, i32* %i, align 4
  br label %for.cond100

for.end133:                                       ; preds = %for.cond100
  br label %if.end134

if.end134:                                        ; preds = %for.end133, %for.end96
  call void @llvm.nvvm.barrier0()
  %call135 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %cmp136 = icmp ult i32 %call135, 16
  br i1 %cmp136, label %if.then137, label %if.else160

if.then137:                                       ; preds = %if.end134
  %call138 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call138, i32* %idx, align 4
  %86 = load i32, i32* %offset.addr, align 4
  %add139 = add nsw i32 %86, 1
  %87 = load i32, i32* %matrix_dim.addr, align 4
  %mul140 = mul nsw i32 %add139, %87
  %88 = load i32, i32* %offset.addr, align 4
  %add141 = add nsw i32 %mul140, %88
  store i32 %add141, i32* %array_offset, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond142

for.cond142:                                      ; preds = %for.inc157, %if.then137
  %89 = load i32, i32* %i, align 4
  %cmp143 = icmp slt i32 %89, 16
  br i1 %cmp143, label %for.body144, label %for.end159

for.body144:                                      ; preds = %for.cond142
  %90 = load i32, i32* %i, align 4
  %idxprom145 = sext i32 %90 to i64
  %arrayidx146 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom145
  %91 = load i32, i32* %idx, align 4
  %idxprom147 = sext i32 %91 to i64
  %arrayidx148 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx146, i64 0, i64 %idxprom147
  %92 = load float, float* %arrayidx148, align 4
  %93 = load float*, float** %m.addr, align 8
  %94 = load i32, i32* %array_offset, align 4
  %call149 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %add150 = add i32 %call149, 1
  %mul151 = mul i32 %add150, 16
  %add152 = add i32 %94, %mul151
  %95 = load i32, i32* %idx, align 4
  %add153 = add i32 %add152, %95
  %idxprom154 = zext i32 %add153 to i64
  %arrayidx155 = getelementptr inbounds float, float* %93, i64 %idxprom154
  store float %92, float* %arrayidx155, align 4
  %96 = load i32, i32* %matrix_dim.addr, align 4
  %97 = load i32, i32* %array_offset, align 4
  %add156 = add nsw i32 %97, %96
  store i32 %add156, i32* %array_offset, align 4
  br label %for.inc157

for.inc157:                                       ; preds = %for.body144
  %98 = load i32, i32* %i, align 4
  %inc158 = add nsw i32 %98, 1
  store i32 %inc158, i32* %i, align 4
  br label %for.cond142

for.end159:                                       ; preds = %for.cond142
  br label %if.end183

if.else160:                                       ; preds = %if.end134
  %call161 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %sub162 = sub i32 %call161, 16
  store i32 %sub162, i32* %idx, align 4
  %99 = load i32, i32* %offset.addr, align 4
  %call163 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %add164 = add i32 %call163, 1
  %mul165 = mul i32 %add164, 16
  %add166 = add i32 %99, %mul165
  %100 = load i32, i32* %matrix_dim.addr, align 4
  %mul167 = mul i32 %add166, %100
  %101 = load i32, i32* %offset.addr, align 4
  %add168 = add i32 %mul167, %101
  store i32 %add168, i32* %array_offset, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond169

for.cond169:                                      ; preds = %for.inc180, %if.else160
  %102 = load i32, i32* %i, align 4
  %cmp170 = icmp slt i32 %102, 16
  br i1 %cmp170, label %for.body171, label %for.end182

for.body171:                                      ; preds = %for.cond169
  %103 = load i32, i32* %i, align 4
  %idxprom172 = sext i32 %103 to i64
  %arrayidx173 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom172
  %104 = load i32, i32* %idx, align 4
  %idxprom174 = sext i32 %104 to i64
  %arrayidx175 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx173, i64 0, i64 %idxprom174
  %105 = load float, float* %arrayidx175, align 4
  %106 = load float*, float** %m.addr, align 8
  %107 = load i32, i32* %array_offset, align 4
  %108 = load i32, i32* %idx, align 4
  %add176 = add nsw i32 %107, %108
  %idxprom177 = sext i32 %add176 to i64
  %arrayidx178 = getelementptr inbounds float, float* %106, i64 %idxprom177
  store float %105, float* %arrayidx178, align 4
  %109 = load i32, i32* %matrix_dim.addr, align 4
  %110 = load i32, i32* %array_offset, align 4
  %add179 = add nsw i32 %110, %109
  store i32 %add179, i32* %array_offset, align 4
  br label %for.inc180

for.inc180:                                       ; preds = %for.body171
  %111 = load i32, i32* %i, align 4
  %inc181 = add nsw i32 %111, 1
  store i32 %inc181, i32* %i, align 4
  br label %for.cond169

for.end182:                                       ; preds = %for.cond169
  br label %if.end183

if.end183:                                        ; preds = %for.end182, %for.end159
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %0
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z12lud_internalPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca float, align 4
  %global_row_id = alloca i32, align 4
  %global_col_id = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  store i32 %offset, i32* %offset.addr, align 4
  %0 = load i32, i32* %offset.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #2
  %add = add i32 %call, 1
  %mul = mul i32 %add, 16
  %add1 = add i32 %0, %mul
  store i32 %add1, i32* %global_row_id, align 4
  %1 = load i32, i32* %offset.addr, align 4
  %call2 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %add3 = add i32 %call2, 1
  %mul4 = mul i32 %add3, 16
  %add5 = add i32 %1, %mul4
  store i32 %add5, i32* %global_col_id, align 4
  %2 = load float*, float** %m.addr, align 8
  %3 = load i32, i32* %offset.addr, align 4
  %call6 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  %add7 = add i32 %3, %call6
  %4 = load i32, i32* %matrix_dim.addr, align 4
  %mul8 = mul i32 %add7, %4
  %5 = load i32, i32* %global_col_id, align 4
  %add9 = add i32 %mul8, %5
  %call10 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add11 = add i32 %add9, %call10
  %idxprom = zext i32 %add11 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %6 = load float, float* %arrayidx, align 4
  %call12 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  %idxprom13 = zext i32 %call12 to i64
  %arrayidx14 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom13
  %call15 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom16 = zext i32 %call15 to i64
  %arrayidx17 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx14, i64 0, i64 %idxprom16
  store float %6, float* %arrayidx17, align 4
  %7 = load float*, float** %m.addr, align 8
  %8 = load i32, i32* %global_row_id, align 4
  %call18 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  %add19 = add i32 %8, %call18
  %9 = load i32, i32* %matrix_dim.addr, align 4
  %mul20 = mul i32 %add19, %9
  %10 = load i32, i32* %offset.addr, align 4
  %add21 = add i32 %mul20, %10
  %call22 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add23 = add i32 %add21, %call22
  %idxprom24 = zext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds float, float* %7, i64 %idxprom24
  %11 = load float, float* %arrayidx25, align 4
  %call26 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  %idxprom27 = zext i32 %call26 to i64
  %arrayidx28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom27
  %call29 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom30 = zext i32 %call29 to i64
  %arrayidx31 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx28, i64 0, i64 %idxprom30
  store float %11, float* %arrayidx31, align 4
  call void @llvm.nvvm.barrier0()
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %12, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call32 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  %idxprom33 = zext i32 %call32 to i64
  %arrayidx34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col to [16 x [16 x float]]*), i64 0, i64 %idxprom33
  %13 = load i32, i32* %i, align 4
  %idxprom35 = sext i32 %13 to i64
  %arrayidx36 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx34, i64 0, i64 %idxprom35
  %14 = load float, float* %arrayidx36, align 4
  %15 = load i32, i32* %i, align 4
  %idxprom37 = sext i32 %15 to i64
  %arrayidx38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row to [16 x [16 x float]]*), i64 0, i64 %idxprom37
  %call39 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom40 = zext i32 %call39 to i64
  %arrayidx41 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx38, i64 0, i64 %idxprom40
  %16 = load float, float* %arrayidx41, align 4
  %mul42 = fmul contract float %14, %16
  %17 = load float, float* %sum, align 4
  %add43 = fadd contract float %17, %mul42
  store float %add43, float* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load float, float* %sum, align 4
  %20 = load float*, float** %m.addr, align 8
  %21 = load i32, i32* %global_row_id, align 4
  %call44 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  %add45 = add i32 %21, %call44
  %22 = load i32, i32* %matrix_dim.addr, align 4
  %mul46 = mul i32 %add45, %22
  %23 = load i32, i32* %global_col_id, align 4
  %add47 = add i32 %mul46, %23
  %call48 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add49 = add i32 %add47, %call48
  %idxprom50 = zext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds float, float* %20, i64 %idxprom50
  %24 = load float, float* %arrayidx51, align 4
  %sub = fsub contract float %24, %19
  store float %sub, float* %arrayidx51, align 4
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_50" "target-features"="+ptx64,+sm_50" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_50" "target-features"="+ptx64,+sm_50" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind readnone }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8}
!llvm.ident = !{!10}
!nvvmir.version = !{!11}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (float*, i32, i32)* @_Z12lud_diagonalPfii, !"kernel", i32 1}
!4 = !{void (float*, i32, i32)* @_Z13lud_perimeterPfii, !"kernel", i32 1}
!5 = !{void (float*, i32, i32)* @_Z12lud_internalPfii, !"kernel", i32 1}
!6 = !{null, !"align", i32 8}
!7 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!8 = !{null, !"align", i32 16}
!9 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!10 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!11 = !{i32 1, i32 4}
