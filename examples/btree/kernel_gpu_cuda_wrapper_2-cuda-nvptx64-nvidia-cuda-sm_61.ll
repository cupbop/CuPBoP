; ModuleID = 'kernel_gpu_cuda_wrapper_2-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "kernel/kernel_gpu_cuda_wrapper_2.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.knode = type { i32, [257 x i32], [257 x i32], i8, i32 }

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1

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
define dso_local void @findRangeK(i64 %height, %struct.knode* %knodesD, i64 %knodes_elem, i64* %currKnodeD, i64* %offsetD, i64* %lastKnodeD, i64* %offset_2D, i32* %startD, i32* %endD, i32* %RecstartD, i32* %ReclenD) #0 {
entry:
  %height.addr = alloca i64, align 8
  %knodesD.addr = alloca %struct.knode*, align 8
  %knodes_elem.addr = alloca i64, align 8
  %currKnodeD.addr = alloca i64*, align 8
  %offsetD.addr = alloca i64*, align 8
  %lastKnodeD.addr = alloca i64*, align 8
  %offset_2D.addr = alloca i64*, align 8
  %startD.addr = alloca i32*, align 8
  %endD.addr = alloca i32*, align 8
  %RecstartD.addr = alloca i32*, align 8
  %ReclenD.addr = alloca i32*, align 8
  %thid = alloca i32, align 4
  %bid = alloca i32, align 4
  %i = alloca i32, align 4
  store i64 %height, i64* %height.addr, align 8
  store %struct.knode* %knodesD, %struct.knode** %knodesD.addr, align 8
  store i64 %knodes_elem, i64* %knodes_elem.addr, align 8
  store i64* %currKnodeD, i64** %currKnodeD.addr, align 8
  store i64* %offsetD, i64** %offsetD.addr, align 8
  store i64* %lastKnodeD, i64** %lastKnodeD.addr, align 8
  store i64* %offset_2D, i64** %offset_2D.addr, align 8
  store i32* %startD, i32** %startD.addr, align 8
  store i32* %endD, i32** %endD.addr, align 8
  store i32* %RecstartD, i32** %RecstartD.addr, align 8
  store i32* %ReclenD, i32** %ReclenD.addr, align 8
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %thid, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %bid, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64, i64* %height.addr, align 8
  %cmp = icmp slt i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %3 = load i64*, i64** %currKnodeD.addr, align 8
  %4 = load i32, i32* %bid, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %idxprom
  %5 = load i64, i64* %arrayidx, align 8
  %arrayidx2 = getelementptr inbounds %struct.knode, %struct.knode* %2, i64 %5
  %keys = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx2, i32 0, i32 2
  %6 = load i32, i32* %thid, align 4
  %idxprom3 = sext i32 %6 to i64
  %arrayidx4 = getelementptr inbounds [257 x i32], [257 x i32]* %keys, i64 0, i64 %idxprom3
  %7 = load i32, i32* %arrayidx4, align 4
  %8 = load i32*, i32** %startD.addr, align 8
  %9 = load i32, i32* %bid, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5
  %10 = load i32, i32* %arrayidx6, align 4
  %cmp7 = icmp sle i32 %7, %10
  br i1 %cmp7, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %for.body
  %11 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %12 = load i64*, i64** %currKnodeD.addr, align 8
  %13 = load i32, i32* %bid, align 4
  %idxprom8 = sext i32 %13 to i64
  %arrayidx9 = getelementptr inbounds i64, i64* %12, i64 %idxprom8
  %14 = load i64, i64* %arrayidx9, align 8
  %arrayidx10 = getelementptr inbounds %struct.knode, %struct.knode* %11, i64 %14
  %keys11 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx10, i32 0, i32 2
  %15 = load i32, i32* %thid, align 4
  %add = add nsw i32 %15, 1
  %idxprom12 = sext i32 %add to i64
  %arrayidx13 = getelementptr inbounds [257 x i32], [257 x i32]* %keys11, i64 0, i64 %idxprom12
  %16 = load i32, i32* %arrayidx13, align 4
  %17 = load i32*, i32** %startD.addr, align 8
  %18 = load i32, i32* %bid, align 4
  %idxprom14 = sext i32 %18 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %17, i64 %idxprom14
  %19 = load i32, i32* %arrayidx15, align 4
  %cmp16 = icmp sgt i32 %16, %19
  br i1 %cmp16, label %if.then, label %if.end34

