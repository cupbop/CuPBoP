; ModuleID = 'main_test_cu-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "main_test_cu.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_gridDim_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv = comdat any

@_ZZ12histo_kernelPhlPjE4temp = internal addrspace(3) global [256 x i32] undef, align 4
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@gridDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_gridDim_t, align 1
@_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E2sm = internal addrspace(3) global [3072 x i32] undef, align 4
@_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E5kcmax = internal addrspace(3) global i32 undef, align 4
@_ZZL10uniformAddPjS_iiiE3uni = internal addrspace(3) global i32 undef, align 4
@_ZZL7prescanILb1ELb0EEvPjPKjS0_iiiE6s_data = internal addrspace(3) global [3072 x i32] undef, align 4
@_ZZL7prescanILb1ELb1EEvPjPKjS0_iiiE6s_data = internal addrspace(3) global [3072 x i32] undef, align 4
@_ZZL7prescanILb0ELb0EEvPjPKjS0_iiiE6s_data = internal addrspace(3) global [3072 x i32] undef, align 4
@_ZZL7prescanILb0ELb1EEvPjPKjS0_iiiE6s_data = internal addrspace(3) global [3072 x i32] undef, align 4

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
define dso_local void @_Z12histo_kernelPhlPj(i8* %buffer, i64 %size, i32* %histo) #0 {
entry:
  %buffer.addr = alloca i8*, align 8
  %size.addr = alloca i64, align 8
  %histo.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %offset = alloca i32, align 4
  store i8* %buffer, i8** %buffer.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i32* %histo, i32** %histo.addr, align 8
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom = zext i32 %call to i64
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ12histo_kernelPhlPjE4temp to [256 x i32]*), i64 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  call void @llvm.nvvm.barrier0()
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %call2 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call3 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %mul = mul i32 %call2, %call3
  %add = add i32 %call1, %mul
  store i32 %add, i32* %i, align 4
  %call4 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %call5 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #2
  %mul6 = mul i32 %call4, %call5
  store i32 %mul6, i32* %offset, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64, i64* %size.addr, align 8
  %cmp = icmp slt i64 %conv, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %buffer.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %3 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %2, i64 %idxprom7
  %4 = load i8, i8* %arrayidx8, align 1
  %idxprom9 = zext i8 %4 to i64
  %arrayidx10 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ12histo_kernelPhlPjE4temp to [256 x i32]*), i64 0, i64 %idxprom9
  %call11 = call i32 @_ZL9atomicAddPjj(i32* %arrayidx10, i32 1) #2
  %5 = load i32, i32* %offset, align 4
  %6 = load i32, i32* %i, align 4
  %add12 = add nsw i32 %6, %5
  store i32 %add12, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @llvm.nvvm.barrier0()
  %7 = load i32*, i32** %histo.addr, align 8
  %call13 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom14 = zext i32 %call13 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %7, i64 %idxprom14
  %call16 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %idxprom17 = zext i32 %call16 to i64
  %arrayidx18 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ12histo_kernelPhlPjE4temp to [256 x i32]*), i64 0, i64 %idxprom17
  %8 = load i32, i32* %arrayidx18, align 4
  %call19 = call i32 @_ZL9atomicAddPjj(i32* %arrayidx15, i32 %8) #2
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

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
  ret i32 %0
}

; Function Attrs: convergent noinline nounwind optnone
define internal i32 @_ZL9atomicAddPjj(i32* %address, i32 %val) #0 {
entry:
  %address.addr = alloca i32*, align 8
  %val.addr = alloca i32, align 4
  store i32* %address, i32** %address.addr, align 8
  store i32 %val, i32* %val.addr, align 4
  %0 = load i32*, i32** %address.addr, align 8
  %1 = load i32, i32* %val.addr, align 4
  %call = call i32 @_ZL12__uAtomicAddPjj(i32* %0, i32 %1) #2
  ret i32 %call
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_(i32* %data, i32* %gm_codewords, i32* %gm_codewordlens, i32* %cw32, i32* %cw32len, i32* %cw32idx, i32* %out, i32* %outidx) #0 {
entry:
  %data.addr = alloca i32*, align 8
  %gm_codewords.addr = alloca i32*, align 8
  %gm_codewordlens.addr = alloca i32*, align 8
  %cw32.addr = alloca i32*, align 8
  %cw32len.addr = alloca i32*, align 8
  %cw32idx.addr = alloca i32*, align 8
  %out.addr = alloca i32*, align 8
  %outidx.addr = alloca i32*, align 8
  %kn = alloca i32, align 4
  %k = alloca i32, align 4
  %kc = alloca i32, align 4
  %startbit = alloca i32, align 4
  %wrbits = alloca i32, align 4
  %cw64 = alloca i64, align 8
  %val32 = alloca i32, align 4
  %codewordlen = alloca i32, align 4
  %tmpbyte = alloca i8, align 1
  %tmpcwlen = alloca i8, align 1
  %tmpcw32 = alloca i32, align 4
  %codewords = alloca i32*, align 8
  %codewordlens = alloca i32*, align 8
  %as = alloca i32*, align 8
  %i = alloca i32, align 4
  %offset = alloca i32, align 4
  %d = alloca i32, align 4
  %ai = alloca i8, align 1
  %bi = alloca i8, align 1
  %d56 = alloca i32, align 4
  %ai64 = alloca i8, align 1
  %bi70 = alloca i8, align 1
  %t = alloca i32, align 4
  store i32* %data, i32** %data.addr, align 8
  store i32* %gm_codewords, i32** %gm_codewords.addr, align 8
  store i32* %gm_codewordlens, i32** %gm_codewordlens.addr, align 8
  store i32* %cw32, i32** %cw32.addr, align 8
  store i32* %cw32len, i32** %cw32len.addr, align 8
  store i32* %cw32idx, i32** %cw32idx.addr, align 8
  store i32* %out, i32** %out.addr, align 8
  store i32* %outidx, i32** %outidx.addr, align 8
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %mul = mul i32 %call, %call1
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add = add i32 %mul, %call2
  store i32 %add, i32* %kn, align 4
  %call3 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call3, i32* %k, align 4
  store i64 0, i64* %cw64, align 8
  store i32 0, i32* %codewordlen, align 4
  store i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E2sm to [3072 x i32]*), i64 0, i64 0), i32** %codewords, align 8
  store i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E2sm to [3072 x i32]*), i64 0, i64 256), i32** %codewordlens, align 8
  store i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E2sm to [3072 x i32]*), i64 0, i64 512), i32** %as, align 8
  %0 = load i32*, i32** %gm_codewords.addr, align 8
  %1 = load i32, i32* %k, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4
  %3 = load i32*, i32** %codewords, align 8
  %4 = load i32, i32* %k, align 4
  %idxprom4 = zext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %3, i64 %idxprom4
  store i32 %2, i32* %arrayidx5, align 4
  %5 = load i32*, i32** %gm_codewordlens.addr, align 8
  %6 = load i32, i32* %k, align 4
  %idxprom6 = zext i32 %6 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 %idxprom6
  %7 = load i32, i32* %arrayidx7, align 4
  %8 = load i32*, i32** %codewordlens, align 8
  %9 = load i32, i32* %k, align 4
  %idxprom8 = zext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %idxprom8
  store i32 %7, i32* %arrayidx9, align 4
  %10 = load i32*, i32** %data.addr, align 8
  %11 = load i32, i32* %kn, align 4
  %idxprom10 = zext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10
  %12 = load i32, i32* %arrayidx11, align 4
  store i32 %12, i32* %val32, align 4
  call void @llvm.nvvm.barrier0()
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %13, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %val32, align 4
  %15 = load i32, i32* %i, align 4
  %sub = sub i32 3, %15
  %mul12 = mul i32 %sub, 8
  %shr = lshr i32 %14, %mul12
  %conv = trunc i32 %shr to i8
  store i8 %conv, i8* %tmpbyte, align 1
  %16 = load i32*, i32** %codewords, align 8
  %17 = load i8, i8* %tmpbyte, align 1
  %idxprom13 = zext i8 %17 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %16, i64 %idxprom13
  %18 = load i32, i32* %arrayidx14, align 4
  store i32 %18, i32* %tmpcw32, align 4
  %19 = load i32*, i32** %codewordlens, align 8
  %20 = load i8, i8* %tmpbyte, align 1
  %idxprom15 = zext i8 %20 to i64
  %arrayidx16 = getelementptr inbounds i32, i32* %19, i64 %idxprom15
  %21 = load i32, i32* %arrayidx16, align 4
  %conv17 = trunc i32 %21 to i8
  store i8 %conv17, i8* %tmpcwlen, align 1
  %22 = load i64, i64* %cw64, align 8
  %23 = load i8, i8* %tmpcwlen, align 1
  %conv18 = zext i8 %23 to i32
  %sh_prom = zext i32 %conv18 to i64
  %shl = shl i64 %22, %sh_prom
  %24 = load i32, i32* %tmpcw32, align 4
  %conv19 = zext i32 %24 to i64
  %or = or i64 %shl, %conv19
  store i64 %or, i64* %cw64, align 8
  %25 = load i8, i8* %tmpcwlen, align 1
  %conv20 = zext i8 %25 to i32
  %26 = load i32, i32* %codewordlen, align 4
  %add21 = add i32 %26, %conv20
  store i32 %add21, i32* %codewordlen, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %i, align 4
  %inc = add i32 %27, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %28 = load i32, i32* %codewordlen, align 4
  %29 = load i32*, i32** %as, align 8
  %30 = load i32, i32* %k, align 4
  %idxprom22 = zext i32 %30 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %29, i64 %idxprom22
  store i32 %28, i32* %arrayidx23, align 4
  call void @llvm.nvvm.barrier0()
  store i32 1, i32* %offset, align 4
  %call24 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shr25 = lshr i32 %call24, 1
  store i32 %shr25, i32* %d, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc46, %for.end
  %31 = load i32, i32* %d, align 4
  %cmp27 = icmp ugt i32 %31, 0
  br i1 %cmp27, label %for.body28, label %for.end48

