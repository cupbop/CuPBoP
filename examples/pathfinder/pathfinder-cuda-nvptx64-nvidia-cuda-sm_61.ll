; ModuleID = 'pathfinder-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "pathfinder.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@_ZZ14dynproc_kerneliPiS_S_iiiiE4prev = internal addrspace(3) global [256 x i32] undef, align 4
@_ZZ14dynproc_kerneliPiS_S_iiiiE6result = internal addrspace(3) global [256 x i32] undef, align 4
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

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
define dso_local void @_Z14dynproc_kerneliPiS_S_iiii(i32 %iteration, i32* %gpuWall, i32* %gpuSrc, i32* %gpuResults, i32 %cols, i32 %rows, i32 %startStep, i32 %border) #0 {
entry:
  %iteration.addr = alloca i32, align 4
  %gpuWall.addr = alloca i32*, align 8
  %gpuSrc.addr = alloca i32*, align 8
  %gpuResults.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %startStep.addr = alloca i32, align 4
  %border.addr = alloca i32, align 4
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %small_block_cols = alloca i32, align 4
  %blkX = alloca i32, align 4
  %blkXmax = alloca i32, align 4
  %xidx = alloca i32, align 4
  %validXmin = alloca i32, align 4
  %validXmax = alloca i32, align 4
  %W = alloca i32, align 4
  %E = alloca i32, align 4
  %isValid = alloca i8, align 1
  %computed = alloca i8, align 1
  %i = alloca i32, align 4
  %left = alloca i32, align 4
  %up = alloca i32, align 4
  %right = alloca i32, align 4
  %shortest = alloca i32, align 4
  %index = alloca i32, align 4
  store i32 %iteration, i32* %iteration.addr, align 4
  store i32* %gpuWall, i32** %gpuWall.addr, align 8
  store i32* %gpuSrc, i32** %gpuSrc.addr, align 8
  store i32* %gpuResults, i32** %gpuResults.addr, align 8
  store i32 %cols, i32* %cols.addr, align 4
  store i32 %rows, i32* %rows.addr, align 4
  store i32 %startStep, i32* %startStep.addr, align 4
  store i32 %border, i32* %border.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %bx, align 4
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call1, i32* %tx, align 4
  %0 = load i32, i32* %iteration.addr, align 4
  %mul = mul nsw i32 %0, 1
  %mul2 = mul nsw i32 %mul, 2
  %sub = sub nsw i32 256, %mul2
  store i32 %sub, i32* %small_block_cols, align 4
  %1 = load i32, i32* %small_block_cols, align 4
  %2 = load i32, i32* %bx, align 4
  %mul3 = mul nsw i32 %1, %2
  %3 = load i32, i32* %border.addr, align 4
  %sub4 = sub nsw i32 %mul3, %3
  store i32 %sub4, i32* %blkX, align 4
  %4 = load i32, i32* %blkX, align 4
  %add = add nsw i32 %4, 256
  %sub5 = sub nsw i32 %add, 1
  store i32 %sub5, i32* %blkXmax, align 4
  %5 = load i32, i32* %blkX, align 4
  %6 = load i32, i32* %tx, align 4
  %add6 = add nsw i32 %5, %6
  store i32 %add6, i32* %xidx, align 4
  %7 = load i32, i32* %blkX, align 4
  %cmp = icmp slt i32 %7, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %8 = load i32, i32* %blkX, align 4
  %sub7 = sub nsw i32 0, %8
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub7, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %validXmin, align 4
  %9 = load i32, i32* %blkXmax, align 4
  %10 = load i32, i32* %cols.addr, align 4
  %sub8 = sub nsw i32 %10, 1
  %cmp9 = icmp sgt i32 %9, %sub8
  br i1 %cmp9, label %cond.true10, label %cond.false14

cond.true10:                                      ; preds = %cond.end
  %11 = load i32, i32* %blkXmax, align 4
  %12 = load i32, i32* %cols.addr, align 4
  %sub11 = sub nsw i32 %11, %12
  %add12 = add nsw i32 %sub11, 1
  %sub13 = sub nsw i32 255, %add12
  br label %cond.end15

cond.false14:                                     ; preds = %cond.end
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true10
  %cond16 = phi i32 [ %sub13, %cond.true10 ], [ 255, %cond.false14 ]
  store i32 %cond16, i32* %validXmax, align 4
  %13 = load i32, i32* %tx, align 4
  %sub17 = sub nsw i32 %13, 1
  store i32 %sub17, i32* %W, align 4
  %14 = load i32, i32* %tx, align 4
  %add18 = add nsw i32 %14, 1
  store i32 %add18, i32* %E, align 4
  %15 = load i32, i32* %W, align 4
  %16 = load i32, i32* %validXmin, align 4
  %cmp19 = icmp slt i32 %15, %16
  br i1 %cmp19, label %cond.true20, label %cond.false21

