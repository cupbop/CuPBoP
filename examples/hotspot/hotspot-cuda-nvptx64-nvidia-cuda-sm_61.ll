; ModuleID = 'hotspot-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "hotspot.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

@_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ14calculate_tempiPfS_S_iiiiffffffE13power_on_cuda = internal addrspace(3) global [16 x [16 x float]] undef, align 4
@_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t = internal addrspace(3) global [16 x [16 x float]] undef, align 4
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
define dso_local void @_Z14calculate_tempiPfS_S_iiiiffffff(i32 %iteration, float* %power, float* %temp_src, float* %temp_dst, i32 %grid_cols, i32 %grid_rows, i32 %border_cols, i32 %border_rows, float %Cap, float %Rx, float %Ry, float %Rz, float %step, float %time_elapsed) #0 {
entry:
  %iteration.addr = alloca i32, align 4
  %power.addr = alloca float*, align 8
  %temp_src.addr = alloca float*, align 8
  %temp_dst.addr = alloca float*, align 8
  %grid_cols.addr = alloca i32, align 4
  %grid_rows.addr = alloca i32, align 4
  %border_cols.addr = alloca i32, align 4
  %border_rows.addr = alloca i32, align 4
  %Cap.addr = alloca float, align 4
  %Rx.addr = alloca float, align 4
  %Ry.addr = alloca float, align 4
  %Rz.addr = alloca float, align 4
  %step.addr = alloca float, align 4
  %time_elapsed.addr = alloca float, align 4
  %amb_temp = alloca float, align 4
  %step_div_Cap = alloca float, align 4
  %Rx_1 = alloca float, align 4
  %Ry_1 = alloca float, align 4
  %Rz_1 = alloca float, align 4
  %bx = alloca i32, align 4
  %by = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %small_block_rows = alloca i32, align 4
  %small_block_cols = alloca i32, align 4
  %blkY = alloca i32, align 4
  %blkX = alloca i32, align 4
  %blkYmax = alloca i32, align 4
  %blkXmax = alloca i32, align 4
  %yidx = alloca i32, align 4
  %xidx = alloca i32, align 4
  %loadYidx = alloca i32, align 4
  %loadXidx = alloca i32, align 4
  %index = alloca i32, align 4
  %validYmin = alloca i32, align 4
  %validYmax = alloca i32, align 4
  %validXmin = alloca i32, align 4
  %validXmax = alloca i32, align 4
  %N = alloca i32, align 4
  %S = alloca i32, align 4
  %W = alloca i32, align 4
  %E = alloca i32, align 4
  %computed = alloca i8, align 1
  %i = alloca i32, align 4
  store i32 %iteration, i32* %iteration.addr, align 4
  store float* %power, float** %power.addr, align 8
  store float* %temp_src, float** %temp_src.addr, align 8
  store float* %temp_dst, float** %temp_dst.addr, align 8
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  store i32 %border_cols, i32* %border_cols.addr, align 4
  store i32 %border_rows, i32* %border_rows.addr, align 4
  store float %Cap, float* %Cap.addr, align 4
  store float %Rx, float* %Rx.addr, align 4
  store float %Ry, float* %Ry.addr, align 4
  store float %Rz, float* %Rz.addr, align 4
  store float %step, float* %step.addr, align 4
  store float %time_elapsed, float* %time_elapsed.addr, align 4
  store float 8.000000e+01, float* %amb_temp, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #2
  store i32 %call, i32* %bx, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #2
  store i32 %call1, i32* %by, align 4
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #2
  store i32 %call2, i32* %tx, align 4
  %call3 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #2
  store i32 %call3, i32* %ty, align 4
  %0 = load float, float* %step.addr, align 4
  %1 = load float, float* %Cap.addr, align 4
  %div = fdiv float %0, %1
  store float %div, float* %step_div_Cap, align 4
  %2 = load float, float* %Rx.addr, align 4
  %div4 = fdiv float 1.000000e+00, %2
  store float %div4, float* %Rx_1, align 4
  %3 = load float, float* %Ry.addr, align 4
  %div5 = fdiv float 1.000000e+00, %3
  store float %div5, float* %Ry_1, align 4
  %4 = load float, float* %Rz.addr, align 4
  %div6 = fdiv float 1.000000e+00, %4
  store float %div6, float* %Rz_1, align 4
  %5 = load i32, i32* %iteration.addr, align 4
  %mul = mul nsw i32 %5, 2
  %sub = sub nsw i32 16, %mul
  store i32 %sub, i32* %small_block_rows, align 4
  %6 = load i32, i32* %iteration.addr, align 4
  %mul7 = mul nsw i32 %6, 2
  %sub8 = sub nsw i32 16, %mul7
  store i32 %sub8, i32* %small_block_cols, align 4
  %7 = load i32, i32* %small_block_rows, align 4
  %8 = load i32, i32* %by, align 4
  %mul9 = mul nsw i32 %7, %8
  %9 = load i32, i32* %border_rows.addr, align 4
  %sub10 = sub nsw i32 %mul9, %9
  store i32 %sub10, i32* %blkY, align 4
  %10 = load i32, i32* %small_block_cols, align 4
  %11 = load i32, i32* %bx, align 4
  %mul11 = mul nsw i32 %10, %11
  %12 = load i32, i32* %border_cols.addr, align 4
  %sub12 = sub nsw i32 %mul11, %12
  store i32 %sub12, i32* %blkX, align 4
  %13 = load i32, i32* %blkY, align 4
  %add = add nsw i32 %13, 16
  %sub13 = sub nsw i32 %add, 1
  store i32 %sub13, i32* %blkYmax, align 4
  %14 = load i32, i32* %blkX, align 4
  %add14 = add nsw i32 %14, 16
  %sub15 = sub nsw i32 %add14, 1
  store i32 %sub15, i32* %blkXmax, align 4
  %15 = load i32, i32* %blkY, align 4
  %16 = load i32, i32* %ty, align 4
  %add16 = add nsw i32 %15, %16
  store i32 %add16, i32* %yidx, align 4
  %17 = load i32, i32* %blkX, align 4
  %18 = load i32, i32* %tx, align 4
  %add17 = add nsw i32 %17, %18
  store i32 %add17, i32* %xidx, align 4
  %19 = load i32, i32* %yidx, align 4
  store i32 %19, i32* %loadYidx, align 4
  %20 = load i32, i32* %xidx, align 4
  store i32 %20, i32* %loadXidx, align 4
  %21 = load i32, i32* %grid_cols.addr, align 4
  %22 = load i32, i32* %loadYidx, align 4
  %mul18 = mul nsw i32 %21, %22
  %23 = load i32, i32* %loadXidx, align 4
  %add19 = add nsw i32 %mul18, %23
  store i32 %add19, i32* %index, align 4
  %24 = load i32, i32* %loadYidx, align 4
  %cmp = icmp sge i32 %24, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %25 = load i32, i32* %loadYidx, align 4
  %26 = load i32, i32* %grid_rows.addr, align 4
  %sub20 = sub nsw i32 %26, 1
  %cmp21 = icmp sle i32 %25, %sub20
  br i1 %cmp21, label %land.lhs.true22, label %if.end

