; ModuleID = 'nn_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "nn_cuda.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_gridDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.latLong = type { float, float }

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@gridDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_gridDim_t, align 1
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
define dso_local void @_Z6euclidP7latLongPfiff(%struct.latLong* %d_locations, float* %d_distances, i32 %numRecords, float %lat, float %lng) #0 {
entry:
  %d_locations.addr = alloca %struct.latLong*, align 8
  %d_distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %lat.addr = alloca float, align 4
  %lng.addr = alloca float, align 4
  %globalId = alloca i32, align 4
  %latLong = alloca %struct.latLong*, align 8
  %dist = alloca float*, align 8
  store %struct.latLong* %d_locations, %struct.latLong** %d_locations.addr, align 8
  store float* %d_distances, float** %d_distances.addr, align 8
  store i32 %numRecords, i32* %numRecords.addr, align 4
  store float %lat, float* %lat.addr, align 4
  store float %lng, float* %lng.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %call1 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #4
  %call2 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %mul = mul i32 %call1, %call2
  %call3 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %add = add i32 %mul, %call3
  %mul4 = mul i32 %call, %add
  %call5 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %add6 = add i32 %mul4, %call5
  store i32 %add6, i32* %globalId, align 4
  %0 = load %struct.latLong*, %struct.latLong** %d_locations.addr, align 8
  %1 = load i32, i32* %globalId, align 4
  %idx.ext = sext i32 %1 to i64
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %0, i64 %idx.ext
  store %struct.latLong* %add.ptr, %struct.latLong** %latLong, align 8
  %2 = load i32, i32* %globalId, align 4
  %3 = load i32, i32* %numRecords.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load float*, float** %d_distances.addr, align 8
  %5 = load i32, i32* %globalId, align 4
  %idx.ext7 = sext i32 %5 to i64
  %add.ptr8 = getelementptr inbounds float, float* %4, i64 %idx.ext7
  store float* %add.ptr8, float** %dist, align 8
  %6 = load float, float* %lat.addr, align 4
  %7 = load %struct.latLong*, %struct.latLong** %latLong, align 8
  %lat9 = getelementptr inbounds %struct.latLong, %struct.latLong* %7, i32 0, i32 0
  %8 = load float, float* %lat9, align 4
  %sub = fsub contract float %6, %8
  %9 = load float, float* %lat.addr, align 4
  %10 = load %struct.latLong*, %struct.latLong** %latLong, align 8
  %lat10 = getelementptr inbounds %struct.latLong, %struct.latLong* %10, i32 0, i32 0
  %11 = load float, float* %lat10, align 4
  %sub11 = fsub contract float %9, %11
  %mul12 = fmul contract float %sub, %sub11
  %12 = load float, float* %lng.addr, align 4
  %13 = load %struct.latLong*, %struct.latLong** %latLong, align 8
  %lng13 = getelementptr inbounds %struct.latLong, %struct.latLong* %13, i32 0, i32 1
  %14 = load float, float* %lng13, align 4
  %sub14 = fsub contract float %12, %14
  %15 = load float, float* %lng.addr, align 4
  %16 = load %struct.latLong*, %struct.latLong** %latLong, align 8
  %lng15 = getelementptr inbounds %struct.latLong, %struct.latLong* %16, i32 0, i32 1
  %17 = load float, float* %lng15, align 4
  %sub16 = fsub contract float %15, %17
  %mul17 = fmul contract float %sub14, %sub16
  %add18 = fadd contract float %mul12, %mul17
  %call19 = call float @_ZL4sqrtf(float %add18) #4
  %18 = load float*, float** %dist, align 8
  store float %call19, float* %18, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
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

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
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
define internal float @_ZL4sqrtf(float %__x) #1 {
entry:
  %__x.addr = alloca float, align 4
  store float %__x, float* %__x.addr, align 4
  %0 = load float, float* %__x.addr, align 4
  %call = call float @_ZL5sqrtff(float %0) #4
  ret float %call
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: alwaysinline convergent nounwind
define internal float @_ZL5sqrtff(float %__a) #1 {
entry:
  %__a.addr = alloca float, align 4
  store float %__a, float* %__a.addr, align 4
  %0 = load float, float* %__a.addr, align 4
  %call = call float @__nv_sqrtf(float %0) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent inlinehint nounwind
define internal float @__nv_sqrtf(float %x) #3 {
  %1 = call float @llvm.nvvm.sqrt.f(float %x)
  ret float %1
}

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.sqrt.f(float) #2

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { alwaysinline convergent inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (%struct.latLong*, float*, i32, float, float)* @_Z6euclidP7latLongPfiff, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
