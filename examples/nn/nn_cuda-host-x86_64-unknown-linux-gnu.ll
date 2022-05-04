; ModuleID = 'nn_cuda-host-x86_64-unknown-linux-gnu.bc'
source_filename = "nn_cuda.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.latLong = type { float, float }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" }
%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" = type { %struct.record*, %struct.record*, %struct.record* }
%struct.record = type { [53 x i8], float }
%"class.std::vector.0" = type { %"struct.std::_Vector_base.1" }
%"struct.std::_Vector_base.1" = type { %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" }
%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" = type { %struct.latLong*, %struct.latLong*, %struct.latLong* }
%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32 }
%struct.CUuuid_st = type { [16 x i8] }
%"class.std::allocator.2" = type { i8 }
%"class.std::allocator" = type { i8 }
%"class.__gnu_cxx::__normal_iterator" = type { %struct.latLong* }
%"class.__gnu_cxx::__normal_iterator.5" = type { %struct.record* }
%"class.__gnu_cxx::new_allocator" = type { i8 }
%"class.__gnu_cxx::new_allocator.3" = type { i8 }

$_ZNSt6vectorI6recordSaIS0_EEC2Ev = comdat any

$_ZNSt6vectorI7latLongSaIS0_EEC2Ev = comdat any

$_ZN4dim3C2Ejjj = comdat any

$_ZNSt6vectorI7latLongSaIS0_EEixEm = comdat any

$_ZNSt6vectorI6recordSaIS0_EEixEm = comdat any

$_ZNSt6vectorI7latLongSaIS0_EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZNSt6vectorI6recordSaIS0_EED2Ev = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_ = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev = comdat any

$_ZNSaI6recordEC2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev = comdat any

$_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev = comdat any

$_ZSt8_DestroyIP6recordEvT_S2_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_ = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m = comdat any

$_ZNSaI6recordED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordED2Ev = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev = comdat any

$_ZNSaI7latLongEC2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev = comdat any

$_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev = comdat any

$_ZSt8_DestroyIP7latLongEvT_S2_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_ = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m = comdat any

$_ZNSaI7latLongED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_ = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE17_M_realloc_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE3endEv = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_ = comdat any

$_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc = comdat any

$_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_ = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE5beginEv = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm = comdat any

$_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_ = comdat any

$_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv = comdat any

$_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv = comdat any

$_ZSt3maxImERKT_S2_S2_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_ = comdat any

$_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv = comdat any

$_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E = comdat any

$_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_ = comdat any

$_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_ = comdat any

$_ZSt4copyIP7latLongS1_ET0_T_S3_S2_ = comdat any

$_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__miter_baseIP7latLongET_S2_ = comdat any

$_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__niter_baseIP7latLongET_S2_ = comdat any

$_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_ = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE17_M_realloc_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE3endEv = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_ = comdat any

$_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc = comdat any

$_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE5beginEv = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm = comdat any

$_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_ = comdat any

$_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv = comdat any

$_ZNKSt6vectorI6recordSaIS0_EE4sizeEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_ = comdat any

$_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv = comdat any

$_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E = comdat any

$_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_ = comdat any

$_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_ = comdat any

$_ZSt4copyIP6recordS1_ET0_T_S3_S2_ = comdat any

$_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__miter_baseIP6recordET_S2_ = comdat any

$_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__niter_baseIP6recordET_S2_ = comdat any

$_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_ = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_ = comdat any

