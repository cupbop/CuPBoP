; ModuleID = 'kernel-cuda-nvptx64-nvidia-cuda-sm_61.bc'
source_filename = "kernel.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

@_ZZ7reduce0PiS_jE5sdata = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 4

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
define dso_local void @_Z7reduce0PiS_j(i32* nocapture readonly %g_idata, i32* nocapture %g_odata, i32 %n) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4, !range !10
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4, !range !11
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4, !range !12
  %mul = mul i32 %2, %1
  %add = add i32 %mul, %0
  %cmp = icmp ult i32 %add, %n
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i32, i32* %g_idata, i64 %idxprom
  %3 = load i32, i32* %arrayidx, align 4, !tbaa !13
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %entry ]
  %idxprom5 = zext i32 %0 to i64
  %arrayidx635 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ7reduce0PiS_jE5sdata, i64 0, i64 %idxprom5
  %arrayidx6 = addrspacecast i32 addrspace(3)* %arrayidx635 to i32*
  store i32 %cond, i32* %arrayidx6, align 4, !tbaa !13
  tail call void @llvm.nvvm.barrier.sync(i32 0) #4
  %cmp839 = icmp ugt i32 %2, 1
  br i1 %cmp839, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %if.end, %cond.end
  %cmp18 = icmp eq i32 %0, 0
  br i1 %cmp18, label %if.then19, label %if.end23

for.body:                                         ; preds = %cond.end, %if.end
  %s.040 = phi i32 [ %mul9, %if.end ], [ 1, %cond.end ]
  %mul9 = shl nuw nsw i32 %s.040, 1
  %rem = urem i32 %0, %mul9
  %cmp10 = icmp eq i32 %rem, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %add11 = add i32 %s.040, %0
  %idxprom12 = zext i32 %add11 to i64
  %arrayidx1336 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ7reduce0PiS_jE5sdata, i64 0, i64 %idxprom12
  %arrayidx13 = addrspacecast i32 addrspace(3)* %arrayidx1336 to i32*
  %4 = load i32, i32* %arrayidx13, align 4, !tbaa !13
  %5 = load i32, i32* %arrayidx6, align 4, !tbaa !13
  %add16 = add nsw i32 %5, %4
  store i32 %add16, i32* %arrayidx6, align 4, !tbaa !13
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  tail call void @llvm.nvvm.barrier.sync(i32 0) #4
  %cmp8 = icmp ult i32 %mul9, %2
  br i1 %cmp8, label %for.body, label %for.cond.cleanup

if.then19:                                        ; preds = %for.cond.cleanup
  %idxprom21 = zext i32 %1 to i64
  %arrayidx22 = getelementptr inbounds i32, i32* %g_odata, i64 %idxprom21
  %6 = load i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* addrspacecast ([64 x i32] addrspace(3)* @_ZZ7reduce0PiS_jE5sdata to [64 x i32]*), i64 0, i64 0), align 4, !tbaa !13
  store i32 %6, i32* %arrayidx22, align 4, !tbaa !13
  br label %if.end23

if.end23:                                         ; preds = %if.then19, %for.cond.cleanup
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier.sync(i32) #3

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_61" "target-features"="+ptx64,+sm_61" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i32*, i32*, i32)* @_Z7reduce0PiS_j, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
!10 = !{i32 0, i32 1024}
!11 = !{i32 0, i32 2147483647}
!12 = !{i32 1, i32 1025}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C++ TBAA"}
