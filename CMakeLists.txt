cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(CudaOnX86)
set(CMAKE_PROJECT_DESCRIPTION "Executing CUDA on X86 architecture.")
set(CMAKE_CXX_STANDARD "14")
set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(VERSION_STRING ${MAJOR_VERSION}.${MINOR_VERSION})
set(COX_VERSION ${VERSION_STRING})
# get LLVM PATH get PATH for head file
if(DEFINED LLVM_CONFIG_PATH)
  if(IS_ABSOLUTE "${LLVM_CONFIG_PATH}")
    if(EXISTS "${LLVM_CONFIG_PATH}")
      set(LLVM_CONFIG "${LLVM_CONFIG_PATH}")
    else()
      message(FATAL_ERROR "llvm-config is not found in ${LLVM_CONFIG_PATH}")
    endif()
    message(STATUS "Using llvm-config: ${LLVM_CONFIG}")
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
else()
  message(FATAL_ERROR "llvm-config is required")
endif()
# get CUDA PATH
if(DEFINED CUDA_PATH)
  message(STATUS "Using CUDA: ${CUDA_PATH}")
else()
  message(FATAL_ERROR "CUDA_PATH is required")
endif()

option(DEBUG "Print debug information." OFF)
if(DEBUG)
  add_definitions(-DDEBUG)
endif()

set(CMAKE_CXX_FLAGS
    "-I${CUDA_PATH}/include ${LLVM_CXX_FLAG} ${CMAKE_CXX_FLAGS}")

set(GCC_COVERAGE_LINK_FLAGS
    "-L${LLVM_LIB_PATH} ${LLVM_LINK_FLAG} -lz -lrt -ldl -ltinfo -lpthread -lm")

add_subdirectory(compilation)
add_subdirectory(runtime)
enable_testing()
add_subdirectory(tests)
