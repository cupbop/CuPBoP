; ModuleID = 'common-host-x86_64-unknown-linux-gnu.bc'
source_filename = "./common/common.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__stopwatch_t = type { %struct.timeval, %struct.timeval }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$_ZSt4fabsf = comdat any

$_ZSt3expf = comdat any

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"dismatch at (%d, %d): (o)%f (n)%f\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stopwatch_start(%struct.__stopwatch_t* %sw) #0 {
entry:
  %sw.addr = alloca %struct.__stopwatch_t*, align 8
  store %struct.__stopwatch_t* %sw, %struct.__stopwatch_t** %sw.addr, align 8
  %0 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %cmp = icmp eq %struct.__stopwatch_t* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %begin = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %1, i32 0, i32 0
  %2 = bitcast %struct.timeval* %begin to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 16, i1 false)
  %3 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %end = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %3, i32 0, i32 1
  %4 = bitcast %struct.timeval* %end to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %4, i8 0, i64 16, i1 false)
  %5 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %begin1 = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %5, i32 0, i32 0
  %call = call i32 @gettimeofday(%struct.timeval* %begin1, %struct.timezone* null) #5
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stopwatch_stop(%struct.__stopwatch_t* %sw) #0 {
entry:
  %sw.addr = alloca %struct.__stopwatch_t*, align 8
  store %struct.__stopwatch_t* %sw, %struct.__stopwatch_t** %sw.addr, align 8
  %0 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %cmp = icmp eq %struct.__stopwatch_t* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %end = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %1, i32 0, i32 1
  %call = call i32 @gettimeofday(%struct.timeval* %end, %struct.timezone* null) #5
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @get_interval_by_sec(%struct.__stopwatch_t* %sw) #0 {
entry:
  %retval = alloca double, align 8
  %sw.addr = alloca %struct.__stopwatch_t*, align 8
  store %struct.__stopwatch_t* %sw, %struct.__stopwatch_t** %sw.addr, align 8
  %0 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %cmp = icmp eq %struct.__stopwatch_t* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %end = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %1, i32 0, i32 1
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %end, i32 0, i32 0
  %2 = load i64, i64* %tv_sec, align 8
  %3 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %begin = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %3, i32 0, i32 0
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %begin, i32 0, i32 0
  %4 = load i64, i64* %tv_sec1, align 8
  %sub = sub nsw i64 %2, %4
  %conv = sitofp i64 %sub to double
  %5 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %end2 = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %5, i32 0, i32 1
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %end2, i32 0, i32 1
  %6 = load i64, i64* %tv_usec, align 8
  %7 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %begin3 = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %7, i32 0, i32 0
  %tv_usec4 = getelementptr inbounds %struct.timeval, %struct.timeval* %begin3, i32 0, i32 1
  %8 = load i64, i64* %tv_usec4, align 8
  %sub5 = sub nsw i64 %6, %8
  %conv6 = sitofp i64 %sub5 to double
  %div = fdiv double %conv6, 1.000000e+06
  %add = fadd double %conv, %div
  store double %add, double* %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load double, double* %retval, align 8
  ret double %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @get_interval_by_usec(%struct.__stopwatch_t* %sw) #0 {
entry:
  %retval = alloca i32, align 4
  %sw.addr = alloca %struct.__stopwatch_t*, align 8
  store %struct.__stopwatch_t* %sw, %struct.__stopwatch_t** %sw.addr, align 8
  %0 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %cmp = icmp eq %struct.__stopwatch_t* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %end = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %1, i32 0, i32 1
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %end, i32 0, i32 0
  %2 = load i64, i64* %tv_sec, align 8
  %3 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %begin = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %3, i32 0, i32 0
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %begin, i32 0, i32 0
  %4 = load i64, i64* %tv_sec1, align 8
  %sub = sub nsw i64 %2, %4
  %mul = mul nsw i64 %sub, 1000000
  %5 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %end2 = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %5, i32 0, i32 1
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %end2, i32 0, i32 1
  %6 = load i64, i64* %tv_usec, align 8
  %7 = load %struct.__stopwatch_t*, %struct.__stopwatch_t** %sw.addr, align 8
  %begin3 = getelementptr inbounds %struct.__stopwatch_t, %struct.__stopwatch_t* %7, i32 0, i32 0
  %tv_usec4 = getelementptr inbounds %struct.timeval, %struct.timeval* %begin3, i32 0, i32 1
  %8 = load i64, i64* %tv_usec4, align 8
  %sub5 = sub nsw i64 %6, %8
  %add = add nsw i64 %mul, %sub5
  %conv = trunc i64 %add to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline optnone uwtable