@.str = private unnamed_addr constant [12 x i8] c"before all\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"after before all\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"before call\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"after call\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"before find\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"after find\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"%s --> Distance=%f\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [24 x i8] c"error reading filelist\0A\00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"error opening a db\0A\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"Nearest Neighbor Usage\0A\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [90 x i8] c"nearestNeighbor [filename] -r [int] -lat [float] -lng [float] [-hqt] [-p [int] -d [int]]\0A\00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c"example:\0A\00", align 1
@.str.15 = private unnamed_addr constant [55 x i8] c"$ ./nearestNeighbor filelist.txt -r 5 -lat 30 -lng 90\0A\00", align 1
@.str.16 = private unnamed_addr constant [59 x i8] c"filename     the filename that lists the data input files\0A\00", align 1
@.str.17 = private unnamed_addr constant [60 x i8] c"-r [int]     the number of records to return (default: 10)\0A\00", align 1
@.str.18 = private unnamed_addr constant [62 x i8] c"-lat [float] the latitude for nearest neighbors (default: 0)\0A\00", align 1
@.str.19 = private unnamed_addr constant [63 x i8] c"-lng [float] the longitude for nearest neighbors (default: 0)\0A\00", align 1
@.str.20 = private unnamed_addr constant [36 x i8] c"-h, --help   Display the help file\0A\00", align 1
@.str.21 = private unnamed_addr constant [52 x i8] c"-q           Quiet mode. Suppress all text output.\0A\00", align 1
@.str.22 = private unnamed_addr constant [40 x i8] c"-t           Print timing information.\0A\00", align 1
@.str.23 = private unnamed_addr constant [73 x i8] c"-p [int]     Choose the platform (must choose both platform and device)\0A\00", align 1
@.str.24 = private unnamed_addr constant [71 x i8] c"-d [int]     Choose the device (must choose both platform and device)\0A\00", align 1
@.str.25 = private unnamed_addr constant [60 x i8] c"Notes: 1. The filename is required as the first parameter.\0A\00", align 1
@.str.26 = private unnamed_addr constant [61 x i8] c"       2. If you declare either the device or the platform,\0A\00", align 1
@.str.27 = private unnamed_addr constant [35 x i8] c"          you must declare both.\0A\0A\00", align 1
@.str.28 = private unnamed_addr constant [26 x i8] c"vector::_M_realloc_insert\00", align 1
@0 = private unnamed_addr constant [24 x i8] c"_Z6euclidP7latLongPfiff\00", align 1
@1 = private constant [8313 x i8] c"P\EDU\BA\01\00\10\00h \00\00\00\00\00\00\02\00\01\01@\00\00\00\A8\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\01\00=\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\013\07\00\00\00\00\00\00\00\02\00\BE\00e\00\00\00\00\00\00\00\00\00\00\00\00\19\00\00\00\00\00\00\C0\16\00\00\00\00\00\00=\05=\00@\008\00\03\00@\00\09\00\01\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text._Z6euclidP7latLongPfiff\00.nv.info._Z6euclidP7latLongPfiff\00.nv.shared._Z6euclidP7latLongPfiff\00.nv.global\00.nv.constant0._Z6euclidP7latLongPfiff\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00_Z6euclidP7latLongPfiff\00.text._Z6euclidP7latLongPfiff\00.nv.info._Z6euclidP7latLongPfiff\00.nv.shared._Z6euclidP7latLongPfiff\00.nv.global\00blockDim\00gridDim\00blockIdx\00threadIdx\00$_Z6euclidP7latLongPfiff$__cuda_sm20_sqrt_rn_f32_slowpath\00.nv.constant0._Z6euclidP7latLongPfiff\00_param\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00J\00\00\00\03\00\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\AC\00\00\00\03\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\B7\00\00\00\01\00\08\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\C0\00\00\00\01\00\08\00\03\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\C8\00\00\00\01\00\08\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\D1\00\00\00\01\00\08\00\02\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\DB\00\00\00\22\00\07\00\D0\0E\00\00\00\00\00\00p\02\00\00\00\00\00\00\15\01\00\00\03\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\12\10\07\00\00\00\00\00\00\00\00\00@\11\00\00\00\00\00\00\04/\08\00\09\00\00\00\0D\00\00\00\04#\08\00\07\00\00\00\00\00\00\00\04\12\08\00\07\00\00\00\00\00\00\00\04\11\08\00\07\00\00\00\00\00\00\00\04#\08\00\09\00\00\00\00\00\00\00\04\12\08\00\09\00\00\008\00\00\00\04\11\08\00\09\00\00\008\00\00\00\010\00\00\01*\00\00\04\0A\08\00\08\00\00\00@\01\1C\00\03\19\1C\00\04\17\0C\00\00\00\00\00\04\00\18\00\00\F0\11\00\04\17\0C\00\00\00\00\00\03\00\14\00\00\F0\11\00\04\17\0C\00\00\00\00\00\02\00\10\00\00\F0\11\00\04\17\0C\00\00\00\00\00\01\00\08\00\00\F0!\00\04\17\0C\00\00\00\00\00\00\00\00\00\00\F0!\00\03\1B\FF\00\04\1D\08\00\18\04\00\008\04\00\00\04\1C\04\00\C8\0E\00\00\04\1E\04\00\90\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\EF\1F\E0\FD\03<d\00\01\00\87\00\80\07\98L\01\01\87\FC\FF\FF\0F\1C\00\00w\03\00\00\C8\F0\EF\1F\E0\FD\03\BC\7F\00\07\01\07\00\80\03l[\0F\00\80\00\00\00@\E2\C0\00\10\00\00\00\A0\E3\EF\1F\E0!\03\BC\7F\00\00\01\F7\0F\00\00\10\\\00\0A\07\00\00\00\E0\\\02\00\07\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\00\F7\0F\80\07\98\\\00\00'\00\80\07\98\\\04\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\00\07\00\80\07\98\\\04\00G\00\80\07\98\\\02\00\17\00\80\07\98L\EF\1F\E0\FD\03\BC\7F\00\00\00\17\04\80\07\98L\02\03'\00\00\80\10\\\00\04\07\00\00\08\10\\\EF\1F\E0!\03\BC\7F\00\03\F0\87\15\00\00\00\01\03\03\07\00\00\00\94\EF\03\007\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\04\F0G\15\00\00\00\01\04\04\07\00\00\00\94\EF\04\00G\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\05\F0\07\15\00\00\00\01\05\05\07\00\00\00\94\EF\05\00W\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\06\F0\87\14\00\00\00\01\06\06\07\00\00\00\95\EF\0A\00g\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0B\00w\00\80\07\98\\\0A\00\A7\00\80\07\98\\\0B\00\B7\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\06\F0\07\14\00\00\00\01\06\06\07\00\00\00\95\EF\08\00g\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\09\00w\00\80\07\98\\\08\00\87\00\80\07\98\\\09\00\97\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00\A7\00\80\07\98\\\07\00\B7\00\80\07\98\\\06\00g\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\07\00w\00\80\07\98\\\06\00g\00\80\07\98\\\07\00w\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\08\00\87\00\80\07\98\\\09\00\97\00\80\07\98\\\08\00\87\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\09\00\97\00\80\07\98\\\08\00\87\00\80\07\98\\\09\00\97\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0B\02\87\00\00\00\10\1C\0C\00\F7\0F\00\08\10\\\0B\00\B7\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0C\00\C7\00\80\07\98\\\0A\0B\F7\0F\00\80\D7[\0B\0B\F7\0F@\06\D8[\EF\1F\E0\FD\03\BCg\00\0A\00\A7\00\80\07\98\\\0B\00\B7\00\80\07\98\\\08\0A\07\00\00\00\B0\A0\EF\1F\E0\FD\03\BC\7F\00\09\02\07\01\00\00\10\1C\0A\00\F7\0F\00\08\10\\\09\00\97\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0A\00\A7\00\80\07\98\\\08\09\F7\0F\00\80\D7[\09\09\F7\0F@\05\D8[\EF\1F\E0\FD\03\BCg\00\08\00\87\00\80\07\98\\\09\00\97\00\80\07\98\\\06\08\07\00\00\00\B0\A0\EF\1F\E0\FD\03\BC\7F\00\07\02\87\01\00\00\10\1C\08\00\F7\0F\00\08\10\\\07\00w\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\08\00\87\00\80\07\98\\\06\07\F7\0F\00\80\D7[\07\07\F7\0F@\04\D8[\EF\1F\E0\FD\03\BCg\00\06\00g\00\80\07\98\\\07\00w\00\80\07\98\\\05\06\07\00\00\00\90\A0\EF\1F\E0\FD\03\BC\7F\00\07\02\C7\01\00\00\10\1C\05\00\F7\0F\00\08\10\\\07\00w\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\05\00W\00\80\07\98\\\06\07\F7\0F\00\80\D7[\07\07\F7\0F\C0\02\D8[\EF\1F\E0\FD\03\BCg\00\06\00g\00\80\07\98\\\07\00w\00\80\07\98\\\04\06\07\00\00\00\90\A0\EF\1F\E0\FD\03\BC\7F\00\05\02\07\02\00\00\10\1C\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00g\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\EF\1F\E0\FD\03\BCg\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\A0\EF\1F\E0\FD\03<d\00\03\00'\00\80\07\98L\04\00W\00\80\07\98L\05\00g\02\00\00\C8\F0\EF\1F\E0!\03<d\00\05\00W\00\80\07\98\\\04\04W\00\00\038\\\05\00W\02\00\00\C8\F0\EF\1F\E0\FD\03<d\00\05\00W\00\80\07\98\\\04\04W\00\00\00\10\\\03\03G\00\00\038\\\0F\19\E0\FD\03\BC\7F\00\04\00\17\02\00\00\C8\F0\04\00G\00\80\07\98\\\03\03G\00\00\00\10\\\EF\1F\E0\FD\03\BC\7F\00\05\02G\02\00\00\10\1C\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00g\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\EF\1F\E0\FD\03\BCg\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\A0\EF\1F\E0\FD\03\BC\7F\00\05\02\87\00\00\00\10\1C\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\04\04\07\00\00\00\B0\80\EF\1F\E0\FD\03\BC\7F\00\06\00G\00\80\07\98\\\07\00W\00\80\07\98\\\05\02G\02\00\00\10\1C\EF\1F\E0\FD\03\BC\7F\00\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\04\00G\00\80\07\98\\\EF\1F\E0!\03<d\00\05\00W\00\80\07\98\\\04\04\07\00\00\00\90\80\04:G\00\00\00\E0\\\EF\1F\E0\FD\03\BC\7F\00\03\04\F7\01\00\00)8\04\00G\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\05\047\00\C0\01\F86\04\047\00\00\00H8\04\06G\00\00\80\10\\\EF\1F\E0\FD\03\BC\7F\00\05\07W\00\00\08\10\\\07\02\87\02\00\00\10\1C\03\00\F7\0F\00\08\10\\\EF\1F\E0\FD\03\BC\7F\00\07\00w\00\80\07\98\\\03\007\00\80\07\98\\\06\07\F7\0F\00\80\D7[\EF\1F\E0\FD\03\BC\7F\00\07\07\F7\0F\C0\01\D8[\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BCg\00\06\00g\00\80\07\98\\\07\00w\00\80\07\98\\\04\06\07\00\00\00\B0\A0\EF\1F\E0\FD\03\BC\7F\00\05\02G\02\00\00\10\1C\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\80\EF\1F\E0\FD\03\BC\7F\00\05\02\87\01\00\00\10\1C\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00g\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\04\04\07\00\00\00\90\80\EF\1F\E0\FD\03\BC\7F\00\07\03G\00\80\03m[\02\00'\00\80\07\98\\\00\00\07\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0F\00\00u\00\00@\E2\0F\00\07\00\00\00@\E2\05\02\07\01\00\00\10\1C\EF\1F\E0\FD\03\BC\7F\00\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\04\00G\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\05\00W\00\80\07\98\\\04\04\07\00\00\00\B0\80\06\00G\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\07\00W\00\80\07\98\\\05\02G\02\00\00\10\1C\03\00\F7\0F\00\08\10\\\EF\1F\E0\FD\03\BC\7F\00\05\00W\00\80\07\98\\\03\007\00\80\07\98\\\04\05\F7\0F\00\80\D7[\EF\1F\E0\FD\03\BC\7F\00\05\05\F7\0F\C0\01\D8[\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\0F\19\E0!\03\BC\7F\00\04\04\07\00\00\00\90\80\04:G\00\00\00\E0\\\03\04\F7\01\00\00)8\EF\1F\E0\FD\03\BC\7F\00\04\00G\00\80\07\98\\\03\007\00\80\07\98\\\05\04'\00\C0\01\F86\EF\1F\E0\FD\03\BC\7F\00\04\04'\00\00\00H8\04\06G\00\00\80\10\\\05\07W\00\00\08\10\\\EF\1F\E0\FD\03\BC\7F\00\07\02\07\03\00\00\10\1C\03\00\F7\0F\00\08\10\\\07\00w\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\06\07\F7\0F\00\80\D7[\07\07\F7\0F\C0\01\D8[\EF\1F\E0\FD\03\BC\7F\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\06\00g\00\80\07\98\\\EF\1F\E0=\03\BC\7F\00\07\00w\00\80\07\98\\\04\06\07\00\00\00\B0\A0\05\02\C7\01\00\00\10\1C\EF\1F\E0\FD\03\BC\7F\00\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\04\00G\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\80\05\02\87\02\00\00\10\1C\EF\1F\E0\FD\03\BC\7F\00\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\06\00g\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\04\00G\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\05\00W\00\80\07\98\\\04\04\07\00\00\00\B0\80\07\00G\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\08\00W\00\80\07\98\\\05\00w\00\80\07\98\\\06\00\87\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\04\00G\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\05\00W\00\80\07\98\\\04\04\07\00\00\00\90\80\03\03G\00\00 X\\\EF\1F\E0\FD\03\BC\7F\00\05\02\07\02\00\00\10\1C\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00g\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\06\04\07\00\00\00\90\80\EF\1F\E0\FD\03\BC\7F\00\05\07G\00\00\00\10\1C\07\08\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\07\00w\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\03\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\04\04\07\00\00\00\90\80\EF\1F\E0\FD\03\BC\7F\00\04\06G\00\00 X\\\04\04G\00\00\00h\\\03\037\00\00\02\80Y\EF\1F\E0\FD\03\BC\7F\00\05\02G\00\00\00\10\1C\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00g\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\EF\1F\E0\FD\03\BCg\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\A0\EF\1F\E0\FD\03\BC\7F\00\05\02G\00\00\00\10\1C\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\80\EF\1F\E0\FD\03\BC\7F\00\05\02\F7\0F\00\80\10\\\06\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\06\00g\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F@\03\D8[\EF\1F\E0\FD\03\BCg\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\03\04\07\00\00\00\90\A0\EF\1F\E0\FD\03\BC\7F\00\05\02\F7\0F\00\80\10\\\03\00\F7\0F\00\08\10\\\05\00W\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\04\05\F7\0F\00\80\D7[\05\05\F7\0F\C0\01\D8[\EF\1F\E0\FD\03<d\00\04\00G\00\80\07\98\\\05\00W\00\80\07\98\\\04\04\07\00\00\00\90\80\EF\1F\E0\FD\03\BC\7F\00\04\00G\00\80\07\98\\\04\00G\00\80\07\98\\\04\00G\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\00G\00\80\07\98\\\03\00G\00\80\07\98\\\03\03\07\00\000\0F\1C\EF\1F\E0\FD\03\BC\7F\00\05\F0\F7\FF\FF'\07\01\07\03W\00\80\03f[\04\00G\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\00\00\00\0C\00\00\90\E2\0F\00\80\05\00\00@\E2\04\00G\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\00G\00\80\07\98\\@\00\80\19\00\00`\E2\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\03\007\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\0F\00\07\00\00\00\F8\F0\03\04W\00\00\00\80P\05\03G\00\00\10h\\\0F\19\E0\FD\03\BC\7F\00\06\0AW\00\000\A8\\\06\06W\00\00\02\80Y\04\F0\07\00\00\F0\03\01\EF\1F\E0\FD\03\BC\7F\00\04\03G\00\00\10h\\\04\06G\00\80\02\80Y\03\00G\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0F\00\07\00\00\00\F8\F0\03\007\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\04\007\00\80\07\98\\\03\02\07\03\00\00\10\1C\EF\1F\E0\FD\03\BC\7F\00\00\00\F7\0F\00\08\10\\\03\007\00\80\07\98\\\00\00\07\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\02\03\F7\0F\00\80\D7[\03\03\F7\0F@\00\D8[\02\00'\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\03\007\00\80\07\98\\\02\02\07\00\00\00\B0\80\00\00'\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\02\007\00\80\07\98\\\03\00\07\00\80\07\98\\\00\00'\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\02\03\F7\0F\00\80\D7[\03\03\F7\0F@\00\D8[\02\00'\00\80\07\98\\\EF\1F\E0=\03\BC\7F\00\03\007\00\80\07\98\\\04\02\07\00\00\00\90\A0\0F\00\07\00\00\00@\E2\EF\1F\E0\FD\03\BC\7F\00\0F\00\07\00\00\00\00\E3\03\007\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\03\007\00\80\07\98\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\04\03\F7\FF\FF\FF\07\04\05\00\F7\0F\80\07\98\\\07\04W\00\80\03k[\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\00\00\00\1C\00\00\A0\E2\0F\00\00\02\00\00@\E2\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\03\007\00\80\07\98\\\0F\00\07\00\00\00@\E3\EF\1F\E0\FD\03\BC\7F\00\04\00\F7\0F\80\07\98\\\07\03G\00\80\83\B1[\07\80\07\E0\80\03\90P\EF\1F\E0\FD\03\BC\7F\00\0F\00\00\02\00\00@\E2\03\F0\F7\FF\FF\FF\07\01\03\007\00\80\07\98\\\EF\1F\E0!\03\BC\7F\00\0F\00\07\00\00\00@\E3\04\0A7\00\00\10\AA\\\05\F0\07\00\00\F8\07\01\EF\1F\E0\FD\03\BC\7F\00\07\04W\00\80\83\B3[\04\00G\00\80\07\98\\\0F\00\00\03\00\00@\E2\EF\1F\E0\FD\03\BC\7F\00\04\F0\07\00\00\F8\03\01\03\03G\00\00\10X\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\0F\00\07\00\00\00@\E3\05\F0\07\00\00\F8\07\01\07\04W\00\80\83\B2[\EF\1F\E0\FD\03\BC\7F\00\07\80\07\E0\80\03\90P\0F\00\00\02\00\00@\E2\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\0F\00\07\00\00\00@\E3\04\F0\07\00\00\F8\05\01\EF\1F\E0\FD\03<d\00\05\00\F7\0F\80\07\98\\\03\03G\00\80\02\80Y\04\03W\00\00\00\80P\EF\1F\E0!\03\BC\7F\00\05\047\00\00\10h\\\06\0AW\00\000\A8\\\06\06W\00\80\01\80Y\EF\1F\E0\FD\03\BC\7F\00\07\F0\07\00\00\F0\03\01\07\04w\00\00\10h\\\06\06w\00\80\02\80Y\EF\1F\E0\FD\03\BC\7F\00\04\F0\07\00\00\F8\02\01\04\06G\00\00\10h\\\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\00G\00\80\07\98\\\0F\00\07\00\00\00@\E3\03\007\00\80\07\98\\\EF\1F\E0\FD\03\BC\7F\00\03\007\00\80\07\98\\\03\007\00\80\07\98\\\0F\00\07\00\00\00 \E3\FF\07\00\FC\00\80\1F\00\0F\00\07\FF\FF\0F@\E2\00\0F\07\00\00\00\B0P\00\0F\07\00\00\00\B0P\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\C5\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\01\00\00\00\00\00\00B\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00H\02\00\00\00\00\00\00\F0\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00)\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\008\03\00\00\00\00\00\00T\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00P\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\8C\03\00\00\00\00\00\00\88\00\00\00\00\00\00\00\03\00\00\00\07\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\9F\00\00\00\01\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\04\00\00\00\00\00\00\\\01\00\00\00\00\00\00\00\00\00\00\07\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\05\00\00\00\00\00\00@\11\00\00\00\00\00\00\03\00\00\00\09\00\00\0D \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\94\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\16\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\05\00\00\00\00\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00\14\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\9C\12\00\00\00\00\00\00\9C\12\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\06\00\00\00\C0\16\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\01\01H\00\00\008\06\00\00\00\00\00\004\06\00\00@\00\00\00\04\00\06\00=\00\00\00\00\00\00\00\00\00\00\00\11 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\FE\18\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F0 \0A\0A\0A\0A.version 6.4\0A.target sm_61\0A.address_size 64.\00\FF\11global .align 1 .b8 blockDim[1];\22\00\03Ogrid!\00\0A\01C\00?Idx\22\00\07dthread#\00\F0\0B\0A.weak .func (.param .b32 \12\00\F5\07_retval0) cudaMalloc(\0A&\00'64\18\00\11_\16\00?_0, \00\0B\A61\0A)\0A{\0A.loc\99\00\118\99\00!__\15\00\A0_depot0[16\C2\002regI\00;%SP\0F\00\15L\10\00\8932 %r<2>!\00\D3rd<3>;\0A\0Amov.u2\00\1B,e\00b;\0Acvta\8D\00\04%\00\13,\\\00\22ld\C8\00\02\18\00nrd2, [\CE\00\1E])\00\1F1)\00\01a0];\0Ast#\00\81[%SP+0],,\00\0A\16\00\128\16\00\222;\B6\00\01\D8\00a1, 999(\00\02g\00\00\EF\00\18[\9E\01\03M\00\AF1;\0Aret;\0A\0A}\D6\01\1A\FE\02FuncGetAttributes\E1\01\0D#\00\0E\EC\01\0F+\00\06\0F\F7\01\1B\1F1\F7\01Q\1F1\F7\01!\0E\D9\00\0F\02\02\0F\0E8\01\0F\0D\02\8DhDevice\B4\00\0E\0E\02\0E$\00\0F\0F\02\00/32,\00\0B\1F1,\00\18\1F2<\02\13\1F2<\02\1F\1D4<\02\1F2<\02\0C\1F2<\02\13\01_\00\04;\02\0F\D9\00\07\1D]4\00\1F14\00\06\0Fp\02\10\0E\9A\01\0Fq\02\12(32q\02\0B\15\00!12\16\00\09\86\02\1F3\86\02\15\1F3\86\02#2Get\CB\00\0E}\02\05\1B\00\04\DA\00\0F\1C\02\13?3[8W\04.\0F\1B\02\0D\1F3W\04\19\04\B3\01\0D\D0\00\0F\AA\01\06\0F\05\04W\F0\04OccupancyMaxActiveBV\08\FE\03sPerMultiprocessor\9F\01\0F;\00\16\0EB\06\0FC\00%\0EJ\04\0FC\00\1E\1F2\86\00/\1F3\88\02\13O4[32\89\02\1C\1D3\89\02\1F4\89\02\0C\1F4\89\02\19\133\89\02\0F\F1\00\1E\0F\BC\04\00\0FK\00$/2]w\07\00\0FL\00$\0F\1F\05\01\0F\98\00%\0F\A7\07\1D\097\05\186M\05\04,\00\2224-\00\183\CF\03\1F2\CF\03\15\1F2\CF\03L\9FWithFlags\D8\03(\05D\00\0E\E1\03\0FL\00'\0F\EA\030\0CL\00\1F2\98\008\1F3\98\008\1F4H\04\13O5[40\EC\08.\0FH\04\0D\1F5\EC\08\1C\0F\F9\00+\1F]\9C\040\0D\9A\01\0F\A5\040\0D:\02\0F\AE\041\0D\DB\02\0F\B7\041\0D|\03\0F\C0\04I\08-\00\1F3$\0A6\F6\17visible .entry _Z6euclidP7latLongPfiff\A0\04\00\9A\00\0F%\00\04\0E\81\04\0F-\00\0F\07b\04\00\C6\00\0F-\00\0B\07C\04\1Ff-\00\0E\1F3-\00\12\0F\05\04\1B?6[5\F1\0C\16wpred %p\D7\0A\00\87\00k%f<14>)\04\1E1r\08/17+\04\0C\1F6+\04\12\02s\00\00-\03\0F\00\01\0C\1D]5\00\1F15\00\0E\0F\EC\03\00\0F5\00\0F\0F\CD\03\01\0F\A0\00\0F\0F\AE\03\01\0Fl\00\0F#0]%\01#to\99\13\07\E8\04\02\82\03\01[\0E\0A\1C\00\144q\03\0F;\00\03\145\D3\03\0F;\00\00\116\1C\00\1F5\EF\03\02\1A6\16\00\03\EF\03*d4\D9\03'24\06\04\15f\16\00\01D\00\1Bf\16\00\02\05\04+f2\DB\08{%ntid.x\1B\04\\%ncta\18\00\00\EB\00\02\17\00\B1y;\0Amul.lo.s\1A\00#5,7\00(r41\00\1561\00cx;\0Aadd.\00$7,3\00\1B6H\00#8,\95\00(r7H\00\\9, %tF\00410,2\00\1B9\EF\04\03\1C\05\110\06\02\03m\01$7,`\01\01\16\00\02D\005d8,3\00T;\0AshlR\03#9,\1E\00\133s\00\03E\02#0,L\00\00$\00\0A\A3\01\144\BF\05\03w\00\02\E2\02\181a\00\06\17\00%2,\C1\01\92;\0Asetp.ge\94\003p1,8\00\00'\00\F2\0B;\0A@%p1 bra LBB6_2;\0Abra.uni\10\0021;\0A\08\00\17:\EB\00\05u\00)16\ED\00/12\EE\00\04413, \00\1A2\F0\00$4,Q\00\01'\00\0B\F2\00\03\AC\02!14f\00\02\09\04%3,\85\02\08\7F\01515,'\01\07.\00\104\16\00\00\1E\00\00\91\00Sub.rn\19\00\225,L\00(%f]\00%6,\CC\02\07\16\00\147E\00,+4G\00\228,6\002%f7k\02\05\1A\00$9,\1F\00f8;\0Afma\1A\00\01\E5\01%f5\05\00\1A9H\03\124]\03\170\81\00\05q\01*4],\00\120,\00\181,\00\04\85\01\01\FE\077qrty\00\01\F0\00)128\01%6,m\01\07\\\00\22rd\12\04;f13\12\02\132\12\02\B02:\0Aret;\0A\0A}\0A\00\00\00\00\00", section ".nv_fatbin", align 8
@__cuda_fatbin_wrapper = internal constant { i32, i32, i8*, i8* } { i32 1180844977, i32 1, i8* getelementptr inbounds ([8313 x i8], [8313 x i8]* @1, i64 0, i64 0), i8* null }, section ".nvFatBinSegment", align 8
@__cuda_gpubin_handle = internal global i8** null, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z6euclidP7latLongPfiff(%struct.latLong* %d_locations, float* %d_distances, i32 %numRecords, float %lat, float %lng) #0 {
entry:
  %d_locations.addr = alloca %struct.latLong*, align 8
  %d_distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %lat.addr = alloca float, align 4
  %lng.addr = alloca float, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca i8*, align 8
  %grid_dim.coerce = alloca { i64, i32 }, align 8
  %block_dim.coerce = alloca { i64, i32 }, align 8
  store %struct.latLong* %d_locations, %struct.latLong** %d_locations.addr, align 8
  store float* %d_distances, float** %d_distances.addr, align 8
  store i32 %numRecords, i32* %numRecords.addr, align 4
  store float %lat, float* %lat.addr, align 4
  store float %lng, float* %lng.addr, align 4
  %kernel_args = alloca i8*, i64 5, align 16
  %0 = bitcast %struct.latLong** %d_locations.addr to i8*
  %1 = getelementptr i8*, i8** %kernel_args, i32 0
  store i8* %0, i8** %1
  %2 = bitcast float** %d_distances.addr to i8*
  %3 = getelementptr i8*, i8** %kernel_args, i32 1
  store i8* %2, i8** %3
  %4 = bitcast i32* %numRecords.addr to i8*
  %5 = getelementptr i8*, i8** %kernel_args, i32 2
  store i8* %4, i8** %5
  %6 = bitcast float* %lat.addr to i8*
  %7 = getelementptr i8*, i8** %kernel_args, i32 3
  store i8* %6, i8** %7
  %8 = bitcast float* %lng.addr to i8*
  %9 = getelementptr i8*, i8** %kernel_args, i32 4
  store i8* %8, i8** %9
  %10 = call i32 @__cudaPopCallConfiguration(%struct.dim3* %grid_dim, %struct.dim3* %block_dim, i64* %shmem_size, i8** %stream)
  %11 = load i64, i64* %shmem_size, align 8
  %12 = load i8*, i8** %stream, align 8
  %13 = bitcast { i64, i32 }* %grid_dim.coerce to i8*
  %14 = bitcast %struct.dim3* %grid_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 12, i1 false)
  %15 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 0
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 1
  %18 = load i32, i32* %17, align 8
  %19 = bitcast { i64, i32 }* %block_dim.coerce to i8*
  %20 = bitcast %struct.dim3* %block_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %19, i8* align 8 %20, i64 12, i1 false)
  %21 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 0
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 1
  %24 = load i32, i32* %23, align 8
  %25 = bitcast i8* %12 to %struct.CUstream_st*
  %call = call i32 @cudaLaunchKernel(i8* bitcast (void (%struct.latLong*, float*, i32, float, float)* @_Z6euclidP7latLongPfiff to i8*), i64 %16, i32 %18, i64 %22, i32 %24, i8** %kernel_args, i64 %11, %struct.CUstream_st* %25)
  br label %setup.end

