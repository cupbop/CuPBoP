; ModuleID = 'gaussian-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "gaussian.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv = comdat any

@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1

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
define dso_local void @_Z4Fan1PfS_ii(float* %m_cuda, float* %a_cuda, i32 %Size, i32 %t) #0 {
entry:
  %m_cuda.addr = alloca float*, align 8
  %a_cuda.addr = alloca float*, align 8
  %Size.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  store float* %m_cuda, float** %m_cuda.addr, align 8
  store float* %a_cuda, float** %a_cuda.addr, align 8
  store i32 %Size, i32* %Size.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %call2 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %mul = mul i32 %call1, %call2
  %add = add i32 %call, %mul
  %0 = load i32, i32* %Size.addr, align 4
  %sub = sub nsw i32 %0, 1
  %1 = load i32, i32* %t.addr, align 4
  %sub3 = sub nsw i32 %sub, %1
  %cmp = icmp uge i32 %add, %sub3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load float*, float** %a_cuda.addr, align 8
  %3 = load i32, i32* %Size.addr, align 4
  %call4 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %call5 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %mul6 = mul i32 %call4, %call5
  %call7 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add8 = add i32 %mul6, %call7
  %4 = load i32, i32* %t.addr, align 4
  %add9 = add i32 %add8, %4
  %add10 = add i32 %add9, 1
  %mul11 = mul i32 %3, %add10
  %idx.ext = zext i32 %mul11 to i64
  %add.ptr = getelementptr inbounds float, float* %2, i64 %idx.ext
  %5 = load i32, i32* %t.addr, align 4
  %idx.ext12 = sext i32 %5 to i64
  %add.ptr13 = getelementptr inbounds float, float* %add.ptr, i64 %idx.ext12
  %6 = load float, float* %add.ptr13, align 4
  %7 = load float*, float** %a_cuda.addr, align 8
  %8 = load i32, i32* %Size.addr, align 4
  %9 = load i32, i32* %t.addr, align 4
  %mul14 = mul nsw i32 %8, %9
  %idx.ext15 = sext i32 %mul14 to i64
  %add.ptr16 = getelementptr inbounds float, float* %7, i64 %idx.ext15
  %10 = load i32, i32* %t.addr, align 4
  %idx.ext17 = sext i32 %10 to i64
  %add.ptr18 = getelementptr inbounds float, float* %add.ptr16, i64 %idx.ext17
  %11 = load float, float* %add.ptr18, align 4
  %div = fdiv float %6, %11
  %12 = load float*, float** %m_cuda.addr, align 8
  %13 = load i32, i32* %Size.addr, align 4
  %call19 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %call20 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %mul21 = mul i32 %call19, %call20
  %call22 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add23 = add i32 %mul21, %call22
  %14 = load i32, i32* %t.addr, align 4
  %add24 = add i32 %add23, %14
  %add25 = add i32 %add24, 1
  %mul26 = mul i32 %13, %add25
  %idx.ext27 = zext i32 %mul26 to i64
  %add.ptr28 = getelementptr inbounds float, float* %12, i64 %idx.ext27
  %15 = load i32, i32* %t.addr, align 4
  %idx.ext29 = sext i32 %15 to i64
  %add.ptr30 = getelementptr inbounds float, float* %add.ptr28, i64 %idx.ext29
  store float %div, float* %add.ptr30, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
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

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %0
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z4Fan2PfS_S_iii(float* %m_cuda, float* %a_cuda, float* %b_cuda, i32 %Size, i32 %j1, i32 %t) #0 {
entry:
  %m_cuda.addr = alloca float*, align 8
  %a_cuda.addr = alloca float*, align 8
  %b_cuda.addr = alloca float*, align 8
  %Size.addr = alloca i32, align 4
  %j1.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %xidx = alloca i32, align 4
  %yidx = alloca i32, align 4
  store float* %m_cuda, float** %m_cuda.addr, align 8
  store float* %a_cuda, float** %a_cuda.addr, align 8
  store float* %b_cuda, float** %b_cuda.addr, align 8
  store i32 %Size, i32* %Size.addr, align 4
  store i32 %j1, i32* %j1.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  %call = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %call1 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %call2 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %mul = mul i32 %call1, %call2
  %add = add i32 %call, %mul
  %0 = load i32, i32* %Size.addr, align 4
  %sub = sub nsw i32 %0, 1
  %1 = load i32, i32* %t.addr, align 4
  %sub3 = sub nsw i32 %sub, %1
  %cmp = icmp uge i32 %add, %sub3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end58

if.end:                                           ; preds = %entry
  %call4 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #3
  %call5 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #3
  %call6 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #3
  %mul7 = mul i32 %call5, %call6
  %add8 = add i32 %call4, %mul7
  %2 = load i32, i32* %Size.addr, align 4
  %3 = load i32, i32* %t.addr, align 4
  %sub9 = sub nsw i32 %2, %3
  %cmp10 = icmp uge i32 %add8, %sub9
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  br label %if.end58

