; ModuleID = '3D-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "3D.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
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
define dso_local void @_Z11hotspotOpt1PfS_S_fiiifffffff(float* %p, float* %tIn, float* %tOut, float %sdc, i32 %nx, i32 %ny, i32 %nz, float %ce, float %cw, float %cn, float %cs, float %ct, float %cb, float %cc) #0 {
entry:
  %p.addr = alloca float*, align 8
  %tIn.addr = alloca float*, align 8
  %tOut.addr = alloca float*, align 8
  %sdc.addr = alloca float, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %nz.addr = alloca i32, align 4
  %ce.addr = alloca float, align 4
  %cw.addr = alloca float, align 4
  %cn.addr = alloca float, align 4
  %cs.addr = alloca float, align 4
  %ct.addr = alloca float, align 4
  %cb.addr = alloca float, align 4
  %cc.addr = alloca float, align 4
  %amb_temp = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %xy = alloca i32, align 4
  %W = alloca i32, align 4
  %E = alloca i32, align 4
  %N = alloca i32, align 4
  %S = alloca i32, align 4
  %temp1 = alloca float, align 4
  %temp2 = alloca float, align 4
  %temp3 = alloca float, align 4
  %k = alloca i32, align 4
  store float* %p, float** %p.addr, align 8
  store float* %tIn, float** %tIn.addr, align 8
  store float* %tOut, float** %tOut.addr, align 8
  store float %sdc, float* %sdc.addr, align 4
  store i32 %nx, i32* %nx.addr, align 4
  store i32 %ny, i32* %ny.addr, align 4
  store i32 %nz, i32* %nz.addr, align 4
  store float %ce, float* %ce.addr, align 4
  store float %cw, float* %cw.addr, align 4
  store float %cn, float* %cn.addr, align 4
  store float %cs, float* %cs.addr, align 4
  store float %ct, float* %ct.addr, align 4
  store float %cb, float* %cb.addr, align 4
  store float %cc, float* %cc.addr, align 4
  store float 8.000000e+01, float* %amb_temp, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %mul = mul i32 %call, %call1
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add = add i32 %mul, %call2
  store i32 %add, i32* %i, align 4
  %call3 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #3
  %call4 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #3
  %mul5 = mul i32 %call3, %call4
  %call6 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #3
  %add7 = add i32 %mul5, %call6
  store i32 %add7, i32* %j, align 4
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %j, align 4
  %2 = load i32, i32* %nx.addr, align 4
  %mul8 = mul nsw i32 %1, %2
  %add9 = add nsw i32 %0, %mul8
  store i32 %add9, i32* %c, align 4
  %3 = load i32, i32* %nx.addr, align 4
  %4 = load i32, i32* %ny.addr, align 4
  %mul10 = mul nsw i32 %3, %4
  store i32 %mul10, i32* %xy, align 4
  %5 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %6 = load i32, i32* %c, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %7 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %7, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %6, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, i32* %W, align 4
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %nx.addr, align 4
  %sub11 = sub nsw i32 %9, 1
  %cmp12 = icmp eq i32 %8, %sub11
  br i1 %cmp12, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %cond.end
  %10 = load i32, i32* %c, align 4
  br label %cond.end16

cond.false14:                                     ; preds = %cond.end
  %11 = load i32, i32* %c, align 4
  %add15 = add nsw i32 %11, 1
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false14, %cond.true13
  %cond17 = phi i32 [ %10, %cond.true13 ], [ %add15, %cond.false14 ]
  store i32 %cond17, i32* %E, align 4
  %12 = load i32, i32* %j, align 4
  %cmp18 = icmp eq i32 %12, 0
  br i1 %cmp18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end16
  %13 = load i32, i32* %c, align 4
  br label %cond.end22

cond.false20:                                     ; preds = %cond.end16
  %14 = load i32, i32* %c, align 4
  %15 = load i32, i32* %nx.addr, align 4
  %sub21 = sub nsw i32 %14, %15
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false20, %cond.true19
  %cond23 = phi i32 [ %13, %cond.true19 ], [ %sub21, %cond.false20 ]
  store i32 %cond23, i32* %N, align 4
  %16 = load i32, i32* %j, align 4
  %17 = load i32, i32* %ny.addr, align 4
  %sub24 = sub nsw i32 %17, 1
  %cmp25 = icmp eq i32 %16, %sub24
  br i1 %cmp25, label %cond.true26, label %cond.false27

cond.true26:                                      ; preds = %cond.end22
  %18 = load i32, i32* %c, align 4
  br label %cond.end29