setup.end:                                        ; preds = %entry
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**)

declare dso_local i32 @cudaLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.CUstream_st*)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %lat = alloca float, align 4
  %lng = alloca float, align 4
  %quiet = alloca i32, align 4
  %timing = alloca i32, align 4
  %platform = alloca i32, align 4
  %device = alloca i32, align 4
  %records = alloca %"class.std::vector", align 8
  %locations = alloca %"class.std::vector.0", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %filename = alloca [100 x i8], align 16
  %resultsCount = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %numRecords = alloca i32, align 4
  %distances = alloca float*, align 8
  %d_locations = alloca %struct.latLong*, align 8
  %d_distances = alloca float*, align 8
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %maxGridX = alloca i64, align 8
  %threadsPerBlock = alloca i64, align 8
  %totalDeviceMemory = alloca i64, align 8
  %freeDeviceMemory = alloca i64, align 8
  %blocks = alloca i64, align 8
  %gridY = alloca i64, align 8
  %gridX = alloca i64, align 8
  %gridDim = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp46 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp46.coerce = alloca { i64, i32 }, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @cudaSetDevice(i32 0)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %quiet, align 4
  store i32 0, i32* %timing, align 4
  store i32 0, i32* %platform, align 4
  store i32 0, i32* %device, align 4
  call void @_ZNSt6vectorI6recordSaIS0_EEC2Ev(%"class.std::vector"* %records)
  invoke void @_ZNSt6vectorI7latLongSaIS0_EEC2Ev(%"class.std::vector.0"* %locations)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  store i32 10, i32* %resultsCount, align 4
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %argv.addr, align 8
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i64 0, i64 0
  %call3 = invoke i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %0, i8** %1, i8* %arraydecay, i32* %resultsCount, float* %lat, float* %lng, i32* %quiet, i32* %timing, i32* %platform, i32* %device)
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %invoke.cont
  %tobool = icmp ne i32 %call3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %invoke.cont2
  invoke void @_Z10printUsagev()
          to label %invoke.cont4 unwind label %lpad1

invoke.cont4:                                     ; preds = %if.then
  store i32 0, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %cleanup, %entry
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  store i8* %3, i8** %exn.slot, align 8
  %4 = extractvalue { i8*, i32 } %2, 1
  store i32 %4, i32* %ehselector.slot, align 4
  br label %ehcleanup

lpad1:                                            ; preds = %invoke.cont80, %if.end79, %invoke.cont74, %invoke.cont70, %for.body, %invoke.cont63, %invoke.cont61, %invoke.cont59, %invoke.cont55, %invoke.cont53, %kcall.end, %kcall.configok, %invoke.cont48, %invoke.cont44, %invoke.cont42, %invoke.cont38, %invoke.cont36, %invoke.cont32, %invoke.cont27, %invoke.cont16, %invoke.cont14, %invoke.cont12, %if.end11, %invoke.cont5, %if.end, %if.then, %invoke.cont
  %5 = landingpad { i8*, i32 }
          cleanup
  %6 = extractvalue { i8*, i32 } %5, 0
  store i8* %6, i8** %exn.slot, align 8
  %7 = extractvalue { i8*, i32 } %5, 1
  store i32 %7, i32* %ehselector.slot, align 4
  invoke void @_ZNSt6vectorI7latLongSaIS0_EED2Ev(%"class.std::vector.0"* %locations)
          to label %invoke.cont85 unwind label %terminate.lpad

if.end:                                           ; preds = %invoke.cont2
  %call6 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0))
          to label %invoke.cont5 unwind label %lpad1

invoke.cont5:                                     ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i64 0, i64 0
  %call9 = invoke i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* %arraydecay7, %"class.std::vector"* dereferenceable(24) %records, %"class.std::vector.0"* dereferenceable(24) %locations)
          to label %invoke.cont8 unwind label %lpad1

invoke.cont8:                                     ; preds = %invoke.cont5
  store i32 %call9, i32* %numRecords, align 4
  %8 = load i32, i32* %resultsCount, align 4
  %9 = load i32, i32* %numRecords, align 4
  %cmp = icmp sgt i32 %8, %9
  br i1 %cmp, label %if.then10, label %if.end11

if.then10:                                        ; preds = %invoke.cont8
  %10 = load i32, i32* %numRecords, align 4
  store i32 %10, i32* %resultsCount, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %invoke.cont8
  %call13 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0))
          to label %invoke.cont12 unwind label %lpad1

invoke.cont12:                                    ; preds = %if.end11
  %call15 = invoke i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 0)
          to label %invoke.cont14 unwind label %lpad1

invoke.cont14:                                    ; preds = %invoke.cont12
  %call17 = invoke i32 @cudaDeviceSynchronize()
          to label %invoke.cont16 unwind label %lpad1

invoke.cont16:                                    ; preds = %invoke.cont14
  %maxGridSize = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 11
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %maxGridSize, i64 0, i64 0
  %11 = load i32, i32* %arrayidx, align 8
  %conv = sext i32 %11 to i64
  store i64 %conv, i64* %maxGridX, align 8
  store i64 256, i64* %threadsPerBlock, align 8
  %12 = load i32, i32* %numRecords, align 4
  %conv18 = sext i32 %12 to i64
  %13 = load i64, i64* %threadsPerBlock, align 8
  %add = add i64 %conv18, %13
  %sub = sub i64 %add, 1
  %14 = load i64, i64* %threadsPerBlock, align 8
  %div = udiv i64 %sub, %14
  store i64 %div, i64* %blocks, align 8
  %15 = load i64, i64* %blocks, align 8
  %16 = load i64, i64* %maxGridX, align 8
  %add19 = add i64 %15, %16
  %sub20 = sub i64 %add19, 1
  %17 = load i64, i64* %maxGridX, align 8
  %div21 = udiv i64 %sub20, %17
  store i64 %div21, i64* %gridY, align 8
  %18 = load i64, i64* %blocks, align 8
  %19 = load i64, i64* %gridY, align 8
  %add22 = add i64 %18, %19
  %sub23 = sub i64 %add22, 1
  %20 = load i64, i64* %gridY, align 8
  %div24 = udiv i64 %sub23, %20
  store i64 %div24, i64* %gridX, align 8
  %21 = load i64, i64* %gridX, align 8
  %conv25 = trunc i64 %21 to i32
  %22 = load i64, i64* %gridY, align 8
  %conv26 = trunc i64 %22 to i32
  invoke void @_ZN4dim3C2Ejjj(%struct.dim3* %gridDim, i32 %conv25, i32 %conv26, i32 1)
          to label %invoke.cont27 unwind label %lpad1

invoke.cont27:                                    ; preds = %invoke.cont16
  %23 = load i32, i32* %numRecords, align 4
  %conv28 = sext i32 %23 to i64
  %mul = mul i64 4, %conv28
  %call29 = call noalias i8* @malloc(i64 %mul) #12
  %24 = bitcast i8* %call29 to float*
  store float* %24, float** %distances, align 8
  %25 = bitcast %struct.latLong** %d_locations to i8**
  %26 = load i32, i32* %numRecords, align 4
  %conv30 = sext i32 %26 to i64
  %mul31 = mul i64 8, %conv30
  %call33 = invoke i32 @cudaMalloc(i8** %25, i64 %mul31)
          to label %invoke.cont32 unwind label %lpad1

invoke.cont32:                                    ; preds = %invoke.cont27
  %27 = bitcast float** %d_distances to i8**
  %28 = load i32, i32* %numRecords, align 4
  %conv34 = sext i32 %28 to i64
  %mul35 = mul i64 4, %conv34
  %call37 = invoke i32 @cudaMalloc(i8** %27, i64 %mul35)
          to label %invoke.cont36 unwind label %lpad1

invoke.cont36:                                    ; preds = %invoke.cont32
  %29 = load %struct.latLong*, %struct.latLong** %d_locations, align 8
  %30 = bitcast %struct.latLong* %29 to i8*
  %call39 = invoke dereferenceable(8) %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EEixEm(%"class.std::vector.0"* %locations, i64 0)
          to label %invoke.cont38 unwind label %lpad1

invoke.cont38:                                    ; preds = %invoke.cont36
  %31 = bitcast %struct.latLong* %call39 to i8*
  %32 = load i32, i32* %numRecords, align 4
  %conv40 = sext i32 %32 to i64
  %mul41 = mul i64 8, %conv40
  %call43 = invoke i32 @cudaMemcpy(i8* %30, i8* %31, i64 %mul41, i32 1)
          to label %invoke.cont42 unwind label %lpad1

invoke.cont42:                                    ; preds = %invoke.cont38
  %call45 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0))
          to label %invoke.cont44 unwind label %lpad1

invoke.cont44:                                    ; preds = %invoke.cont42
  %33 = bitcast %struct.dim3* %agg.tmp to i8*
  %34 = bitcast %struct.dim3* %gridDim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %33, i8* align 4 %34, i64 12, i1 false)
  %35 = load i64, i64* %threadsPerBlock, align 8
  %conv47 = trunc i64 %35 to i32
  invoke void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp46, i32 %conv47, i32 1, i32 1)
          to label %invoke.cont48 unwind label %lpad1

invoke.cont48:                                    ; preds = %invoke.cont44
  %36 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*
  %37 = bitcast %struct.dim3* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %36, i8* align 4 %37, i64 12, i1 false)
  %38 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0
  %39 = load i64, i64* %38, align 4
  %40 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  %42 = bitcast { i64, i32 }* %agg.tmp46.coerce to i8*
  %43 = bitcast %struct.dim3* %agg.tmp46 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %42, i8* align 4 %43, i64 12, i1 false)
  %44 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp46.coerce, i32 0, i32 0
  %45 = load i64, i64* %44, align 4
  %46 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp46.coerce, i32 0, i32 1
  %47 = load i32, i32* %46, align 4
  %call50 = invoke i32 @__cudaPushCallConfiguration(i64 %39, i32 %41, i64 %45, i32 %47, i64 0, i8* null)
          to label %invoke.cont49 unwind label %lpad1

invoke.cont49:                                    ; preds = %invoke.cont48
  %tobool51 = icmp ne i32 %call50, 0
  br i1 %tobool51, label %kcall.end, label %kcall.configok

kcall.configok:                                   ; preds = %invoke.cont49
  %48 = load %struct.latLong*, %struct.latLong** %d_locations, align 8
  %49 = load float*, float** %d_distances, align 8
  %50 = load i32, i32* %numRecords, align 4
  %51 = load float, float* %lat, align 4
  %52 = load float, float* %lng, align 4
  invoke void @_Z6euclidP7latLongPfiff(%struct.latLong* %48, float* %49, i32 %50, float %51, float %52)
          to label %invoke.cont52 unwind label %lpad1

invoke.cont52:                                    ; preds = %kcall.configok
  br label %kcall.end

kcall.end:                                        ; preds = %invoke.cont52, %invoke.cont49
  %call54 = invoke i32 @cudaDeviceSynchronize()
          to label %invoke.cont53 unwind label %lpad1

invoke.cont53:                                    ; preds = %kcall.end
  %call56 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0))
          to label %invoke.cont55 unwind label %lpad1

invoke.cont55:                                    ; preds = %invoke.cont53
  %53 = load float*, float** %distances, align 8
  %54 = bitcast float* %53 to i8*
  %55 = load float*, float** %d_distances, align 8
  %56 = bitcast float* %55 to i8*
  %57 = load i32, i32* %numRecords, align 4
  %conv57 = sext i32 %57 to i64
  %mul58 = mul i64 4, %conv57
  %call60 = invoke i32 @cudaMemcpy(i8* %54, i8* %56, i64 %mul58, i32 2)
          to label %invoke.cont59 unwind label %lpad1

invoke.cont59:                                    ; preds = %invoke.cont55
  %call62 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0))
          to label %invoke.cont61 unwind label %lpad1

invoke.cont61:                                    ; preds = %invoke.cont59
  %58 = load float*, float** %distances, align 8
  %59 = load i32, i32* %numRecords, align 4
  %60 = load i32, i32* %resultsCount, align 4
  invoke void @_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii(%"class.std::vector"* dereferenceable(24) %records, float* %58, i32 %59, i32 %60)
          to label %invoke.cont63 unwind label %lpad1

invoke.cont63:                                    ; preds = %invoke.cont61
  %call65 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0))
          to label %invoke.cont64 unwind label %lpad1

