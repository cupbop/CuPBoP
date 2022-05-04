; ModuleID = 'kernel_gpu_cuda_wrapper-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "kernel/kernel_gpu_cuda_wrapper.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.knode = type { i32, [257 x i32], [257 x i32], i8, i32 }
%struct.record = type { i32 }

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
define dso_local void @findK(i64 %height, %struct.knode* %knodesD, i64 %knodes_elem, %struct.record* %recordsD, i64* %currKnodeD, i64* %offsetD, i32* %keysD, %struct.record* %ansD) #0 {
entry:
  %height.addr = alloca i64, align 8
  %knodesD.addr = alloca %struct.knode*, align 8
  %knodes_elem.addr = alloca i64, align 8
  %recordsD.addr = alloca %struct.record*, align 8
  %currKnodeD.addr = alloca i64*, align 8
  %offsetD.addr = alloca i64*, align 8
  %keysD.addr = alloca i32*, align 8
  %ansD.addr = alloca %struct.record*, align 8
  %thid = alloca i32, align 4
  %bid = alloca i32, align 4
  %i = alloca i32, align 4
  store i64 %height, i64* %height.addr, align 8
  store %struct.knode* %knodesD, %struct.knode** %knodesD.addr, align 8
  store i64 %knodes_elem, i64* %knodes_elem.addr, align 8
  store %struct.record* %recordsD, %struct.record** %recordsD.addr, align 8
  store i64* %currKnodeD, i64** %currKnodeD.addr, align 8
  store i64* %offsetD, i64** %offsetD.addr, align 8
  store i32* %keysD, i32** %keysD.addr, align 8
  store %struct.record* %ansD, %struct.record** %ansD.addr, align 8
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
  %8 = load i32*, i32** %keysD.addr, align 8
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
  %17 = load i32*, i32** %keysD.addr, align 8
  %18 = load i32, i32* %bid, align 4
  %idxprom14 = sext i32 %18 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %17, i64 %idxprom14
  %19 = load i32, i32* %arrayidx15, align 4
  %cmp16 = icmp sgt i32 %16, %19
  br i1 %cmp16, label %if.then, label %if.end34

if.then:                                          ; preds = %land.lhs.true
  %20 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %21 = load i64*, i64** %offsetD.addr, align 8
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
  %28 = load i64*, i64** %offsetD.addr, align 8
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
  call void @llvm.nvvm.barrier0()
  %35 = load i32, i32* %thid, align 4
  %cmp35 = icmp eq i32 %35, 0
  br i1 %cmp35, label %if.then36, label %if.end41

if.then36:                                        ; preds = %if.end34
  %36 = load i64*, i64** %offsetD.addr, align 8
  %37 = load i32, i32* %bid, align 4
  %idxprom37 = sext i32 %37 to i64
  %arrayidx38 = getelementptr inbounds i64, i64* %36, i64 %idxprom37
  %38 = load i64, i64* %arrayidx38, align 8
  %39 = load i64*, i64** %currKnodeD.addr, align 8
  %40 = load i32, i32* %bid, align 4
  %idxprom39 = sext i32 %40 to i64
  %arrayidx40 = getelementptr inbounds i64, i64* %39, i64 %idxprom39
  store i64 %38, i64* %arrayidx40, align 8
  br label %if.end41

if.end41:                                         ; preds = %if.then36, %if.end34
  call void @llvm.nvvm.barrier0()
  br label %for.inc

for.inc:                                          ; preds = %if.end41
  %41 = load i32, i32* %i, align 4
  %inc = add nsw i32 %41, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %42 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %43 = load i64*, i64** %currKnodeD.addr, align 8
  %44 = load i32, i32* %bid, align 4
  %idxprom42 = sext i32 %44 to i64
  %arrayidx43 = getelementptr inbounds i64, i64* %43, i64 %idxprom42
  %45 = load i64, i64* %arrayidx43, align 8
  %arrayidx44 = getelementptr inbounds %struct.knode, %struct.knode* %42, i64 %45
  %keys45 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx44, i32 0, i32 2
  %46 = load i32, i32* %thid, align 4
  %idxprom46 = sext i32 %46 to i64
  %arrayidx47 = getelementptr inbounds [257 x i32], [257 x i32]* %keys45, i64 0, i64 %idxprom46
  %47 = load i32, i32* %arrayidx47, align 4
  %48 = load i32*, i32** %keysD.addr, align 8
  %49 = load i32, i32* %bid, align 4
  %idxprom48 = sext i32 %49 to i64
  %arrayidx49 = getelementptr inbounds i32, i32* %48, i64 %idxprom48
  %50 = load i32, i32* %arrayidx49, align 4
  %cmp50 = icmp eq i32 %47, %50
  br i1 %cmp50, label %if.then51, label %if.end63

if.then51:                                        ; preds = %for.end
  %51 = load %struct.record*, %struct.record** %recordsD.addr, align 8
  %52 = load %struct.knode*, %struct.knode** %knodesD.addr, align 8
  %53 = load i64*, i64** %currKnodeD.addr, align 8
  %54 = load i32, i32* %bid, align 4
  %idxprom52 = sext i32 %54 to i64
  %arrayidx53 = getelementptr inbounds i64, i64* %53, i64 %idxprom52
  %55 = load i64, i64* %arrayidx53, align 8
  %arrayidx54 = getelementptr inbounds %struct.knode, %struct.knode* %52, i64 %55
  %indices55 = getelementptr inbounds %struct.knode, %struct.knode* %arrayidx54, i32 0, i32 1
  %56 = load i32, i32* %thid, align 4
  %idxprom56 = sext i32 %56 to i64
  %arrayidx57 = getelementptr inbounds [257 x i32], [257 x i32]* %indices55, i64 0, i64 %idxprom56
  %57 = load i32, i32* %arrayidx57, align 4
  %idxprom58 = sext i32 %57 to i64
  %arrayidx59 = getelementptr inbounds %struct.record, %struct.record* %51, i64 %idxprom58
  %value = getelementptr inbounds %struct.record, %struct.record* %arrayidx59, i32 0, i32 0
  %58 = load i32, i32* %value, align 4
  %59 = load %struct.record*, %struct.record** %ansD.addr, align 8
  %60 = load i32, i32* %bid, align 4
  %idxprom60 = sext i32 %60 to i64
  %arrayidx61 = getelementptr inbounds %struct.record, %struct.record* %59, i64 %idxprom60
  %value62 = getelementptr inbounds %struct.record, %struct.record* %arrayidx61, i32 0, i32 0
  store i32 %58, i32* %value62, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.then51, %for.end
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
!3 = !{void (i64, %struct.knode*, i64, %struct.record*, i64*, i64*, i32*, %struct.record*)* @findK, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