for.body28:                                       ; preds = %for.cond26
  call void @llvm.nvvm.barrier0()
  %32 = load i32, i32* %k, align 4
  %33 = load i32, i32* %d, align 4
  %cmp29 = icmp ult i32 %32, %33
  br i1 %cmp29, label %if.then, label %if.end

if.then:                                          ; preds = %for.body28
  %34 = load i32, i32* %offset, align 4
  %35 = load i32, i32* %k, align 4
  %mul30 = mul i32 2, %35
  %add31 = add i32 %mul30, 1
  %mul32 = mul i32 %34, %add31
  %sub33 = sub i32 %mul32, 1
  %conv34 = trunc i32 %sub33 to i8
  store i8 %conv34, i8* %ai, align 1
  %36 = load i32, i32* %offset, align 4
  %37 = load i32, i32* %k, align 4
  %mul35 = mul i32 2, %37
  %add36 = add i32 %mul35, 2
  %mul37 = mul i32 %36, %add36
  %sub38 = sub i32 %mul37, 1
  %conv39 = trunc i32 %sub38 to i8
  store i8 %conv39, i8* %bi, align 1
  %38 = load i32*, i32** %as, align 8
  %39 = load i8, i8* %ai, align 1
  %idxprom40 = zext i8 %39 to i64
  %arrayidx41 = getelementptr inbounds i32, i32* %38, i64 %idxprom40
  %40 = load i32, i32* %arrayidx41, align 4
  %41 = load i32*, i32** %as, align 8
  %42 = load i8, i8* %bi, align 1
  %idxprom42 = zext i8 %42 to i64
  %arrayidx43 = getelementptr inbounds i32, i32* %41, i64 %idxprom42
  %43 = load i32, i32* %arrayidx43, align 4
  %add44 = add i32 %43, %40
  store i32 %add44, i32* %arrayidx43, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body28
  %44 = load i32, i32* %offset, align 4
  %mul45 = mul i32 %44, 2
  store i32 %mul45, i32* %offset, align 4
  br label %for.inc46

for.inc46:                                        ; preds = %if.end
  %45 = load i32, i32* %d, align 4
  %shr47 = lshr i32 %45, 1
  store i32 %shr47, i32* %d, align 4
  br label %for.cond26

for.end48:                                        ; preds = %for.cond26
  %46 = load i32, i32* %k, align 4
  %cmp49 = icmp eq i32 %46, 0
  br i1 %cmp49, label %if.then50, label %if.end55

if.then50:                                        ; preds = %for.end48
  %47 = load i32*, i32** %as, align 8
  %call51 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %sub52 = sub i32 %call51, 1
  %idxprom53 = zext i32 %sub52 to i64
  %arrayidx54 = getelementptr inbounds i32, i32* %47, i64 %idxprom53
  store i32 0, i32* %arrayidx54, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then50, %for.end48
  store i32 1, i32* %d56, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc86, %if.end55
  %48 = load i32, i32* %d56, align 4
  %call58 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %cmp59 = icmp ult i32 %48, %call58
  br i1 %cmp59, label %for.body60, label %for.end88

for.body60:                                       ; preds = %for.cond57
  %49 = load i32, i32* %offset, align 4
  %shr61 = lshr i32 %49, 1
  store i32 %shr61, i32* %offset, align 4
  call void @llvm.nvvm.barrier0()
  %50 = load i32, i32* %k, align 4
  %51 = load i32, i32* %d56, align 4
  %cmp62 = icmp ult i32 %50, %51
  br i1 %cmp62, label %if.then63, label %if.end85

if.then63:                                        ; preds = %for.body60
  %52 = load i32, i32* %offset, align 4
  %53 = load i32, i32* %k, align 4
  %mul65 = mul i32 2, %53
  %add66 = add i32 %mul65, 1
  %mul67 = mul i32 %52, %add66
  %sub68 = sub i32 %mul67, 1
  %conv69 = trunc i32 %sub68 to i8
  store i8 %conv69, i8* %ai64, align 1
  %54 = load i32, i32* %offset, align 4
  %55 = load i32, i32* %k, align 4
  %mul71 = mul i32 2, %55
  %add72 = add i32 %mul71, 2
  %mul73 = mul i32 %54, %add72
  %sub74 = sub i32 %mul73, 1
  %conv75 = trunc i32 %sub74 to i8
  store i8 %conv75, i8* %bi70, align 1
  %56 = load i32*, i32** %as, align 8
  %57 = load i8, i8* %ai64, align 1
  %idxprom76 = zext i8 %57 to i64
  %arrayidx77 = getelementptr inbounds i32, i32* %56, i64 %idxprom76
  %58 = load i32, i32* %arrayidx77, align 4
  store i32 %58, i32* %t, align 4
  %59 = load i32*, i32** %as, align 8
  %60 = load i8, i8* %bi70, align 1
  %idxprom78 = zext i8 %60 to i64
  %arrayidx79 = getelementptr inbounds i32, i32* %59, i64 %idxprom78
  %61 = load i32, i32* %arrayidx79, align 4
  %62 = load i32*, i32** %as, align 8
  %63 = load i8, i8* %ai64, align 1
  %idxprom80 = zext i8 %63 to i64
  %arrayidx81 = getelementptr inbounds i32, i32* %62, i64 %idxprom80
  store i32 %61, i32* %arrayidx81, align 4
  %64 = load i32, i32* %t, align 4
  %65 = load i32*, i32** %as, align 8
  %66 = load i8, i8* %bi70, align 1
  %idxprom82 = zext i8 %66 to i64
  %arrayidx83 = getelementptr inbounds i32, i32* %65, i64 %idxprom82
  %67 = load i32, i32* %arrayidx83, align 4
  %add84 = add i32 %67, %64
  store i32 %add84, i32* %arrayidx83, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.then63, %for.body60
  br label %for.inc86

for.inc86:                                        ; preds = %if.end85
  %68 = load i32, i32* %d56, align 4
  %mul87 = mul i32 %68, 2
  store i32 %mul87, i32* %d56, align 4
  br label %for.cond57

for.end88:                                        ; preds = %for.cond57
  call void @llvm.nvvm.barrier0()
  %69 = load i32, i32* %k, align 4
  %call89 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %sub90 = sub i32 %call89, 1
  %cmp91 = icmp eq i32 %69, %sub90
  br i1 %cmp91, label %if.then92, label %if.end102

if.then92:                                        ; preds = %for.end88
  %70 = load i32*, i32** %as, align 8
  %71 = load i32, i32* %k, align 4
  %idxprom93 = zext i32 %71 to i64
  %arrayidx94 = getelementptr inbounds i32, i32* %70, i64 %idxprom93
  %72 = load i32, i32* %arrayidx94, align 4
  %73 = load i32, i32* %codewordlen, align 4
  %add95 = add i32 %72, %73
  %74 = load i32*, i32** %outidx.addr, align 8
  %call96 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %idxprom97 = zext i32 %call96 to i64
  %arrayidx98 = getelementptr inbounds i32, i32* %74, i64 %idxprom97
  store i32 %add95, i32* %arrayidx98, align 4
  %75 = load i32*, i32** %as, align 8
  %76 = load i32, i32* %k, align 4
  %idxprom99 = zext i32 %76 to i64
  %arrayidx100 = getelementptr inbounds i32, i32* %75, i64 %idxprom99
  %77 = load i32, i32* %arrayidx100, align 4
  %78 = load i32, i32* %codewordlen, align 4
  %add101 = add i32 %77, %78
  %div = udiv i32 %add101, 32
  store i32 %div, i32* addrspacecast (i32 addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E5kcmax to i32*), align 4
  br label %if.end102

