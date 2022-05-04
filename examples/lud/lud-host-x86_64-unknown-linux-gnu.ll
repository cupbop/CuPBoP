; ModuleID = 'lud-host-x86_64-unknown-linux-gnu.bc'
source_filename = "cuda/lud.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.option = type { i8*, i32, i32*, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__stopwatch_t = type { %struct.timeval, %struct.timeval }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [29 x i8] c"WG size of kernel = %d X %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"::vs:i:\00", align 1
@_ZL12long_options = internal global [4 x %struct.option] [%struct.option { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i32 1, i32* null, i32 105 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i32 1, i32* null, i32 115 }, %struct.option { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 0, i32* null, i32 118 }, %struct.option zeroinitializer], align 16
@optarg = external dso_local global i8*, align 8
@_ZL9do_verify = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [44 x i8] c"Generate input matrix internally, size =%d\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [16 x i8] c"invalid option\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"missing argument\0A\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Usage: %s [-v] [-s matrix_size|-i input_file]\0A\00", align 1
@optind = external dso_local global i32, align 4
@.str.6 = private unnamed_addr constant [29 x i8] c"Reading matrix from file %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"error create matrix from file %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"Creating matrix internally size=%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [40 x i8] c"error create matrix internally size=%d\0A\00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"No input file specified!\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Before LUD\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"Time consumed(ms): %lf\0A\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"After LUD\0A\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c">>>Verify<<<<\0A\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"verify\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %matrix_dim = alloca i32, align 4
  %opt = alloca i32, align 4
  %option_index = alloca i32, align 4
  %ret = alloca i32, align 4
  %input_file = alloca i8*, align 8
  %m = alloca float*, align 8
  %d_m = alloca float*, align 8
  %mm = alloca float*, align 8
  %sw = alloca %struct.__stopwatch_t, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @cudaSetDevice(i32 0)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i32 16, i32 16)
  store i32 32, i32* %matrix_dim, align 4
  store i32 0, i32* %option_index, align 4
  store i8* null, i8** %input_file, align 8
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %argv.addr, align 8
  %call2 = call i32 @getopt_long(i32 %0, i8** %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), %struct.option* getelementptr inbounds ([4 x %struct.option], [4 x %struct.option]* @_ZL12long_options, i64 0, i64 0), i32* %option_index) #5
  store i32 %call2, i32* %opt, align 4
  %cmp = icmp ne i32 %call2, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %opt, align 4
  switch i32 %2, label %sw.default [
    i32 105, label %sw.bb
    i32 118, label %sw.bb3
    i32 115, label %sw.bb4
    i32 63, label %sw.bb7
    i32 58, label %sw.bb9
  ]

sw.bb:                                            ; preds = %while.body
  %3 = load i8*, i8** @optarg, align 8
  store i8* %3, i8** %input_file, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  store i32 1, i32* @_ZL9do_verify, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %while.body
  %4 = load i8*, i8** @optarg, align 8
  %call5 = call i32 @atoi(i8* %4) #6
  store i32 %call5, i32* %matrix_dim, align 4
  %5 = load i32, i32* %matrix_dim, align 4
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.2, i64 0, i64 0), i32 %5)
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0))
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0))
  br label %sw.epilog

sw.default:                                       ; preds = %while.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %9, i64 0
  %10 = load i8*, i8** %arrayidx, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i64 0, i64 0), i8* %10)
  call void @exit(i32 1) #7
  unreachable

sw.epilog:                                        ; preds = %sw.bb9, %sw.bb7, %sw.bb4, %sw.bb3, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* @optind, align 4
  %12 = load i32, i32* %argc.addr, align 4
  %cmp12 = icmp slt i32 %11, %12
  br i1 %cmp12, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %13 = load i32, i32* @optind, align 4
  %cmp13 = icmp eq i32 %13, 1
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.end
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = load i8**, i8*** %argv.addr, align 8
  %arrayidx14 = getelementptr inbounds i8*, i8** %15, i64 0
  %16 = load i8*, i8** %arrayidx14, align 8
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i64 0, i64 0), i8* %16)
  call void @exit(i32 1) #7
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %17 = load i8*, i8** %input_file, align 8
  %tobool = icmp ne i8* %17, null
  br i1 %tobool, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.end
  %18 = load i8*, i8** %input_file, align 8
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i64 0, i64 0), i8* %18)
  %19 = load i8*, i8** %input_file, align 8
  %call18 = call i32 @create_matrix_from_file(float** %m, i8* %19, i32* %matrix_dim)
  store i32 %call18, i32* %ret, align 4
  %20 = load i32, i32* %ret, align 4
  %cmp19 = icmp ne i32 %20, 0
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.then16
  store float* null, float** %m, align 8
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = load i8*, i8** %input_file, align 8
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.7, i64 0, i64 0), i8* %22)
  call void @exit(i32 1) #7
  unreachable

if.end22:                                         ; preds = %if.then16
  br label %if.end34

if.else:                                          ; preds = %if.end
  %23 = load i32, i32* %matrix_dim, align 4
  %tobool23 = icmp ne i32 %23, 0
  br i1 %tobool23, label %if.then24, label %if.else31

