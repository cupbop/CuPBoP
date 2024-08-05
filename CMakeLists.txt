cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(CuPBoP)
set(CMAKE_PROJECT_DESCRIPTION "Executing CUDA on non-NVIDIA architecture.")
set(CMAKE_CXX_STANDARD "14")

find_program(LLVM_CONFIG llvm-config)
if(NOT LLVM_CONFIG)
  message(FATAL_ERROR "llvm-config not found. Please install LLVM.")
else()
  message(STATUS "Found llvm-config: ${LLVM_CONFIG}")
  execute_process(
    COMMAND "${LLVM_CONFIG}" "--cxxflags"
    OUTPUT_VARIABLE LLVM_CXX_FLAG
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(
    COMMAND "${LLVM_CONFIG}" "--libdir"
    OUTPUT_VARIABLE LLVM_LIB_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(
    COMMAND "${LLVM_CONFIG}" "--libs"
    OUTPUT_VARIABLE LLVM_LINK_FLAG
    OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()

if(DEFINED CUDA_PATH)
  message(STATUS "CUDA_PATH provided: ${CUDA_PATH}")
elseif(DEFINED ENV{CUDA_PATH})
  set(CUDA_PATH $ENV{CUDA_PATH})
  message(STATUS "CUDA_PATH from environment: ${CUDA_PATH}")
else()
  message(FATAL_ERROR "CUDA_PATH is not provided. Please set CUDA_PATH or
      define it as an environment variable.")
endif()

option(DEBUG "Print debug information." OFF)
if(DEBUG)
  add_definitions(-DDEBUG)
endif()

set(CMAKE_CXX_FLAGS
    "-I${CUDA_PATH}/include ${LLVM_CXX_FLAG} ${CMAKE_CXX_FLAGS} -Wunused")

set(GCC_COVERAGE_LINK_FLAGS
    "-L${LLVM_LIB_PATH} ${LLVM_LINK_FLAG} -lz -lrt -ldl -ltinfo -lpthread -lm")

add_subdirectory(compilation)
add_subdirectory(runtime)
enable_testing()

set(HETERO_MARK_DATA
    "/tmp/data"
    CACHE PATH "The path to download hetero-mark dataset.")

add_subdirectory(test)