land.lhs.true22:                                  ; preds = %land.lhs.true
  %27 = load i32, i32* %loadXidx, align 4
  %cmp23 = icmp sge i32 %27, 0
  br i1 %cmp23, label %land.lhs.true24, label %if.end

land.lhs.true24:                                  ; preds = %land.lhs.true22
  %28 = load i32, i32* %loadXidx, align 4
  %29 = load i32, i32* %grid_cols.addr, align 4
  %sub25 = sub nsw i32 %29, 1
  %cmp26 = icmp sle i32 %28, %sub25
  br i1 %cmp26, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true24
  %30 = load float*, float** %temp_src.addr, align 8
  %31 = load i32, i32* %index, align 4
  %idxprom = sext i32 %31 to i64
  %arrayidx = getelementptr inbounds float, float* %30, i64 %idxprom
  %32 = load float, float* %arrayidx, align 4
  %33 = load i32, i32* %ty, align 4
  %idxprom27 = sext i32 %33 to i64
  %arrayidx28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom27
  %34 = load i32, i32* %tx, align 4
  %idxprom29 = sext i32 %34 to i64
  %arrayidx30 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx28, i64 0, i64 %idxprom29
  store float %32, float* %arrayidx30, align 4
  %35 = load float*, float** %power.addr, align 8
  %36 = load i32, i32* %index, align 4
  %idxprom31 = sext i32 %36 to i64
  %arrayidx32 = getelementptr inbounds float, float* %35, i64 %idxprom31
  %37 = load float, float* %arrayidx32, align 4
  %38 = load i32, i32* %ty, align 4
  %idxprom33 = sext i32 %38 to i64
  %arrayidx34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE13power_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom33
  %39 = load i32, i32* %tx, align 4
  %idxprom35 = sext i32 %39 to i64
  %arrayidx36 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx34, i64 0, i64 %idxprom35
  store float %37, float* %arrayidx36, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true24, %land.lhs.true22, %land.lhs.true, %entry
  call void @llvm.nvvm.barrier0()
  %40 = load i32, i32* %blkY, align 4
  %cmp37 = icmp slt i32 %40, 0
  br i1 %cmp37, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %41 = load i32, i32* %blkY, align 4
  %sub38 = sub nsw i32 0, %41
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub38, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %validYmin, align 4
  %42 = load i32, i32* %blkYmax, align 4
  %43 = load i32, i32* %grid_rows.addr, align 4
  %sub39 = sub nsw i32 %43, 1
  %cmp40 = icmp sgt i32 %42, %sub39
  br i1 %cmp40, label %cond.true41, label %cond.false45