define dso_local i32 @create_matrix_from_file(float** %mp, i8* %filename, i32* %size_p) #3 {
entry:
  %retval = alloca i32, align 4
  %mp.addr = alloca float**, align 8
  %filename.addr = alloca i8*, align 8
  %size_p.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %size = alloca i32, align 4
  %m = alloca float*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  store float** %mp, float*** %mp.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i32* %size_p, i32** %size_p.addr, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %fp, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32* %size)
  %3 = load i32, i32* %size, align 4
  %conv = sext i32 %3 to i64
  %mul = mul i64 4, %conv
  %4 = load i32, i32* %size, align 4
  %conv2 = sext i32 %4 to i64
  %mul3 = mul i64 %mul, %conv2
  %call4 = call noalias i8* @malloc(i64 %mul3) #5
  %5 = bitcast i8* %call4 to float*
  store float* %5, float** %m, align 8
  %6 = load float*, float** %m, align 8
  %cmp5 = icmp eq float* %6, null
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call7 = call i32 @fclose(%struct._IO_FILE* %7)
  store i32 1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc17, %if.end8
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %size, align 4
  %cmp9 = icmp slt i32 %8, %9
  br i1 %cmp9, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %for.body
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %size, align 4
  %cmp11 = icmp slt i32 %10, %11
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %13 = load float*, float** %m, align 8
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %size, align 4
  %mul13 = mul nsw i32 %14, %15
  %idx.ext = sext i32 %mul13 to i64
  %add.ptr = getelementptr inbounds float, float* %13, i64 %idx.ext
  %16 = load i32, i32* %j, align 4
  %idx.ext14 = sext i32 %16 to i64
  %add.ptr15 = getelementptr inbounds float, float* %add.ptr, i64 %idx.ext14
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), float* %add.ptr15)
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %17 = load i32, i32* %j, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %18 = load i32, i32* %i, align 4
  %inc18 = add nsw i32 %18, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call20 = call i32 @fclose(%struct._IO_FILE* %19)
  %20 = load i32, i32* %size, align 4
  %21 = load i32*, i32** %size_p.addr, align 8
  store i32 %20, i32* %21, align 4
  %22 = load float*, float** %m, align 8
  %23 = load float**, float*** %mp.addr, align 8
  store float* %22, float** %23, align 8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end19, %if.then6, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #4

declare dso_local i32 @fscanf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @create_matrix_from_random(float** %mp, i32 %size) #0 {
entry:
  %retval = alloca i32, align 4
  %mp.addr = alloca float**, align 8
  %size.addr = alloca i32, align 4
  %l = alloca float*, align 8
  %u = alloca float*, align 8
  %m = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store float** %mp, float*** %mp.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %call = call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #5
  %0 = load i32, i32* %size.addr, align 4
  %1 = load i32, i32* %size.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv1 = sext i32 %mul to i64
  %mul2 = mul i64 %conv1, 4
  %call3 = call noalias i8* @malloc(i64 %mul2) #5
  %2 = bitcast i8* %call3 to float*
  store float* %2, float** %l, align 8
  %3 = load float*, float** %l, align 8
  %cmp = icmp eq float* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %size.addr, align 4
  %5 = load i32, i32* %size.addr, align 4
  %mul4 = mul nsw i32 %4, %5
  %conv5 = sext i32 %mul4 to i64
  %mul6 = mul i64 %conv5, 4
  %call7 = call noalias i8* @malloc(i64 %mul6) #5
  %6 = bitcast i8* %call7 to float*
  store float* %6, float** %u, align 8
  %7 = load float*, float** %u, align 8
  %cmp8 = icmp eq float* %7, null
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  %8 = load float*, float** %l, align 8
  %9 = bitcast float* %8 to i8*
  call void @free(i8* %9) #5
  store i32 1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %if.end10
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %size.addr, align 4
  %cmp11 = icmp slt i32 %10, %11
  br i1 %cmp11, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %size.addr, align 4
  %cmp13 = icmp slt i32 %12, %13
  br i1 %cmp13, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond12
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %j, align 4
  %cmp15 = icmp sgt i32 %14, %15
  br i1 %cmp15, label %if.then16, label %if.else