if.then:                                          ; preds = %land.lhs.true
  %20 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %21 = load i64*, i64** %currKnodeD.addr, align 8
  %22 = load i32, i32* %bid, align 4
  %idxprom17 = sext i32 %22 to i64
  %arrayidx18 = getelementptr inbounds i64, i64* %21, i64 %idxprom17
  %23 = load i64, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds %struct.knode, %struct.knode* %20, i64 %23
  %indices = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx19, i32 0, i32 1
  %24 = load i32, i32* %thid, align 4
  %idxprom20 = sext i32 %24 to i64
  %arrayidx21 = getelementptr inbounds [257 x i32], [257 x i32]* %indices, i64 0, i64 %idxprom20
  %25 = load i32, i32* %arrayidx21, align 4
  %conv22 = sext i32 %25 to i64
  %26 = load i64, i64* %knodes_elem.addr, align 8
  %cmp23 = icmp slt i64 %conv22, %26
  br i1 %cmp23, label %if.then24, label %if.end

if.then24:                                        ; preds = %if.then
  %27 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %28 = load i64*, i64** %currKnodeD.addr, align 8
  %29 = load i32, i32* %bid, align 4
  %idxprom25 = sext i32 %29 to i64
  %arrayidx26 = getelementptr inbounds i64, i64* %28, i64 %idxprom25
  %30 = load i64, i64* %arrayidx26, align 8
  %arrayidx27 = getelementptr inbounds %struct.knode, %struct.knode* %27, i64 %30
  %indices28 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx27, i32 0, i32 1
  %31 = load i32, i32* %thid, align 4
  %idxprom29 = sext i32 %31 to i64
  %arrayidx30 = getelementptr inbounds [257 x i32], [257 x i32]* %indices28, i64 0, i64 %idxprom29
  %32 = load i32, i32* %arrayidx30, align 4
  %conv31 = sext i32 %32 to i64
  %33 = load i64*, i64** %offsetD.addr, align 8
  %34 = load i32, i32* %bid, align 4
  %idxprom32 = sext i32 %34 to i64
  %arrayidx33 = getelementptr inbounds i64, i64* %33, i64 %idxprom32
  store i64 %conv31, i64* %arrayidx33, align 8
  br label %if.end

if.end:                                           ; preds = %if.then24, %if.then
  br label %if.end34

if.end34:                                         ; preds = %if.end, %land.lhs.true, %for.body
  %35 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %36 = load i64*, i64** %lastKnodeD.addr, align 8
  %37 = load i32, i32* %bid, align 4
  %idxprom35 = sext i32 %37 to i64
  %arrayidx36 = getelementptr inbounds i64, i64* %36, i64 %idxprom35
  %38 = load i64, i64* %arrayidx36, align 8
  %arrayidx37 = getelementptr inbounds %struct.knode, %struct.knode* %35, i64 %38
  %keys38 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx37, i32 0, i32 2
  %39 = load i32, i32* %thid, align 4
  %idxprom39 = sext i32 %39 to i64
  %arrayidx40 = getelementptr inbounds [257 x i32], [257 x i32]* %keys38, i64 0, i64 %idxprom39
  %40 = load i32, i32* %arrayidx40, align 4
  %41 = load i32*, i32** %endD.addr, align 8
  %42 = load i32, i32* %bid, align 4
  %idxprom41 = sext i32 %42 to i64
  %arrayidx42 = getelementptr inbounds i32, i32* %41, i64 %idxprom41
  %43 = load i32, i32* %arrayidx42, align 4
  %cmp43 = icmp sle i32 %40, %43
  br i1 %cmp43, label %land.lhs.true44, label %if.end75

land.lhs.true44:                                  ; preds = %if.end34
  %44 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %45 = load i64*, i64** %lastKnodeD.addr, align 8
  %46 = load i32, i32* %bid, align 4
  %idxprom45 = sext i32 %46 to i64
  %arrayidx46 = getelementptr inbounds i64, i64* %45, i64 %idxprom45
  %47 = load i64, i64* %arrayidx46, align 8
  %arrayidx47 = getelementptr inbounds %struct.knode, %struct.knode* %44, i64 %47
  %keys48 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx47, i32 0, i32 2
  %48 = load i32, i32* %thid, align 4
  %add49 = add nsw i32 %48, 1
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds [257 x i32], [257 x i32]* %keys48, i64 0, i64 %idxprom50
  %49 = load i32, i32* %arrayidx51, align 4
  %50 = load i32*, i32** %endD.addr, align 8
  %51 = load i32, i32* %bid, align 4
  %idxprom52 = sext i32 %51 to i64
  %arrayidx53 = getelementptr inbounds i32, i32* %50, i64 %idxprom52
  %52 = load i32, i32* %arrayidx53, align 4
  %cmp54 = icmp sgt i32 %49, %52
  br i1 %cmp54, label %if.then55, label %if.end75