cond.true41:                                      ; preds = %cond.end
  %44 = load i32, i32* %blkYmax, align 4
  %45 = load i32, i32* %grid_rows.addr, align 4
  %sub42 = sub nsw i32 %44, %45
  %add43 = add nsw i32 %sub42, 1
  %sub44 = sub nsw i32 15, %add43
  br label %cond.end46

cond.false45:                                     ; preds = %cond.end
  br label %cond.end46

cond.end46:                                       ; preds = %cond.false45, %cond.true41
  %cond47 = phi i32 [ %sub44, %cond.true41 ], [ 15, %cond.false45 ]
  store i32 %cond47, i32* %validYmax, align 4
  %46 = load i32, i32* %blkX, align 4
  %cmp48 = icmp slt i32 %46, 0
  br i1 %cmp48, label %cond.true49, label %cond.false51

cond.true49:                                      ; preds = %cond.end46
  %47 = load i32, i32* %blkX, align 4
  %sub50 = sub nsw i32 0, %47
  br label %cond.end52

cond.false51:                                     ; preds = %cond.end46
  br label %cond.end52

cond.end52:                                       ; preds = %cond.false51, %cond.true49
  %cond53 = phi i32 [ %sub50, %cond.true49 ], [ 0, %cond.false51 ]
  store i32 %cond53, i32* %validXmin, align 4
  %48 = load i32, i32* %blkXmax, align 4
  %49 = load i32, i32* %grid_cols.addr, align 4
  %sub54 = sub nsw i32 %49, 1
  %cmp55 = icmp sgt i32 %48, %sub54
  br i1 %cmp55, label %cond.true56, label %cond.false60

cond.true56:                                      ; preds = %cond.end52
  %50 = load i32, i32* %blkXmax, align 4
  %51 = load i32, i32* %grid_cols.addr, align 4
  %sub57 = sub nsw i32 %50, %51
  %add58 = add nsw i32 %sub57, 1
  %sub59 = sub nsw i32 15, %add58
  br label %cond.end61

