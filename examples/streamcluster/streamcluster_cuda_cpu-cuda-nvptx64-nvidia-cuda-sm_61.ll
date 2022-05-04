; ModuleID = 'streamcluster_cuda_cpu-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "streamcluster_cuda_cpu.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_gridDim_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.Point = type { float, float*, i64, float }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@gridDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_gridDim_t, align 1
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
define dso_local float @_Z6d_distiiiiPf(i32 %p1, i32 %p2, i32 %num, i32 %dim, float* %coord_d) #0 {
entry:
  %p1.addr = alloca i32, align 4
  %p2.addr = alloca i32, align 4
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %coord_d.addr = alloca float*, align 8
  %retval1 = alloca float, align 4
  %i = alloca i32, align 4
  %tmp = alloca float, align 4
  store i32 %p1, i32* %p1.addr, align 4
  store i32 %p2, i32* %p2.addr, align 4
  store i32 %num, i32* %num.addr, align 4
  store i32 %dim, i32* %dim.addr, align 4
  store float* %coord_d, float** %coord_d.addr, align 8
  store float 0.000000e+00, float* %retval1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %dim.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %coord_d.addr, align 8
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %num.addr, align 4
  %mul = mul nsw i32 %3, %4
  %5 = load i32, i32* %p1.addr, align 4
  %add = add nsw i32 %mul, %5
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %6 = load float, float* %arrayidx, align 4
  %7 = load float*, float** %coord_d.addr, align 8
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %num.addr, align 4
  %mul2 = mul nsw i32 %8, %9
  %10 = load i32, i32* %p2.addr, align 4
  %add3 = add nsw i32 %mul2, %10
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds float, float* %7, i64 %idxprom4
  %11 = load float, float* %arrayidx5, align 4
  %sub = fsub contract float %6, %11
  store float %sub, float* %tmp, align 4
  %12 = load float, float* %tmp, align 4
  %13 = load float, float* %tmp, align 4
  %mul6 = fmul contract float %12, %13
  %14 = load float, float* %retval1, align 4
  %add7 = fadd contract float %14, %mul6
  store float %add7, float* %retval1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load float, float* %retval1, align 4
  ret float %16
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb(i32 %num, i32 %dim, i64 %x, %struct.Point* %p, i32 %K, i32 %stride, float* %coord_d, float* %work_mem_d, i32* %center_table_d, i8* %switch_membership_d) #0 {
entry:
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %p.addr = alloca %struct.Point*, align 8
  %K.addr = alloca i32, align 4
  %stride.addr = alloca i32, align 4
  %coord_d.addr = alloca float*, align 8
  %work_mem_d.addr = alloca float*, align 8
  %center_table_d.addr = alloca i32*, align 8
  %switch_membership_d.addr = alloca i8*, align 8
  %bid = alloca i32, align 4
  %tid = alloca i32, align 4
  %lower = alloca float*, align 8
  %x_cost = alloca float, align 4
  store i32 %num, i32* %num.addr, align 4
  store i32 %dim, i32* %dim.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  store %struct.Point* %p, %struct.Point** %p.addr, align 8
  store i32 %K, i32* %K.addr, align 4
  store i32 %stride, i32* %stride.addr, align 4
  store float* %coord_d, float** %coord_d.addr, align 8
  store float* %work_mem_d, float** %work_mem_d.addr, align 8
  store i32* %center_table_d, i32** %center_table_d.addr, align 8
  store i8* %switch_membership_d, i8** %switch_membership_d.addr, align 8
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %call1 = call i32 @_ZN24__cuda_builtin_gridDim_t17__fetch_builtin_xEv() #3
  %call2 = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #3
  %mul = mul i32 %call1, %call2
  %add = add i32 %call, %mul
  store i32 %add, i32* %bid, align 4
  %call3 = call i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3
  %0 = load i32, i32* %bid, align 4
  %mul4 = mul i32 %call3, %0
  %call5 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add6 = add i32 %mul4, %call5
  store i32 %add6, i32* %tid, align 4
  %1 = load i32, i32* %tid, align 4
  %2 = load i32, i32* %num.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end34