invoke.cont64:                                    ; preds = %invoke.cont63
  %61 = load i32, i32* %quiet, align 4
  %tobool66 = icmp ne i32 %61, 0
  br i1 %tobool66, label %if.end79, label %if.then67

if.then67:                                        ; preds = %invoke.cont64
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then67
  %62 = load i32, i32* %i, align 4
  %63 = load i32, i32* %resultsCount, align 4
  %cmp68 = icmp slt i32 %62, %63
  br i1 %cmp68, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %64 = load i32, i32* %i, align 4
  %conv69 = sext i32 %64 to i64
  %call71 = invoke dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %records, i64 %conv69)
          to label %invoke.cont70 unwind label %lpad1

invoke.cont70:                                    ; preds = %for.body
  %recString = getelementptr inbounds %struct.record, %struct.record* %call71, i32 0, i32 0
  %arraydecay72 = getelementptr inbounds [53 x i8], [53 x i8]* %recString, i64 0, i64 0
  %65 = load i32, i32* %i, align 4
  %conv73 = sext i32 %65 to i64
  %call75 = invoke dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %records, i64 %conv73)
          to label %invoke.cont74 unwind label %lpad1

invoke.cont74:                                    ; preds = %invoke.cont70
  %distance = getelementptr inbounds %struct.record, %struct.record* %call75, i32 0, i32 1
  %66 = load float, float* %distance, align 4
  %conv76 = fpext float %66 to double
  %call78 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* %arraydecay72, double %conv76)
          to label %invoke.cont77 unwind label %lpad1

invoke.cont77:                                    ; preds = %invoke.cont74
  br label %for.inc

for.inc:                                          ; preds = %invoke.cont77
  %67 = load i32, i32* %i, align 4
  %inc = add nsw i32 %67, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end79

if.end79:                                         ; preds = %for.end, %invoke.cont64
  %68 = load float*, float** %distances, align 8
  %69 = bitcast float* %68 to i8*
  call void @free(i8* %69) #12
  %70 = load %struct.latLong*, %struct.latLong** %d_locations, align 8
  %71 = bitcast %struct.latLong* %70 to i8*
  %call81 = invoke i32 @cudaFree(i8* %71)
          to label %invoke.cont80 unwind label %lpad1

invoke.cont80:                                    ; preds = %if.end79
  %72 = load float*, float** %d_distances, align 8
  %73 = bitcast float* %72 to i8*
  %call83 = invoke i32 @cudaFree(i8* %73)
          to label %invoke.cont82 unwind label %lpad1

invoke.cont82:                                    ; preds = %invoke.cont80
  store i32 0, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont82, %invoke.cont4
  invoke void @_ZNSt6vectorI7latLongSaIS0_EED2Ev(%"class.std::vector.0"* %locations)
          to label %invoke.cont84 unwind label %lpad

invoke.cont84:                                    ; preds = %cleanup
  call void @_ZNSt6vectorI6recordSaIS0_EED2Ev(%"class.std::vector"* %records)
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 4
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %cleanup.cont
  ]

cleanup.cont:                                     ; preds = %invoke.cont84, %invoke.cont84
  %74 = load i32, i32* %retval, align 4
  ret i32 %74

invoke.cont85:                                    ; preds = %lpad1
  br label %ehcleanup

ehcleanup:                                        ; preds = %invoke.cont85, %lpad
  invoke void @_ZNSt6vectorI6recordSaIS0_EED2Ev(%"class.std::vector"* %records)
          to label %invoke.cont87 unwind label %terminate.lpad

invoke.cont87:                                    ; preds = %ehcleanup
  br label %eh.resume

eh.resume:                                        ; preds = %invoke.cont87
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val88 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val88

terminate.lpad:                                   ; preds = %ehcleanup, %lpad1
  %75 = landingpad { i8*, i32 }
          catch i8* null
  %76 = extractvalue { i8*, i32 } %75, 0
  call void @__clang_call_terminate(i8* %76) #13
  unreachable

unreachable:                                      ; preds = %invoke.cont84
  unreachable
}

declare dso_local i32 @cudaSetDevice(i32) #3

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI6recordSaIS0_EEC2Ev(%"class.std::vector"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev(%"struct.std::_Vector_base"* %0)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI7latLongSaIS0_EEC2Ev(%"class.std::vector.0"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev(%"struct.std::_Vector_base.1"* %0)
  ret void
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: noinline optnone uwtable
define dso_local i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %argc, i8** %argv, i8* %filename, i32* %r, float* %lat, float* %lng, i32* %q, i32* %t, i32* %p, i32* %d) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %filename.addr = alloca i8*, align 8
  %r.addr = alloca i32*, align 8
  %lat.addr = alloca float*, align 8
  %lng.addr = alloca float*, align 8
  %q.addr = alloca i32*, align 8
  %t.addr = alloca i32*, align 8
  %p.addr = alloca i32*, align 8
  %d.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %flag = alloca i8, align 1
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i32* %r, i32** %r.addr, align 8
  store float* %lat, float** %lat.addr, align 8
  store float* %lng, float** %lng.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  store i32* %t, i32** %t.addr, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32* %d, i32** %d.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 8
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 1
  %3 = load i8*, i8** %arrayidx, align 8
  %call = call i8* @strncpy(i8* %1, i8* %3, i64 100)
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %argc.addr, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8**, i8*** %argv.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i64 %idxprom
  %8 = load i8*, i8** %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 0
  %9 = load i8, i8* %arrayidx3, align 1
  %conv = sext i8 %9 to i32
  %cmp4 = icmp eq i32 %conv, 45
  br i1 %cmp4, label %if.then5, label %if.end44

if.then5:                                         ; preds = %for.body
  %10 = load i8**, i8*** %argv.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds i8*, i8** %10, i64 %idxprom6
  %12 = load i8*, i8** %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 1
  %13 = load i8, i8* %arrayidx8, align 1
  store i8 %13, i8* %flag, align 1
  %14 = load i8, i8* %flag, align 1
  %conv9 = sext i8 %14 to i32
  switch i32 %conv9, label %sw.epilog [
    i32 114, label %sw.bb
    i32 108, label %sw.bb13
    i32 104, label %sw.bb31
    i32 113, label %sw.bb32
    i32 116, label %sw.bb33
    i32 112, label %sw.bb34
    i32 100, label %sw.bb39
  ]

sw.bb:                                            ; preds = %if.then5
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  %16 = load i8**, i8*** %argv.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds i8*, i8** %16, i64 %idxprom10
  %18 = load i8*, i8** %arrayidx11, align 8
  %call12 = call i32 @atoi(i8* %18) #14
  %19 = load i32*, i32** %r.addr, align 8
  store i32 %call12, i32* %19, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %if.then5
  %20 = load i8**, i8*** %argv.addr, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %21 to i64
  %arrayidx15 = getelementptr inbounds i8*, i8** %20, i64 %idxprom14
  %22 = load i8*, i8** %arrayidx15, align 8
  %arrayidx16 = getelementptr inbounds i8, i8* %22, i64 2
  %23 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %23 to i32
  %cmp18 = icmp eq i32 %conv17, 97
  br i1 %cmp18, label %if.then19, label %if.else

if.then19:                                        ; preds = %sw.bb13
  %24 = load i8**, i8*** %argv.addr, align 8
  %25 = load i32, i32* %i, align 4
  %add = add nsw i32 %25, 1
  %idxprom20 = sext i32 %add to i64
  %arrayidx21 = getelementptr inbounds i8*, i8** %24, i64 %idxprom20
  %26 = load i8*, i8** %arrayidx21, align 8
  %call22 = call double @atof(i8* %26) #14
  %conv23 = fptrunc double %call22 to float
  %27 = load float*, float** %lat.addr, align 8
  store float %conv23, float* %27, align 4
  br label %if.end29

if.else:                                          ; preds = %sw.bb13
  %28 = load i8**, i8*** %argv.addr, align 8
  %29 = load i32, i32* %i, align 4
  %add24 = add nsw i32 %29, 1
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds i8*, i8** %28, i64 %idxprom25
  %30 = load i8*, i8** %arrayidx26, align 8
  %call27 = call double @atof(i8* %30) #14
  %conv28 = fptrunc double %call27 to float
  %31 = load float*, float** %lng.addr, align 8
  store float %conv28, float* %31, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then19
  %32 = load i32, i32* %i, align 4
  %inc30 = add nsw i32 %32, 1
  store i32 %inc30, i32* %i, align 4
  br label %sw.epilog

sw.bb31:                                          ; preds = %if.then5
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb32:                                          ; preds = %if.then5
  %33 = load i32*, i32** %q.addr, align 8
  store i32 1, i32* %33, align 4
  br label %sw.epilog

sw.bb33:                                          ; preds = %if.then5
  %34 = load i32*, i32** %t.addr, align 8
  store i32 1, i32* %34, align 4
  br label %sw.epilog

sw.bb34:                                          ; preds = %if.then5
  %35 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %35, 1
  store i32 %inc35, i32* %i, align 4
  %36 = load i8**, i8*** %argv.addr, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %37 to i64
  %arrayidx37 = getelementptr inbounds i8*, i8** %36, i64 %idxprom36
  %38 = load i8*, i8** %arrayidx37, align 8
  %call38 = call i32 @atoi(i8* %38) #14
  %39 = load i32*, i32** %p.addr, align 8
  store i32 %call38, i32* %39, align 4
  br label %sw.epilog

sw.bb39:                                          ; preds = %if.then5
  %40 = load i32, i32* %i, align 4
  %inc40 = add nsw i32 %40, 1
  store i32 %inc40, i32* %i, align 4
  %41 = load i8**, i8*** %argv.addr, align 8
  %42 = load i32, i32* %i, align 4
  %idxprom41 = sext i32 %42 to i64
  %arrayidx42 = getelementptr inbounds i8*, i8** %41, i64 %idxprom41
  %43 = load i8*, i8** %arrayidx42, align 8
  %call43 = call i32 @atoi(i8* %43) #14
  %44 = load i32*, i32** %d.addr, align 8
  store i32 %call43, i32* %44, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb39, %sw.bb34, %sw.bb33, %sw.bb32, %if.end29, %sw.bb, %if.then5
  br label %if.end44

if.end44:                                         ; preds = %sw.epilog, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end44
  %45 = load i32, i32* %i, align 4
  %inc45 = add nsw i32 %45, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %46 = load i32*, i32** %d.addr, align 8
  %47 = load i32, i32* %46, align 4
  %cmp46 = icmp sge i32 %47, 0
  br i1 %cmp46, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.end
  %48 = load i32*, i32** %p.addr, align 8
  %49 = load i32, i32* %48, align 4
  %cmp47 = icmp slt i32 %49, 0
  br i1 %cmp47, label %if.then51, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.end
  %50 = load i32*, i32** %p.addr, align 8
  %51 = load i32, i32* %50, align 4
  %cmp48 = icmp sge i32 %51, 0
  br i1 %cmp48, label %land.lhs.true49, label %if.end52

land.lhs.true49:                                  ; preds = %lor.lhs.false
  %52 = load i32*, i32** %d.addr, align 8
  %53 = load i32, i32* %52, align 4
  %cmp50 = icmp slt i32 %53, 0
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %land.lhs.true49, %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end52:                                         ; preds = %land.lhs.true49, %lor.lhs.false
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end52, %if.then51, %sw.bb31, %if.then
  %54 = load i32, i32* %retval, align 4
  ret i32 %54
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z10printUsagev() #0 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0))
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([90 x i8], [90 x i8]* @.str.13, i64 0, i64 0))
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i64 0, i64 0))
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.15, i64 0, i64 0))
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.16, i64 0, i64 0))
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.17, i64 0, i64 0))
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.18, i64 0, i64 0))
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.19, i64 0, i64 0))
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.20, i64 0, i64 0))
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.21, i64 0, i64 0))
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.22, i64 0, i64 0))
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.23, i64 0, i64 0))
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.24, i64 0, i64 0))
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.25, i64 0, i64 0))
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.26, i64 0, i64 0))
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.27, i64 0, i64 0))
  ret void
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline optnone uwtable
define dso_local i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* %filename, %"class.std::vector"* dereferenceable(24) %records, %"class.std::vector.0"* dereferenceable(24) %locations) #0 {
entry:
  %filename.addr = alloca i8*, align 8
  %records.addr = alloca %"class.std::vector"*, align 8
  %locations.addr = alloca %"class.std::vector.0"*, align 8
  %flist = alloca %struct._IO_FILE*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %dbname = alloca [64 x i8], align 16
  %recNum = alloca i32, align 4
  %record = alloca %struct.record, align 4
  %latLong = alloca %struct.latLong, align 4
  %substr = alloca [6 x i8], align 1
  store i8* %filename, i8** %filename.addr, align 8
  store %"class.std::vector"* %records, %"class.std::vector"** %records.addr, align 8
  store %"class.std::vector.0"* %locations, %"class.std::vector.0"** %locations.addr, align 8
  store i32 0, i32* %i, align 4
  store i32 0, i32* %recNum, align 4
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %flist, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %flist, align 8
  %call1 = call i32 @feof(%struct._IO_FILE* %1) #12
  %tobool = icmp ne i32 %call1, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end48

while.body:                                       ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %flist, align 8
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %dbname, i64 0, i64 0
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i8* %arraydecay)
  %cmp = icmp ne i32 %call2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.9, i64 0, i64 0))
  call void @exit(i32 0) #13
  unreachable

if.end:                                           ; preds = %while.body
  %arraydecay4 = getelementptr inbounds [64 x i8], [64 x i8]* %dbname, i64 0, i64 0
  %call5 = call %struct._IO_FILE* @fopen(i8* %arraydecay4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  store %struct._IO_FILE* %call5, %struct._IO_FILE** %fp, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %tobool6 = icmp ne %struct._IO_FILE* %4, null
  br i1 %tobool6, label %if.end9, label %if.then7

if.then7:                                         ; preds = %if.end
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i64 0, i64 0))
  call void @exit(i32 1) #13
  unreachable

if.end9:                                          ; preds = %if.end
  br label %while.cond10

while.cond10:                                     ; preds = %for.end41, %if.end9
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call11 = call i32 @feof(%struct._IO_FILE* %5) #12
  %tobool12 = icmp ne i32 %call11, 0
  %lnot13 = xor i1 %tobool12, true
  br i1 %lnot13, label %while.body14, label %while.end