if.end102:                                        ; preds = %if.then92, %for.end88
  %79 = load i32*, i32** %as, align 8
  %80 = load i32, i32* %k, align 4
  %idxprom103 = zext i32 %80 to i64
  %arrayidx104 = getelementptr inbounds i32, i32* %79, i64 %idxprom103
  %81 = load i32, i32* %arrayidx104, align 4
  %div105 = udiv i32 %81, 32
  store i32 %div105, i32* %kc, align 4
  %82 = load i32*, i32** %as, align 8
  %83 = load i32, i32* %k, align 4
  %idxprom106 = zext i32 %83 to i64
  %arrayidx107 = getelementptr inbounds i32, i32* %82, i64 %idxprom106
  %84 = load i32, i32* %arrayidx107, align 4
  %rem = urem i32 %84, 32
  store i32 %rem, i32* %startbit, align 4
  %85 = load i32*, i32** %as, align 8
  %86 = load i32, i32* %k, align 4
  %idxprom108 = zext i32 %86 to i64
  %arrayidx109 = getelementptr inbounds i32, i32* %85, i64 %idxprom108
  store i32 0, i32* %arrayidx109, align 4
  call void @llvm.nvvm.barrier0()
  %87 = load i32, i32* %codewordlen, align 4
  %88 = load i32, i32* %startbit, align 4
  %sub110 = sub i32 32, %88
  %cmp111 = icmp ugt i32 %87, %sub110
  br i1 %cmp111, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end102
  %89 = load i32, i32* %startbit, align 4
  %sub112 = sub i32 32, %89
  br label %cond.end

cond.false:                                       ; preds = %if.end102
  %90 = load i32, i32* %codewordlen, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub112, %cond.true ], [ %90, %cond.false ]
  store i32 %cond, i32* %wrbits, align 4
  %91 = load i64, i64* %cw64, align 8
  %92 = load i32, i32* %codewordlen, align 4
  %93 = load i32, i32* %wrbits, align 4
  %sub113 = sub i32 %92, %93
  %sh_prom114 = zext i32 %sub113 to i64
  %shr115 = lshr i64 %91, %sh_prom114
  %conv116 = trunc i64 %shr115 to i32
  store i32 %conv116, i32* %tmpcw32, align 4
  %94 = load i32*, i32** %as, align 8
  %95 = load i32, i32* %kc, align 4
  %idxprom117 = zext i32 %95 to i64
  %arrayidx118 = getelementptr inbounds i32, i32* %94, i64 %idxprom117
  %96 = load i32, i32* %tmpcw32, align 4
  %97 = load i32, i32* %startbit, align 4
  %sub119 = sub i32 32, %97
  %98 = load i32, i32* %wrbits, align 4
  %sub120 = sub i32 %sub119, %98
  %shl121 = shl i32 %96, %sub120
  %call122 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx118, i32 %shl121) #2
  %99 = load i32, i32* %wrbits, align 4
  %100 = load i32, i32* %codewordlen, align 4
  %sub123 = sub i32 %100, %99
  store i32 %sub123, i32* %codewordlen, align 4
  %101 = load i32, i32* %codewordlen, align 4
  %tobool = icmp ne i32 %101, 0
  br i1 %tobool, label %if.then124, label %if.end143

if.then124:                                       ; preds = %cond.end
  %102 = load i32, i32* %codewordlen, align 4
  %cmp125 = icmp ugt i32 %102, 32
  br i1 %cmp125, label %cond.true126, label %cond.false127

cond.true126:                                     ; preds = %if.then124
  br label %cond.end128

cond.false127:                                    ; preds = %if.then124
  %103 = load i32, i32* %codewordlen, align 4
  br label %cond.end128

cond.end128:                                      ; preds = %cond.false127, %cond.true126
  %cond129 = phi i32 [ 32, %cond.true126 ], [ %103, %cond.false127 ]
  store i32 %cond129, i32* %wrbits, align 4
  %104 = load i64, i64* %cw64, align 8
  %105 = load i32, i32* %codewordlen, align 4
  %106 = load i32, i32* %wrbits, align 4
  %sub130 = sub i32 %105, %106
  %sh_prom131 = zext i32 %sub130 to i64
  %shr132 = lshr i64 %104, %sh_prom131
  %conv133 = trunc i64 %shr132 to i32
  %107 = load i32, i32* %wrbits, align 4
  %shl134 = shl i32 1, %107
  %sub135 = sub nsw i32 %shl134, 1
  %and = and i32 %conv133, %sub135
  store i32 %and, i32* %tmpcw32, align 4
  %108 = load i32*, i32** %as, align 8
  %109 = load i32, i32* %kc, align 4
  %add136 = add i32 %109, 1
  %idxprom137 = zext i32 %add136 to i64
  %arrayidx138 = getelementptr inbounds i32, i32* %108, i64 %idxprom137
  %110 = load i32, i32* %tmpcw32, align 4
  %111 = load i32, i32* %wrbits, align 4
  %sub139 = sub i32 32, %111
  %shl140 = shl i32 %110, %sub139
  %call141 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx138, i32 %shl140) #2
  %112 = load i32, i32* %wrbits, align 4
  %113 = load i32, i32* %codewordlen, align 4
  %sub142 = sub i32 %113, %112
  store i32 %sub142, i32* %codewordlen, align 4
  br label %if.end143

if.end143:                                        ; preds = %cond.end128, %cond.end
  %114 = load i32, i32* %codewordlen, align 4
  %tobool144 = icmp ne i32 %114, 0
  br i1 %tobool144, label %if.then145, label %if.end157

if.then145:                                       ; preds = %if.end143
  %115 = load i64, i64* %cw64, align 8
  %116 = load i32, i32* %codewordlen, align 4
  %shl146 = shl i32 1, %116
  %sub147 = sub nsw i32 %shl146, 1
  %conv148 = sext i32 %sub147 to i64
  %and149 = and i64 %115, %conv148
  %conv150 = trunc i64 %and149 to i32
  store i32 %conv150, i32* %tmpcw32, align 4
  %117 = load i32*, i32** %as, align 8
  %118 = load i32, i32* %kc, align 4
  %add151 = add i32 %118, 2
  %idxprom152 = zext i32 %add151 to i64
  %arrayidx153 = getelementptr inbounds i32, i32* %117, i64 %idxprom152
  %119 = load i32, i32* %tmpcw32, align 4
  %120 = load i32, i32* %codewordlen, align 4
  %sub154 = sub i32 32, %120
  %shl155 = shl i32 %119, %sub154
  %call156 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx153, i32 %shl155) #2
  br label %if.end157

if.end157:                                        ; preds = %if.then145, %if.end143
  call void @llvm.nvvm.barrier0()
  %121 = load i32, i32* %k, align 4
  %122 = load i32, i32* addrspacecast (i32 addrspace(3)* @_ZZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_E5kcmax to i32*), align 4
  %cmp158 = icmp ule i32 %121, %122
  br i1 %cmp158, label %if.then159, label %if.end164

if.then159:                                       ; preds = %if.end157
  %123 = load i32*, i32** %as, align 8
  %124 = load i32, i32* %k, align 4
  %idxprom160 = zext i32 %124 to i64
  %arrayidx161 = getelementptr inbounds i32, i32* %123, i64 %idxprom160
  %125 = load i32, i32* %arrayidx161, align 4
  %126 = load i32*, i32** %out.addr, align 8
  %127 = load i32, i32* %kn, align 4
  %idxprom162 = zext i32 %127 to i64
  %arrayidx163 = getelementptr inbounds i32, i32* %126, i64 %idxprom162
  store i32 %125, i32* %arrayidx163, align 4
  br label %if.end164