if.then16:                                        ; preds = %for.body14
  %call17 = call i32 @rand() #5
  %conv18 = sitofp i32 %call17 to float
  %div = fdiv float %conv18, 0x41E0000000000000
  %16 = load float*, float** %l, align 8
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %size.addr, align 4
  %mul19 = mul nsw i32 %17, %18
  %19 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul19, %19
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %16, i64 %idxprom
  store float %div, float* %arrayidx, align 4
  br label %if.end32

if.else:                                          ; preds = %for.body14
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* %j, align 4
  %cmp20 = icmp eq i32 %20, %21
  br i1 %cmp20, label %if.then21, label %if.else26

if.then21:                                        ; preds = %if.else
  %22 = load float*, float** %l, align 8
  %23 = load i32, i32* %i, align 4
  %24 = load i32, i32* %size.addr, align 4
  %mul22 = mul nsw i32 %23, %24
  %25 = load i32, i32* %j, align 4
  %add23 = add nsw i32 %mul22, %25
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds float, float* %22, i64 %idxprom24
  store float 1.000000e+00, float* %arrayidx25, align 4
  br label %if.end31

if.else26:                                        ; preds = %if.else
  %26 = load float*, float** %l, align 8
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* %size.addr, align 4
  %mul27 = mul nsw i32 %27, %28
  %29 = load i32, i32* %j, align 4
  %add28 = add nsw i32 %mul27, %29
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds float, float* %26, i64 %idxprom29
  store float 0.000000e+00, float* %arrayidx30, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.else26, %if.then21
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then16
  br label %for.inc

for.inc:                                          ; preds = %if.end32
  %30 = load i32, i32* %j, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  br label %for.inc33

for.inc33:                                        ; preds = %for.end
  %31 = load i32, i32* %i, align 4
  %inc34 = add nsw i32 %31, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc60, %for.end35
  %32 = load i32, i32* %j, align 4
  %33 = load i32, i32* %size.addr, align 4
  %cmp37 = icmp slt i32 %32, %33
  br i1 %cmp37, label %for.body38, label %for.end62

for.body38:                                       ; preds = %for.cond36
  store i32 0, i32* %i, align 4
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc57, %for.body38
  %34 = load i32, i32* %i, align 4
  %35 = load i32, i32* %size.addr, align 4
  %cmp40 = icmp slt i32 %34, %35
  br i1 %cmp40, label %for.body41, label %for.end59

for.body41:                                       ; preds = %for.cond39
  %36 = load i32, i32* %i, align 4
  %37 = load i32, i32* %j, align 4
  %cmp42 = icmp sgt i32 %36, %37
  br i1 %cmp42, label %if.then43, label %if.else48

if.then43:                                        ; preds = %for.body41
  %38 = load float*, float** %u, align 8
  %39 = load i32, i32* %j, align 4
  %40 = load i32, i32* %size.addr, align 4
  %mul44 = mul nsw i32 %39, %40
  %41 = load i32, i32* %i, align 4
  %add45 = add nsw i32 %mul44, %41
  %idxprom46 = sext i32 %add45 to i64
  %arrayidx47 = getelementptr inbounds float, float* %38, i64 %idxprom46
  store float 0.000000e+00, float* %arrayidx47, align 4
  br label %if.end56

if.else48:                                        ; preds = %for.body41
  %call49 = call i32 @rand() #5
  %conv50 = sitofp i32 %call49 to float
  %div51 = fdiv float %conv50, 0x41E0000000000000
  %42 = load float*, float** %u, align 8
  %43 = load i32, i32* %j, align 4
  %44 = load i32, i32* %size.addr, align 4
  %mul52 = mul nsw i32 %43, %44
  %45 = load i32, i32* %i, align 4
  %add53 = add nsw i32 %mul52, %45
  %idxprom54 = sext i32 %add53 to i64
  %arrayidx55 = getelementptr inbounds float, float* %42, i64 %idxprom54
  store float %div51, float* %arrayidx55, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.else48, %if.then43
  br label %for.inc57

