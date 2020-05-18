set(file "/users/Wei_Hao/XNNPACK/pthreadpool-download/pthreadpool-prefix/src/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "af8c518b6ec65dca216143ddf5ef9d2e6b133123f9a47a24841ef447c5d91bd1")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/pthreadpool-download/pthreadpool-prefix/src/pthreadpool-stamp/download-pthreadpool.cmake")
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
