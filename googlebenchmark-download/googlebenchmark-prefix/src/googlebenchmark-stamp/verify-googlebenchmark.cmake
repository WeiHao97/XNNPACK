set(file "/users/Wei_Hao/XNNPACK/googlebenchmark-download/googlebenchmark-prefix/src/v1.4.1.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "61ae07eb5d4a0b02753419eb17a82b7d322786bb36ab62bd3df331a4d47c00a7")
set(attempt 0)
set(succeeded 0)
while(${attempt} LESS 3 OR ${attempt} EQUAL 3 AND NOT ${succeeded})
  file(SHA256 "${file}" actual_value)
  if("${actual_value}" STREQUAL "${expect_value}")
    set(succeeded 1)
  elseif(${attempt} LESS 3)
    message(STATUS "SHA256 hash of ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
Retrying download.
")
    file(REMOVE "${file}")
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/googlebenchmark-download/googlebenchmark-prefix/src/googlebenchmark-stamp/download-googlebenchmark.cmake")
  endif()
  math(EXPR attempt "${attempt} + 1")
endwhile()

if(${succeeded})
  message(STATUS "verifying file... done")
else()
  message(FATAL_ERROR "error: SHA256 hash of
  ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
")
endif()
