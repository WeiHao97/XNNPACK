set(file "/users/Wei_Hao/XNNPACK/clog-download/clog-prefix/src/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "3f2dc1970f397a0e59db72f9fca6ff144b216895c1d606f6c94a507c1e53a025")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/clog-download/clog-prefix/src/clog-stamp/download-clog.cmake")
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
