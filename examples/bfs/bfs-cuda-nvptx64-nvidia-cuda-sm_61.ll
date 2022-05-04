; ModuleID = 'bfs-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "bfs.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.Node = type { i32, i32 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

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
define dso_local void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %g_graph_nodes, i32* %g_graph_edges, i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i32* %g_cost, i32 %no_of_nodes) #0 {
entry:
  %g_graph_nodes.addr = alloca %struct.Node*, align 8
  %g_graph_edges.addr = alloca i32*, align 8
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_cost.addr = alloca i32*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  %tid = alloca i32, align 4
  %i = alloca i32, align 4
  %id = alloca i32, align 4
  store %struct.Node* %g_graph_nodes, %struct.Node** %g_graph_nodes.addr, align 8
  store i32* %g_graph_edges, i32** %g_graph_edges.addr, align 8
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  store i32* %g_cost, i32** %g_cost.addr, align 8
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %mul = mul i32 %call, 512
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add = add i32 %mul, %call1
  store i32 %add, i32* %tid, align 4
  %0 = load i32, i32* %tid, align 4
  %1 = load i32, i32* %no_of_nodes.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end26

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %g_graph_mask.addr, align 8
  %3 = load i32, i32* %tid, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom
  %4 = load i8, i8* %arrayidx, align 1
  %tobool = trunc i8 %4 to i1
  br i1 %tobool, label %if.then, label %if.end26

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** %g_graph_mask.addr, align 8
  %6 = load i32, i32* %tid, align 4
  %idxprom2 = sext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %idxprom2
  store i8 0, i8* %arrayidx3, align 1
  %7 = load %struct.Node*, %struct.Node** %g_graph_nodes.addr, align 8
  %8 = load i32, i32* %tid, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds %struct.Node, %struct.Node* %7, i64 %idxprom4
  %starting = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx5, i32 0, i32 0
  %9 = load i32, i32* %starting, align 4
  store i32 %9, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, i32* %i, align 4
  %11 = load %struct.Node*, %struct.Node** %g_graph_nodes.addr, align 8
  %12 = load i32, i32* %tid, align 4
  %idxprom6 = sext i32 %12 to i64
  %arrayidx7 = getelementptr inbounds %struct.Node, %struct.Node* %11, i64 %idxprom6
  %no_of_edges = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx7, i32 0, i32 1
  %13 = load i32, i32* %no_of_edges, align 4
  %14 = load %struct.Node*, %struct.Node** %g_graph_nodes.addr, align 8
  %15 = load i32, i32* %tid, align 4
  %idxprom8 = sext i32 %15 to i64
  %arrayidx9 = getelementptr inbounds %struct.Node, %struct.Node* %14, i64 %idxprom8
  %starting10 = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx9, i32 0, i32 0
  %16 = load i32, i32* %starting10, align 4
  %add11 = add nsw i32 %13, %16
  %cmp12 = icmp slt i32 %10, %add11
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load i32*, i32** %g_graph_edges.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %17, i64 %idxprom13
  %19 = load i32, i32* %arrayidx14, align 4
  store i32 %19, i32* %id, align 4
  %20 = load i8*, i8** %g_graph_visited.addr, align 8
  %21 = load i32, i32* %id, align 4
  %idxprom15 = sext i32 %21 to i64
  %arrayidx16 = getelementptr inbounds i8, i8* %20, i64 %idxprom15
  %22 = load i8, i8* %arrayidx16, align 1
  %tobool17 = trunc i8 %22 to i1
  br i1 %tobool17, label %if.end, label %if.then18

if.then18:                                        ; preds = %for.body
  %23 = load i32*, i32** %g_cost.addr, align 8
  %24 = load i32, i32* %tid, align 4
  %idxprom19 = sext i32 %24 to i64
  %arrayidx20 = getelementptr inbounds i32, i32* %23, i64 %idxprom19
  %25 = load i32, i32* %arrayidx20, align 4
  %add21 = add nsw i32 %25, 1
  %26 = load i32*, i32** %g_cost.addr, align 8
  %27 = load i32, i32* %id, align 4
  %idxprom22 = sext i32 %27 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %26, i64 %idxprom22
  store i32 %add21, i32* %arrayidx23, align 4
  %28 = load i8*, i8** %g_updating_graph_mask.addr, align 8
  %29 = load i32, i32* %id, align 4
  %idxprom24 = sext i32 %29 to i64
  %arrayidx25 = getelementptr inbounds i8, i8* %28, i64 %idxprom24
  store i8 1, i8* %arrayidx25, align 1
  br label %if.end

if.end:                                           ; preds = %if.then18, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %30 = load i32, i32* %i, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end26

if.end26:                                         ; preds = %for.end, %land.lhs.true, %entry
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

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z7Kernel2PbS_S_S_i(i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i8* %g_over, i32 %no_of_nodes) #0 {
entry:
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_over.addr = alloca i8*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  %tid = alloca i32, align 4
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  store i8* %g_over, i8** %g_over.addr, align 8
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  %call = call i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3
  %mul = mul i32 %call, 512
  %call1 = call i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3
  %add = add i32 %mul, %call1
  store i32 %add, i32* %tid, align 4
  %0 = load i32, i32* %tid, align 4
  %1 = load i32, i32* %no_of_nodes.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %g_updating_graph_mask.addr, align 8
  %3 = load i32, i32* %tid, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom
  %4 = load i8, i8* %arrayidx, align 1
  %tobool = trunc i8 %4 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** %g_graph_mask.addr, align 8
  %6 = load i32, i32* %tid, align 4
  %idxprom2 = sext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %idxprom2
  store i8 1, i8* %arrayidx3, align 1
  %7 = load i8*, i8** %g_graph_visited.addr, align 8
  %8 = load i32, i32* %tid, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %idxprom4
  store i8 1, i8* %arrayidx5, align 1
  %9 = load i8*, i8** %g_over.addr, align 8
  store i8 1, i8* %9, align 1
  %10 = load i8*, i8** %g_updating_graph_mask.addr, align 8
  %11 = load i32, i32* %tid, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i64 %idxprom6
  store i8 0, i8* %arrayidx7, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

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
!3 = !{void (%struct.Node*, i32*, i8*, i8*, i8*, i32*, i32)* @_Z6KernelP4NodePiPbS2_S2_S1_i, !"kernel", i32 1}
!4 = !{void (i8*, i8*, i8*, i8*, i32)* @_Z7Kernel2PbS_S_S_i, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = !{i32 1, i32 4}