for.inc57:                                        ; preds = %if.end56
  %46 = load i32, i32* %i, align 4
  %inc58 = add nsw i32 %46, 1
  store i32 %inc58, i32* %i, align 4
  br label %for.cond39

for.end59:                                        ; preds = %for.cond39
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %47 = load i32, i32* %j, align 4
  %inc61 = add nsw i32 %47, 1
  store i32 %inc61, i32* %j, align 4
  br label %for.cond36

for.end62:                                        ; preds = %for.cond36
  store i32 0, i32* %i, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc92, %for.end62
  %48 = load i32, i32* %i, align 4
  %49 = load i32, i32* %size.addr, align 4
  %cmp64 = icmp slt i32 %48, %49
  br i1 %cmp64, label %for.body65, label %for.end94

for.body65:                                       ; preds = %for.cond63
  store i32 0, i32* %j, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc89, %for.body65
  %50 = load i32, i32* %j, align 4
  %51 = load i32, i32* %size.addr, align 4
  %cmp67 = icmp slt i32 %50, %51
  br i1 %cmp67, label %for.body68, label %for.end91

for.body68:                                       ; preds = %for.cond66
  store i32 0, i32* %k, align 4
  br label %for.cond69

for.cond69:                                       ; preds = %for.inc86, %for.body68
  %52 = load i32, i32* %k, align 4
  %53 = load i32, i32* %i, align 4
  %54 = load i32, i32* %j, align 4
  %cmp70 = icmp slt i32 %53, %54
  br i1 %cmp70, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.cond69
  %55 = load i32, i32* %i, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.cond69
  %56 = load i32, i32* %j, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %55, %cond.true ], [ %56, %cond.false ]
  %cmp71 = icmp sle i32 %52, %cond
  br i1 %cmp71, label %for.body72, label %for.end88

for.body72:                                       ; preds = %cond.end
  %57 = load float*, float** %l, align 8
  %58 = load i32, i32* %i, align 4
  %59 = load i32, i32* %size.addr, align 4
  %mul73 = mul nsw i32 %58, %59
  %60 = load i32, i32* %k, align 4
  %add74 = add nsw i32 %mul73, %60
  %idxprom75 = sext i32 %add74 to i64
  %arrayidx76 = getelementptr inbounds float, float* %57, i64 %idxprom75
  %61 = load float, float* %arrayidx76, align 4
  %62 = load float*, float** %u, align 8
  %63 = load i32, i32* %j, align 4
  %64 = load i32, i32* %size.addr, align 4
  %mul77 = mul nsw i32 %63, %64
  %65 = load i32, i32* %k, align 4
  %add78 = add nsw i32 %mul77, %65
  %idxprom79 = sext i32 %add78 to i64
  %arrayidx80 = getelementptr inbounds float, float* %62, i64 %idxprom79
  %66 = load float, float* %arrayidx80, align 4
  %mul81 = fmul float %61, %66
  %67 = load float*, float** %m, align 8
  %68 = load i32, i32* %i, align 4
  %69 = load i32, i32* %size.addr, align 4
  %mul82 = mul nsw i32 %68, %69
  %70 = load i32, i32* %j, align 4
  %add83 = add nsw i32 %mul82, %70
  %idxprom84 = sext i32 %add83 to i64
  %arrayidx85 = getelementptr inbounds float, float* %67, i64 %idxprom84
  store float %mul81, float* %arrayidx85, align 4
  br label %for.inc86

for.inc86:                                        ; preds = %for.body72
  %71 = load i32, i32* %k, align 4
  %inc87 = add nsw i32 %71, 1
  store i32 %inc87, i32* %k, align 4
  br label %for.cond69

for.end88:                                        ; preds = %cond.end
  br label %for.inc89

for.inc89:                                        ; preds = %for.end88
  %72 = load i32, i32* %j, align 4
  %inc90 = add nsw i32 %72, 1
  store i32 %inc90, i32* %j, align 4
  br label %for.cond66

for.end91:                                        ; preds = %for.cond66
  br label %for.inc92

for.inc92:                                        ; preds = %for.end91
  %73 = load i32, i32* %i, align 4
  %inc93 = add nsw i32 %73, 1
  store i32 %inc93, i32* %i, align 4
  br label %for.cond63