cond.false27:                                     ; preds = %cond.end22
  %19 = load i32, i32* %c, align 4
  %20 = load i32, i32* %nx.addr, align 4
  %add28 = add nsw i32 %19, %20
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false27, %cond.true26
  %cond30 = phi i32 [ %18, %cond.true26 ], [ %add28, %cond.false27 ]
  store i32 %cond30, i32* %S, align 4
  %21 = load float*, float** %tIn.addr, align 8
  %22 = load i32, i32* %c, align 4
  %idxprom = sext i32 %22 to i64
  %arrayidx = getelementptr inbounds float, float* %21, i64 %idxprom
  %23 = load float, float* %arrayidx, align 4
  store float %23, float* %temp2, align 4
  store float %23, float* %temp1, align 4
  %24 = load float*, float** %tIn.addr, align 8
  %25 = load i32, i32* %c, align 4
  %26 = load i32, i32* %xy, align 4
  %add31 = add nsw i32 %25, %26
  %idxprom32 = sext i32 %add31 to i64
  %arrayidx33 = getelementptr inbounds float, float* %24, i64 %idxprom32
  %27 = load float, float* %arrayidx33, align 4
  store float %27, float* %temp3, align 4
  %28 = load float, float* %cc.addr, align 4
  %29 = load float, float* %temp2, align 4
  %mul34 = fmul contract float %28, %29
  %30 = load float, float* %cw.addr, align 4
  %31 = load float*, float** %tIn.addr, align 8
  %32 = load i32, i32* %W, align 4
  %idxprom35 = sext i32 %32 to i64
  %arrayidx36 = getelementptr inbounds float, float* %31, i64 %idxprom35
  %33 = load float, float* %arrayidx36, align 4
  %mul37 = fmul contract float %30, %33
  %add38 = fadd contract float %mul34, %mul37
  %34 = load float, float* %ce.addr, align 4
  %35 = load float*, float** %tIn.addr, align 8
  %36 = load i32, i32* %E, align 4
  %idxprom39 = sext i32 %36 to i64
  %arrayidx40 = getelementptr inbounds float, float* %35, i64 %idxprom39
  %37 = load float, float* %arrayidx40, align 4
  %mul41 = fmul contract float %34, %37
  %add42 = fadd contract float %add38, %mul41
  %38 = load float, float* %cs.addr, align 4
  %39 = load float*, float** %tIn.addr, align 8
  %40 = load i32, i32* %S, align 4
  %idxprom43 = sext i32 %40 to i64
  %arrayidx44 = getelementptr inbounds float, float* %39, i64 %idxprom43
  %41 = load float, float* %arrayidx44, align 4
  %mul45 = fmul contract float %38, %41
  %add46 = fadd contract float %add42, %mul45
  %42 = load float, float* %cn.addr, align 4
  %43 = load float*, float** %tIn.addr, align 8
  %44 = load i32, i32* %N, align 4
  %idxprom47 = sext i32 %44 to i64
  %arrayidx48 = getelementptr inbounds float, float* %43, i64 %idxprom47
  %45 = load float, float* %arrayidx48, align 4
  %mul49 = fmul contract float %42, %45
  %add50 = fadd contract float %add46, %mul49
  %46 = load float, float* %cb.addr, align 4
  %47 = load float, float* %temp1, align 4
  %mul51 = fmul contract float %46, %47
  %add52 = fadd contract float %add50, %mul51
  %48 = load float, float* %ct.addr, align 4
  %49 = load float, float* %temp3, align 4
  %mul53 = fmul contract float %48, %49
  %add54 = fadd contract float %add52, %mul53
  %50 = load float, float* %sdc.addr, align 4
  %51 = load float*, float** %p.addr, align 8
  %52 = load i32, i32* %c, align 4
  %idxprom55 = sext i32 %52 to i64
  %arrayidx56 = getelementptr inbounds float, float* %51, i64 %idxprom55
  %53 = load float, float* %arrayidx56, align 4
  %mul57 = fmul contract float %50, %53
  %add58 = fadd contract float %add54, %mul57
  %54 = load float, float* %ct.addr, align 4
  %55 = load float, float* %amb_temp, align 4
  %mul59 = fmul contract float %54, %55
  %add60 = fadd contract float %add58, %mul59
  %56 = load float*, float** %tOut.addr, align 8
  %57 = load i32, i32* %c, align 4
  %idxprom61 = sext i32 %57 to i64
  %arrayidx62 = getelementptr inbounds float, float* %56, i64 %idxprom61
  store float %add60, float* %arrayidx62, align 4
  %58 = load i32, i32* %xy, align 4
  %59 = load i32, i32* %c, align 4
  %add63 = add nsw i32 %59, %58
  store i32 %add63, i32* %c, align 4
  %60 = load i32, i32* %xy, align 4
  %61 = load i32, i32* %W, align 4
  %add64 = add nsw i32 %61, %60
  store i32 %add64, i32* %W, align 4
  %62 = load i32, i32* %xy, align 4
  %63 = load i32, i32* %E, align 4
  %add65 = add nsw i32 %63, %62
  store i32 %add65, i32* %E, align 4
  %64 = load i32, i32* %xy, align 4
  %65 = load i32, i32* %N, align 4
  %add66 = add nsw i32 %65, %64
  store i32 %add66, i32* %N, align 4
  %66 = load i32, i32* %xy, align 4
  %67 = load i32, i32* %S, align 4
  %add67 = add nsw i32 %67, %66
  store i32 %add67, i32* %S, align 4
  store i32 1, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end29
  %68 = load i32, i32* %k, align 4
  %69 = load i32, i32* %nz.addr, align 4
  %sub68 = sub nsw i32 %69, 1
  %cmp69 = icmp slt i32 %68, %sub68
  br i1 %cmp69, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %70 = load float, float* %temp2, align 4
  store float %70, float* %temp1, align 4
  %71 = load float, float* %temp3, align 4
  store float %71, float* %temp2, align 4
  %72 = load float*, float** %tIn.addr, align 8
  %73 = load i32, i32* %c, align 4
  %74 = load i32, i32* %xy, align 4
  %add70 = add nsw i32 %73, %74
  %idxprom71 = sext i32 %add70 to i64
  %arrayidx72 = getelementptr inbounds float, float* %72, i64 %idxprom71
  %75 = load float, float* %arrayidx72, align 4
  store float %75, float* %temp3, align 4
  %76 = load float, float* %cc.addr, align 4
  %77 = load float, float* %temp2, align 4
  %mul73 = fmul contract float %76, %77
  %78 = load float, float* %cw.addr, align 4
  %79 = load float*, float** %tIn.addr, align 8
  %80 = load i32, i32* %W, align 4
  %idxprom74 = sext i32 %80 to i64
  %arrayidx75 = getelementptr inbounds float, float* %79, i64 %idxprom74
  %81 = load float, float* %arrayidx75, align 4
  %mul76 = fmul contract float %78, %81
  %add77 = fadd contract float %mul73, %mul76
  %82 = load float, float* %ce.addr, align 4
  %83 = load float*, float** %tIn.addr, align 8
  %84 = load i32, i32* %E, align 4
  %idxprom78 = sext i32 %84 to i64
  %arrayidx79 = getelementptr inbounds float, float* %83, i64 %idxprom78
  %85 = load float, float* %arrayidx79, align 4
  %mul80 = fmul contract float %82, %85
  %add81 = fadd contract float %add77, %mul80
  %86 = load float, float* %cs.addr, align 4
  %87 = load float*, float** %tIn.addr, align 8
  %88 = load i32, i32* %S, align 4
  %idxprom82 = sext i32 %88 to i64
  %arrayidx83 = getelementptr inbounds float, float* %87, i64 %idxprom82
  %89 = load float, float* %arrayidx83, align 4
  %mul84 = fmul contract float %86, %89
  %add85 = fadd contract float %add81, %mul84
  %90 = load float, float* %cn.addr, align 4
  %91 = load float*, float** %tIn.addr, align 8
  %92 = load i32, i32* %N, align 4
  %idxprom86 = sext i32 %92 to i64
  %arrayidx87 = getelementptr inbounds float, float* %91, i64 %idxprom86
  %93 = load float, float* %arrayidx87, align 4
  %mul88 = fmul contract float %90, %93
  %add89 = fadd contract float %add85, %mul88
  %94 = load float, float* %cb.addr, align 4
  %95 = load float, float* %temp1, align 4
  %mul90 = fmul contract float %94, %95
  %add91 = fadd contract float %add89, %mul90
  %96 = load float, float* %ct.addr, align 4
  %97 = load float, float* %temp3, align 4
  %mul92 = fmul contract float %96, %97
  %add93 = fadd contract float %add91, %mul92
  %98 = load float, float* %sdc.addr, align 4
  %99 = load float*, float** %p.addr, align 8
  %100 = load i32, i32* %c, align 4
  %idxprom94 = sext i32 %100 to i64
  %arrayidx95 = getelementptr inbounds float, float* %99, i64 %idxprom94
  %101 = load float, float* %arrayidx95, align 4
  %mul96 = fmul contract float %98, %101
  %add97 = fadd contract float %add93, %mul96
  %102 = load float, float* %ct.addr, align 4
  %103 = load float, float* %amb_temp, align 4
  %mul98 = fmul contract float %102, %103
  %add99 = fadd contract float %add97, %mul98
  %104 = load float*, float** %tOut.addr, align 8
  %105 = load i32, i32* %c, align 4
  %idxprom100 = sext i32 %105 to i64
  %arrayidx101 = getelementptr inbounds float, float* %104, i64 %idxprom100
  store float %add99, float* %arrayidx101, align 4
  %106 = load i32, i32* %xy, align 4
  %107 = load i32, i32* %c, align 4
  %add102 = add nsw i32 %107, %106
  store i32 %add102, i32* %c, align 4
  %108 = load i32, i32* %xy, align 4
  %109 = load i32, i32* %W, align 4
  %add103 = add nsw i32 %109, %108
  store i32 %add103, i32* %W, align 4
  %110 = load i32, i32* %xy, align 4
  %111 = load i32, i32* %E, align 4
  %add104 = add nsw i32 %111, %110
  store i32 %add104, i32* %E, align 4
  %112 = load i32, i32* %xy, align 4
  %113 = load i32, i32* %N, align 4
  %add105 = add nsw i32 %113, %112
  store i32 %add105, i32* %N, align 4
  %114 = load i32, i32* %xy, align 4
  %115 = load i32, i32* %S, align 4
  %add106 = add nsw i32 %115, %114
  store i32 %add106, i32* %S, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %116 = load i32, i32* %k, align 4
  %inc = add nsw i32 %116, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %117 = load float, float* %temp2, align 4
  store float %117, float* %temp1, align 4
  %118 = load float, float* %temp3, align 4
  store float %118, float* %temp2, align 4
  %119 = load float, float* %cc.addr, align 4
  %120 = load float, float* %temp2, align 4
  %mul107 = fmul contract float %119, %120
  %121 = load float, float* %cw.addr, align 4
  %122 = load float*, float** %tIn.addr, align 8
  %123 = load i32, i32* %W, align 4
  %idxprom108 = sext i32 %123 to i64
  %arrayidx109 = getelementptr inbounds float, float* %122, i64 %idxprom108
  %124 = load float, float* %arrayidx109, align 4
  %mul110 = fmul contract float %121, %124
  %add111 = fadd contract float %mul107, %mul110
  %125 = load float, float* %ce.addr, align 4
  %126 = load float*, float** %tIn.addr, align 8
  %127 = load i32, i32* %E, align 4
  %idxprom112 = sext i32 %127 to i64
  %arrayidx113 = getelementptr inbounds float, float* %126, i64 %idxprom112
  %128 = load float, float* %arrayidx113, align 4
  %mul114 = fmul contract float %125, %128
  %add115 = fadd contract float %add111, %mul114
  %129 = load float, float* %cs.addr, align 4
  %130 = load float*, float** %tIn.addr, align 8
  %131 = load i32, i32* %S, align 4
  %idxprom116 = sext i32 %131 to i64
  %arrayidx117 = getelementptr inbounds float, float* %130, i64 %idxprom116
  %132 = load float, float* %arrayidx117, align 4
  %mul118 = fmul contract float %129, %132
  %add119 = fadd contract float %add115, %mul118
  %133 = load float, float* %cn.addr, align 4
  %134 = load float*, float** %tIn.addr, align 8
  %135 = load i32, i32* %N, align 4
  %idxprom120 = sext i32 %135 to i64
  %arrayidx121 = getelementptr inbounds float, float* %134, i64 %idxprom120
  %136 = load float, float* %arrayidx121, align 4
  %mul122 = fmul contract float %133, %136
  %add123 = fadd contract float %add119, %mul122
  %137 = load float, float* %cb.addr, align 4
  %138 = load float, float* %temp1, align 4
  %mul124 = fmul contract float %137, %138
  %add125 = fadd contract float %add123, %mul124
  %139 = load float, float* %ct.addr, align 4
  %140 = load float, float* %temp3, align 4
  %mul126 = fmul contract float %139, %140
  %add127 = fadd contract float %add125, %mul126
  %141 = load float, float* %sdc.addr, align 4
  %142 = load float*, float** %p.addr, align 8
  %143 = load i32, i32* %c, align 4
  %idxprom128 = sext i32 %143 to i64
  %arrayidx129 = getelementptr inbounds float, float* %142, i64 %idxprom128
  %144 = load float, float* %arrayidx129, align 4
  %mul130 = fmul contract float %141, %144
  %add131 = fadd contract float %add127, %mul130
  %145 = load float, float* %ct.addr, align 4
  %146 = load float, float* %amb_temp, align 4
  %mul132 = fmul contract float %145, %146
  %add133 = fadd contract float %add131, %mul132
  %147 = load float*, float** %tOut.addr, align 8
  %148 = load i32, i32* %c, align 4
  %idxprom134 = sext i32 %148 to i64
  %arrayidx135 = getelementptr inbounds float, float* %147, i64 %idxprom134
  store float %add133, float* %arrayidx135, align 4
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %0
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

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  ret i32 %0
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
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)* @_Z11hotspotOpt1PfS_S_fiiifffffff, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