cond.false60:                                     ; preds = %cond.end52
  br label %cond.end61

cond.end61:                                       ; preds = %cond.false60, %cond.true56
  %cond62 = phi i32 [ %sub59, %cond.true56 ], [ 15, %cond.false60 ]
  store i32 %cond62, i32* %validXmax, align 4
  %52 = load i32, i32* %ty, align 4
  %sub63 = sub nsw i32 %52, 1
  store i32 %sub63, i32* %N, align 4
  %53 = load i32, i32* %ty, align 4
  %add64 = add nsw i32 %53, 1
  store i32 %add64, i32* %S, align 4
  %54 = load i32, i32* %tx, align 4
  %sub65 = sub nsw i32 %54, 1
  store i32 %sub65, i32* %W, align 4
  %55 = load i32, i32* %tx, align 4
  %add66 = add nsw i32 %55, 1
  store i32 %add66, i32* %E, align 4
  %56 = load i32, i32* %N, align 4
  %57 = load i32, i32* %validYmin, align 4
  %cmp67 = icmp slt i32 %56, %57
  br i1 %cmp67, label %cond.true68, label %cond.false69

cond.true68:                                      ; preds = %cond.end61
  %58 = load i32, i32* %validYmin, align 4
  br label %cond.end70

cond.false69:                                     ; preds = %cond.end61
  %59 = load i32, i32* %N, align 4
  br label %cond.end70

cond.end70:                                       ; preds = %cond.false69, %cond.true68
  %cond71 = phi i32 [ %58, %cond.true68 ], [ %59, %cond.false69 ]
  store i32 %cond71, i32* %N, align 4
  %60 = load i32, i32* %S, align 4
  %61 = load i32, i32* %validYmax, align 4
  %cmp72 = icmp sgt i32 %60, %61
  br i1 %cmp72, label %cond.true73, label %cond.false74

cond.true73:                                      ; preds = %cond.end70
  %62 = load i32, i32* %validYmax, align 4
  br label %cond.end75

cond.false74:                                     ; preds = %cond.end70
  %63 = load i32, i32* %S, align 4
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false74, %cond.true73
  %cond76 = phi i32 [ %62, %cond.true73 ], [ %63, %cond.false74 ]
  store i32 %cond76, i32* %S, align 4
  %64 = load i32, i32* %W, align 4
  %65 = load i32, i32* %validXmin, align 4
  %cmp77 = icmp slt i32 %64, %65
  br i1 %cmp77, label %cond.true78, label %cond.false79

cond.true78:                                      ; preds = %cond.end75
  %66 = load i32, i32* %validXmin, align 4
  br label %cond.end80

cond.false79:                                     ; preds = %cond.end75
  %67 = load i32, i32* %W, align 4
  br label %cond.end80

cond.end80:                                       ; preds = %cond.false79, %cond.true78
  %cond81 = phi i32 [ %66, %cond.true78 ], [ %67, %cond.false79 ]
  store i32 %cond81, i32* %W, align 4
  %68 = load i32, i32* %E, align 4
  %69 = load i32, i32* %validXmax, align 4
  %cmp82 = icmp sgt i32 %68, %69
  br i1 %cmp82, label %cond.true83, label %cond.false84

cond.true83:                                      ; preds = %cond.end80
  %70 = load i32, i32* %validXmax, align 4
  br label %cond.end85

cond.false84:                                     ; preds = %cond.end80
  %71 = load i32, i32* %E, align 4
  br label %cond.end85

