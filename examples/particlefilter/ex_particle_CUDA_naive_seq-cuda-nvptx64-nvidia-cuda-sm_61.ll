; ModuleID = 'ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "ex_particle_CUDA_naive_seq.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
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
define dso_local i32 @_Z12findIndexSeqPdid(double* %CDF, i32 %lengthCDF, double %value) #0 {
entry:
  %retval = alloca i32, align 4
  %CDF.addr = alloca double*, align 8
  %lengthCDF.addr = alloca i32, align 4
  %value.addr = alloca double, align 8
  %index = alloca i32, align 4
  %x = alloca i32, align 4
  store double* %CDF, double** %CDF.addr, align 8
  store i32 %lengthCDF, i32* %lengthCDF.addr, align 4
  store double %value, double* %value.addr, align 8
  store i32 -1, i32* %index, align 4
  store i32 0, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %x, align 4
  %1 = load i32, i32* %lengthCDF.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %CDF.addr, align 8
  %3 = load i32, i32* %x, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom
  %4 = load double, double* %arrayidx, align 8
  %5 = load double, double* %value.addr, align 8
  %cmp1 = fcmp oge double %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32, i32* %x, align 4
  store i32 %6, i32* %index, align 4
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %x, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %8 = load i32, i32* %index, align 4
  %cmp2 = icmp eq i32 %8, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.end
  %9 = load i32, i32* %lengthCDF.addr, align 4
  %sub = sub nsw i32 %9, 1
  store i32 %sub, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %for.end
  %10 = load i32, i32* %index, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local i32 @_Z12findIndexBinPdiid(double* %CDF, i32 %beginIndex, i32 %endIndex, double %value) #0 {
entry:
  %retval = alloca i32, align 4
  %CDF.addr = alloca double*, align 8
  %beginIndex.addr = alloca i32, align 4
  %endIndex.addr = alloca i32, align 4
  %value.addr = alloca double, align 8
  %middleIndex = alloca i32, align 4
  store double* %CDF, double** %CDF.addr, align 8
  store i32 %beginIndex, i32* %beginIndex.addr, align 4
  store i32 %endIndex, i32* %endIndex.addr, align 4
  store double %value, double* %value.addr, align 8
  %0 = load i32, i32* %endIndex.addr, align 4
  %1 = load i32, i32* %beginIndex.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end34, %if.end
  %2 = load i32, i32* %endIndex.addr, align 4
  %3 = load i32, i32* %beginIndex.addr, align 4
  %cmp1 = icmp sgt i32 %2, %3
  br i1 %cmp1, label %while.body, label %while.end35

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %beginIndex.addr, align 4
  %5 = load i32, i32* %endIndex.addr, align 4
  %6 = load i32, i32* %beginIndex.addr, align 4
  %sub = sub nsw i32 %5, %6
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %4, %div
  store i32 %add, i32* %middleIndex, align 4
  %7 = load double*, double** %CDF.addr, align 8
  %8 = load i32, i32* %middleIndex, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom
  %9 = load double, double* %arrayidx, align 8
  %10 = load double, double* %value.addr, align 8
  %cmp2 = fcmp oge double %9, %10
  br i1 %cmp2, label %if.then3, label %if.end26

if.then3:                                         ; preds = %while.body
  %11 = load i32, i32* %middleIndex, align 4
  %cmp4 = icmp eq i32 %11, 0
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then3
  %12 = load i32, i32* %middleIndex, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then3
  %13 = load double*, double** %CDF.addr, align 8
  %14 = load i32, i32* %middleIndex, align 4
  %sub6 = sub nsw i32 %14, 1
  %idxprom7 = sext i32 %sub6 to i64
  %arrayidx8 = getelementptr inbounds double, double* %13, i64 %idxprom7
  %15 = load double, double* %arrayidx8, align 8
  %16 = load double, double* %value.addr, align 8
  %cmp9 = fcmp olt double %15, %16
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else
  %17 = load i32, i32* %middleIndex, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

if.else11:                                        ; preds = %if.else
  %18 = load double*, double** %CDF.addr, align 8
  %19 = load i32, i32* %middleIndex, align 4
  %sub12 = sub nsw i32 %19, 1
  %idxprom13 = sext i32 %sub12 to i64
  %arrayidx14 = getelementptr inbounds double, double* %18, i64 %idxprom13
  %20 = load double, double* %arrayidx14, align 8
  %21 = load double, double* %value.addr, align 8
  %cmp15 = fcmp oeq double %20, %21
  br i1 %cmp15, label %if.then16, label %if.end23

if.then16:                                        ; preds = %if.else11
  br label %while.cond17

while.cond17:                                     ; preds = %while.body22, %if.then16
  %22 = load double*, double** %CDF.addr, align 8
  %23 = load i32, i32* %middleIndex, align 4
  %idxprom18 = sext i32 %23 to i64
  %arrayidx19 = getelementptr inbounds double, double* %22, i64 %idxprom18
  %24 = load double, double* %arrayidx19, align 8
  %25 = load double, double* %value.addr, align 8
  %cmp20 = fcmp oeq double %24, %25
  br i1 %cmp20, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond17
  %26 = load i32, i32* %middleIndex, align 4
  %cmp21 = icmp sge i32 %26, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond17
  %27 = phi i1 [ false, %while.cond17 ], [ %cmp21, %land.rhs ]
  br i1 %27, label %while.body22, label %while.end