for.end94:                                        ; preds = %for.cond63
  %74 = load float*, float** %l, align 8
  %75 = bitcast float* %74 to i8*
  call void @free(i8* %75) #5
  %76 = load float*, float** %u, align 8
  %77 = bitcast float* %76 to i8*
  call void @free(i8* %77) #5
  %78 = load float*, float** %m, align 8
  %79 = load float**, float*** %mp.addr, align 8
  store float* %78, float** %79, align 8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end94, %if.then9, %if.then
  %80 = load i32, i32* %retval, align 4
  ret i32 %80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @matrix_multiply(float* %inputa, float* %inputb, float* %output, i32 %size) #0 {
entry:
  %inputa.addr = alloca float*, align 8
  %inputb.addr = alloca float*, align 8
  %output.addr = alloca float*, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store float* %inputa, float** %inputa.addr, align 8
  store float* %inputb, float** %inputb.addr, align 8
  store float* %output, float** %output.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc16, %for.body
  %2 = load i32, i32* %k, align 4
  %3 = load i32, i32* %size.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end18

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %size.addr, align 4
  %cmp5 = icmp slt i32 %4, %5
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %6 = load float*, float** %inputa.addr, align 8
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %size.addr, align 4
  %mul = mul nsw i32 %7, %8
  %9 = load i32, i32* %k, align 4
  %add = add nsw i32 %mul, %9
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom
  %10 = load float, float* %arrayidx, align 4
  %11 = load float*, float** %inputb.addr, align 8
  %12 = load i32, i32* %k, align 4
  %13 = load i32, i32* %size.addr, align 4
  %mul7 = mul nsw i32 %12, %13
  %14 = load i32, i32* %j, align 4
  %add8 = add nsw i32 %mul7, %14
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds float, float* %11, i64 %idxprom9
  %15 = load float, float* %arrayidx10, align 4
  %mul11 = fmul float %10, %15
  %16 = load float*, float** %output.addr, align 8
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %size.addr, align 4
  %mul12 = mul nsw i32 %17, %18
  %19 = load i32, i32* %j, align 4
  %add13 = add nsw i32 %mul12, %19
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds float, float* %16, i64 %idxprom14
  store float %mul11, float* %arrayidx15, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %20 = load i32, i32* %j, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %21 = load i32, i32* %k, align 4
  %inc17 = add nsw i32 %21, 1
  store i32 %inc17, i32* %k, align 4
  br label %for.cond1

for.end18:                                        ; preds = %for.cond1
  br label %for.inc19

for.inc19:                                        ; preds = %for.end18
  %22 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %22, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local i32 @lud_verify(float* %m, float* %lu, i32 %matrix_dim) #3 {
entry:
  %m.addr = alloca float*, align 8
  %lu.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %tmp = alloca float*, align 8
  %sum = alloca float, align 4
  %l = alloca float, align 4
  %u = alloca float, align 4
  store float* %m, float** %m.addr, align 8
  store float* %lu, float** %lu.addr, align 8
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  %0 = load i32, i32* %matrix_dim.addr, align 4
  %1 = load i32, i32* %matrix_dim.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv = sext i32 %mul to i64
  %mul1 = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul1) #5
  %2 = bitcast i8* %call to float*
  store float* %2, float** %tmp, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %matrix_dim.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc21, %for.body
  %5 = load i32, i32* %j, align 4
  %6 = load i32, i32* %matrix_dim.addr, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %for.body4, label %for.end23

for.body4:                                        ; preds = %for.cond2
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %7 = load i32, i32* %k, align 4
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %j, align 4
  %cmp6 = icmp slt i32 %8, %9
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.cond5
  %10 = load i32, i32* %i, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.cond5
  %11 = load i32, i32* %j, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %10, %cond.true ], [ %11, %cond.false ]
  %cmp7 = icmp sle i32 %7, %cond
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %cond.end
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %k, align 4
  %cmp9 = icmp eq i32 %12, %13
  br i1 %cmp9, label %if.then, label %if.else

if.then:                                          ; preds = %for.body8
  store float 1.000000e+00, float* %l, align 4
  br label %if.end