cond.end85:                                       ; preds = %cond.false84, %cond.true83
  %cond86 = phi i32 [ %70, %cond.true83 ], [ %71, %cond.false84 ]
  store i32 %cond86, i32* %E, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end85
  %72 = load i32, i32* %i, align 4
  %73 = load i32, i32* %iteration.addr, align 4
  %cmp87 = icmp slt i32 %72, %73
  br i1 %cmp87, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %computed, align 1
  %74 = load i32, i32* %tx, align 4
  %75 = load i32, i32* %i, align 4
  %add88 = add nsw i32 %75, 1
  %cmp89 = icmp sge i32 %74, %add88
  br i1 %cmp89, label %land.lhs.true90, label %if.end175

land.lhs.true90:                                  ; preds = %for.body
  %76 = load i32, i32* %tx, align 4
  %77 = load i32, i32* %i, align 4
  %sub91 = sub nsw i32 16, %77
  %sub92 = sub nsw i32 %sub91, 2
  %cmp93 = icmp sle i32 %76, %sub92
  br i1 %cmp93, label %land.lhs.true94, label %if.end175

land.lhs.true94:                                  ; preds = %land.lhs.true90
  %78 = load i32, i32* %ty, align 4
  %79 = load i32, i32* %i, align 4
  %add95 = add nsw i32 %79, 1
  %cmp96 = icmp sge i32 %78, %add95
  br i1 %cmp96, label %land.lhs.true97, label %if.end175

land.lhs.true97:                                  ; preds = %land.lhs.true94
  %80 = load i32, i32* %ty, align 4
  %81 = load i32, i32* %i, align 4
  %sub98 = sub nsw i32 16, %81
  %sub99 = sub nsw i32 %sub98, 2
  %cmp100 = icmp sle i32 %80, %sub99
  br i1 %cmp100, label %land.lhs.true101, label %if.end175

land.lhs.true101:                                 ; preds = %land.lhs.true97
  %82 = load i32, i32* %tx, align 4
  %83 = load i32, i32* %validXmin, align 4
  %cmp102 = icmp sge i32 %82, %83
  br i1 %cmp102, label %land.lhs.true103, label %if.end175

land.lhs.true103:                                 ; preds = %land.lhs.true101
  %84 = load i32, i32* %tx, align 4
  %85 = load i32, i32* %validXmax, align 4
  %cmp104 = icmp sle i32 %84, %85
  br i1 %cmp104, label %land.lhs.true105, label %if.end175

land.lhs.true105:                                 ; preds = %land.lhs.true103
  %86 = load i32, i32* %ty, align 4
  %87 = load i32, i32* %validYmin, align 4
  %cmp106 = icmp sge i32 %86, %87
  br i1 %cmp106, label %land.lhs.true107, label %if.end175

land.lhs.true107:                                 ; preds = %land.lhs.true105
  %88 = load i32, i32* %ty, align 4
  %89 = load i32, i32* %validYmax, align 4
  %cmp108 = icmp sle i32 %88, %89
  br i1 %cmp108, label %if.then109, label %if.end175