while.body22:                                     ; preds = %land.end
  %28 = load i32, i32* %middleIndex, align 4
  %dec = add nsw i32 %28, -1
  store i32 %dec, i32* %middleIndex, align 4
  br label %while.cond17

while.end:                                        ; preds = %land.end
  %29 = load i32, i32* %middleIndex, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %middleIndex, align 4
  %30 = load i32, i32* %middleIndex, align 4
  store i32 %30, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %if.else11
  br label %if.end24

if.end24:                                         ; preds = %if.end23
  br label %if.end25

if.end25:                                         ; preds = %if.end24
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %while.body
  %31 = load double*, double** %CDF.addr, align 8
  %32 = load i32, i32* %middleIndex, align 4
  %idxprom27 = sext i32 %32 to i64
  %arrayidx28 = getelementptr inbounds double, double* %31, i64 %idxprom27
  %33 = load double, double* %arrayidx28, align 8
  %34 = load double, double* %value.addr, align 8
  %cmp29 = fcmp ogt double %33, %34
  br i1 %cmp29, label %if.then30, label %if.else32

if.then30:                                        ; preds = %if.end26
  %35 = load i32, i32* %middleIndex, align 4
  %sub31 = sub nsw i32 %35, 1
  store i32 %sub31, i32* %endIndex.addr, align 4
  br label %if.end34

if.else32:                                        ; preds = %if.end26
  %36 = load i32, i32* %middleIndex, align 4
  %add33 = add nsw i32 %36, 1
  store i32 %add33, i32* %beginIndex.addr, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.else32, %if.then30
  br label %while.cond

while.end35:                                      ; preds = %while.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end35, %while.end, %if.then10, %if.then5, %if.then
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z6kernelPdS_S_S_S_S_i(double* %arrayX, double* %arrayY, double* %CDF, double* %u, double* %xj, double* %yj, i32 %Nparticles) #0 {
entry:
  %arrayX.addr = alloca double*, align 8
  %arrayY.addr = alloca double*, align 8
  %CDF.addr = alloca double*, align 8
  %u.addr = alloca double*, align 8
  %xj.addr = alloca double*, align 8
  %yj.addr = alloca double*, align 8
  %Nparticles.addr = alloca i32, align 4
  %block_id = alloca i32, align 4
  %i = alloca i32, align 4
  %index = alloca i32, align 4
  %x = alloca i32, align 4
  store double* %arrayX, double** %arrayX.addr, align 8
  store double* %arrayY, double** %arrayY.addr, align 8
  store double* %CDF, double** %CDF.addr, align 8
  store double* %u, double** %u.addr, align 8
  store double* %xj, double** %xj.addr, align 8
  store double* %yj, double** %yj.addr, align 8
  store i32 %Nparticles, i32* %Nparticles.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  store i32 %call, i32* %block_id, align 4
  %call1 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %0 = load i32, i32* %block_id, align 4
  %mul = mul i32 %call1, %0
  %call2 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add = add i32 %mul, %call2
  store i32 %add, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %Nparticles.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end19

if.then:                                          ; preds = %entry
  store i32 -1, i32* %index, align 4
  store i32 0, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %x, align 4
  %4 = load i32, i32* %Nparticles.addr, align 4
  %cmp3 = icmp slt i32 %3, %4
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load double*, double** %CDF.addr, align 8
  %6 = load i32, i32* %x, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom
  %7 = load double, double* %arrayidx, align 8
  %8 = load double*, double** %u.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %9 to i64
  %arrayidx5 = getelementptr inbounds double, double* %8, i64 %idxprom4
  %10 = load double, double* %arrayidx5, align 8
  %cmp6 = fcmp oge double %7, %10
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %for.body
  %11 = load i32, i32* %x, align 4
  store i32 %11, i32* %index, align 4
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %x, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then7, %for.cond
  %13 = load i32, i32* %index, align 4
  %cmp8 = icmp eq i32 %13, -1
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %for.end
  %14 = load i32, i32* %Nparticles.addr, align 4
  %sub = sub nsw i32 %14, 1
  store i32 %sub, i32* %index, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %for.end
  %15 = load double*, double** %arrayX.addr, align 8
  %16 = load i32, i32* %index, align 4
  %idxprom11 = sext i32 %16 to i64
  %arrayidx12 = getelementptr inbounds double, double* %15, i64 %idxprom11
  %17 = load double, double* %arrayidx12, align 8
  %18 = load double*, double** %xj.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %19 to i64
  %arrayidx14 = getelementptr inbounds double, double* %18, i64 %idxprom13
  store double %17, double* %arrayidx14, align 8
  %20 = load double*, double** %arrayY.addr, align 8
  %21 = load i32, i32* %index, align 4
  %idxprom15 = sext i32 %21 to i64
  %arrayidx16 = getelementptr inbounds double, double* %20, i64 %idxprom15
  %22 = load double, double* %arrayidx16, align 8
  %23 = load double*, double** %yj.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %24 to i64
  %arrayidx18 = getelementptr inbounds double, double* %23, i64 %idxprom17
  store double %22, double* %arrayidx18, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.end10, %entry
  ret void
}

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
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

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
!3 = !{void (double*, double*, double*, double*, double*, double*, i32)* @_Z6kernelPdS_S_S_S_S_i, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