if.end164:                                        ; preds = %if.then159, %if.end157
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal i32 @_ZL8atomicOrPjj(i32* %address, i32 %val) #0 {
entry:
  %address.addr = alloca i32*, align 8
  %val.addr = alloca i32, align 4
  store i32* %address, i32** %address.addr, align 8
  store i32 %val, i32* %val.addr, align 4
  %0 = load i32*, i32** %address.addr, align 8
  %1 = load i32, i32* %val.addr, align 4
  %call = call i32 @_ZL11__uAtomicOrPjj(i32* %0, i32 %1) #2
  ret i32 %call
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL5pack2PjS_S_S_j(i32* %srcData, i32* %cindex, i32* %cindex2, i32* %dstData, i32 %original_num_block_elements) #0 {
entry:
  %srcData.addr = alloca i32*, align 8
  %cindex.addr = alloca i32*, align 8
  %cindex2.addr = alloca i32*, align 8
  %dstData.addr = alloca i32*, align 8
  %original_num_block_elements.addr = alloca i32, align 4
  %tid = alloca i32, align 4
  %offset = alloca i32, align 4
  %bitsize = alloca i32, align 4
  %pos = alloca i32, align 4
  %dword = alloca i32, align 4
  %bit = alloca i32, align 4
  %i = alloca i32, align 4
  %dw = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32* %srcData, i32** %srcData.addr, align 8
  store i32* %cindex, i32** %cindex.addr, align 8
  store i32* %cindex2, i32** %cindex2.addr, align 8
  store i32* %dstData, i32** %dstData.addr, align 8
  store i32 %original_num_block_elements, i32* %original_num_block_elements.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %mul = mul i32 %call, %call1
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add = add i32 %mul, %call2
  store i32 %add, i32* %tid, align 4
  %0 = load i32, i32* %tid, align 4
  %1 = load i32, i32* %original_num_block_elements.addr, align 4
  %mul3 = mul i32 %0, %1
  store i32 %mul3, i32* %offset, align 4
  %2 = load i32*, i32** %cindex.addr, align 8
  %3 = load i32, i32* %tid, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  store i32 %4, i32* %bitsize, align 4
  %5 = load i32*, i32** %cindex2.addr, align 8
  %6 = load i32, i32* %tid, align 4
  %idxprom4 = zext i32 %6 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %idxprom4
  %7 = load i32, i32* %arrayidx5, align 4
  store i32 %7, i32* %pos, align 4
  %8 = load i32, i32* %pos, align 4
  %div = udiv i32 %8, 32
  store i32 %div, i32* %dword, align 4
  %9 = load i32, i32* %pos, align 4
  %rem = urem i32 %9, 32
  store i32 %rem, i32* %bit, align 4
  %10 = load i32*, i32** %srcData.addr, align 8
  %11 = load i32, i32* %offset, align 4
  %idxprom6 = zext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6
  %12 = load i32, i32* %arrayidx7, align 4
  store i32 %12, i32* %dw, align 4
  %13 = load i32, i32* %dw, align 4
  %14 = load i32, i32* %bit, align 4
  %shr = lshr i32 %13, %14
  store i32 %shr, i32* %tmp, align 4
  %15 = load i32*, i32** %dstData.addr, align 8
  %16 = load i32, i32* %dword, align 4
  %idxprom8 = zext i32 %16 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %15, i64 %idxprom8
  %17 = load i32, i32* %tmp, align 4
  %call10 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx9, i32 %17) #2
  %18 = load i32, i32* %bit, align 4
  %cmp = icmp eq i32 %18, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %19 = load i32, i32* %dw, align 4
  %20 = load i32, i32* %bit, align 4
  %sub = sub i32 32, %20
  %shl = shl i32 %19, %sub
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %shl, %cond.false ]
  store i32 %cond, i32* %tmp, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %21 = load i32, i32* %i, align 4
  %22 = load i32, i32* %bitsize, align 4
  %div11 = udiv i32 %22, 32
  %cmp12 = icmp ult i32 %21, %div11
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load i32*, i32** %srcData.addr, align 8
  %24 = load i32, i32* %offset, align 4
  %25 = load i32, i32* %i, align 4
  %add13 = add i32 %24, %25
  %idxprom14 = zext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %23, i64 %idxprom14
  %26 = load i32, i32* %arrayidx15, align 4
  store i32 %26, i32* %dw, align 4
  %27 = load i32, i32* %dw, align 4
  %28 = load i32, i32* %bit, align 4
  %shr16 = lshr i32 %27, %28
  %29 = load i32, i32* %tmp, align 4
  %or = or i32 %29, %shr16
  store i32 %or, i32* %tmp, align 4
  %30 = load i32, i32* %tmp, align 4
  %31 = load i32*, i32** %dstData.addr, align 8
  %32 = load i32, i32* %dword, align 4
  %33 = load i32, i32* %i, align 4
  %add17 = add i32 %32, %33
  %idxprom18 = zext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds i32, i32* %31, i64 %idxprom18
  store i32 %30, i32* %arrayidx19, align 4
  %34 = load i32, i32* %bit, align 4
  %cmp20 = icmp eq i32 %34, 0
  br i1 %cmp20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %for.body
  br label %cond.end25

cond.false22:                                     ; preds = %for.body
  %35 = load i32, i32* %dw, align 4
  %36 = load i32, i32* %bit, align 4
  %sub23 = sub i32 32, %36
  %shl24 = shl i32 %35, %sub23
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false22, %cond.true21
  %cond26 = phi i32 [ 0, %cond.true21 ], [ %shl24, %cond.false22 ]
  store i32 %cond26, i32* %tmp, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end25
  %37 = load i32, i32* %i, align 4
  %inc = add i32 %37, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %38 = load i32, i32* %bit, align 4
  %cmp27 = icmp ne i32 %38, 0
  br i1 %cmp27, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %39 = load i32, i32* %bitsize, align 4
  %rem28 = urem i32 %39, 32
  %cmp29 = icmp ne i32 %rem28, 0
  br i1 %cmp29, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.end
  %40 = load i32*, i32** %dstData.addr, align 8
  %41 = load i32, i32* %dword, align 4
  %42 = load i32, i32* %i, align 4
  %add30 = add i32 %41, %42
  %idxprom31 = zext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds i32, i32* %40, i64 %idxprom31
  %43 = load i32, i32* %tmp, align 4
  %call33 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx32, i32 %43) #2
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %44 = load i32, i32* %bitsize, align 4
  %rem34 = urem i32 %44, 32
  %cmp35 = icmp ne i32 %rem34, 0
  br i1 %cmp35, label %if.then36, label %if.end57

if.then36:                                        ; preds = %if.end
  %45 = load i32*, i32** %srcData.addr, align 8
  %46 = load i32, i32* %offset, align 4
  %47 = load i32, i32* %i, align 4
  %add37 = add i32 %46, %47
  %idxprom38 = zext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds i32, i32* %45, i64 %idxprom38
  %48 = load i32, i32* %arrayidx39, align 4
  store i32 %48, i32* %dw, align 4
  %49 = load i32*, i32** %dstData.addr, align 8
  %50 = load i32, i32* %dword, align 4
  %51 = load i32, i32* %i, align 4
  %add40 = add i32 %50, %51
  %idxprom41 = zext i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds i32, i32* %49, i64 %idxprom41
  %52 = load i32, i32* %dw, align 4
  %53 = load i32, i32* %bit, align 4
  %shr43 = lshr i32 %52, %53
  %call44 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx42, i32 %shr43) #2
  %54 = load i32*, i32** %dstData.addr, align 8
  %55 = load i32, i32* %dword, align 4
  %56 = load i32, i32* %i, align 4
  %add45 = add i32 %55, %56
  %add46 = add i32 %add45, 1
  %idxprom47 = zext i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds i32, i32* %54, i64 %idxprom47
  %57 = load i32, i32* %bit, align 4
  %cmp49 = icmp eq i32 %57, 0
  br i1 %cmp49, label %cond.true50, label %cond.false51

cond.true50:                                      ; preds = %if.then36
  br label %cond.end54

cond.false51:                                     ; preds = %if.then36
  %58 = load i32, i32* %dw, align 4
  %59 = load i32, i32* %bit, align 4
  %sub52 = sub i32 32, %59
  %shl53 = shl i32 %58, %sub52
  br label %cond.end54

cond.end54:                                       ; preds = %cond.false51, %cond.true50
  %cond55 = phi i32 [ 0, %cond.true50 ], [ %shl53, %cond.false51 ]
  %call56 = call i32 @_ZL8atomicOrPjj(i32* %arrayidx48, i32 %cond55) #2
  br label %if.end57

if.end57:                                         ; preds = %cond.end54, %if.end
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL10uniformAddPjS_iii(i32* %g_data, i32* %uniforms, i32 %n, i32 %blockOffset, i32 %baseIndex) #0 {
entry:
  %g_data.addr = alloca i32*, align 8
  %uniforms.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %blockOffset.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %address = alloca i32, align 4
  store i32* %g_data, i32** %g_data.addr, align 8
  store i32* %uniforms, i32** %uniforms.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %blockOffset, i32* %blockOffset.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %uniforms.addr, align 8
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %1 = load i32, i32* %blockOffset.addr, align 4
  %add = add i32 %call1, %1
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4
  store i32 %2, i32* addrspacecast (i32 addrspace(3)* @_ZZL10uniformAddPjS_iiiE3uni to i32*), align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call3 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call3, 1
  %call4 = call i32 @_ZL7__mul24ii(i32 %call2, i32 %shl) #2
  %3 = load i32, i32* %baseIndex.addr, align 4
  %add5 = add nsw i32 %call4, %3
  %call6 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add7 = add i32 %add5, %call6
  store i32 %add7, i32* %address, align 4
  call void @llvm.nvvm.barrier0()
  %4 = load i32, i32* addrspacecast (i32 addrspace(3)* @_ZZL10uniformAddPjS_iiiE3uni to i32*), align 4
  %5 = load i32*, i32** %g_data.addr, align 8
  %6 = load i32, i32* %address, align 4
  %idxprom8 = zext i32 %6 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %5, i64 %idxprom8
  %7 = load i32, i32* %arrayidx9, align 4
  %add10 = add i32 %7, %4
  store i32 %add10, i32* %arrayidx9, align 4
  %call11 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %call12 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %add13 = add i32 %call11, %call12
  %8 = load i32, i32* %n.addr, align 4
  %cmp14 = icmp ult i32 %add13, %8
  %conv = zext i1 %cmp14 to i32
  %9 = load i32, i32* addrspacecast (i32 addrspace(3)* @_ZZL10uniformAddPjS_iiiE3uni to i32*), align 4
  %mul = mul i32 %conv, %9
  %10 = load i32*, i32** %g_data.addr, align 8
  %11 = load i32, i32* %address, align 4
  %call15 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %add16 = add i32 %11, %call15
  %idxprom17 = zext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds i32, i32* %10, i64 %idxprom17
  %12 = load i32, i32* %arrayidx18, align 4
  %add19 = add i32 %12, %mul
  store i32 %add19, i32* %arrayidx18, align 4
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define internal i32 @_ZL7__mul24ii(i32 %__a, i32 %__b) #1 {
entry:
  %__a.addr = alloca i32, align 4
  %__b.addr = alloca i32, align 4
  store i32 %__a, i32* %__a.addr, align 4
  store i32 %__b, i32* %__b.addr, align 4
  %0 = load i32, i32* %__a.addr, align 4
  %1 = load i32, i32* %__b.addr, align 4
  %call = call i32 @__nv_mul24(i32 %0, i32 %1) #2
  ret i32 %call
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3