cond.true20:                                      ; preds = %cond.end15
  %17 = load i32, i32* %validXmin, align 4
  br label %cond.end22

cond.false21:                                     ; preds = %cond.end15
  %18 = load i32, i32* %W, align 4
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true20
  %cond23 = phi i32 [ %17, %cond.true20 ], [ %18, %cond.false21 ]
  store i32 %cond23, i32* %W, align 4
  %19 = load i32, i32* %E, align 4
  %20 = load i32, i32* %validXmax, align 4
  %cmp24 = icmp sgt i32 %19, %20
  br i1 %cmp24, label %cond.true25, label %cond.false26

cond.true25:                                      ; preds = %cond.end22
  %21 = load i32, i32* %validXmax, align 4
  br label %cond.end27

cond.false26:                                     ; preds = %cond.end22
  %22 = load i32, i32* %E, align 4
  br label %cond.end27

cond.end27:                                       ; preds = %cond.false26, %cond.true25
  %cond28 = phi i32 [ %21, %cond.true25 ], [ %22, %cond.false26 ]
  store i32 %cond28, i32* %E, align 4
  %23 = load i32, i32* %tx, align 4
  %24 = load i32, i32* %validXmin, align 4
  %cmp29 = icmp sge i32 %23, %24
  br i1 %cmp29, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.end27
  %25 = load i32, i32* %tx, align 4
  %26 = load i32, i32* %validXmax, align 4
  %cmp30 = icmp sle i32 %25, %26
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.end27
  %27 = phi i1 [ false, %cond.end27 ], [ %cmp30, %land.rhs ]
  %frombool = zext i1 %27 to i8
  store i8 %frombool, i8* %isValid, align 1
  %28 = load i32, i32* %xidx, align 4
  %cmp31 = icmp sge i32 %28, 0
  br i1 %cmp31, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %land.end
  %29 = load i32, i32* %xidx, align 4
  %30 = load i32, i32* %cols.addr, align 4
  %sub32 = sub nsw i32 %30, 1
  %cmp33 = icmp sle i32 %29, %sub32
  br i1 %cmp33, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %31 = load i32*, i32** %gpuSrc.addr, align 8
  %32 = load i32, i32* %xidx, align 4
  %idxprom = sext i32 %32 to i64
  %arrayidx = getelementptr inbounds i32, i32* %31, i64 %idxprom
  %33 = load i32, i32* %arrayidx, align 4
  %34 = load i32, i32* %tx, align 4
  %idxprom34 = sext i32 %34 to i64
  %arrayidx35 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom34
  store i32 %33, i32* %arrayidx35, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %land.end
  call void @llvm.nvvm.barrier0()
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %35 = load i32, i32* %i, align 4
  %36 = load i32, i32* %iteration.addr, align 4
  %cmp36 = icmp slt i32 %35, %36
  br i1 %cmp36, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %computed, align 1
  %37 = load i32, i32* %tx, align 4
  %38 = load i32, i32* %i, align 4
  %add37 = add nsw i32 %38, 1
  %cmp38 = icmp sge i32 %37, %add37
  br i1 %cmp38, label %land.lhs.true39, label %if.end69

land.lhs.true39:                                  ; preds = %for.body
  %39 = load i32, i32* %tx, align 4
  %40 = load i32, i32* %i, align 4
  %sub40 = sub nsw i32 256, %40
  %sub41 = sub nsw i32 %sub40, 2
  %cmp42 = icmp sle i32 %39, %sub41
  br i1 %cmp42, label %land.lhs.true43, label %if.end69

land.lhs.true43:                                  ; preds = %land.lhs.true39
  %41 = load i8, i8* %isValid, align 1
  %tobool = trunc i8 %41 to i1
  br i1 %tobool, label %if.then44, label %if.end69

if.then44:                                        ; preds = %land.lhs.true43
  store i8 1, i8* %computed, align 1
  %42 = load i32, i32* %W, align 4
  %idxprom45 = sext i32 %42 to i64
  %arrayidx46 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom45
  %43 = load i32, i32* %arrayidx46, align 4
  store i32 %43, i32* %left, align 4
  %44 = load i32, i32* %tx, align 4
  %idxprom47 = sext i32 %44 to i64
  %arrayidx48 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom47
  %45 = load i32, i32* %arrayidx48, align 4
  store i32 %45, i32* %up, align 4
  %46 = load i32, i32* %E, align 4
  %idxprom49 = sext i32 %46 to i64
  %arrayidx50 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom49
  %47 = load i32, i32* %arrayidx50, align 4
  store i32 %47, i32* %right, align 4
  %48 = load i32, i32* %left, align 4
  %49 = load i32, i32* %up, align 4
  %cmp51 = icmp sle i32 %48, %49
  br i1 %cmp51, label %cond.true52, label %cond.false53

cond.true52:                                      ; preds = %if.then44
  %50 = load i32, i32* %left, align 4
  br label %cond.end54

