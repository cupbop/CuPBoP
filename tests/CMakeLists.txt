set(TESTCASES
    aes
    bs
    ep
    fir
    ga
    hist
    kmeans
    pr)
foreach(case IN LISTS TESTCASES)
  message(STATUS "Add test: ${case}")
  message(STATUS "${CMAKE_CURRENT_SOURCE_DIR}")

  message(STATUS "${CMAKE_BINARY_DIR}")
  find_program(BASH_PROGRAM bash)
  execute_process(COMMAND find . -name "*test.cc" -type f -delete)
  add_test(
    NAME "${case}"
    COMMAND
      ${BASH_PROGRAM} ${CMAKE_CURRENT_SOURCE_DIR}/runHeteroMark.sh ${case}
      ${CUDA_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/Hetero-Mark ${CMAKE_BINARY_DIR})
endforeach()