if.else:                                          ; preds = %for.body8
  %14 = load float*, float** %lu.addr, align 8
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %matrix_dim.addr, align 4
  %mul10 = mul nsw i32 %15, %16
  %17 = load i32, i32* %k, align 4
  %add = add nsw i32 %mul10, %17
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %14, i64 %idxprom
  %18 = load float, float* %arrayidx, align 4
  store float %18, float* %l, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %19 = load float*, float** %lu.addr, align 8
  %20 = load i32, i32* %k, align 4
  %21 = load i32, i32* %matrix_dim.addr, align 4
  %mul11 = mul nsw i32 %20, %21
  %22 = load i32, i32* %j, align 4
  %add12 = add nsw i32 %mul11, %22
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds float, float* %19, i64 %idxprom13
  %23 = load float, float* %arrayidx14, align 4
  store float %23, float* %u, align 4
  %24 = load float, float* %l, align 4
  %25 = load float, float* %u, align 4
  %mul15 = fmul float %24, %25
  %26 = load float, float* %sum, align 4
  %add16 = fadd float %26, %mul15
  store float %add16, float* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %27 = load i32, i32* %k, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %cond.end
  %28 = load float, float* %sum, align 4
  %29 = load float*, float** %tmp, align 8
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* %matrix_dim.addr, align 4
  %mul17 = mul nsw i32 %30, %31
  %32 = load i32, i32* %j, align 4
  %add18 = add nsw i32 %mul17, %32
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds float, float* %29, i64 %idxprom19
  store float %28, float* %arrayidx20, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %33 = load i32, i32* %j, align 4
  %inc22 = add nsw i32 %33, 1
  store i32 %inc22, i32* %j, align 4
  br label %for.cond2

for.end23:                                        ; preds = %for.cond2
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %34 = load i32, i32* %i, align 4
  %inc25 = add nsw i32 %34, 1
  store i32 %inc25, i32* %i, align 4
  br label %for.cond

for.end26:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc60, %for.end26
  %35 = load i32, i32* %i, align 4
  %36 = load i32, i32* %matrix_dim.addr, align 4
  %cmp28 = icmp slt i32 %35, %36
  br i1 %cmp28, label %for.body29, label %for.end62

for.body29:                                       ; preds = %for.cond27
  store i32 0, i32* %j, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc57, %for.body29
  %37 = load i32, i32* %j, align 4
  %38 = load i32, i32* %matrix_dim.addr, align 4
  %cmp31 = icmp slt i32 %37, %38
  br i1 %cmp31, label %for.body32, label %for.end59

for.body32:                                       ; preds = %for.cond30
  %39 = load float*, float** %m.addr, align 8
  %40 = load i32, i32* %i, align 4
  %41 = load i32, i32* %matrix_dim.addr, align 4
  %mul33 = mul nsw i32 %40, %41
  %42 = load i32, i32* %j, align 4
  %add34 = add nsw i32 %mul33, %42
  %idxprom35 = sext i32 %add34 to i64
  %arrayidx36 = getelementptr inbounds float, float* %39, i64 %idxprom35
  %43 = load float, float* %arrayidx36, align 4
  %44 = load float*, float** %tmp, align 8
  %45 = load i32, i32* %i, align 4
  %46 = load i32, i32* %matrix_dim.addr, align 4
  %mul37 = mul nsw i32 %45, %46
  %47 = load i32, i32* %j, align 4
  %add38 = add nsw i32 %mul37, %47
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds float, float* %44, i64 %idxprom39
  %48 = load float, float* %arrayidx40, align 4
  %sub = fsub float %43, %48
  %call41 = call float @_ZSt4fabsf(float %sub)
  %conv42 = fpext float %call41 to double
  %cmp43 = fcmp ogt double %conv42, 1.000000e-04
  br i1 %cmp43, label %if.then44, label %if.end56

if.then44:                                        ; preds = %for.body32
  %49 = load i32, i32* %i, align 4
  %50 = load i32, i32* %j, align 4
  %51 = load float*, float** %m.addr, align 8
  %52 = load i32, i32* %i, align 4
  %53 = load i32, i32* %matrix_dim.addr, align 4
  %mul45 = mul nsw i32 %52, %53
  %54 = load i32, i32* %j, align 4
  %add46 = add nsw i32 %mul45, %54
  %idxprom47 = sext i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds float, float* %51, i64 %idxprom47
  %55 = load float, float* %arrayidx48, align 4
  %conv49 = fpext float %55 to double
  %56 = load float*, float** %tmp, align 8
  %57 = load i32, i32* %i, align 4
  %58 = load i32, i32* %matrix_dim.addr, align 4
  %mul50 = mul nsw i32 %57, %58
  %59 = load i32, i32* %j, align 4
  %add51 = add nsw i32 %mul50, %59
  %idxprom52 = sext i32 %add51 to i64
  %arrayidx53 = getelementptr inbounds float, float* %56, i64 %idxprom52
  %60 = load float, float* %arrayidx53, align 4
  %conv54 = fpext float %60 to double
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 %49, i32 %50, double %conv49, double %conv54)
  br label %if.end56