if.then24:                                        ; preds = %if.else
  %24 = load i32, i32* %matrix_dim, align 4
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i64 0, i64 0), i32 %24)
  %25 = load i32, i32* %matrix_dim, align 4
  %call26 = call i32 @create_matrix(float** %m, i32 %25)
  store i32 %call26, i32* %ret, align 4
  %26 = load i32, i32* %ret, align 4
  %cmp27 = icmp ne i32 %26, 0
  br i1 %cmp27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.then24
  store float* null, float** %m, align 8
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = load i32, i32* %matrix_dim, align 4
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), i32 %28)
  call void @exit(i32 1) #7
  unreachable

if.end30:                                         ; preds = %if.then24
  br label %if.end33

if.else31:                                        ; preds = %if.else
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.10, i64 0, i64 0))
  call void @exit(i32 1) #7
  unreachable

if.end33:                                         ; preds = %if.end30
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end22
  %29 = load i32, i32* @_ZL9do_verify, align 4
  %tobool35 = icmp ne i32 %29, 0
  br i1 %tobool35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %if.end34
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i64 0, i64 0))
  %30 = load float*, float** %m, align 8
  %31 = load i32, i32* %matrix_dim, align 4
  call void @matrix_duplicate(float* %30, float** %mm, i32 %31)
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %if.end34
  %32 = bitcast float** %d_m to i8**
  %33 = load i32, i32* %matrix_dim, align 4
  %34 = load i32, i32* %matrix_dim, align 4
  %mul = mul nsw i32 %33, %34
  %conv = sext i32 %mul to i64
  %mul39 = mul i64 %conv, 4
  %call40 = call i32 @cudaMalloc(i8** %32, i64 %mul39)
  call void @stopwatch_start(%struct.__stopwatch_t* %sw)
  %35 = load float*, float** %d_m, align 8
  %36 = bitcast float* %35 to i8*
  %37 = load float*, float** %m, align 8
  %38 = bitcast float* %37 to i8*
  %39 = load i32, i32* %matrix_dim, align 4
  %40 = load i32, i32* %matrix_dim, align 4
  %mul41 = mul nsw i32 %39, %40
  %conv42 = sext i32 %mul41 to i64
  %mul43 = mul i64 %conv42, 4
  %call44 = call i32 @cudaMemcpy(i8* %36, i8* %38, i64 %mul43, i32 1)
  %41 = load float*, float** %d_m, align 8
  %42 = load i32, i32* %matrix_dim, align 4
  call void @_Z8lud_cudaPfi(float* %41, i32 %42)
  %43 = load float*, float** %m, align 8
  %44 = bitcast float* %43 to i8*
  %45 = load float*, float** %d_m, align 8
  %46 = bitcast float* %45 to i8*
  %47 = load i32, i32* %matrix_dim, align 4
  %48 = load i32, i32* %matrix_dim, align 4
  %mul45 = mul nsw i32 %47, %48
  %conv46 = sext i32 %mul45 to i64
  %mul47 = mul i64 %conv46, 4
  %call48 = call i32 @cudaMemcpy(i8* %44, i8* %46, i64 %mul47, i32 2)
  call void @stopwatch_stop(%struct.__stopwatch_t* %sw)
  %call49 = call double @get_interval_by_sec(%struct.__stopwatch_t* %sw)
  %mul50 = fmul contract double 1.000000e+03, %call49
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), double %mul50)
  %49 = load float*, float** %d_m, align 8
  %50 = bitcast float* %49 to i8*
  %call52 = call i32 @cudaFree(i8* %50)
  %51 = load i32, i32* @_ZL9do_verify, align 4
  %tobool53 = icmp ne i32 %51, 0
  br i1 %tobool53, label %if.then54, label %if.end58

if.then54:                                        ; preds = %if.end38
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i64 0, i64 0))
  %call56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i64 0, i64 0))
  %52 = load float*, float** %mm, align 8
  %53 = load float*, float** %m, align 8
  %54 = load i32, i32* %matrix_dim, align 4
  %call57 = call i32 @lud_verify(float* %52, float* %53, i32 %54)
  %55 = load float*, float** %mm, align 8
  %56 = bitcast float* %55 to i8*
  call void @free(i8* %56) #5
  br label %if.end58

if.end58:                                         ; preds = %if.then54, %if.end38
  %57 = load float*, float** %m, align 8
  %58 = bitcast float* %57 to i8*
  call void @free(i8* %58) #5
  ret i32 0
}

declare dso_local i32 @cudaSetDevice(i32) #1

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local i32 @create_matrix_from_file(float**, i8*, i32*) #1

declare dso_local i32 @create_matrix(float**, i32) #1

declare dso_local void @matrix_duplicate(float*, float**, i32) #1

declare dso_local i32 @cudaMalloc(i8**, i64) #1

declare dso_local void @stopwatch_start(%struct.__stopwatch_t*) #1

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #1

declare dso_local void @_Z8lud_cudaPfi(float*, i32) #1

declare dso_local void @stopwatch_stop(%struct.__stopwatch_t*) #1

declare dso_local double @get_interval_by_sec(%struct.__stopwatch_t*) #1

declare dso_local i32 @cudaFree(i8*) #1

declare dso_local i32 @lud_verify(float*, float*, i32) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