; Function Attrs: alwaysinline convergent nounwind
define internal i32 @_ZL12__uAtomicAddPjj(i32* %__p, i32 %__v) #1 {
entry:
  %__p.addr = alloca i32*, align 8
  %__v.addr = alloca i32, align 4
  store i32* %__p, i32** %__p.addr, align 8
  store i32 %__v, i32* %__v.addr, align 4
  %0 = load i32*, i32** %__p.addr, align 8
  %1 = load i32, i32* %__v.addr, align 4
  %2 = atomicrmw add i32* %0, i32 %1 seq_cst
  ret i32 %2
}

; Function Attrs: alwaysinline convergent nounwind
define internal i32 @_ZL11__uAtomicOrPjj(i32* %__p, i32 %__v) #1 {
entry:
  %__p.addr = alloca i32*, align 8
  %__v.addr = alloca i32, align 4
  store i32* %__p, i32** %__p.addr, align 8
  store i32 %__v, i32* %__v.addr, align 4
  %0 = load i32*, i32** %__p.addr, align 8
  %1 = load i32, i32* %__v.addr, align 4
  %2 = atomicrmw or i32* %0, i32 %1 seq_cst
  ret i32 %2
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL7prescanILb1ELb0EEvPjPKjS0_iii(i32* %g_odata, i32* %g_idata, i32* %g_blockSums, i32 %n, i32 %blockIndex, i32 %baseIndex) #0 {
entry:
  %g_odata.addr = alloca i32*, align 8
  %g_idata.addr = alloca i32*, align 8
  %g_blockSums.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %blockIndex.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %ai = alloca i32, align 4
  %bi = alloca i32, align 4
  %mem_ai = alloca i32, align 4
  %mem_bi = alloca i32, align 4
  %bankOffsetA = alloca i32, align 4
  %bankOffsetB = alloca i32, align 4
  store i32* %g_odata, i32** %g_odata.addr, align 8
  store i32* %g_idata, i32** %g_idata.addr, align 8
  store i32* %g_blockSums, i32** %g_blockSums.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  %0 = load i32*, i32** %g_idata.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %2 = load i32, i32* %baseIndex.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call1, 1
  %call2 = call i32 @_ZL7__mul24ii(i32 %call, i32 %shl) #2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %baseIndex.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %3, %cond.false ]
  call void @_ZL22loadSharedChunkFromMemILb0EEvPjPKjiiRiS3_S3_S3_S3_S3_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb1ELb0EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32* %0, i32 %1, i32 %cond, i32* dereferenceable(4) %ai, i32* dereferenceable(4) %bi, i32* dereferenceable(4) %mem_ai, i32* dereferenceable(4) %mem_bi, i32* dereferenceable(4) %bankOffsetA, i32* dereferenceable(4) %bankOffsetB) #2
  %4 = load i32, i32* %blockIndex.addr, align 4
  %5 = load i32*, i32** %g_blockSums.addr, align 8
  call void @_ZL12prescanBlockILb1EEvPjiS0_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb1ELb0EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %4, i32* %5) #2
  %6 = load i32*, i32** %g_odata.addr, align 8
  %7 = load i32, i32* %n.addr, align 4
  %8 = load i32, i32* %ai, align 4
  %9 = load i32, i32* %bi, align 4
  %10 = load i32, i32* %mem_ai, align 4
  %11 = load i32, i32* %mem_bi, align 4
  %12 = load i32, i32* %bankOffsetA, align 4
  %13 = load i32, i32* %bankOffsetB, align 4
  call void @_ZL21storeSharedChunkToMemILb0EEvPjPKjiiiiiii(i32* %6, i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb1ELb0EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) #2
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL22loadSharedChunkFromMemILb0EEvPjPKjiiRiS3_S3_S3_S3_S3_(i32* %s_data, i32* %g_idata, i32 %n, i32 %baseIndex, i32* dereferenceable(4) %ai, i32* dereferenceable(4) %bi, i32* dereferenceable(4) %mem_ai, i32* dereferenceable(4) %mem_bi, i32* dereferenceable(4) %bankOffsetA, i32* dereferenceable(4) %bankOffsetB) #0 {
entry:
  %s_data.addr = alloca i32*, align 8
  %g_idata.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %ai.addr = alloca i32*, align 8
  %bi.addr = alloca i32*, align 8
  %mem_ai.addr = alloca i32*, align 8
  %mem_bi.addr = alloca i32*, align 8
  %bankOffsetA.addr = alloca i32*, align 8
  %bankOffsetB.addr = alloca i32*, align 8
  %thid = alloca i32, align 4
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32* %g_idata, i32** %g_idata.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  store i32* %ai, i32** %ai.addr, align 8
  store i32* %bi, i32** %bi.addr, align 8
  store i32* %mem_ai, i32** %mem_ai.addr, align 8
  store i32* %mem_bi, i32** %mem_bi.addr, align 8
  store i32* %bankOffsetA, i32** %bankOffsetA.addr, align 8
  store i32* %bankOffsetB, i32** %bankOffsetB.addr, align 8
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %thid, align 4
  %0 = load i32, i32* %baseIndex.addr, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add = add i32 %0, %call1
  %1 = load i32*, i32** %mem_ai.addr, align 8
  store i32 %add, i32* %1, align 4
  %2 = load i32*, i32** %mem_ai.addr, align 8
  %3 = load i32, i32* %2, align 4
  %call2 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %add3 = add i32 %3, %call2
  %4 = load i32*, i32** %mem_bi.addr, align 8
  store i32 %add3, i32* %4, align 4
  %5 = load i32, i32* %thid, align 4
  %6 = load i32*, i32** %ai.addr, align 8
  store i32 %5, i32* %6, align 4
  %7 = load i32, i32* %thid, align 4
  %call4 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %add5 = add i32 %7, %call4
  %8 = load i32*, i32** %bi.addr, align 8
  store i32 %add5, i32* %8, align 4
  %9 = load i32*, i32** %ai.addr, align 8
  %10 = load i32, i32* %9, align 4
  %shr = ashr i32 %10, 4
  %11 = load i32*, i32** %bankOffsetA.addr, align 8
  store i32 %shr, i32* %11, align 4
  %12 = load i32*, i32** %bi.addr, align 8
  %13 = load i32, i32* %12, align 4
  %shr6 = ashr i32 %13, 4
  %14 = load i32*, i32** %bankOffsetB.addr, align 8
  store i32 %shr6, i32* %14, align 4
  %15 = load i32*, i32** %g_idata.addr, align 8
  %16 = load i32*, i32** %mem_ai.addr, align 8
  %17 = load i32, i32* %16, align 4
  %idxprom = sext i32 %17 to i64
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 %idxprom
  %18 = load i32, i32* %arrayidx, align 4
  %19 = load i32*, i32** %s_data.addr, align 8
  %20 = load i32*, i32** %ai.addr, align 8
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %bankOffsetA.addr, align 8
  %23 = load i32, i32* %22, align 4
  %add7 = add nsw i32 %21, %23
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %19, i64 %idxprom8
  store i32 %18, i32* %arrayidx9, align 4
  %24 = load i32*, i32** %g_idata.addr, align 8
  %25 = load i32*, i32** %mem_bi.addr, align 8
  %26 = load i32, i32* %25, align 4
  %idxprom10 = sext i32 %26 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %24, i64 %idxprom10
  %27 = load i32, i32* %arrayidx11, align 4
  %28 = load i32*, i32** %s_data.addr, align 8
  %29 = load i32*, i32** %bi.addr, align 8
  %30 = load i32, i32* %29, align 4
  %31 = load i32*, i32** %bankOffsetB.addr, align 8
  %32 = load i32, i32* %31, align 4
  %add12 = add nsw i32 %30, %32
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %28, i64 %idxprom13
  store i32 %27, i32* %arrayidx14, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL12prescanBlockILb1EEvPjiS0_(i32* %data, i32 %blockIndex, i32* %blockSums) #0 {