if.end56:                                         ; preds = %if.then44, %for.body32
  br label %for.inc57

for.inc57:                                        ; preds = %if.end56
  %61 = load i32, i32* %j, align 4
  %inc58 = add nsw i32 %61, 1
  store i32 %inc58, i32* %j, align 4
  br label %for.cond30

for.end59:                                        ; preds = %for.cond30
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %62 = load i32, i32* %i, align 4
  %inc61 = add nsw i32 %62, 1
  store i32 %inc61, i32* %i, align 4
  br label %for.cond27

for.end62:                                        ; preds = %for.cond27
  %call63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0))
  %63 = load float*, float** %tmp, align 8
  %64 = bitcast float* %63 to i8*
  call void @free(i8* %64) #5
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local float @_ZSt4fabsf(float %__x) #0 comdat {
entry:
  %__x.addr = alloca float, align 4
  store float %__x, float* %__x.addr, align 4
  %0 = load float, float* %__x.addr, align 4
  %1 = call float @llvm.fabs.f32(float %0)
  ret float %1
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @matrix_duplicate(float* %src, float** %dst, i32 %matrix_dim) #0 {
entry:
  %src.addr = alloca float*, align 8
  %dst.addr = alloca float**, align 8
  %matrix_dim.addr = alloca i32, align 4
  %s = alloca i32, align 4
  %p = alloca float*, align 8
  store float* %src, float** %src.addr, align 8
  store float** %dst, float*** %dst.addr, align 8
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  %0 = load i32, i32* %matrix_dim.addr, align 4
  %1 = load i32, i32* %matrix_dim.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv = sext i32 %mul to i64
  %mul1 = mul i64 %conv, 4
  %conv2 = trunc i64 %mul1 to i32
  store i32 %conv2, i32* %s, align 4
  %2 = load i32, i32* %s, align 4
  %conv3 = sext i32 %2 to i64
  %call = call noalias i8* @malloc(i64 %conv3) #5
  %3 = bitcast i8* %call to float*
  store float* %3, float** %p, align 8
  %4 = load float*, float** %p, align 8
  %5 = bitcast float* %4 to i8*
  %6 = load float*, float** %src.addr, align 8
  %7 = bitcast float* %6 to i8*
  %8 = load i32, i32* %s, align 4
  %conv4 = sext i32 %8 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %7, i64 %conv4, i1 false)
  %9 = load float*, float** %p, align 8
  %10 = load float**, float*** %dst.addr, align 8
  store float* %9, float** %10, align 8
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline optnone uwtable
define dso_local void @print_matrix(float* %m, i32 %matrix_dim) #3 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %matrix_dim.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end7

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %matrix_dim.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load float*, float** %m.addr, align 8
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %matrix_dim.addr, align 4
  %mul = mul nsw i32 %5, %6
  %7 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %7
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %8 = load float, float* %arrayidx, align 4
  %conv = fpext float %8 to double
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %10, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local i32 @create_matrix(float** %mp, i32 %size) #3 {
entry:
  %retval = alloca i32, align 4
  %mp.addr = alloca float**, align 8
  %size.addr = alloca i32, align 4
  %m = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %lamda = alloca float, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %coe_i = alloca float, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store float** %mp, float*** %mp.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store float 0xBF50624DE0000000, float* %lamda, align 4
  %0 = load i32, i32* %size.addr, align 4
  %mul = mul nsw i32 2, %0
  %sub = sub nsw i32 %mul, 1
  %1 = zext i32 %sub to i64
  %2 = call i8* @llvm.stacksave()
  store i8* %2, i8** %saved_stack, align 8
  %vla = alloca float, i64 %1, align 16
  store i64 %1, i64* %__vla_expr0, align 8
  store float 0.000000e+00, float* %coe_i, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load float, float* %lamda, align 4
  %6 = load i32, i32* %i, align 4
  %conv = sitofp i32 %6 to float
  %mul1 = fmul float %5, %conv
  %call = call float @_ZSt3expf(float %mul1)
  %mul2 = fmul float 1.000000e+01, %call
  store float %mul2, float* %coe_i, align 4
  %7 = load i32, i32* %size.addr, align 4
  %sub3 = sub nsw i32 %7, 1
  %8 = load i32, i32* %i, align 4
  %add = add nsw i32 %sub3, %8
  store i32 %add, i32* %j, align 4
  %9 = load float, float* %coe_i, align 4
  %10 = load i32, i32* %j, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds float, float* %vla, i64 %idxprom
  store float %9, float* %arrayidx, align 4
  %11 = load i32, i32* %size.addr, align 4
  %sub4 = sub nsw i32 %11, 1
  %12 = load i32, i32* %i, align 4
  %sub5 = sub nsw i32 %sub4, %12
  store i32 %sub5, i32* %j, align 4
  %13 = load float, float* %coe_i, align 4
  %14 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %14 to i64
  %arrayidx7 = getelementptr inbounds float, float* %vla, i64 %idxprom6
  store float %13, float* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %size.addr, align 4
  %conv8 = sext i32 %16 to i64
  %mul9 = mul i64 4, %conv8
  %17 = load i32, i32* %size.addr, align 4
  %conv10 = sext i32 %17 to i64
  %mul11 = mul i64 %mul9, %conv10
  %call12 = call noalias i8* @malloc(i64 %mul11) #5
  %18 = bitcast i8* %call12 to float*
  store float* %18, float** %m, align 8
  %19 = load float*, float** %m, align 8
  %cmp13 = icmp eq float* %19, null
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  store i32 1, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc32, %if.end
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* %size.addr, align 4
  %cmp15 = icmp slt i32 %20, %21
  br i1 %cmp15, label %for.body16, label %for.end34