while.body14:                                     ; preds = %while.cond10
  %recString = getelementptr inbounds %struct.record, %struct.record* %record, i32 0, i32 0
  %arraydecay15 = getelementptr inbounds [53 x i8], [53 x i8]* %recString, i64 0, i64 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call16 = call i8* @fgets(i8* %arraydecay15, i32 49, %struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call17 = call i32 @fgetc(%struct._IO_FILE* %7)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call18 = call i32 @feof(%struct._IO_FILE* %8) #12
  %tobool19 = icmp ne i32 %call18, 0
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %while.body14
  br label %while.end

if.end21:                                         ; preds = %while.body14
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end21
  %9 = load i32, i32* %i, align 4
  %cmp22 = icmp slt i32 %9, 5
  br i1 %cmp22, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %recString23 = getelementptr inbounds %struct.record, %struct.record* %record, i32 0, i32 0
  %arraydecay24 = getelementptr inbounds [53 x i8], [53 x i8]* %recString23, i64 0, i64 0
  %10 = load i32, i32* %i, align 4
  %idx.ext = sext i32 %10 to i64
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay24, i64 %idx.ext
  %add.ptr25 = getelementptr inbounds i8, i8* %add.ptr, i64 28
  %11 = load i8, i8* %add.ptr25, align 1
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 %idxprom
  store i8 %11, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx26 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 5
  store i8 0, i8* %arrayidx26, align 1
  %arraydecay27 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 0
  %call28 = call double @atof(i8* %arraydecay27) #14
  %conv = fptrunc double %call28 to float
  %lat = getelementptr inbounds %struct.latLong, %struct.latLong* %latLong, i32 0, i32 0
  store float %conv, float* %lat, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc39, %for.end
  %14 = load i32, i32* %i, align 4
  %cmp30 = icmp slt i32 %14, 5
  br i1 %cmp30, label %for.body31, label %for.end41

for.body31:                                       ; preds = %for.cond29
  %recString32 = getelementptr inbounds %struct.record, %struct.record* %record, i32 0, i32 0
  %arraydecay33 = getelementptr inbounds [53 x i8], [53 x i8]* %recString32, i64 0, i64 0
  %15 = load i32, i32* %i, align 4
  %idx.ext34 = sext i32 %15 to i64
  %add.ptr35 = getelementptr inbounds i8, i8* %arraydecay33, i64 %idx.ext34
  %add.ptr36 = getelementptr inbounds i8, i8* %add.ptr35, i64 33
  %16 = load i8, i8* %add.ptr36, align 1
  %17 = load i32, i32* %i, align 4
  %idxprom37 = sext i32 %17 to i64
  %arrayidx38 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 %idxprom37
  store i8 %16, i8* %arrayidx38, align 1
  br label %for.inc39

for.inc39:                                        ; preds = %for.body31
  %18 = load i32, i32* %i, align 4
  %inc40 = add nsw i32 %18, 1
  store i32 %inc40, i32* %i, align 4
  br label %for.cond29

for.end41:                                        ; preds = %for.cond29
  %arrayidx42 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 5
  store i8 0, i8* %arrayidx42, align 1
  %arraydecay43 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 0
  %call44 = call double @atof(i8* %arraydecay43) #14
  %conv45 = fptrunc double %call44 to float
  %lng = getelementptr inbounds %struct.latLong, %struct.latLong* %latLong, i32 0, i32 1
  store float %conv45, float* %lng, align 4
  %19 = load %"class.std::vector.0"*, %"class.std::vector.0"** %locations.addr, align 8
  call void @_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_(%"class.std::vector.0"* %19, %struct.latLong* dereferenceable(8) %latLong)
  %20 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8
  call void @_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_(%"class.std::vector"* %20, %struct.record* dereferenceable(60) %record)
  %21 = load i32, i32* %recNum, align 4
  %inc46 = add nsw i32 %21, 1
  store i32 %inc46, i32* %recNum, align 4
  br label %while.cond10

while.end:                                        ; preds = %if.then20, %while.cond10
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call47 = call i32 @fclose(%struct._IO_FILE* %22)
  br label %while.cond

while.end48:                                      ; preds = %while.cond
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %flist, align 8
  %call49 = call i32 @fclose(%struct._IO_FILE* %23)
  %24 = load i32, i32* %recNum, align 4
  ret i32 %24
}

declare dso_local i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #3

declare dso_local i32 @cudaDeviceSynchronize() #3

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0
  %0 = load i32, i32* %vx.addr, align 4
  store i32 %0, i32* %x, align 4
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1
  %1 = load i32, i32* %vy.addr, align 4
  store i32 %1, i32* %y, align 4
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2
  %2 = load i32, i32* %vz.addr, align 4
  store i32 %2, i32* %z, align 4
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #5

declare dso_local i32 @cudaMalloc(i8**, i64) #3

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EEixEm(%"class.std::vector.0"* %this, i64 %__n) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  %1 = load %struct.latLong*, %struct.latLong** %_M_start, align 8
  %2 = load i64, i64* %__n.addr, align 8
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %1, i64 %2
  ret %struct.latLong* %add.ptr
}

declare dso_local i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64, i8*) #3

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii(%"class.std::vector"* dereferenceable(24) %records, float* %distances, i32 %numRecords, i32 %topN) #0 {
entry:
  %records.addr = alloca %"class.std::vector"*, align 8
  %distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %topN.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %val = alloca float, align 4
  %minLoc = alloca i32, align 4
  %tempRec = alloca %struct.record*, align 8
  %tempDist = alloca float, align 4
  store %"class.std::vector"* %records, %"class.std::vector"** %records.addr, align 8
  store float* %distances, float** %distances.addr, align 8
  store i32 %numRecords, i32* %numRecords.addr, align 4
  store i32 %topN, i32* %topN.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %topN.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  store i32 %2, i32* %minLoc, align 4
  %3 = load i32, i32* %i, align 4
  store i32 %3, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %numRecords.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load float*, float** %distances.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom
  %8 = load float, float* %arrayidx, align 4
  store float %8, float* %val, align 4
  %9 = load float, float* %val, align 4
  %10 = load float*, float** %distances.addr, align 8
  %11 = load i32, i32* %minLoc, align 4
  %idxprom4 = sext i32 %11 to i64
  %arrayidx5 = getelementptr inbounds float, float* %10, i64 %idxprom4
  %12 = load float, float* %arrayidx5, align 4
  %cmp6 = fcmp olt float %9, %12
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  store i32 %13, i32* %minLoc, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %j, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %15 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8
  %16 = load i32, i32* %i, align 4
  %conv = sext i32 %16 to i64
  %call = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %15, i64 %conv)
  store %struct.record* %call, %struct.record** %tempRec, align 8
  %17 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8
  %18 = load i32, i32* %minLoc, align 4
  %conv7 = sext i32 %18 to i64
  %call8 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %17, i64 %conv7)
  %19 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8
  %20 = load i32, i32* %i, align 4
  %conv9 = sext i32 %20 to i64
  %call10 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %19, i64 %conv9)
  %21 = bitcast %struct.record* %call10 to i8*
  %22 = bitcast %struct.record* %call8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %21, i8* align 4 %22, i64 60, i1 false)
  %23 = load %struct.record*, %struct.record** %tempRec, align 8
  %24 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8
  %25 = load i32, i32* %minLoc, align 4
  %conv11 = sext i32 %25 to i64
  %call12 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %24, i64 %conv11)
  %26 = bitcast %struct.record* %call12 to i8*
  %27 = bitcast %struct.record* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %26, i8* align 4 %27, i64 60, i1 false)
  %28 = load float*, float** %distances.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %29 to i64
  %arrayidx14 = getelementptr inbounds float, float* %28, i64 %idxprom13
  %30 = load float, float* %arrayidx14, align 4
  store float %30, float* %tempDist, align 4
  %31 = load float*, float** %distances.addr, align 8
  %32 = load i32, i32* %minLoc, align 4
  %idxprom15 = sext i32 %32 to i64
  %arrayidx16 = getelementptr inbounds float, float* %31, i64 %idxprom15
  %33 = load float, float* %arrayidx16, align 4
  %34 = load float*, float** %distances.addr, align 8
  %35 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %35 to i64
  %arrayidx18 = getelementptr inbounds float, float* %34, i64 %idxprom17
  store float %33, float* %arrayidx18, align 4
  %36 = load float, float* %tempDist, align 4
  %37 = load float*, float** %distances.addr, align 8
  %38 = load i32, i32* %minLoc, align 4
  %idxprom19 = sext i32 %38 to i64
  %arrayidx20 = getelementptr inbounds float, float* %37, i64 %idxprom19
  store float %36, float* %arrayidx20, align 4
  %39 = load float*, float** %distances.addr, align 8
  %40 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %40 to i64
  %arrayidx22 = getelementptr inbounds float, float* %39, i64 %idxprom21
  %41 = load float, float* %arrayidx22, align 4
  %42 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8
  %43 = load i32, i32* %i, align 4
  %conv23 = sext i32 %43 to i64
  %call24 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %42, i64 %conv23)
  %distance = getelementptr inbounds %struct.record, %struct.record* %call24, i32 0, i32 1
  store float %41, float* %distance, align 4
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %44 = load i32, i32* %i, align 4
  %inc26 = add nsw i32 %44, 1
  store i32 %inc26, i32* %i, align 4
  br label %for.cond

for.end27:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %this, i64 %__n) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  %1 = load %struct.record*, %struct.record** %_M_start, align 8
  %2 = load i64, i64* %__n.addr, align 8
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %1, i64 %2
  ret %struct.record* %add.ptr
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

declare dso_local i32 @cudaFree(i8*) #3

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI7latLongSaIS0_EED2Ev(%"class.std::vector.0"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  %1 = load %struct.latLong*, %struct.latLong** %_M_start, align 8
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 1
  %3 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8
  %4 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %call = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %4)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  invoke void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %1, %struct.latLong* %3, %"class.std::allocator.2"* dereferenceable(1) %call)
          to label %invoke.cont3 unwind label %lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %5 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev(%"struct.std::_Vector_base.1"* %5)
  ret void

lpad:                                             ; preds = %invoke.cont, %entry
  %6 = landingpad { i8*, i32 }
          cleanup
  %7 = extractvalue { i8*, i32 } %6, 0
  store i8* %7, i8** %exn.slot, align 8
  %8 = extractvalue { i8*, i32 } %6, 1
  store i32 %8, i32* %ehselector.slot, align 4
  %9 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  invoke void @_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev(%"struct.std::_Vector_base.1"* %9)
          to label %invoke.cont4 unwind label %terminate.lpad

invoke.cont4:                                     ; preds = %lpad
  br label %eh.resume

eh.resume:                                        ; preds = %invoke.cont4
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val5

terminate.lpad:                                   ; preds = %lpad
  %10 = landingpad { i8*, i32 }
          catch i8* null
  %11 = extractvalue { i8*, i32 } %10, 0
  call void @__clang_call_terminate(i8* %11) #13
  unreachable
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #6 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #12
  call void @_ZSt9terminatev() #13
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI6recordSaIS0_EED2Ev(%"class.std::vector"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  %1 = load %struct.record*, %struct.record** %_M_start, align 8
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 1
  %3 = load %struct.record*, %struct.record** %_M_finish, align 8
  %4 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %call = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %4)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  invoke void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %1, %struct.record* %3, %"class.std::allocator"* dereferenceable(1) %call)
          to label %invoke.cont3 unwind label %lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %5 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev(%"struct.std::_Vector_base"* %5)
  ret void

lpad:                                             ; preds = %invoke.cont, %entry
  %6 = landingpad { i8*, i32 }
          cleanup
  %7 = extractvalue { i8*, i32 } %6, 0
  store i8* %7, i8** %exn.slot, align 8
  %8 = extractvalue { i8*, i32 } %6, 1
  store i32 %8, i32* %ehselector.slot, align 4
  %9 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  invoke void @_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev(%"struct.std::_Vector_base"* %9)
          to label %invoke.cont4 unwind label %terminate.lpad

invoke.cont4:                                     ; preds = %lpad
  br label %eh.resume

eh.resume:                                        ; preds = %invoke.cont4
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val5

terminate.lpad:                                   ; preds = %lpad
  %10 = landingpad { i8*, i32 }
          catch i8* null
  %11 = extractvalue { i8*, i32 } %10, 0
  call void @__clang_call_terminate(i8* %11) #13
  unreachable
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #5

declare dso_local i32 @fscanf(%struct._IO_FILE*, i8*, ...) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

declare dso_local i32 @fgetc(%struct._IO_FILE*) #3