if.end12:                                         ; preds = %if.end
  %call13 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %call14 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %mul15 = mul i32 %call13, %call14
  %call16 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add17 = add i32 %mul15, %call16
  store i32 %add17, i32* %xidx, align 4
  %call18 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #3
  %call19 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #3
  %mul20 = mul i32 %call18, %call19
  %call21 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #3
  %add22 = add i32 %mul20, %call21
  store i32 %add22, i32* %yidx, align 4
  %4 = load float*, float** %m_cuda.addr, align 8
  %5 = load i32, i32* %Size.addr, align 4
  %6 = load i32, i32* %xidx, align 4
  %add23 = add nsw i32 %6, 1
  %7 = load i32, i32* %t.addr, align 4
  %add24 = add nsw i32 %add23, %7
  %mul25 = mul nsw i32 %5, %add24
  %8 = load i32, i32* %t.addr, align 4
  %add26 = add nsw i32 %mul25, %8
  %idxprom = sext i32 %add26 to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %9 = load float, float* %arrayidx, align 4
  %10 = load float*, float** %a_cuda.addr, align 8
  %11 = load i32, i32* %Size.addr, align 4
  %12 = load i32, i32* %t.addr, align 4
  %mul27 = mul nsw i32 %11, %12
  %13 = load i32, i32* %yidx, align 4
  %14 = load i32, i32* %t.addr, align 4
  %add28 = add nsw i32 %13, %14
  %add29 = add nsw i32 %mul27, %add28
  %idxprom30 = sext i32 %add29 to i64
  %arrayidx31 = getelementptr inbounds float, float* %10, i64 %idxprom30
  %15 = load float, float* %arrayidx31, align 4
  %mul32 = fmul contract float %9, %15
  %16 = load float*, float** %a_cuda.addr, align 8
  %17 = load i32, i32* %Size.addr, align 4
  %18 = load i32, i32* %xidx, align 4
  %add33 = add nsw i32 %18, 1
  %19 = load i32, i32* %t.addr, align 4
  %add34 = add nsw i32 %add33, %19
  %mul35 = mul nsw i32 %17, %add34
  %20 = load i32, i32* %yidx, align 4
  %21 = load i32, i32* %t.addr, align 4
  %add36 = add nsw i32 %20, %21
  %add37 = add nsw i32 %mul35, %add36
  %idxprom38 = sext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds float, float* %16, i64 %idxprom38
  %22 = load float, float* %arrayidx39, align 4
  %sub40 = fsub contract float %22, %mul32
  store float %sub40, float* %arrayidx39, align 4
  %23 = load i32, i32* %yidx, align 4
  %cmp41 = icmp eq i32 %23, 0
  br i1 %cmp41, label %if.then42, label %if.end58

if.then42:                                        ; preds = %if.end12
  %24 = load float*, float** %m_cuda.addr, align 8
  %25 = load i32, i32* %Size.addr, align 4
  %26 = load i32, i32* %xidx, align 4
  %add43 = add nsw i32 %26, 1
  %27 = load i32, i32* %t.addr, align 4
  %add44 = add nsw i32 %add43, %27
  %mul45 = mul nsw i32 %25, %add44
  %28 = load i32, i32* %yidx, align 4
  %29 = load i32, i32* %t.addr, align 4
  %add46 = add nsw i32 %28, %29
  %add47 = add nsw i32 %mul45, %add46
  %idxprom48 = sext i32 %add47 to i64
  %arrayidx49 = getelementptr inbounds float, float* %24, i64 %idxprom48
  %30 = load float, float* %arrayidx49, align 4
  %31 = load float*, float** %b_cuda.addr, align 8
  %32 = load i32, i32* %t.addr, align 4
  %idxprom50 = sext i32 %32 to i64
  %arrayidx51 = getelementptr inbounds float, float* %31, i64 %idxprom50
  %33 = load float, float* %arrayidx51, align 4
  %mul52 = fmul contract float %30, %33
  %34 = load float*, float** %b_cuda.addr, align 8
  %35 = load i32, i32* %xidx, align 4
  %add53 = add nsw i32 %35, 1
  %36 = load i32, i32* %t.addr, align 4
  %add54 = add nsw i32 %add53, %36
  %idxprom55 = sext i32 %add54 to i64
  %arrayidx56 = getelementptr inbounds float, float* %34, i64 %idxprom55
  %37 = load float, float* %arrayidx56, align 4
  %sub57 = fsub contract float %37, %mul52
  store float %sub57, float* %arrayidx56, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then, %if.then11, %if.then42, %if.end12
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  ret i32 %0
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !6, !5, !7, !7, !7, !7, !8, !8, !7}
!llvm.ident = !{!9}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (float*, float*, i32, i32)* @_Z4Fan1PfS_ii, !"kernel", i32 1}
!4 = !{void (float*, float*, float*, i32, i32, i32)* @_Z4Fan2PfS_S_iii, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = !{i32 1, i32 4}