entry:
  %data.addr = alloca i32*, align 8
  %blockIndex.addr = alloca i32, align 4
  %blockSums.addr = alloca i32*, align 8
  %stride = alloca i32, align 4
  store i32* %data, i32** %data.addr, align 8
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  store i32* %blockSums, i32** %blockSums.addr, align 8
  %0 = load i32*, i32** %data.addr, align 8
  %call = call i32 @_ZL8buildSumPj(i32* %0) #2
  store i32 %call, i32* %stride, align 4
  %1 = load i32*, i32** %data.addr, align 8
  %2 = load i32*, i32** %blockSums.addr, align 8
  %3 = load i32, i32* %blockIndex.addr, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, i32* %blockIndex.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ %4, %cond.false ]
  call void @_ZL16clearLastElementILb1EEvPjS0_i(i32* %1, i32* %2, i32 %cond) #2
  %5 = load i32*, i32** %data.addr, align 8
  %6 = load i32, i32* %stride, align 4
  call void @_ZL16scanRootToLeavesPjj(i32* %5, i32 %6) #2
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL21storeSharedChunkToMemILb0EEvPjPKjiiiiiii(i32* %g_odata, i32* %s_data, i32 %n, i32 %ai, i32 %bi, i32 %mem_ai, i32 %mem_bi, i32 %bankOffsetA, i32 %bankOffsetB) #0 {
entry:
  %g_odata.addr = alloca i32*, align 8
  %s_data.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %ai.addr = alloca i32, align 4
  %bi.addr = alloca i32, align 4
  %mem_ai.addr = alloca i32, align 4
  %mem_bi.addr = alloca i32, align 4
  %bankOffsetA.addr = alloca i32, align 4
  %bankOffsetB.addr = alloca i32, align 4
  store i32* %g_odata, i32** %g_odata.addr, align 8
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %ai, i32* %ai.addr, align 4
  store i32 %bi, i32* %bi.addr, align 4
  store i32 %mem_ai, i32* %mem_ai.addr, align 4
  store i32 %mem_bi, i32* %mem_bi.addr, align 4
  store i32 %bankOffsetA, i32* %bankOffsetA.addr, align 4
  store i32 %bankOffsetB, i32* %bankOffsetB.addr, align 4
  call void @llvm.nvvm.barrier0()
  %0 = load i32*, i32** %s_data.addr, align 8
  %1 = load i32, i32* %ai.addr, align 4
  %2 = load i32, i32* %bankOffsetA.addr, align 4
  %add = add nsw i32 %1, %2
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32*, i32** %g_odata.addr, align 8
  %5 = load i32, i32* %mem_ai.addr, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1
  store i32 %3, i32* %arrayidx2, align 4
  %6 = load i32*, i32** %s_data.addr, align 8
  %7 = load i32, i32* %bi.addr, align 4
  %8 = load i32, i32* %bankOffsetB.addr, align 4
  %add3 = add nsw i32 %7, %8
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %idxprom4
  %9 = load i32, i32* %arrayidx5, align 4
  %10 = load i32*, i32** %g_odata.addr, align 8
  %11 = load i32, i32* %mem_bi.addr, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6
  store i32 %9, i32* %arrayidx7, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal i32 @_ZL8buildSumPj(i32* %s_data) #0 {
entry:
  %s_data.addr = alloca i32*, align 8
  %thid = alloca i32, align 4
  %stride = alloca i32, align 4
  %d = alloca i32, align 4
  %i = alloca i32, align 4
  %ai = alloca i32, align 4
  %bi = alloca i32, align 4
  store i32* %s_data, i32** %s_data.addr, align 8
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %thid, align 4
  store i32 1, i32* %stride, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %d, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %d, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @llvm.nvvm.barrier0()
  %1 = load i32, i32* %thid, align 4
  %2 = load i32, i32* %d, align 4
  %cmp2 = icmp ult i32 %1, %2
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %stride, align 4
  %call3 = call i32 @_ZL7__mul24ii(i32 2, i32 %3) #2
  %4 = load i32, i32* %thid, align 4
  %call4 = call i32 @_ZL7__mul24ii(i32 %call3, i32 %4) #2
  store i32 %call4, i32* %i, align 4
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %stride, align 4
  %add = add i32 %5, %6
  %sub = sub i32 %add, 1
  store i32 %sub, i32* %ai, align 4
  %7 = load i32, i32* %ai, align 4
  %8 = load i32, i32* %stride, align 4
  %add5 = add i32 %7, %8
  store i32 %add5, i32* %bi, align 4
  %9 = load i32, i32* %ai, align 4
  %shr = ashr i32 %9, 4
  %10 = load i32, i32* %ai, align 4
  %add6 = add nsw i32 %10, %shr
  store i32 %add6, i32* %ai, align 4
  %11 = load i32, i32* %bi, align 4
  %shr7 = ashr i32 %11, 4
  %12 = load i32, i32* %bi, align 4
  %add8 = add nsw i32 %12, %shr7
  store i32 %add8, i32* %bi, align 4
  %13 = load i32*, i32** %s_data.addr, align 8
  %14 = load i32, i32* %ai, align 4
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 %idxprom
  %15 = load i32, i32* %arrayidx, align 4
  %16 = load i32*, i32** %s_data.addr, align 8
  %17 = load i32, i32* %bi, align 4
  %idxprom9 = sext i32 %17 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %16, i64 %idxprom9
  %18 = load i32, i32* %arrayidx10, align 4
  %add11 = add i32 %18, %15
  store i32 %add11, i32* %arrayidx10, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %19 = load i32, i32* %stride, align 4
  %mul = mul i32 %19, 2
  store i32 %mul, i32* %stride, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %d, align 4
  %shr12 = ashr i32 %20, 1
  store i32 %shr12, i32* %d, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %stride, align 4
  ret i32 %21
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL16clearLastElementILb1EEvPjS0_i(i32* %s_data, i32* %g_blockSums, i32 %blockIndex) #0 {
entry:
  %s_data.addr = alloca i32*, align 8
  %g_blockSums.addr = alloca i32*, align 8
  %blockIndex.addr = alloca i32, align 4
  %index = alloca i32, align 4
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32* %g_blockSums, i32** %g_blockSums.addr, align 8
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call1, 1
  %sub = sub i32 %shl, 1
  store i32 %sub, i32* %index, align 4
  %0 = load i32, i32* %index, align 4
  %shr = ashr i32 %0, 4
  %1 = load i32, i32* %index, align 4
  %add = add nsw i32 %1, %shr
  store i32 %add, i32* %index, align 4
  %2 = load i32*, i32** %s_data.addr, align 8
  %3 = load i32, i32* %index, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32*, i32** %g_blockSums.addr, align 8
  %6 = load i32, i32* %blockIndex.addr, align 4
  %idxprom2 = sext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 %idxprom2
  store i32 %4, i32* %arrayidx3, align 4
  %7 = load i32*, i32** %s_data.addr, align 8
  %8 = load i32, i32* %index, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4
  store i32 0, i32* %arrayidx5, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL16scanRootToLeavesPjj(i32* %s_data, i32 %stride) #0 {
entry:
  %s_data.addr = alloca i32*, align 8
  %stride.addr = alloca i32, align 4
  %thid = alloca i32, align 4
  %d = alloca i32, align 4
  %i = alloca i32, align 4
  %ai = alloca i32, align 4
  %bi = alloca i32, align 4
  %t = alloca i32, align 4
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32 %stride, i32* %stride.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %thid, align 4
  store i32 1, i32* %d, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %d, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %cmp = icmp ule i32 %0, %call1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %stride.addr, align 4
  %shr = lshr i32 %1, 1
  store i32 %shr, i32* %stride.addr, align 4
  call void @llvm.nvvm.barrier0()
  %2 = load i32, i32* %thid, align 4
  %3 = load i32, i32* %d, align 4
  %cmp2 = icmp ult i32 %2, %3
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* %stride.addr, align 4
  %call3 = call i32 @_ZL7__mul24ii(i32 2, i32 %4) #2
  %5 = load i32, i32* %thid, align 4
  %call4 = call i32 @_ZL7__mul24ii(i32 %call3, i32 %5) #2
  store i32 %call4, i32* %i, align 4
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %stride.addr, align 4
  %add = add i32 %6, %7
  %sub = sub i32 %add, 1
  store i32 %sub, i32* %ai, align 4
  %8 = load i32, i32* %ai, align 4
  %9 = load i32, i32* %stride.addr, align 4
  %add5 = add i32 %8, %9
  store i32 %add5, i32* %bi, align 4
  %10 = load i32, i32* %ai, align 4
  %shr6 = ashr i32 %10, 4
  %11 = load i32, i32* %ai, align 4
  %add7 = add nsw i32 %11, %shr6
  store i32 %add7, i32* %ai, align 4
  %12 = load i32, i32* %bi, align 4
  %shr8 = ashr i32 %12, 4
  %13 = load i32, i32* %bi, align 4
  %add9 = add nsw i32 %13, %shr8
  store i32 %add9, i32* %bi, align 4
  %14 = load i32*, i32** %s_data.addr, align 8
  %15 = load i32, i32* %ai, align 4
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds i32, i32* %14, i64 %idxprom
  %16 = load i32, i32* %arrayidx, align 4
  store i32 %16, i32* %t, align 4
  %17 = load i32*, i32** %s_data.addr, align 8
  %18 = load i32, i32* %bi, align 4
  %idxprom10 = sext i32 %18 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %17, i64 %idxprom10
  %19 = load i32, i32* %arrayidx11, align 4
  %20 = load i32*, i32** %s_data.addr, align 8
  %21 = load i32, i32* %ai, align 4
  %idxprom12 = sext i32 %21 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %20, i64 %idxprom12
  store i32 %19, i32* %arrayidx13, align 4
  %22 = load i32, i32* %t, align 4
  %23 = load i32*, i32** %s_data.addr, align 8
  %24 = load i32, i32* %bi, align 4
  %idxprom14 = sext i32 %24 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %23, i64 %idxprom14
  %25 = load i32, i32* %arrayidx15, align 4
  %add16 = add i32 %25, %22
  store i32 %add16, i32* %arrayidx15, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %26 = load i32, i32* %d, align 4
  %mul = mul nsw i32 %26, 2
  store i32 %mul, i32* %d, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL7prescanILb1ELb1EEvPjPKjS0_iii(i32* %g_odata, i32* %g_idata, i32* %g_blockSums, i32 %n, i32 %blockIndex, i32 %baseIndex) #0 {
