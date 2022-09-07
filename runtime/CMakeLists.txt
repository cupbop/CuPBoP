cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(
  X86runtime
  DESCRIPTION "Implementation CUDA runtime API with x86"
  LANGUAGES CXX)
set(LIB_NAME x86Runtime)
set(CMAKE_VERBOSE_MAKEFILE ON)

# compile threadPool implementation
add_subdirectory(threadPool)

# compile x86 runtime library
include_directories(./include/)
include_directories(./include/x86)
include_directories(./threadPool/include/)
include_directories(./threadPool/include/x86)
include_directories(../external/moodycamel/)
file(GLOB proj_SOURCES "src/x86/*.cpp")
add_library(${LIB_NAME} SHARED ${proj_SOURCES})