if.then55:                                        ; preds = %land.lhs.true44
  %53 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %54 = load i64*, i64** %lastKnodeD.addr, align 8
  %55 = load i32, i32* %bid, align 4
  %idxprom56 = sext i32 %55 to i64
  %arrayidx57 = getelementptr inbounds i64, i64* %54, i64 %idxprom56
  %56 = load i64, i64* %arrayidx57, align 8
  %arrayidx58 = getelementptr inbounds %struct.knode, %struct.knode* %53, i64 %56
  %indices59 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx58, i32 0, i32 1
  %57 = load i32, i32* %thid, align 4
  %idxprom60 = sext i32 %57 to i64
  %arrayidx61 = getelementptr inbounds [257 x i32], [257 x i32]* %indices59, i64 0, i64 %idxprom60
  %58 = load i32, i32* %arrayidx61, align 4
  %conv62 = sext i32 %58 to i64
  %59 = load i64, i64* %knodes_elem.addr, align 8
  %cmp63 = icmp slt i64 %conv62, %59
  br i1 %cmp63, label %if.then64, label %if.end74

if.then64:                                        ; preds = %if.then55
  %60 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %61 = load i64*, i64** %lastKnodeD.addr, align 8
  %62 = load i32, i32* %bid, align 4
  %idxprom65 = sext i32 %62 to i64
  %arrayidx66 = getelementptr inbounds i64, i64* %61, i64 %idxprom65
  %63 = load i64, i64* %arrayidx66, align 8
  %arrayidx67 = getelementptr inbounds %struct.knode, %struct.knode* %60, i64 %63
  %indices68 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx67, i32 0, i32 1
  %64 = load i32, i32* %thid, align 4
  %idxprom69 = sext i32 %64 to i64
  %arrayidx70 = getelementptr inbounds [257 x i32], [257 x i32]* %indices68, i64 0, i64 %idxprom69
  %65 = load i32, i32* %arrayidx70, align 4
  %conv71 = sext i32 %65 to i64
  %66 = load i64*, i64** %offset_2D.addr, align 8
  %67 = load i32, i32* %bid, align 4
  %idxprom72 = sext i32 %67 to i64
  %arrayidx73 = getelementptr inbounds i64, i64* %66, i64 %idxprom72
  store i64 %conv71, i64* %arrayidx73, align 8
  br label %if.end74

if.end74:                                         ; preds = %if.then64, %if.then55
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %land.lhs.true44, %if.end34
  call void @llvm.nvvm.barrier0()
  %68 = load i32, i32* %thid, align 4
  %cmp76 = icmp eq i32 %68, 0
  br i1 %cmp76, label %if.then77, label %if.end86

if.then77:                                        ; preds = %if.end75
  %69 = load i64*, i64** %offsetD.addr, align 8
  %70 = load i32, i32* %bid, align 4
  %idxprom78 = sext i32 %70 to i64
  %arrayidx79 = getelementptr inbounds i64, i64* %69, i64 %idxprom78
  %71 = load i64, i64* %arrayidx79, align 8
  %72 = load i64*, i64** %currKnodeD.addr, align 8
  %73 = load i32, i32* %bid, align 4
  %idxprom80 = sext i32 %73 to i64
  %arrayidx81 = getelementptr inbounds i64, i64* %72, i64 %idxprom80
  store i64 %71, i64* %arrayidx81, align 8
  %74 = load i64*, i64** %offset_2D.addr, align 8
  %75 = load i32, i32* %bid, align 4
  %idxprom82 = sext i32 %75 to i64
  %arrayidx83 = getelementptr inbounds i64, i64* %74, i64 %idxprom82
  %76 = load i64, i64* %arrayidx83, align 8
  %77 = load i64*, i64** %lastKnodeD.addr, align 8
  %78 = load i32, i32* %bid, align 4
  %idxprom84 = sext i32 %78 to i64
  %arrayidx85 = getelementptr inbounds i64, i64* %77, i64 %idxprom84
  store i64 %76, i64* %arrayidx85, align 8
  br label %if.end86

if.end86:                                         ; preds = %if.then77, %if.end75
  call void @llvm.nvvm.barrier0()
  br label %for.inc

for.inc:                                          ; preds = %if.end86
  %79 = load i32, i32* %i, align 4
  %inc = add nsw i32 %79, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %80 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %81 = load i64*, i64** %currKnodeD.addr, align 8
  %82 = load i32, i32* %bid, align 4
  %idxprom87 = sext i32 %82 to i64
  %arrayidx88 = getelementptr inbounds i64, i64* %81, i64 %idxprom87
  %83 = load i64, i64* %arrayidx88, align 8
  %arrayidx89 = getelementptr inbounds %struct.knode, %struct.knode* %80, i64 %83
  %keys90 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx89, i32 0, i32 2
  %84 = load i32, i32* %thid, align 4
  %idxprom91 = sext i32 %84 to i64
  %arrayidx92 = getelementptr inbounds [257 x i32], [257 x i32]* %keys90, i64 0, i64 %idxprom91
  %85 = load i32, i32* %arrayidx92, align 4
  %86 = load i32*, i32** %startD.addr, align 8
  %87 = load i32, i32* %bid, align 4
  %idxprom93 = sext i32 %87 to i64
  %arrayidx94 = getelementptr inbounds i32, i32* %86, i64 %idxprom93
  %88 = load i32, i32* %arrayidx94, align 4
  %cmp95 = icmp eq i32 %85, %88
  br i1 %cmp95, label %if.then96, label %if.end105