if.then109:                                       ; preds = %land.lhs.true107
  store i8 1, i8* %computed, align 1
  %90 = load i32, i32* %ty, align 4
  %idxprom110 = sext i32 %90 to i64
  %arrayidx111 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom110
  %91 = load i32, i32* %tx, align 4
  %idxprom112 = sext i32 %91 to i64
  %arrayidx113 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx111, i64 0, i64 %idxprom112
  %92 = load float, float* %arrayidx113, align 4
  %conv = fpext float %92 to double
  %93 = load float, float* %step_div_Cap, align 4
  %conv114 = fpext float %93 to double
  %94 = load i32, i32* %ty, align 4
  %idxprom115 = sext i32 %94 to i64
  %arrayidx116 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE13power_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom115
  %95 = load i32, i32* %tx, align 4
  %idxprom117 = sext i32 %95 to i64
  %arrayidx118 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx116, i64 0, i64 %idxprom117
  %96 = load float, float* %arrayidx118, align 4
  %conv119 = fpext float %96 to double
  %97 = load i32, i32* %S, align 4
  %idxprom120 = sext i32 %97 to i64
  %arrayidx121 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom120
  %98 = load i32, i32* %tx, align 4
  %idxprom122 = sext i32 %98 to i64
  %arrayidx123 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx121, i64 0, i64 %idxprom122
  %99 = load float, float* %arrayidx123, align 4
  %100 = load i32, i32* %N, align 4
  %idxprom124 = sext i32 %100 to i64
  %arrayidx125 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom124
  %101 = load i32, i32* %tx, align 4
  %idxprom126 = sext i32 %101 to i64
  %arrayidx127 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx125, i64 0, i64 %idxprom126
  %102 = load float, float* %arrayidx127, align 4
  %add128 = fadd contract float %99, %102
  %conv129 = fpext float %add128 to double
  %103 = load i32, i32* %ty, align 4
  %idxprom130 = sext i32 %103 to i64
  %arrayidx131 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom130
  %104 = load i32, i32* %tx, align 4
  %idxprom132 = sext i32 %104 to i64
  %arrayidx133 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx131, i64 0, i64 %idxprom132
  %105 = load float, float* %arrayidx133, align 4
  %conv134 = fpext float %105 to double
  %mul135 = fmul contract double 2.000000e+00, %conv134
  %sub136 = fsub contract double %conv129, %mul135
  %106 = load float, float* %Ry_1, align 4
  %conv137 = fpext float %106 to double
  %mul138 = fmul contract double %sub136, %conv137
  %add139 = fadd contract double %conv119, %mul138
  %107 = load i32, i32* %ty, align 4
  %idxprom140 = sext i32 %107 to i64
  %arrayidx141 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom140
  %108 = load i32, i32* %E, align 4
  %idxprom142 = sext i32 %108 to i64
  %arrayidx143 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx141, i64 0, i64 %idxprom142
  %109 = load float, float* %arrayidx143, align 4
  %110 = load i32, i32* %ty, align 4
  %idxprom144 = sext i32 %110 to i64
  %arrayidx145 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom144
  %111 = load i32, i32* %W, align 4
  %idxprom146 = sext i32 %111 to i64
  %arrayidx147 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx145, i64 0, i64 %idxprom146
  %112 = load float, float* %arrayidx147, align 4
  %add148 = fadd contract float %109, %112
  %conv149 = fpext float %add148 to double
  %113 = load i32, i32* %ty, align 4
  %idxprom150 = sext i32 %113 to i64
  %arrayidx151 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom150
  %114 = load i32, i32* %tx, align 4
  %idxprom152 = sext i32 %114 to i64
  %arrayidx153 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx151, i64 0, i64 %idxprom152
  %115 = load float, float* %arrayidx153, align 4
  %conv154 = fpext float %115 to double
  %mul155 = fmul contract double 2.000000e+00, %conv154
  %sub156 = fsub contract double %conv149, %mul155
  %116 = load float, float* %Rx_1, align 4
  %conv157 = fpext float %116 to double
  %mul158 = fmul contract double %sub156, %conv157
  %add159 = fadd contract double %add139, %mul158
  %117 = load float, float* %amb_temp, align 4
  %118 = load i32, i32* %ty, align 4
  %idxprom160 = sext i32 %118 to i64
  %arrayidx161 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom160
  %119 = load i32, i32* %tx, align 4
  %idxprom162 = sext i32 %119 to i64
  %arrayidx163 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx161, i64 0, i64 %idxprom162
  %120 = load float, float* %arrayidx163, align 4
  %sub164 = fsub contract float %117, %120
  %121 = load float, float* %Rz_1, align 4
  %mul165 = fmul contract float %sub164, %121
  %conv166 = fpext float %mul165 to double
  %add167 = fadd contract double %add159, %conv166
  %mul168 = fmul contract double %conv114, %add167
  %add169 = fadd contract double %conv, %mul168
  %conv170 = fptrunc double %add169 to float
  %122 = load i32, i32* %ty, align 4
  %idxprom171 = sext i32 %122 to i64
  %arrayidx172 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t to [16 x [16 x float]]*), i64 0, i64 %idxprom171
  %123 = load i32, i32* %tx, align 4
  %idxprom173 = sext i32 %123 to i64
  %arrayidx174 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx172, i64 0, i64 %idxprom173
  store float %conv170, float* %arrayidx174, align 4
  br label %if.end175