; Function Attrs: nounwind readonly
declare dso_local double @atof(i8*) #8

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_(%"class.std::vector.0"* %this, %struct.latLong* dereferenceable(8) %__x) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__x.addr = alloca %struct.latLong*, align 8
  %agg.tmp = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  store %struct.latLong* %__x, %struct.latLong** %__x.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 2
  %3 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8
  %cmp = icmp ne %struct.latLong* %1, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %4, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl3 to %"class.std::allocator.2"*
  %6 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl4 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %6, i32 0, i32 0
  %_M_finish5 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl4, i32 0, i32 1
  %7 = load %struct.latLong*, %struct.latLong** %_M_finish5, align 8
  %8 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %5, %struct.latLong* %7, %struct.latLong* dereferenceable(8) %8)
  %9 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %9, i32 0, i32 0
  %_M_finish7 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl6, i32 0, i32 1
  %10 = load %struct.latLong*, %struct.latLong** %_M_finish7, align 8
  %incdec.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %10, i32 1
  store %struct.latLong* %incdec.ptr, %struct.latLong** %_M_finish7, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %call = call %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE3endEv(%"class.std::vector.0"* %this1)
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %agg.tmp, i32 0, i32 0
  store %struct.latLong* %call, %struct.latLong** %coerce.dive, align 8
  %11 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8
  %coerce.dive8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %agg.tmp, i32 0, i32 0
  %12 = load %struct.latLong*, %struct.latLong** %coerce.dive8, align 8
  call void @_ZNSt6vectorI7latLongSaIS0_EE17_M_realloc_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* %this1, %struct.latLong* %12, %struct.latLong* dereferenceable(8) %11)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_(%"class.std::vector"* %this, %struct.record* dereferenceable(60) %__x) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %__x.addr = alloca %struct.record*, align 8
  %agg.tmp = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  store %struct.record* %__x, %struct.record** %__x.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 2
  %3 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8
  %cmp = icmp ne %struct.record* %1, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl3 to %"class.std::allocator"*
  %6 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0
  %_M_finish5 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl4, i32 0, i32 1
  %7 = load %struct.record*, %struct.record** %_M_finish5, align 8
  %8 = load %struct.record*, %struct.record** %__x.addr, align 8
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %5, %struct.record* %7, %struct.record* dereferenceable(60) %8)
  %9 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %9, i32 0, i32 0
  %_M_finish7 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl6, i32 0, i32 1
  %10 = load %struct.record*, %struct.record** %_M_finish7, align 8
  %incdec.ptr = getelementptr inbounds %struct.record, %struct.record* %10, i32 1
  store %struct.record* %incdec.ptr, %struct.record** %_M_finish7, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %call = call %struct.record* @_ZNSt6vectorI6recordSaIS0_EE3endEv(%"class.std::vector"* %this1)
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %agg.tmp, i32 0, i32 0
  store %struct.record* %call, %struct.record** %coerce.dive, align 8
  %11 = load %struct.record*, %struct.record** %__x.addr, align 8
  %coerce.dive8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %agg.tmp, i32 0, i32 0
  %12 = load %struct.record*, %struct.record** %coerce.dive8, align 8
  call void @_ZNSt6vectorI6recordSaIS0_EE17_M_realloc_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* %this1, %struct.record* %12, %struct.record* dereferenceable(60) %11)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #8

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev(%"struct.std::_Vector_base"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaI6recordEC2Ev(%"class.std::allocator"* %0) #12
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1, i32 0, i32 0
  store %struct.record* null, %struct.record** %_M_start, align 8
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1, i32 0, i32 1
  store %struct.record* null, %struct.record** %_M_finish, align 8
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1, i32 0, i32 2
  store %struct.record* null, %struct.record** %_M_end_of_storage, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaI6recordEC2Ev(%"class.std::allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev(%"class.__gnu_cxx::new_allocator"* %0) #12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %__first, %struct.record* %__last, %"class.std::allocator"* dereferenceable(1) %0) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %.addr = alloca %"class.std::allocator"*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %.addr, align 8
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8
  %2 = load %struct.record*, %struct.record** %__last.addr, align 8
  call void @_ZSt8_DestroyIP6recordEvT_S2_(%struct.record* %1, %struct.record* %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*
  ret %"class.std::allocator"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev(%"struct.std::_Vector_base"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  %0 = load %struct.record*, %struct.record** %_M_start, align 8
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 2
  %1 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %_M_start4 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl3, i32 0, i32 0
  %2 = load %struct.record*, %struct.record** %_M_start4, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %1 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60
  invoke void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %this1, %struct.record* %0, i64 %sub.ptr.div)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_M_impl5 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl5) #12
  ret void

lpad:                                             ; preds = %entry
  %3 = landingpad { i8*, i32 }
          cleanup
  %4 = extractvalue { i8*, i32 } %3, 0
  store i8* %4, i8** %exn.slot, align 8
  %5 = extractvalue { i8*, i32 } %3, 1
  store i32 %5, i32* %ehselector.slot, align 4
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl6) #12
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val7 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIP6recordEvT_S2_(%struct.record* %__first, %struct.record* %__last) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_(%struct.record* %0, %struct.record* %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_(%struct.record* %0, %struct.record* %1) #4 comdat align 2 {
entry:
  %.addr = alloca %struct.record*, align 8
  %.addr1 = alloca %struct.record*, align 8
  store %struct.record* %0, %struct.record** %.addr, align 8
  store %struct.record* %1, %struct.record** %.addr1, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %this, %struct.record* %__p, i64 %__n) #0 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %0 = load %struct.record*, %struct.record** %__p.addr, align 8
  %tobool = icmp ne %struct.record* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %1 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8
  %3 = load i64, i64* %__n.addr, align 8
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m(%"class.std::allocator"* dereferenceable(1) %1, %struct.record* %2, i64 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaI6recordED2Ev(%"class.std::allocator"* %0) #12
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m(%"class.std::allocator"* dereferenceable(1) %__a, %struct.record* %__p, i64 %__n) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8
  %3 = load i64, i64* %__n.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator"* %1, %struct.record* %2, i64 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator"* %this, %struct.record* %__p, i64 %0) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %.addr = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  store i64 %0, i64* %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %1 = load %struct.record*, %struct.record** %__p.addr, align 8
  %2 = bitcast %struct.record* %1 to i8*
  call void @_ZdlPv(i8* %2) #12
  ret void
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) #9

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaI6recordED2Ev(%"class.std::allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorI6recordED2Ev(%"class.__gnu_cxx::new_allocator"* %0) #12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI6recordED2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev(%"struct.std::_Vector_base.1"* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1 to %"class.std::allocator.2"*
  call void @_ZNSaI7latLongEC2Ev(%"class.std::allocator.2"* %0) #12
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1, i32 0, i32 0
  store %struct.latLong* null, %struct.latLong** %_M_start, align 8
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1, i32 0, i32 1
  store %struct.latLong* null, %struct.latLong** %_M_finish, align 8
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1, i32 0, i32 2
  store %struct.latLong* null, %struct.latLong** %_M_end_of_storage, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaI7latLongEC2Ev(%"class.std::allocator.2"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %this, %"class.std::allocator.2"** %this.addr, align 8
  %this1 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator.2"* %this1 to %"class.__gnu_cxx::new_allocator.3"*
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev(%"class.__gnu_cxx::new_allocator.3"* %0) #12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev(%"class.__gnu_cxx::new_allocator.3"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %__first, %struct.latLong* %__last, %"class.std::allocator.2"* dereferenceable(1) %0) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %.addr = alloca %"class.std::allocator.2"*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %"class.std::allocator.2"* %0, %"class.std::allocator.2"** %.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  call void @_ZSt8_DestroyIP7latLongEvT_S2_(%struct.latLong* %1, %struct.latLong* %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*
  ret %"class.std::allocator.2"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev(%"struct.std::_Vector_base.1"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  %0 = load %struct.latLong*, %struct.latLong** %_M_start, align 8
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 2
  %1 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %_M_start4 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl3, i32 0, i32 0
  %2 = load %struct.latLong*, %struct.latLong** %_M_start4, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %1 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  invoke void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %this1, %struct.latLong* %0, i64 %sub.ptr.div)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_M_impl5 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl5) #12
  ret void

lpad:                                             ; preds = %entry
  %3 = landingpad { i8*, i32 }
          cleanup
  %4 = extractvalue { i8*, i32 } %3, 0
  store i8* %4, i8** %exn.slot, align 8
  %5 = extractvalue { i8*, i32 } %3, 1
  store i32 %5, i32* %ehselector.slot, align 4
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl6) #12
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val7 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val7
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIP7latLongEvT_S2_(%struct.latLong* %__first, %struct.latLong* %__last) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_(%struct.latLong* %0, %struct.latLong* %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_(%struct.latLong* %0, %struct.latLong* %1) #4 comdat align 2 {
entry:
  %.addr = alloca %struct.latLong*, align 8
  %.addr1 = alloca %struct.latLong*, align 8
  store %struct.latLong* %0, %struct.latLong** %.addr, align 8
  store %struct.latLong* %1, %struct.latLong** %.addr1, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %this, %struct.latLong* %__p, i64 %__n) #0 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  %tobool = icmp ne %struct.latLong* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %1 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  %3 = load i64, i64* %__n.addr, align 8
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m(%"class.std::allocator.2"* dereferenceable(1) %1, %struct.latLong* %2, i64 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1 to %"class.std::allocator.2"*
  call void @_ZNSaI7latLongED2Ev(%"class.std::allocator.2"* %0) #12
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m(%"class.std::allocator.2"* dereferenceable(1) %__a, %struct.latLong* %__p, i64 %__n) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  %3 = load i64, i64* %__n.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator.3"* %1, %struct.latLong* %2, i64 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator.3"* %this, %struct.latLong* %__p, i64 %0) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %.addr = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  store i64 %0, i64* %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  %2 = bitcast %struct.latLong* %1 to i8*
  call void @_ZdlPv(i8* %2) #12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaI7latLongED2Ev(%"class.std::allocator.2"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %this, %"class.std::allocator.2"** %this.addr, align 8
  %this1 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator.2"* %this1 to %"class.__gnu_cxx::new_allocator.3"*
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev(%"class.__gnu_cxx::new_allocator.3"* %0) #12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev(%"class.__gnu_cxx::new_allocator.3"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %__a, %struct.latLong* %__p, %struct.latLong* dereferenceable(8) %__arg) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__arg.addr = alloca %struct.latLong*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  store %struct.latLong* %__arg, %struct.latLong** %__arg.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  %3 = load %struct.latLong*, %struct.latLong** %__arg.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator.3"* %1, %struct.latLong* %2, %struct.latLong* dereferenceable(8) %3)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI7latLongSaIS0_EE17_M_realloc_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* %this, %struct.latLong* %__position.coerce, %struct.latLong* dereferenceable(8) %__x) #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__position = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__x.addr = alloca %struct.latLong*, align 8
  %__len = alloca i64, align 8
  %__elems_before = alloca i64, align 8
  %ref.tmp = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %__new_start = alloca %struct.latLong*, align 8
  %__new_finish = alloca %struct.latLong*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %__position, i32 0, i32 0
  store %struct.latLong* %__position.coerce, %struct.latLong** %coerce.dive, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  store %struct.latLong* %__x, %struct.latLong** %__x.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %call = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector.0"* %this1, i64 1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.28, i64 0, i64 0))
  store i64 %call, i64* %__len, align 8
  %call2 = call %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE5beginEv(%"class.std::vector.0"* %this1)
  %coerce.dive3 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %ref.tmp, i32 0, i32 0
  store %struct.latLong* %call2, %struct.latLong** %coerce.dive3, align 8
  %call4 = call i64 @_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__position, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %ref.tmp)
  store i64 %call4, i64* %__elems_before, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %1 = load i64, i64* %__len, align 8
  %call5 = call %struct.latLong* @_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base.1"* %0, i64 %1)
  store %struct.latLong* %call5, %struct.latLong** %__new_start, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  store %struct.latLong* %2, %struct.latLong** %__new_finish, align 8
  %3 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %3, i32 0, i32 0
  %4 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*
  %5 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %6 = load i64, i64* %__elems_before, align 8
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %5, i64 %6
  %7 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %4, %struct.latLong* %add.ptr, %struct.latLong* dereferenceable(8) %7)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  store %struct.latLong* null, %struct.latLong** %__new_finish, align 8
  %8 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %8, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl6, i32 0, i32 0
  %9 = load %struct.latLong*, %struct.latLong** %_M_start, align 8
  %call8 = invoke dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__position)
          to label %invoke.cont7 unwind label %lpad

invoke.cont7:                                     ; preds = %invoke.cont
  %10 = load %struct.latLong*, %struct.latLong** %call8, align 8
  %11 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %12 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %call10 = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %12)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %invoke.cont7
  %call12 = invoke %struct.latLong* @_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.latLong* %9, %struct.latLong* %10, %struct.latLong* %11, %"class.std::allocator.2"* dereferenceable(1) %call10)
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %invoke.cont9
  store %struct.latLong* %call12, %struct.latLong** %__new_finish, align 8
  %13 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8
  %incdec.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %13, i32 1
  store %struct.latLong* %incdec.ptr, %struct.latLong** %__new_finish, align 8
  %call14 = invoke dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__position)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %invoke.cont11
  %14 = load %struct.latLong*, %struct.latLong** %call14, align 8
  %15 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl15 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %15, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl15, i32 0, i32 1
  %16 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8
  %17 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8
  %18 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %call17 = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %18)
          to label %invoke.cont16 unwind label %lpad

invoke.cont16:                                    ; preds = %invoke.cont13
  %call19 = invoke %struct.latLong* @_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.latLong* %14, %struct.latLong* %16, %struct.latLong* %17, %"class.std::allocator.2"* dereferenceable(1) %call17)
          to label %invoke.cont18 unwind label %lpad

invoke.cont18:                                    ; preds = %invoke.cont16
  store %struct.latLong* %call19, %struct.latLong** %__new_finish, align 8
  br label %try.cont

lpad:                                             ; preds = %invoke.cont16, %invoke.cont13, %invoke.cont11, %invoke.cont9, %invoke.cont7, %invoke.cont, %entry
  %19 = landingpad { i8*, i32 }
          catch i8* null
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %exn.slot, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %ehselector.slot, align 4
  br label %catch

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %22 = call i8* @__cxa_begin_catch(i8* %exn) #12
  %23 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8
  %tobool = icmp ne %struct.latLong* %23, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %catch
  %24 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl20 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %24, i32 0, i32 0
  %25 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl20 to %"class.std::allocator.2"*
  %26 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %27 = load i64, i64* %__elems_before, align 8
  %add.ptr21 = getelementptr inbounds %struct.latLong, %struct.latLong* %26, i64 %27
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_(%"class.std::allocator.2"* dereferenceable(1) %25, %struct.latLong* %add.ptr21)
          to label %invoke.cont23 unwind label %lpad22

invoke.cont23:                                    ; preds = %if.then
  br label %if.end

lpad22:                                           ; preds = %invoke.cont27, %if.end, %invoke.cont24, %if.else, %if.then
  %28 = landingpad { i8*, i32 }
          cleanup
  %29 = extractvalue { i8*, i32 } %28, 0
  store i8* %29, i8** %exn.slot, align 8
  %30 = extractvalue { i8*, i32 } %28, 1
  store i32 %30, i32* %ehselector.slot, align 4
  invoke void @__cxa_end_catch()
          to label %invoke.cont28 unwind label %terminate.lpad

if.else:                                          ; preds = %catch
  %31 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %32 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8
  %33 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %call25 = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %33)
          to label %invoke.cont24 unwind label %lpad22

invoke.cont24:                                    ; preds = %if.else
  invoke void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %31, %struct.latLong* %32, %"class.std::allocator.2"* dereferenceable(1) %call25)
          to label %invoke.cont26 unwind label %lpad22

invoke.cont26:                                    ; preds = %invoke.cont24
  br label %if.end

if.end:                                           ; preds = %invoke.cont26, %invoke.cont23
  %34 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %35 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %36 = load i64, i64* %__len, align 8
  invoke void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %34, %struct.latLong* %35, i64 %36)
          to label %invoke.cont27 unwind label %lpad22

invoke.cont27:                                    ; preds = %if.end
  invoke void @__cxa_rethrow() #15
          to label %unreachable unwind label %lpad22

invoke.cont28:                                    ; preds = %lpad22
  br label %eh.resume

try.cont:                                         ; preds = %invoke.cont18
  %37 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl29 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %37, i32 0, i32 0
  %_M_start30 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl29, i32 0, i32 0
  %38 = load %struct.latLong*, %struct.latLong** %_M_start30, align 8
  %39 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl31 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %39, i32 0, i32 0
  %_M_finish32 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl31, i32 0, i32 1
  %40 = load %struct.latLong*, %struct.latLong** %_M_finish32, align 8
  %41 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %call33 = call dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %41)
  call void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %38, %struct.latLong* %40, %"class.std::allocator.2"* dereferenceable(1) %call33)
  %42 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %43 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl34 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %43, i32 0, i32 0
  %_M_start35 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl34, i32 0, i32 0
  %44 = load %struct.latLong*, %struct.latLong** %_M_start35, align 8
  %45 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl36 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %45, i32 0, i32 0
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl36, i32 0, i32 2
  %46 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8
  %47 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl37 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %47, i32 0, i32 0
  %_M_start38 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl37, i32 0, i32 0
  %48 = load %struct.latLong*, %struct.latLong** %_M_start38, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %46 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %48 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %42, %struct.latLong* %44, i64 %sub.ptr.div)
  %49 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %50 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl39 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %50, i32 0, i32 0
  %_M_start40 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl39, i32 0, i32 0
  store %struct.latLong* %49, %struct.latLong** %_M_start40, align 8
  %51 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8
  %52 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl41 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %52, i32 0, i32 0
  %_M_finish42 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl41, i32 0, i32 1
  store %struct.latLong* %51, %struct.latLong** %_M_finish42, align 8
  %53 = load %struct.latLong*, %struct.latLong** %__new_start, align 8
  %54 = load i64, i64* %__len, align 8
  %add.ptr43 = getelementptr inbounds %struct.latLong, %struct.latLong* %53, i64 %54
  %55 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl44 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %55, i32 0, i32 0
  %_M_end_of_storage45 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl44, i32 0, i32 2
  store %struct.latLong* %add.ptr43, %struct.latLong** %_M_end_of_storage45, align 8
  ret void

eh.resume:                                        ; preds = %invoke.cont28
  %exn46 = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn46, 0
  %lpad.val47 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val47

terminate.lpad:                                   ; preds = %lpad22
  %56 = landingpad { i8*, i32 }
          catch i8* null
  %57 = extractvalue { i8*, i32 } %56, 0
  call void @__clang_call_terminate(i8* %57) #13
  unreachable