for.body16:                                       ; preds = %for.cond14
  store i32 0, i32* %j, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc29, %for.body16
  %22 = load i32, i32* %j, align 4
  %23 = load i32, i32* %size.addr, align 4
  %cmp18 = icmp slt i32 %22, %23
  br i1 %cmp18, label %for.body19, label %for.end31

for.body19:                                       ; preds = %for.cond17
  %24 = load i32, i32* %size.addr, align 4
  %sub20 = sub nsw i32 %24, 1
  %25 = load i32, i32* %i, align 4
  %sub21 = sub nsw i32 %sub20, %25
  %26 = load i32, i32* %j, align 4
  %add22 = add nsw i32 %sub21, %26
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds float, float* %vla, i64 %idxprom23
  %27 = load float, float* %arrayidx24, align 4
  %28 = load float*, float** %m, align 8
  %29 = load i32, i32* %i, align 4
  %30 = load i32, i32* %size.addr, align 4
  %mul25 = mul nsw i32 %29, %30
  %31 = load i32, i32* %j, align 4
  %add26 = add nsw i32 %mul25, %31
  %idxprom27 = sext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds float, float* %28, i64 %idxprom27
  store float %27, float* %arrayidx28, align 4
  br label %for.inc29

for.inc29:                                        ; preds = %for.body19
  %32 = load i32, i32* %j, align 4
  %inc30 = add nsw i32 %32, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond17

for.end31:                                        ; preds = %for.cond17
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %33 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %33, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond14

for.end34:                                        ; preds = %for.cond14
  %34 = load float*, float** %m, align 8
  %35 = load float**, float*** %mp.addr, align 8
  store float* %34, float** %35, align 8
  store i32 0, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %for.end34, %if.then
  %36 = load i8*, i8** %saved_stack, align 8
  call void @llvm.stackrestore(i8* %36)
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #5

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local float @_ZSt3expf(float %__x) #0 comdat {
entry:
  %__x.addr = alloca float, align 4
  store float %__x, float* %__x.addr, align 4
  %0 = load float, float* %__x.addr, align 4
  %call = call float @expf(float %0) #5
  ret float %call
}

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #6

; Function Attrs: nounwind
declare dso_local float @expf(float) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
