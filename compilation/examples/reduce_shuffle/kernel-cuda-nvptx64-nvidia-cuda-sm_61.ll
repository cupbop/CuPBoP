; ModuleID = 'kernel-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "kernel.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

@_ZZ7reduce5PiS_jE5sdata = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 4

; Function Attrs: nounwind
define weak dso_local i32 @cudaMalloc(i8** %p, i64 %s) local_unnamed_addr #0 {
entry:
  ret i32 999
}

; Function Attrs: nounwind
define weak dso_local i32 @cudaFuncGetAttributes(%struct.cudaFuncAttributes* %p, i8* %c) local_unnamed_addr #0 {
entry:
  ret i32 999
}

; Function Attrs: nounwind
define weak dso_local i32 @cudaDeviceGetAttribute(i32* %value, i32 %attr, i32 %device) local_unnamed_addr #0 {
entry:
  ret i32 999
}

; Function Attrs: nounwind
define weak dso_local i32 @cudaGetDevice(i32* %device) local_unnamed_addr #0 {
entry:
  ret i32 999
}

; Function Attrs: nounwind
define weak dso_local i32 @cudaOccupancyMaxActiveBlocksPerMultiprocessor(i32* %numBlocks, i8* %func, i32 %blockSize, i64 %dynamicSmemSize) local_unnamed_addr #0 {
entry:
  ret i32 999
}

; Function Attrs: nounwind
define weak dso_local i32 @cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(i32* %numBlocks, i8* %func, i32 %blockSize, i64 %dynamicSmemSize, i32 %flags) local_unnamed_addr #0 {
entry:
  ret i32 999
}

; Function Attrs: convergent nounwind
define dso_local void @_Z7reduce5PiS_j(i32* nocapture readonly %g_idata, i32* nocapture %g_odata, i32 %n) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !10
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !11
  %mul = shl i32 %1, 7
  %add = add i32 %mul, %0
  %cmp = icmp ult i32 %add, %n
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i32, i32* %g_idata, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !12
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %entry ]
  %add4 = add i32 %add, 64
  %cmp5 = icmp ult i32 %add4, %n
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %idxprom7 = zext i32 %add4 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %g_idata, i64 %idxprom7
  %3 = load i32, i32* %arrayidx8, align 4, !tbaa !12
  %add9 = add nsw i32 %3, %cond
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %mySum.0 = phi i32 [ %add9, %if.then ], [ %cond, %cond.end ]
  %idxprom10 = zext i32 %0 to i64
  %arrayidx1150 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ7reduce5PiS_jE5sdata, i64 0, i64 %idxprom10
  %arrayidx11 = addrspacecast i32 addrspace(3)* %arrayidx1150 to i32*
  store i32 %mySum.0, i32* %arrayidx11, align 4, !tbaa !12
  tail call void @llvm.nvvm.barrier.sync(i32 0) #5
  tail call void @llvm.nvvm.barrier.sync(i32 0) #5
  tail call void @llvm.nvvm.barrier.sync(i32 0) #5
  tail call void @llvm.nvvm.barrier.sync(i32 0) #5
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.z() #5, !range !16
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #5, !range !17
  %mul.i.i52 = mul nuw nsw i32 %5, %4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !17
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #5, !range !10
  %mul39.i.i53 = add nuw nsw i32 %7, %mul.i.i52
  %add.i.i54 = mul nuw nsw i32 %mul39.i.i53, %6
  %add8.i.i55 = add nuw nsw i32 %add.i.i54, %0
  %cmp14 = icmp ult i32 %add8.i.i55, 32
  br i1 %cmp14, label %if.then15, label %if.end32

if.then15:                                        ; preds = %if.end
  %add16 = add nuw nsw i32 %0, 32
  %idxprom17 = zext i32 %add16 to i64
  %arrayidx1851 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ7reduce5PiS_jE5sdata, i64 0, i64 %idxprom17
  %arrayidx18 = addrspacecast i32 addrspace(3)* %arrayidx1851 to i32*
  %8 = load i32, i32* %arrayidx18, align 4, !tbaa !12
  %add19 = add nsw i32 %8, %mySum.0
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %add19, i32 16, i32 31) #5
  %add23 = add nsw i32 %9, %add19
  %10 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %add23, i32 8, i32 31) #5
  %add23.1 = add nsw i32 %10, %add23
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %add23.1, i32 4, i32 31) #5
  %add23.2 = add nsw i32 %11, %add23.1
  %12 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %add23.2, i32 2, i32 31) #5
  %add23.3 = add nsw i32 %12, %add23.2
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %add23.3, i32 1, i32 31) #5
  %cmp27 = icmp eq i32 %add8.i.i55, 0
  br i1 %cmp27, label %if.then28, label %if.end32

if.then28:                                        ; preds = %if.then15
  %add23.4 = add nsw i32 %13, %add23.3
  %idxprom30 = zext i32 %1 to i64
  %arrayidx31 = getelementptr inbounds i32, i32* %g_odata, i64 %idxprom30
  store i32 %add23.4, i32* %arrayidx31, align 4, !tbaa !12
  br label %if.end32

if.end32:                                         ; preds = %if.end, %if.then28, %if.then15
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.z() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier.sync(i32) #3

; Function Attrs: convergent inaccessiblememonly nounwind
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind }
attributes #4 = { convergent inaccessiblememonly nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i32*, i32*, i32)* @_Z7reduce5PiS_j, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
!10 = !{i32 0, i32 1024}
!11 = !{i32 0, i32 2147483647}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
!16 = !{i32 0, i32 64}
!17 = !{i32 1, i32 1025}