unreachable:                                      ; preds = %invoke.cont27
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE3endEv(%"class.std::vector.0"* %this) #0 comdat align 2 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1
  call void @_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator"* %retval, %struct.latLong** dereferenceable(8) %_M_finish)
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %retval, i32 0, i32 0
  %1 = load %struct.latLong*, %struct.latLong** %coerce.dive, align 8
  ret %struct.latLong* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator.3"* %this, %struct.latLong* %__p, %struct.latLong* dereferenceable(8) %__val) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__val.addr = alloca %struct.latLong*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  store %struct.latLong* %__val, %struct.latLong** %__val.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  %1 = bitcast %struct.latLong* %0 to i8*
  %2 = bitcast i8* %1 to %struct.latLong*
  %3 = load %struct.latLong*, %struct.latLong** %__val.addr, align 8
  %4 = bitcast %struct.latLong* %2 to i8*
  %5 = bitcast %struct.latLong* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 8, i1 false)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector.0"* %this, i64 %__n, i8* %__s) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__n.addr = alloca i64, align 8
  %__s.addr = alloca i8*, align 8
  %__len = alloca i64, align 8
  %ref.tmp = alloca i64, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %call = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this1)
  %call2 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1)
  %sub = sub i64 %call, %call2
  %0 = load i64, i64* %__n.addr, align 8
  %cmp = icmp ult i64 %sub, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %__s.addr, align 8
  call void @_ZSt20__throw_length_errorPKc(i8* %1) #15
  unreachable

if.end:                                           ; preds = %entry
  %call3 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1)
  %call4 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1)
  store i64 %call4, i64* %ref.tmp, align 8
  %call5 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %ref.tmp, i64* dereferenceable(8) %__n.addr)
  %2 = load i64, i64* %call5, align 8
  %add = add i64 %call3, %2
  store i64 %add, i64* %__len, align 8
  %3 = load i64, i64* %__len, align 8
  %call6 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1)
  %cmp7 = icmp ult i64 %3, %call6
  br i1 %cmp7, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i64, i64* %__len, align 8
  %call8 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this1)
  %cmp9 = icmp ugt i64 %4, %call8
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.end
  %call10 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this1)
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %5 = load i64, i64* %__len, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call10, %cond.true ], [ %5, %cond.false ]
  ret i64 %cond
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__lhs, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__rhs) #0 comdat {
entry:
  %__lhs.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %__rhs.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %__lhs, %"class.__gnu_cxx::__normal_iterator"** %__lhs.addr, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %__rhs, %"class.__gnu_cxx::__normal_iterator"** %__rhs.addr, align 8
  %0 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %__lhs.addr, align 8
  %call = call dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %0)
  %1 = load %struct.latLong*, %struct.latLong** %call, align 8
  %2 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %__rhs.addr, align 8
  %call1 = call dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %2)
  %3 = load %struct.latLong*, %struct.latLong** %call1, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %1 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  ret i64 %sub.ptr.div
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE5beginEv(%"class.std::vector.0"* %this) #0 comdat align 2 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  call void @_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator"* %retval, %struct.latLong** dereferenceable(8) %_M_start)
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %retval, i32 0, i32 0
  %1 = load %struct.latLong*, %struct.latLong** %coerce.dive, align 8
  ret %struct.latLong* %1
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base.1"* %this, i64 %__n) #0 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %0 = load i64, i64* %__n.addr, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %1 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*
  %2 = load i64, i64* %__n.addr, align 8
  %call = call %struct.latLong* @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m(%"class.std::allocator.2"* dereferenceable(1) %1, i64 %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.latLong* [ %call, %cond.true ], [ null, %cond.false ]
  ret %struct.latLong* %cond
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result, %"class.std::allocator.2"* dereferenceable(1) %__alloc) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__alloc.addr = alloca %"class.std::allocator.2"*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  store %"class.std::allocator.2"* %__alloc, %"class.std::allocator.2"** %__alloc.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %3 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__alloc.addr, align 8
  %call = call %struct.latLong* @_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2, %"class.std::allocator.2"* dereferenceable(1) %3)
  ret %struct.latLong* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %this, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %this1, i32 0, i32 0
  ret %struct.latLong** %_M_current
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_(%"class.std::allocator.2"* dereferenceable(1) %__a, %struct.latLong* %__p) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_(%"class.__gnu_cxx::new_allocator.3"* %1, %struct.latLong* %2)
  ret void
}

declare dso_local void @__cxa_rethrow()

declare dso_local void @__cxa_end_catch()

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %call = call dereferenceable(1) %"class.std::allocator.2"* @_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %0)
  %call2 = call i64 @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_(%"class.std::allocator.2"* dereferenceable(1) %call)
  ret i64 %call2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 0
  %3 = load %struct.latLong*, %struct.latLong** %_M_start, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %1 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  ret i64 %sub.ptr.div
}

; Function Attrs: noreturn
declare dso_local void @_ZSt20__throw_length_errorPKc(i8*) #10

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %__a, i64* dereferenceable(8) %__b) #4 comdat {
entry:
  %retval = alloca i64*, align 8
  %__a.addr = alloca i64*, align 8
  %__b.addr = alloca i64*, align 8
  store i64* %__a, i64** %__a.addr, align 8
  store i64* %__b, i64** %__b.addr, align 8
  %0 = load i64*, i64** %__a.addr, align 8
  %1 = load i64, i64* %0, align 8
  %2 = load i64*, i64** %__b.addr, align 8
  %3 = load i64, i64* %2, align 8
  %cmp = icmp ult i64 %1, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %__b.addr, align 8
  store i64* %4, i64** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i64*, i64** %__a.addr, align 8
  store i64* %5, i64** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i64*, i64** %retval, align 8
  ret i64* %6
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_(%"class.std::allocator.2"* dereferenceable(1) %__a) #4 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %1) #12
  ret i64 %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator.2"* @_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*
  ret %"class.std::allocator.2"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret i64 2305843009213693951
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator"* %this, %struct.latLong** dereferenceable(8) %__i) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %__i.addr = alloca %struct.latLong**, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %this, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  store %struct.latLong** %__i, %struct.latLong*** %__i.addr, align 8
  %this1 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %this1, i32 0, i32 0
  %0 = load %struct.latLong**, %struct.latLong*** %__i.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %0, align 8
  store %struct.latLong* %1, %struct.latLong** %_M_current, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m(%"class.std::allocator.2"* dereferenceable(1) %__a, i64 %__n) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load i64, i64* %__n.addr, align 8
  %call = call %struct.latLong* @_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.3"* %1, i64 %2, i8* null)
  ret %struct.latLong* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.3"* %this, i64 %__n, i8* %0) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__n.addr = alloca i64, align 8
  %.addr = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8* %0, i8** %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %this1) #12
  %cmp = icmp ugt i64 %1, %call
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZSt17__throw_bad_allocv() #15
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %__n.addr, align 8
  %mul = mul i64 %2, 8
  %call2 = call i8* @_Znwm(i64 %mul)
  %3 = bitcast i8* %call2 to %struct.latLong*
  ret %struct.latLong* %3
}

; Function Attrs: noreturn
declare dso_local void @_ZSt17__throw_bad_allocv() #10

; Function Attrs: nobuiltin
declare dso_local noalias i8* @_Znwm(i64) #11

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result, %"class.std::allocator.2"* dereferenceable(1) %0) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %.addr = alloca %"class.std::allocator.2"*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  store %"class.std::allocator.2"* %0, %"class.std::allocator.2"** %.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %3 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %call = call %struct.latLong* @_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %1, %struct.latLong* %2, %struct.latLong* %3)
  ret %struct.latLong* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__assignable = alloca i8, align 1
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  store i8 1, i8* %__assignable, align 1
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %call = call %struct.latLong* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2)
  ret %struct.latLong* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #0 comdat align 2 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %call = call %struct.latLong* @_ZSt4copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2)
  ret %struct.latLong* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt4copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %call = call %struct.latLong* @_ZSt12__miter_baseIP7latLongET_S2_(%struct.latLong* %0)
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %call1 = call %struct.latLong* @_ZSt12__miter_baseIP7latLongET_S2_(%struct.latLong* %1)
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %call2 = call %struct.latLong* @_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %call, %struct.latLong* %call1, %struct.latLong* %2)
  ret %struct.latLong* %call2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %call = call %struct.latLong* @_ZSt12__niter_baseIP7latLongET_S2_(%struct.latLong* %0)
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %call1 = call %struct.latLong* @_ZSt12__niter_baseIP7latLongET_S2_(%struct.latLong* %1)
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %call2 = call %struct.latLong* @_ZSt12__niter_baseIP7latLongET_S2_(%struct.latLong* %2)
  %call3 = call %struct.latLong* @_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %call, %struct.latLong* %call1, %struct.latLong* %call2)
  ret %struct.latLong* %call3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt12__miter_baseIP7latLongET_S2_(%struct.latLong* %__it) #4 comdat {
entry:
  %__it.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__it, %struct.latLong** %__it.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__it.addr, align 8
  ret %struct.latLong* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__simple = alloca i8, align 1
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  store i8 1, i8* %__simple, align 1
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %call = call %struct.latLong* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2)
  ret %struct.latLong* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZSt12__niter_baseIP7latLongET_S2_(%struct.latLong* %__it) #4 comdat {
entry:
  %__it.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__it, %struct.latLong** %__it.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__it.addr, align 8
  ret %struct.latLong* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %struct.latLong* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #4 comdat align 2 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %_Num = alloca i64, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %0 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  store i64 %sub.ptr.div, i64* %_Num, align 8
  %2 = load i64, i64* %_Num, align 8
  %tobool = icmp ne i64 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %4 = bitcast %struct.latLong* %3 to i8*
  %5 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8
  %6 = bitcast %struct.latLong* %5 to i8*
  %7 = load i64, i64* %_Num, align 8
  %mul = mul i64 8, %7
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %6, i64 %mul, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8
  %9 = load i64, i64* %_Num, align 8
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %8, i64 %9
  ret %struct.latLong* %add.ptr
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_(%"class.__gnu_cxx::new_allocator.3"* %this, %struct.latLong* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %__a, %struct.record* %__p, %struct.record* dereferenceable(60) %__arg) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__arg.addr = alloca %struct.record*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  store %struct.record* %__arg, %struct.record** %__arg.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8
  %3 = load %struct.record*, %struct.record** %__arg.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator"* %1, %struct.record* %2, %struct.record* dereferenceable(60) %3)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI6recordSaIS0_EE17_M_realloc_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* %this, %struct.record* %__position.coerce, %struct.record* dereferenceable(60) %__x) #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__position = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %this.addr = alloca %"class.std::vector"*, align 8
  %__x.addr = alloca %struct.record*, align 8
  %__len = alloca i64, align 8
  %__elems_before = alloca i64, align 8
  %ref.tmp = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %__new_start = alloca %struct.record*, align 8
  %__new_finish = alloca %struct.record*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %__position, i32 0, i32 0
  store %struct.record* %__position.coerce, %struct.record** %coerce.dive, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  store %struct.record* %__x, %struct.record** %__x.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %call = call i64 @_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector"* %this1, i64 1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.28, i64 0, i64 0))
  store i64 %call, i64* %__len, align 8
  %call2 = call %struct.record* @_ZNSt6vectorI6recordSaIS0_EE5beginEv(%"class.std::vector"* %this1)
  %coerce.dive3 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %ref.tmp, i32 0, i32 0
  store %struct.record* %call2, %struct.record** %coerce.dive3, align 8
  %call4 = call i64 @_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %__position, %"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %ref.tmp)
  store i64 %call4, i64* %__elems_before, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %1 = load i64, i64* %__len, align 8
  %call5 = call %struct.record* @_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base"* %0, i64 %1)
  store %struct.record* %call5, %struct.record** %__new_start, align 8
  %2 = load %struct.record*, %struct.record** %__new_start, align 8
  store %struct.record* %2, %struct.record** %__new_finish, align 8
  %3 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %4 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*
  %5 = load %struct.record*, %struct.record** %__new_start, align 8
  %6 = load i64, i64* %__elems_before, align 8
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %5, i64 %6
  %7 = load %struct.record*, %struct.record** %__x.addr, align 8
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %4, %struct.record* %add.ptr, %struct.record* dereferenceable(60) %7)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  store %struct.record* null, %struct.record** %__new_finish, align 8
  %8 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %8, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl6, i32 0, i32 0
  %9 = load %struct.record*, %struct.record** %_M_start, align 8
  %call8 = invoke dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %__position)
          to label %invoke.cont7 unwind label %lpad

invoke.cont7:                                     ; preds = %invoke.cont
  %10 = load %struct.record*, %struct.record** %call8, align 8
  %11 = load %struct.record*, %struct.record** %__new_start, align 8
  %12 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %call10 = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %12)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %invoke.cont7
  %call12 = invoke %struct.record* @_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.record* %9, %struct.record* %10, %struct.record* %11, %"class.std::allocator"* dereferenceable(1) %call10)
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %invoke.cont9
  store %struct.record* %call12, %struct.record** %__new_finish, align 8
  %13 = load %struct.record*, %struct.record** %__new_finish, align 8
  %incdec.ptr = getelementptr inbounds %struct.record, %struct.record* %13, i32 1
  store %struct.record* %incdec.ptr, %struct.record** %__new_finish, align 8
  %call14 = invoke dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %__position)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %invoke.cont11
  %14 = load %struct.record*, %struct.record** %call14, align 8
  %15 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl15 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %15, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl15, i32 0, i32 1
  %16 = load %struct.record*, %struct.record** %_M_finish, align 8
  %17 = load %struct.record*, %struct.record** %__new_finish, align 8
  %18 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %call17 = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %18)
          to label %invoke.cont16 unwind label %lpad

invoke.cont16:                                    ; preds = %invoke.cont13
  %call19 = invoke %struct.record* @_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.record* %14, %struct.record* %16, %struct.record* %17, %"class.std::allocator"* dereferenceable(1) %call17)
          to label %invoke.cont18 unwind label %lpad

invoke.cont18:                                    ; preds = %invoke.cont16
  store %struct.record* %call19, %struct.record** %__new_finish, align 8
  br label %try.cont

lpad:                                             ; preds = %invoke.cont16, %invoke.cont13, %invoke.cont11, %invoke.cont9, %invoke.cont7, %invoke.cont, %entry
  %19 = landingpad { i8*, i32 }
          catch i8* null
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %exn.slot, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %ehselector.slot, align 4
  br label %catch

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %22 = call i8* @__cxa_begin_catch(i8* %exn) #12
  %23 = load %struct.record*, %struct.record** %__new_finish, align 8
  %tobool = icmp ne %struct.record* %23, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %catch
  %24 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl20 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %24, i32 0, i32 0
  %25 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl20 to %"class.std::allocator"*
  %26 = load %struct.record*, %struct.record** %__new_start, align 8
  %27 = load i64, i64* %__elems_before, align 8
  %add.ptr21 = getelementptr inbounds %struct.record, %struct.record* %26, i64 %27
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_(%"class.std::allocator"* dereferenceable(1) %25, %struct.record* %add.ptr21)
          to label %invoke.cont23 unwind label %lpad22