if.end175:                                        ; preds = %if.then109, %land.lhs.true107, %land.lhs.true105, %land.lhs.true103, %land.lhs.true101, %land.lhs.true97, %land.lhs.true94, %land.lhs.true90, %for.body
  call void @llvm.nvvm.barrier0()
  %124 = load i32, i32* %i, align 4
  %125 = load i32, i32* %iteration.addr, align 4
  %sub176 = sub nsw i32 %125, 1
  %cmp177 = icmp eq i32 %124, %sub176
  br i1 %cmp177, label %if.then178, label %if.end179

if.then178:                                       ; preds = %if.end175
  br label %for.end

if.end179:                                        ; preds = %if.end175
  %126 = load i8, i8* %computed, align 1
  %tobool = trunc i8 %126 to i1
  br i1 %tobool, label %if.then180, label %if.end189

if.then180:                                       ; preds = %if.end179
  %127 = load i32, i32* %ty, align 4
  %idxprom181 = sext i32 %127 to i64
  %arrayidx182 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t to [16 x [16 x float]]*), i64 0, i64 %idxprom181
  %128 = load i32, i32* %tx, align 4
  %idxprom183 = sext i32 %128 to i64
  %arrayidx184 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx182, i64 0, i64 %idxprom183
  %129 = load float, float* %arrayidx184, align 4
  %130 = load i32, i32* %ty, align 4
  %idxprom185 = sext i32 %130 to i64
  %arrayidx186 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE12temp_on_cuda to [16 x [16 x float]]*), i64 0, i64 %idxprom185
  %131 = load i32, i32* %tx, align 4
  %idxprom187 = sext i32 %131 to i64
  %arrayidx188 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx186, i64 0, i64 %idxprom187
  store float %129, float* %arrayidx188, align 4
  br label %if.end189

if.end189:                                        ; preds = %if.then180, %if.end179
  call void @llvm.nvvm.barrier0()
  br label %for.inc

for.inc:                                          ; preds = %if.end189
  %132 = load i32, i32* %i, align 4
  %inc = add nsw i32 %132, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then178, %for.cond
  %133 = load i8, i8* %computed, align 1
  %tobool190 = trunc i8 %133 to i1
  br i1 %tobool190, label %if.then191, label %if.end198

if.then191:                                       ; preds = %for.end
  %134 = load i32, i32* %ty, align 4
  %idxprom192 = sext i32 %134 to i64
  %arrayidx193 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]]* addrspacecast ([16 x [16 x float]] addrspace(3)* @_ZZ14calculate_tempiPfS_S_iiiiffffffE6temp_t to [16 x [16 x float]]*), i64 0, i64 %idxprom192
  %135 = load i32, i32* %tx, align 4
  %idxprom194 = sext i32 %135 to i64
  %arrayidx195 = getelementptr inbounds [16 x float], [16 x float]* %arrayidx193, i64 0, i64 %idxprom194
  %136 = load float, float* %arrayidx195, align 4
  %137 = load float*, float** %temp_dst.addr, align 8
  %138 = load i32, i32* %index, align 4
  %idxprom196 = sext i32 %138 to i64
  %arrayidx197 = getelementptr inbounds float, float* %137, i64 %idxprom196
  store float %136, float* %arrayidx197, align 4
  br label %if.end198

if.end198:                                        ; preds = %if.then191, %for.end
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

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

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
!3 = !{void (i32, float*, float*, float*, i32, i32, i32, i32, float, float, float, float, float, float)* @_Z14calculate_tempiPfS_S_iiiiffffff, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
