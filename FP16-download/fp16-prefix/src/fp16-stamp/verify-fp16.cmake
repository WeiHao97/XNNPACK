set(file "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "0d56bb92f649ec294dbccb13e04865e3c82933b6f6735d1d7145de45da700156")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/fp16-stamp/download-fp16.cmake")
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