invoke.cont23:                                    ; preds = %if.then
  br label %if.end

lpad22:                                           ; preds = %invoke.cont27, %if.end, %invoke.cont24, %if.else, %if.then
  %28 = landingpad { i8*, i32 }
          cleanup
  %29 = extractvalue { i8*, i32 } %28, 0
  store i8* %29, i8** %exn.slot, align 8
  %30 = extractvalue { i8*, i32 } %28, 1
  store i32 %30, i32* %ehselector.slot, align 4
  invoke void @__cxa_end_catch()
          to label %invoke.cont28 unwind label %terminate.lpad

if.else:                                          ; preds = %catch
  %31 = load %struct.record*, %struct.record** %__new_start, align 8
  %32 = load %struct.record*, %struct.record** %__new_finish, align 8
  %33 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %call25 = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %33)
          to label %invoke.cont24 unwind label %lpad22

invoke.cont24:                                    ; preds = %if.else
  invoke void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %31, %struct.record* %32, %"class.std::allocator"* dereferenceable(1) %call25)
          to label %invoke.cont26 unwind label %lpad22

invoke.cont26:                                    ; preds = %invoke.cont24
  br label %if.end

if.end:                                           ; preds = %invoke.cont26, %invoke.cont23
  %34 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %35 = load %struct.record*, %struct.record** %__new_start, align 8
  %36 = load i64, i64* %__len, align 8
  invoke void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %34, %struct.record* %35, i64 %36)
          to label %invoke.cont27 unwind label %lpad22

invoke.cont27:                                    ; preds = %if.end
  invoke void @__cxa_rethrow() #15
          to label %unreachable unwind label %lpad22

invoke.cont28:                                    ; preds = %lpad22
  br label %eh.resume

try.cont:                                         ; preds = %invoke.cont18
  %37 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl29 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %37, i32 0, i32 0
  %_M_start30 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl29, i32 0, i32 0
  %38 = load %struct.record*, %struct.record** %_M_start30, align 8
  %39 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl31 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %39, i32 0, i32 0
  %_M_finish32 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl31, i32 0, i32 1
  %40 = load %struct.record*, %struct.record** %_M_finish32, align 8
  %41 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %call33 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %41)
  call void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %38, %struct.record* %40, %"class.std::allocator"* dereferenceable(1) %call33)
  %42 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %43 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl34 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %43, i32 0, i32 0
  %_M_start35 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl34, i32 0, i32 0
  %44 = load %struct.record*, %struct.record** %_M_start35, align 8
  %45 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl36 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %45, i32 0, i32 0
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl36, i32 0, i32 2
  %46 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8
  %47 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl37 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %47, i32 0, i32 0
  %_M_start38 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl37, i32 0, i32 0
  %48 = load %struct.record*, %struct.record** %_M_start38, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %46 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %48 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %42, %struct.record* %44, i64 %sub.ptr.div)
  %49 = load %struct.record*, %struct.record** %__new_start, align 8
  %50 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl39 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %50, i32 0, i32 0
  %_M_start40 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl39, i32 0, i32 0
  store %struct.record* %49, %struct.record** %_M_start40, align 8
  %51 = load %struct.record*, %struct.record** %__new_finish, align 8
  %52 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl41 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %52, i32 0, i32 0
  %_M_finish42 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl41, i32 0, i32 1
  store %struct.record* %51, %struct.record** %_M_finish42, align 8
  %53 = load %struct.record*, %struct.record** %__new_start, align 8
  %54 = load i64, i64* %__len, align 8
  %add.ptr43 = getelementptr inbounds %struct.record, %struct.record* %53, i64 %54
  %55 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl44 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %55, i32 0, i32 0
  %_M_end_of_storage45 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl44, i32 0, i32 2
  store %struct.record* %add.ptr43, %struct.record** %_M_end_of_storage45, align 8
  ret void

eh.resume:                                        ; preds = %invoke.cont28
  %exn46 = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn46, 0
  %lpad.val47 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val47

terminate.lpad:                                   ; preds = %lpad22
  %56 = landingpad { i8*, i32 }
          catch i8* null
  %57 = extractvalue { i8*, i32 } %56, 0
  call void @__clang_call_terminate(i8* %57) #13
  unreachable

unreachable:                                      ; preds = %invoke.cont27
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZNSt6vectorI6recordSaIS0_EE3endEv(%"class.std::vector"* %this) #0 comdat align 2 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1
  call void @_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.5"* %retval, %struct.record** dereferenceable(8) %_M_finish)
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %retval, i32 0, i32 0
  %1 = load %struct.record*, %struct.record** %coerce.dive, align 8
  ret %struct.record* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator"* %this, %struct.record* %__p, %struct.record* dereferenceable(60) %__val) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__val.addr = alloca %struct.record*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  store %struct.record* %__val, %struct.record** %__val.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %struct.record*, %struct.record** %__p.addr, align 8
  %1 = bitcast %struct.record* %0 to i8*
  %2 = bitcast i8* %1 to %struct.record*
  %3 = load %struct.record*, %struct.record** %__val.addr, align 8
  %4 = bitcast %struct.record* %2 to i8*
  %5 = bitcast %struct.record* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 60, i1 false)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector"* %this, i64 %__n, i8* %__s) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %__n.addr = alloca i64, align 8
  %__s.addr = alloca i8*, align 8
  %__len = alloca i64, align 8
  %ref.tmp = alloca i64, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %call = call i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this1)
  %call2 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1)
  %sub = sub i64 %call, %call2
  %0 = load i64, i64* %__n.addr, align 8
  %cmp = icmp ult i64 %sub, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %__s.addr, align 8
  call void @_ZSt20__throw_length_errorPKc(i8* %1) #15
  unreachable

if.end:                                           ; preds = %entry
  %call3 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1)
  %call4 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1)
  store i64 %call4, i64* %ref.tmp, align 8
  %call5 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %ref.tmp, i64* dereferenceable(8) %__n.addr)
  %2 = load i64, i64* %call5, align 8
  %add = add i64 %call3, %2
  store i64 %add, i64* %__len, align 8
  %3 = load i64, i64* %__len, align 8
  %call6 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1)
  %cmp7 = icmp ult i64 %3, %call6
  br i1 %cmp7, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i64, i64* %__len, align 8
  %call8 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this1)
  %cmp9 = icmp ugt i64 %4, %call8
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.end
  %call10 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this1)
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %5 = load i64, i64* %__len, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call10, %cond.true ], [ %5, %cond.false ]
  ret i64 %cond
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %__lhs, %"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %__rhs) #0 comdat {
entry:
  %__lhs.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  %__rhs.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %__lhs, %"class.__gnu_cxx::__normal_iterator.5"** %__lhs.addr, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %__rhs, %"class.__gnu_cxx::__normal_iterator.5"** %__rhs.addr, align 8
  %0 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %__lhs.addr, align 8
  %call = call dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %0)
  %1 = load %struct.record*, %struct.record** %call, align 8
  %2 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %__rhs.addr, align 8
  %call1 = call dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %2)
  %3 = load %struct.record*, %struct.record** %call1, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %1 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60
  ret i64 %sub.ptr.div
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZNSt6vectorI6recordSaIS0_EE5beginEv(%"class.std::vector"* %this) #0 comdat align 2 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0
  call void @_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.5"* %retval, %struct.record** dereferenceable(8) %_M_start)
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %retval, i32 0, i32 0
  %1 = load %struct.record*, %struct.record** %coerce.dive, align 8
  ret %struct.record* %1
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base"* %this, i64 %__n) #0 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %0 = load i64, i64* %__n.addr, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %1 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*
  %2 = load i64, i64* %__n.addr, align 8
  %call = call %struct.record* @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m(%"class.std::allocator"* dereferenceable(1) %1, i64 %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.record* [ %call, %cond.true ], [ null, %cond.false ]
  ret %struct.record* %cond
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result, %"class.std::allocator"* dereferenceable(1) %__alloc) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__alloc.addr = alloca %"class.std::allocator"*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  store %"class.std::allocator"* %__alloc, %"class.std::allocator"** %__alloc.addr, align 8
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %__alloc.addr, align 8
  %call = call %struct.record* @_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.record* %0, %struct.record* %1, %struct.record* %2, %"class.std::allocator"* dereferenceable(1) %3)
  ret %struct.record* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %this, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %this1, i32 0, i32 0
  ret %struct.record** %_M_current
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_(%"class.std::allocator"* dereferenceable(1) %__a, %struct.record* %__p) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_(%"class.__gnu_cxx::new_allocator"* %1, %struct.record* %2)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %0)
  %call2 = call i64 @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_(%"class.std::allocator"* dereferenceable(1) %call)
  ret i64 %call2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 0
  %3 = load %struct.record*, %struct.record** %_M_start, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %1 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60
  ret i64 %sub.ptr.div
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_(%"class.std::allocator"* dereferenceable(1) %__a) #4 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %1) #12
  ret i64 %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*
  ret %"class.std::allocator"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret i64 307445734561825860
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.5"* %this, %struct.record** dereferenceable(8) %__i) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  %__i.addr = alloca %struct.record**, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %this, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  store %struct.record** %__i, %struct.record*** %__i.addr, align 8
  %this1 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %this1, i32 0, i32 0
  %0 = load %struct.record**, %struct.record*** %__i.addr, align 8
  %1 = load %struct.record*, %struct.record** %0, align 8
  store %struct.record* %1, %struct.record** %_M_current, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m(%"class.std::allocator"* dereferenceable(1) %__a, i64 %__n) #0 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load i64, i64* %__n.addr, align 8
  %call = call %struct.record* @_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %1, i64 %2, i8* null)
  ret %struct.record* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %this, i64 %__n, i8* %0) #0 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__n.addr = alloca i64, align 8
  %.addr = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8* %0, i8** %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this1) #12
  %cmp = icmp ugt i64 %1, %call
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZSt17__throw_bad_allocv() #15
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %__n.addr, align 8
  %mul = mul i64 %2, 60
  %call2 = call i8* @_Znwm(i64 %mul)
  %3 = bitcast i8* %call2 to %struct.record*
  ret %struct.record* %3
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result, %"class.std::allocator"* dereferenceable(1) %0) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %.addr = alloca %"class.std::allocator"*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %.addr, align 8
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8
  %2 = load %struct.record*, %struct.record** %__last.addr, align 8
  %3 = load %struct.record*, %struct.record** %__result.addr, align 8
  %call = call %struct.record* @_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %1, %struct.record* %2, %struct.record* %3)
  ret %struct.record* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__assignable = alloca i8, align 1
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  store i8 1, i8* %__assignable, align 1
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8
  %call = call %struct.record* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_(%struct.record* %0, %struct.record* %1, %struct.record* %2)
  ret %struct.record* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #0 comdat align 2 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8
  %call = call %struct.record* @_ZSt4copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %0, %struct.record* %1, %struct.record* %2)
  ret %struct.record* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt4copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %call = call %struct.record* @_ZSt12__miter_baseIP6recordET_S2_(%struct.record* %0)
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  %call1 = call %struct.record* @_ZSt12__miter_baseIP6recordET_S2_(%struct.record* %1)
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8
  %call2 = call %struct.record* @_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %call, %struct.record* %call1, %struct.record* %2)
  ret %struct.record* %call2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %call = call %struct.record* @_ZSt12__niter_baseIP6recordET_S2_(%struct.record* %0)
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  %call1 = call %struct.record* @_ZSt12__niter_baseIP6recordET_S2_(%struct.record* %1)
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8
  %call2 = call %struct.record* @_ZSt12__niter_baseIP6recordET_S2_(%struct.record* %2)
  %call3 = call %struct.record* @_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %call, %struct.record* %call1, %struct.record* %call2)
  ret %struct.record* %call3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt12__miter_baseIP6recordET_S2_(%struct.record* %__it) #4 comdat {
entry:
  %__it.addr = alloca %struct.record*, align 8
  store %struct.record* %__it, %struct.record** %__it.addr, align 8
  %0 = load %struct.record*, %struct.record** %__it.addr, align 8
  ret %struct.record* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #0 comdat {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__simple = alloca i8, align 1
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  store i8 1, i8* %__simple, align 1
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8
  %call = call %struct.record* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_(%struct.record* %0, %struct.record* %1, %struct.record* %2)
  ret %struct.record* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZSt12__niter_baseIP6recordET_S2_(%struct.record* %__it) #4 comdat {
entry:
  %__it.addr = alloca %struct.record*, align 8
  store %struct.record* %__it, %struct.record** %__it.addr, align 8
  %0 = load %struct.record*, %struct.record** %__it.addr, align 8
  ret %struct.record* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %struct.record* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #4 comdat align 2 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %_Num = alloca i64, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  %0 = load %struct.record*, %struct.record** %__last.addr, align 8
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %0 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60
  store i64 %sub.ptr.div, i64* %_Num, align 8
  %2 = load i64, i64* %_Num, align 8
  %tobool = icmp ne i64 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.record*, %struct.record** %__result.addr, align 8
  %4 = bitcast %struct.record* %3 to i8*
  %5 = load %struct.record*, %struct.record** %__first.addr, align 8
  %6 = bitcast %struct.record* %5 to i8*
  %7 = load i64, i64* %_Num, align 8
  %mul = mul i64 60, %7
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %6, i64 %mul, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.record*, %struct.record** %__result.addr, align 8
  %9 = load i64, i64* %_Num, align 8
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %8, i64 %9
  ret %struct.record* %add.ptr
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_(%"class.__gnu_cxx::new_allocator"* %this, %struct.record* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %struct.record*, %struct.record** %__p.addr, align 8
  ret void
}

define internal void @__cuda_register_globals(i8** %0) {
entry:
  %1 = call i32 @__cudaRegisterFunction(i8** %0, i8* bitcast (void (%struct.latLong*, float*, i32, float, float)* @_Z6euclidP7latLongPfiff to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
  ret void
}

declare dso_local i32 @__cudaRegisterFunction(i8**, i8*, i8*, i8*, i32, i8*, i8*, i8*, i8*, i32*)

declare dso_local i32 @__cudaRegisterVar(i8**, i8*, i8*, i8*, i32, i32, i32, i32)

declare dso_local i8** @__cudaRegisterFatBinary(i8*)

define internal void @__cuda_module_ctor(i8* %0) {
entry:
  %1 = call i8** @__cudaRegisterFatBinary(i8* bitcast ({ i32, i32, i8*, i8* }* @__cuda_fatbin_wrapper to i8*))
  store i8** %1, i8*** @__cuda_gpubin_handle, align 8
  call void @__cuda_register_globals(i8** %1)
  call void @__cudaRegisterFatBinaryEnd(i8** %1)
  %2 = call i32 @atexit(void (i8*)* @__cuda_module_dtor)
  ret void
}

declare dso_local void @__cudaRegisterFatBinaryEnd(i8**)

declare dso_local void @__cudaUnregisterFatBinary(i8**)

define internal void @__cuda_module_dtor(i8* %0) {
entry:
  %1 = load i8**, i8*** @__cuda_gpubin_handle, align 8
  call void @__cudaUnregisterFatBinary(i8** %1)
  ret void
}

declare dso_local i32 @atexit(void (i8*)*)

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }
attributes #14 = { nounwind readonly }
attributes #15 = { noreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