if.then:                                          ; preds = %entry
  %3 = load float*, float** %work_mem_d.addr, align 8
  %4 = load i32, i32* %tid, align 4
  %5 = load i32, i32* %stride.addr, align 4
  %mul7 = mul nsw i32 %4, %5
  %idxprom = sext i32 %mul7 to i64
  %arrayidx = getelementptr inbounds float, float* %3, i64 %idxprom
  store float* %arrayidx, float** %lower, align 8
  %6 = load i32, i32* %tid, align 4
  %7 = load i64, i64* %x.addr, align 8
  %conv = trunc i64 %7 to i32
  %8 = load i32, i32* %num.addr, align 4
  %9 = load i32, i32* %dim.addr, align 4
  %10 = load float*, float** %coord_d.addr, align 8
  %call8 = call float @_Z6d_distiiiiPf(i32 %6, i32 %conv, i32 %8, i32 %9, float* %10) #3
  %11 = load %struct.Point*, %struct.Point** %p.addr, align 8
  %12 = load i32, i32* %tid, align 4
  %idxprom9 = sext i32 %12 to i64
  %arrayidx10 = getelementptr inbounds %struct.Point, %struct.Point* %11, i64 %idxprom9
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx10, i32 0, i32 0
  %13 = load float, float* %weight, align 8
  %mul11 = fmul contract float %call8, %13
  store float %mul11, float* %x_cost, align 4
  %14 = load float, float* %x_cost, align 4
  %15 = load %struct.Point*, %struct.Point** %p.addr, align 8
  %16 = load i32, i32* %tid, align 4
  %idxprom12 = sext i32 %16 to i64
  %arrayidx13 = getelementptr inbounds %struct.Point, %struct.Point* %15, i64 %idxprom12
  %cost = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx13, i32 0, i32 3
  %17 = load float, float* %cost, align 8
  %cmp14 = fcmp olt float %14, %17
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %if.then
  %18 = load i8*, i8** %switch_membership_d.addr, align 8
  %19 = load i32, i32* %tid, align 4
  %idxprom16 = sext i32 %19 to i64
  %arrayidx17 = getelementptr inbounds i8, i8* %18, i64 %idxprom16
  store i8 1, i8* %arrayidx17, align 1
  %20 = load float, float* %x_cost, align 4
  %21 = load %struct.Point*, %struct.Point** %p.addr, align 8
  %22 = load i32, i32* %tid, align 4
  %idxprom18 = sext i32 %22 to i64
  %arrayidx19 = getelementptr inbounds %struct.Point, %struct.Point* %21, i64 %idxprom18
  %cost20 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx19, i32 0, i32 3
  %23 = load float, float* %cost20, align 8
  %sub = fsub contract float %20, %23
  %24 = load float*, float** %lower, align 8
  %25 = load i32, i32* %K.addr, align 4
  %idxprom21 = sext i32 %25 to i64
  %arrayidx22 = getelementptr inbounds float, float* %24, i64 %idxprom21
  %26 = load float, float* %arrayidx22, align 4
  %add23 = fadd contract float %26, %sub
  store float %add23, float* %arrayidx22, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %27 = load %struct.Point*, %struct.Point** %p.addr, align 8
  %28 = load i32, i32* %tid, align 4
  %idxprom24 = sext i32 %28 to i64
  %arrayidx25 = getelementptr inbounds %struct.Point, %struct.Point* %27, i64 %idxprom24
  %cost26 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx25, i32 0, i32 3
  %29 = load float, float* %cost26, align 8
  %30 = load float, float* %x_cost, align 4
  %sub27 = fsub contract float %29, %30
  %31 = load float*, float** %lower, align 8
  %32 = load i32*, i32** %center_table_d.addr, align 8
  %33 = load %struct.Point*, %struct.Point** %p.addr, align 8
  %34 = load i32, i32* %tid, align 4
  %idxprom28 = sext i32 %34 to i64
  %arrayidx29 = getelementptr inbounds %struct.Point, %struct.Point* %33, i64 %idxprom28
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx29, i32 0, i32 2
  %35 = load i64, i64* %assign, align 8
  %arrayidx30 = getelementptr inbounds i32, i32* %32, i64 %35
  %36 = load i32, i32* %arrayidx30, align 4
  %idxprom31 = sext i32 %36 to i64
  %arrayidx32 = getelementptr inbounds float, float* %31, i64 %idxprom31
  %37 = load float, float* %arrayidx32, align 4
  %add33 = fadd contract float %37, %sub27
  store float %add33, float* %arrayidx32, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then15
  br label %if.end34

if.end34:                                         ; preds = %if.end, %entry
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define linkonce_odr dso_local i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
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
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

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
!3 = !{void (i32, i32, i64, %struct.Point*, i32, i32, float*, float*, i32*, i8*)* @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