if.then96:                                        ; preds = %for.end
  %89 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %90 = load i64*, i64** %currKnodeD.addr, align 8
  %91 = load i32, i32* %bid, align 4
  %idxprom97 = sext i32 %91 to i64
  %arrayidx98 = getelementptr inbounds i64, i64* %90, i64 %idxprom97
  %92 = load i64, i64* %arrayidx98, align 8
  %arrayidx99 = getelementptr inbounds %struct.knode, %struct.knode* %89, i64 %92
  %indices100 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx99, i32 0, i32 1
  %93 = load i32, i32* %thid, align 4
  %idxprom101 = sext i32 %93 to i64
  %arrayidx102 = getelementptr inbounds [257 x i32], [257 x i32]* %indices100, i64 0, i64 %idxprom101
  %94 = load i32, i32* %arrayidx102, align 4
  %95 = load i32*, i32** %RecstartD.addr, align 8
  %96 = load i32, i32* %bid, align 4
  %idxprom103 = sext i32 %96 to i64
  %arrayidx104 = getelementptr inbounds i32, i32* %95, i64 %idxprom103
  store i32 %94, i32* %arrayidx104, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.then96, %for.end
  call void @llvm.nvvm.barrier0()
  %97 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %98 = load i64*, i64** %lastKnodeD.addr, align 8
  %99 = load i32, i32* %bid, align 4
  %idxprom106 = sext i32 %99 to i64
  %arrayidx107 = getelementptr inbounds i64, i64* %98, i64 %idxprom106
  %100 = load i64, i64* %arrayidx107, align 8
  %arrayidx108 = getelementptr inbounds %struct.knode, %struct.knode* %97, i64 %100
  %keys109 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx108, i32 0, i32 2
  %101 = load i32, i32* %thid, align 4
  %idxprom110 = sext i32 %101 to i64
  %arrayidx111 = getelementptr inbounds [257 x i32], [257 x i32]* %keys109, i64 0, i64 %idxprom110
  %102 = load i32, i32* %arrayidx111, align 4
  %103 = load i32*, i32** %endD.addr, align 8
  %104 = load i32, i32* %bid, align 4
  %idxprom112 = sext i32 %104 to i64
  %arrayidx113 = getelementptr inbounds i32, i32* %103, i64 %idxprom112
  %105 = load i32, i32* %arrayidx113, align 4
  %cmp114 = icmp eq i32 %102, %105
  br i1 %cmp114, label %if.then115, label %if.end127

if.then115:                                       ; preds = %if.end105
  %106 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %107 = load i64*, i64** %lastKnodeD.addr, align 8
  %108 = load i32, i32* %bid, align 4
  %idxprom116 = sext i32 %108 to i64
  %arrayidx117 = getelementptr inbounds i64, i64* %107, i64 %idxprom116
  %109 = load i64, i64* %arrayidx117, align 8
  %arrayidx118 = getelementptr inbounds %struct.knode, %struct.knode* %106, i64 %109
  %indices119 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx118, i32 0, i32 1
  %110 = load i32, i32* %thid, align 4
  %idxprom120 = sext i32 %110 to i64
  %arrayidx121 = getelementptr inbounds [257 x i32], [257 x i32]* %indices119, i64 0, i64 %idxprom120
  %111 = load i32, i32* %arrayidx121, align 4
  %112 = load i32*, i32** %RecstartD.addr, align 8
  %113 = load i32, i32* %bid, align 4
  %idxprom122 = sext i32 %113 to i64
  %arrayidx123 = getelementptr inbounds i32, i32* %112, i64 %idxprom122
  %114 = load i32, i32* %arrayidx123, align 4
  %sub = sub nsw i32 %111, %114
  %add124 = add nsw i32 %sub, 1
  %115 = load i32*, i32** %ReclenD.addr, align 8
  %116 = load i32, i32* %bid, align 4
  %idxprom125 = sext i32 %116 to i64
  %arrayidx126 = getelementptr inbounds i32, i32* %115, i64 %idxprom125
  store i32 %add124, i32* %arrayidx126, align 4
  br label %if.end127

if.end127:                                        ; preds = %if.then115, %if.end105
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %0
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind readnone }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i64, %struct.knode*, i64, i64*, i64*, i64*, i64*, i32*, i32*, i32*, i32*)* @findRangeK, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