cond.false53:                                     ; preds = %if.then44
  %51 = load i32, i32* %up, align 4
  br label %cond.end54

cond.end54:                                       ; preds = %cond.false53, %cond.true52
  %cond55 = phi i32 [ %50, %cond.true52 ], [ %51, %cond.false53 ]
  store i32 %cond55, i32* %shortest, align 4
  %52 = load i32, i32* %shortest, align 4
  %53 = load i32, i32* %right, align 4
  %cmp56 = icmp sle i32 %52, %53
  br i1 %cmp56, label %cond.true57, label %cond.false58

cond.true57:                                      ; preds = %cond.end54
  %54 = load i32, i32* %shortest, align 4
  br label %cond.end59

cond.false58:                                     ; preds = %cond.end54
  %55 = load i32, i32* %right, align 4
  br label %cond.end59

cond.end59:                                       ; preds = %cond.false58, %cond.true57
  %cond60 = phi i32 [ %54, %cond.true57 ], [ %55, %cond.false58 ]
  store i32 %cond60, i32* %shortest, align 4
  %56 = load i32, i32* %cols.addr, align 4
  %57 = load i32, i32* %startStep.addr, align 4
  %58 = load i32, i32* %i, align 4
  %add61 = add nsw i32 %57, %58
  %mul62 = mul nsw i32 %56, %add61
  %59 = load i32, i32* %xidx, align 4
  %add63 = add nsw i32 %mul62, %59
  store i32 %add63, i32* %index, align 4
  %60 = load i32, i32* %shortest, align 4
  %61 = load i32*, i32** %gpuWall.addr, align 8
  %62 = load i32, i32* %index, align 4
  %idxprom64 = sext i32 %62 to i64
  %arrayidx65 = getelementptr inbounds i32, i32* %61, i64 %idxprom64
  %63 = load i32, i32* %arrayidx65, align 4
  %add66 = add nsw i32 %60, %63
  %64 = load i32, i32* %tx, align 4
  %idxprom67 = sext i32 %64 to i64
  %arrayidx68 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE6result to [256 x i32]*), i64 0, i64 %idxprom67
  store i32 %add66, i32* %arrayidx68, align 4
  br label %if.end69

if.end69:                                         ; preds = %cond.end59, %land.lhs.true43, %land.lhs.true39, %for.body
  call void @llvm.nvvm.barrier0()
  %65 = load i32, i32* %i, align 4
  %66 = load i32, i32* %iteration.addr, align 4
  %sub70 = sub nsw i32 %66, 1
  %cmp71 = icmp eq i32 %65, %sub70
  br i1 %cmp71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end69
  br label %for.end

if.end73:                                         ; preds = %if.end69
  %67 = load i8, i8* %computed, align 1
  %tobool74 = trunc i8 %67 to i1
  br i1 %tobool74, label %if.then75, label %if.end80

if.then75:                                        ; preds = %if.end73
  %68 = load i32, i32* %tx, align 4
  %idxprom76 = sext i32 %68 to i64
  %arrayidx77 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE6result to [256 x i32]*), i64 0, i64 %idxprom76
  %69 = load i32, i32* %arrayidx77, align 4
  %70 = load i32, i32* %tx, align 4
  %idxprom78 = sext i32 %70 to i64
  %arrayidx79 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE4prev to [256 x i32]*), i64 0, i64 %idxprom78
  store i32 %69, i32* %arrayidx79, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.then75, %if.end73
  call void @llvm.nvvm.barrier0()
  br label %for.inc

for.inc:                                          ; preds = %if.end80
  %71 = load i32, i32* %i, align 4
  %inc = add nsw i32 %71, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then72, %for.cond
  %72 = load i8, i8* %computed, align 1
  %tobool81 = trunc i8 %72 to i1
  br i1 %tobool81, label %if.then82, label %if.end87

if.then82:                                        ; preds = %for.end
  %73 = load i32, i32* %tx, align 4
  %idxprom83 = sext i32 %73 to i64
  %arrayidx84 = getelementptr inbounds [256 x i32], [256 x i32]* addrspacecast ([256 x i32] addrspace(3)* @_ZZ14dynproc_kerneliPiS_S_iiiiE6result to [256 x i32]*), i64 0, i64 %idxprom83
  %74 = load i32, i32* %arrayidx84, align 4
  %75 = load i32*, i32** %gpuResults.addr, align 8
  %76 = load i32, i32* %xidx, align 4
  %idxprom85 = sext i32 %76 to i64
  %arrayidx86 = getelementptr inbounds i32, i32* %75, i64 %idxprom85
  store i32 %74, i32* %arrayidx86, align 4
  br label %if.end87

if.end87:                                         ; preds = %if.then82, %for.end
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

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

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
!3 = !{void (i32, i32*, i32*, i32*, i32, i32, i32, i32)* @_Z14dynproc_kerneliPiS_S_iiii, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