entry:
  %g_odata.addr = alloca i32*, align 8
  %g_idata.addr = alloca i32*, align 8
  %g_blockSums.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %blockIndex.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %ai = alloca i32, align 4
  %bi = alloca i32, align 4
  %mem_ai = alloca i32, align 4
  %mem_bi = alloca i32, align 4
  %bankOffsetA = alloca i32, align 4
  %bankOffsetB = alloca i32, align 4
  store i32* %g_odata, i32** %g_odata.addr, align 8
  store i32* %g_idata, i32** %g_idata.addr, align 8
  store i32* %g_blockSums, i32** %g_blockSums.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  %0 = load i32*, i32** %g_idata.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %2 = load i32, i32* %baseIndex.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call1, 1
  %call2 = call i32 @_ZL7__mul24ii(i32 %call, i32 %shl) #2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %baseIndex.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %3, %cond.false ]
  call void @_ZL22loadSharedChunkFromMemILb1EEvPjPKjiiRiS3_S3_S3_S3_S3_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb1ELb1EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32* %0, i32 %1, i32 %cond, i32* dereferenceable(4) %ai, i32* dereferenceable(4) %bi, i32* dereferenceable(4) %mem_ai, i32* dereferenceable(4) %mem_bi, i32* dereferenceable(4) %bankOffsetA, i32* dereferenceable(4) %bankOffsetB) #2
  %4 = load i32, i32* %blockIndex.addr, align 4
  %5 = load i32*, i32** %g_blockSums.addr, align 8
  call void @_ZL12prescanBlockILb1EEvPjiS0_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb1ELb1EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %4, i32* %5) #2
  %6 = load i32*, i32** %g_odata.addr, align 8
  %7 = load i32, i32* %n.addr, align 4
  %8 = load i32, i32* %ai, align 4
  %9 = load i32, i32* %bi, align 4
  %10 = load i32, i32* %mem_ai, align 4
  %11 = load i32, i32* %mem_bi, align 4
  %12 = load i32, i32* %bankOffsetA, align 4
  %13 = load i32, i32* %bankOffsetB, align 4
  call void @_ZL21storeSharedChunkToMemILb1EEvPjPKjiiiiiii(i32* %6, i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb1ELb1EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) #2
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL22loadSharedChunkFromMemILb1EEvPjPKjiiRiS3_S3_S3_S3_S3_(i32* %s_data, i32* %g_idata, i32 %n, i32 %baseIndex, i32* dereferenceable(4) %ai, i32* dereferenceable(4) %bi, i32* dereferenceable(4) %mem_ai, i32* dereferenceable(4) %mem_bi, i32* dereferenceable(4) %bankOffsetA, i32* dereferenceable(4) %bankOffsetB) #0 {
entry:
  %s_data.addr = alloca i32*, align 8
  %g_idata.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %ai.addr = alloca i32*, align 8
  %bi.addr = alloca i32*, align 8
  %mem_ai.addr = alloca i32*, align 8
  %mem_bi.addr = alloca i32*, align 8
  %bankOffsetA.addr = alloca i32*, align 8
  %bankOffsetB.addr = alloca i32*, align 8
  %thid = alloca i32, align 4
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32* %g_idata, i32** %g_idata.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  store i32* %ai, i32** %ai.addr, align 8
  store i32* %bi, i32** %bi.addr, align 8
  store i32* %mem_ai, i32** %mem_ai.addr, align 8
  store i32* %mem_bi, i32** %mem_bi.addr, align 8
  store i32* %bankOffsetA, i32** %bankOffsetA.addr, align 8
  store i32* %bankOffsetB, i32** %bankOffsetB.addr, align 8
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %thid, align 4
  %0 = load i32, i32* %baseIndex.addr, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %add = add i32 %0, %call1
  %1 = load i32*, i32** %mem_ai.addr, align 8
  store i32 %add, i32* %1, align 4
  %2 = load i32*, i32** %mem_ai.addr, align 8
  %3 = load i32, i32* %2, align 4
  %call2 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %add3 = add i32 %3, %call2
  %4 = load i32*, i32** %mem_bi.addr, align 8
  store i32 %add3, i32* %4, align 4
  %5 = load i32, i32* %thid, align 4
  %6 = load i32*, i32** %ai.addr, align 8
  store i32 %5, i32* %6, align 4
  %7 = load i32, i32* %thid, align 4
  %call4 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %add5 = add i32 %7, %call4
  %8 = load i32*, i32** %bi.addr, align 8
  store i32 %add5, i32* %8, align 4
  %9 = load i32*, i32** %ai.addr, align 8
  %10 = load i32, i32* %9, align 4
  %shr = ashr i32 %10, 4
  %11 = load i32*, i32** %bankOffsetA.addr, align 8
  store i32 %shr, i32* %11, align 4
  %12 = load i32*, i32** %bi.addr, align 8
  %13 = load i32, i32* %12, align 4
  %shr6 = ashr i32 %13, 4
  %14 = load i32*, i32** %bankOffsetB.addr, align 8
  store i32 %shr6, i32* %14, align 4
  %15 = load i32*, i32** %g_idata.addr, align 8
  %16 = load i32*, i32** %mem_ai.addr, align 8
  %17 = load i32, i32* %16, align 4
  %idxprom = sext i32 %17 to i64
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 %idxprom
  %18 = load i32, i32* %arrayidx, align 4
  %19 = load i32*, i32** %s_data.addr, align 8
  %20 = load i32*, i32** %ai.addr, align 8
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %bankOffsetA.addr, align 8
  %23 = load i32, i32* %22, align 4
  %add7 = add nsw i32 %21, %23
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %19, i64 %idxprom8
  store i32 %18, i32* %arrayidx9, align 4
  %24 = load i32*, i32** %bi.addr, align 8
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %25, %26
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %27 = load i32*, i32** %g_idata.addr, align 8
  %28 = load i32*, i32** %mem_bi.addr, align 8
  %29 = load i32, i32* %28, align 4
  %idxprom10 = sext i32 %29 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %27, i64 %idxprom10
  %30 = load i32, i32* %arrayidx11, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %30, %cond.true ], [ 0, %cond.false ]
  %31 = load i32*, i32** %s_data.addr, align 8
  %32 = load i32*, i32** %bi.addr, align 8
  %33 = load i32, i32* %32, align 4
  %34 = load i32*, i32** %bankOffsetB.addr, align 8
  %35 = load i32, i32* %34, align 4
  %add12 = add nsw i32 %33, %35
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %31, i64 %idxprom13
  store i32 %cond, i32* %arrayidx14, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL21storeSharedChunkToMemILb1EEvPjPKjiiiiiii(i32* %g_odata, i32* %s_data, i32 %n, i32 %ai, i32 %bi, i32 %mem_ai, i32 %mem_bi, i32 %bankOffsetA, i32 %bankOffsetB) #0 {
entry:
  %g_odata.addr = alloca i32*, align 8
  %s_data.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %ai.addr = alloca i32, align 4
  %bi.addr = alloca i32, align 4
  %mem_ai.addr = alloca i32, align 4
  %mem_bi.addr = alloca i32, align 4
  %bankOffsetA.addr = alloca i32, align 4
  %bankOffsetB.addr = alloca i32, align 4
  store i32* %g_odata, i32** %g_odata.addr, align 8
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %ai, i32* %ai.addr, align 4
  store i32 %bi, i32* %bi.addr, align 4
  store i32 %mem_ai, i32* %mem_ai.addr, align 4
  store i32 %mem_bi, i32* %mem_bi.addr, align 4
  store i32 %bankOffsetA, i32* %bankOffsetA.addr, align 4
  store i32 %bankOffsetB, i32* %bankOffsetB.addr, align 4
  call void @llvm.nvvm.barrier0()
  %0 = load i32*, i32** %s_data.addr, align 8
  %1 = load i32, i32* %ai.addr, align 4
  %2 = load i32, i32* %bankOffsetA.addr, align 4
  %add = add nsw i32 %1, %2
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32*, i32** %g_odata.addr, align 8
  %5 = load i32, i32* %mem_ai.addr, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1
  store i32 %3, i32* %arrayidx2, align 4
  %6 = load i32, i32* %bi.addr, align 4
  %7 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %s_data.addr, align 8
  %9 = load i32, i32* %bi.addr, align 4
  %10 = load i32, i32* %bankOffsetB.addr, align 4
  %add3 = add nsw i32 %9, %10
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4
  %11 = load i32, i32* %arrayidx5, align 4
  %12 = load i32*, i32** %g_odata.addr, align 8
  %13 = load i32, i32* %mem_bi.addr, align 4
  %idxprom6 = sext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %idxprom6
  store i32 %11, i32* %arrayidx7, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL7prescanILb0ELb0EEvPjPKjS0_iii(i32* %g_odata, i32* %g_idata, i32* %g_blockSums, i32 %n, i32 %blockIndex, i32 %baseIndex) #0 {
entry:
  %g_odata.addr = alloca i32*, align 8
  %g_idata.addr = alloca i32*, align 8
  %g_blockSums.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %blockIndex.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %ai = alloca i32, align 4
  %bi = alloca i32, align 4
  %mem_ai = alloca i32, align 4
  %mem_bi = alloca i32, align 4
  %bankOffsetA = alloca i32, align 4
  %bankOffsetB = alloca i32, align 4
  store i32* %g_odata, i32** %g_odata.addr, align 8
  store i32* %g_idata, i32** %g_idata.addr, align 8
  store i32* %g_blockSums, i32** %g_blockSums.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  %0 = load i32*, i32** %g_idata.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %2 = load i32, i32* %baseIndex.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call1, 1
  %call2 = call i32 @_ZL7__mul24ii(i32 %call, i32 %shl) #2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %baseIndex.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %3, %cond.false ]
  call void @_ZL22loadSharedChunkFromMemILb0EEvPjPKjiiRiS3_S3_S3_S3_S3_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb0ELb0EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32* %0, i32 %1, i32 %cond, i32* dereferenceable(4) %ai, i32* dereferenceable(4) %bi, i32* dereferenceable(4) %mem_ai, i32* dereferenceable(4) %mem_bi, i32* dereferenceable(4) %bankOffsetA, i32* dereferenceable(4) %bankOffsetB) #2
  %4 = load i32, i32* %blockIndex.addr, align 4
  %5 = load i32*, i32** %g_blockSums.addr, align 8
  call void @_ZL12prescanBlockILb0EEvPjiS0_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb0ELb0EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %4, i32* %5) #2
  %6 = load i32*, i32** %g_odata.addr, align 8
  %7 = load i32, i32* %n.addr, align 4
  %8 = load i32, i32* %ai, align 4
  %9 = load i32, i32* %bi, align 4
  %10 = load i32, i32* %mem_ai, align 4
  %11 = load i32, i32* %mem_bi, align 4
  %12 = load i32, i32* %bankOffsetA, align 4
  %13 = load i32, i32* %bankOffsetB, align 4
  call void @_ZL21storeSharedChunkToMemILb0EEvPjPKjiiiiiii(i32* %6, i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb0ELb0EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) #2
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL12prescanBlockILb0EEvPjiS0_(i32* %data, i32 %blockIndex, i32* %blockSums) #0 {
entry:
  %data.addr = alloca i32*, align 8
  %blockIndex.addr = alloca i32, align 4
  %blockSums.addr = alloca i32*, align 8
  %stride = alloca i32, align 4
  store i32* %data, i32** %data.addr, align 8
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  store i32* %blockSums, i32** %blockSums.addr, align 8
  %0 = load i32*, i32** %data.addr, align 8
  %call = call i32 @_ZL8buildSumPj(i32* %0) #2
  store i32 %call, i32* %stride, align 4
  %1 = load i32*, i32** %data.addr, align 8
  %2 = load i32*, i32** %blockSums.addr, align 8
  %3 = load i32, i32* %blockIndex.addr, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, i32* %blockIndex.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ %4, %cond.false ]
  call void @_ZL16clearLastElementILb0EEvPjS0_i(i32* %1, i32* %2, i32 %cond) #2
  %5 = load i32*, i32** %data.addr, align 8
  %6 = load i32, i32* %stride, align 4
  call void @_ZL16scanRootToLeavesPjj(i32* %5, i32 %6) #2
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define internal void @_ZL16clearLastElementILb0EEvPjS0_i(i32* %s_data, i32* %g_blockSums, i32 %blockIndex) #0 {
entry:
  %s_data.addr = alloca i32*, align 8
  %g_blockSums.addr = alloca i32*, align 8
  %blockIndex.addr = alloca i32, align 4
  %index = alloca i32, align 4
  store i32* %s_data, i32** %s_data.addr, align 8
  store i32* %g_blockSums, i32** %g_blockSums.addr, align 8
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call1, 1
  %sub = sub i32 %shl, 1
  store i32 %sub, i32* %index, align 4
  %0 = load i32, i32* %index, align 4
  %shr = ashr i32 %0, 4
  %1 = load i32, i32* %index, align 4
  %add = add nsw i32 %1, %shr
  store i32 %add, i32* %index, align 4
  %2 = load i32*, i32** %s_data.addr, align 8
  %3 = load i32, i32* %index, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_ZL7prescanILb0ELb1EEvPjPKjS0_iii(i32* %g_odata, i32* %g_idata, i32* %g_blockSums, i32 %n, i32 %blockIndex, i32 %baseIndex) #0 {
entry:
  %g_odata.addr = alloca i32*, align 8
  %g_idata.addr = alloca i32*, align 8
  %g_blockSums.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %blockIndex.addr = alloca i32, align 4
  %baseIndex.addr = alloca i32, align 4
  %ai = alloca i32, align 4
  %bi = alloca i32, align 4
  %mem_ai = alloca i32, align 4
  %mem_bi = alloca i32, align 4
  %bankOffsetA = alloca i32, align 4
  %bankOffsetB = alloca i32, align 4
  store i32* %g_odata, i32** %g_odata.addr, align 8
  store i32* %g_idata, i32** %g_idata.addr, align 8
  store i32* %g_blockSums, i32** %g_blockSums.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 %blockIndex, i32* %blockIndex.addr, align 4
  store i32 %baseIndex, i32* %baseIndex.addr, align 4
  %0 = load i32*, i32** %g_idata.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %2 = load i32, i32* %baseIndex.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #2
  %shl = shl i32 %call1, 1
  %call2 = call i32 @_ZL7__mul24ii(i32 %call, i32 %shl) #2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %baseIndex.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %3, %cond.false ]
  call void @_ZL22loadSharedChunkFromMemILb1EEvPjPKjiiRiS3_S3_S3_S3_S3_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb0ELb1EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32* %0, i32 %1, i32 %cond, i32* dereferenceable(4) %ai, i32* dereferenceable(4) %bi, i32* dereferenceable(4) %mem_ai, i32* dereferenceable(4) %mem_bi, i32* dereferenceable(4) %bankOffsetA, i32* dereferenceable(4) %bankOffsetB) #2
  %4 = load i32, i32* %blockIndex.addr, align 4
  %5 = load i32*, i32** %g_blockSums.addr, align 8
  call void @_ZL12prescanBlockILb0EEvPjiS0_(i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb0ELb1EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %4, i32* %5) #2
  %6 = load i32*, i32** %g_odata.addr, align 8
  %7 = load i32, i32* %n.addr, align 4
  %8 = load i32, i32* %ai, align 4
  %9 = load i32, i32* %bi, align 4
  %10 = load i32, i32* %mem_ai, align 4
  %11 = load i32, i32* %mem_bi, align 4
  %12 = load i32, i32* %bankOffsetA, align 4
  %13 = load i32, i32* %bankOffsetB, align 4
  call void @_ZL21storeSharedChunkToMemILb1EEvPjPKjiiiiiii(i32* %6, i32* getelementptr inbounds ([3072 x i32], [3072 x i32]* addrspacecast ([3072 x i32] addrspace(3)* @_ZZL7prescanILb0ELb1EEvPjPKjS0_iiiE6s_data to [3072 x i32]*), i64 0, i64 0), i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) #2
  ret void
}

; Function Attrs: alwaysinline convergent inlinehint nounwind
define internal i32 @__nv_mul24(i32 %x, i32 %y) #4 {
  %1 = call i32 @llvm.nvvm.mul24.i(i32 %x, i32 %y)
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.mul24.i(i32, i32) #3

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { alwaysinline convergent inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !11, !13, !13, !13, !13, !14, !14, !13}
!llvm.ident = !{!15}
!nvvmir.version = !{!16}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i8*, i64, i32*)* @_Z12histo_kernelPhlPj, !"kernel", i32 1}
!4 = !{void (i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)* @_ZL26vlc_encode_kernel_sm64huffPjPKjS1_S_S_S_S_S_, !"kernel", i32 1}
!5 = !{void (i32*, i32*, i32*, i32*, i32)* @_ZL5pack2PjS_S_S_j, !"kernel", i32 1}
!6 = !{void (i32*, i32*, i32, i32, i32)* @_ZL10uniformAddPjS_iii, !"kernel", i32 1}
!7 = !{void (i32*, i32*, i32*, i32, i32, i32)* @_ZL7prescanILb1ELb0EEvPjPKjS0_iii, !"kernel", i32 1}
!8 = !{void (i32*, i32*, i32*, i32, i32, i32)* @_ZL7prescanILb1ELb1EEvPjPKjS0_iii, !"kernel", i32 1}
!9 = !{void (i32*, i32*, i32*, i32, i32, i32)* @_ZL7prescanILb0ELb0EEvPjPKjS0_iii, !"kernel", i32 1}
!10 = !{void (i32*, i32*, i32*, i32, i32, i32)* @_ZL7prescanILb0ELb1EEvPjPKjS0_iii, !"kernel", i32 1}
!11 = !{null, !"align", i32 8}
!12 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!13 = !{null, !"align", i32 16}
!14 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!15 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!16 = !{i32 1, i32 4}
