set(file "/users/Wei_Hao/XNNPACK/FXdiv-download/fxdiv-prefix/src/b408327ac2a15ec3e43352421954f5b1967701d1.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "ab7dfb08829bee33dca38405d647868fb214ac685e379ec7ef2bebcd234cd44d")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/FXdiv-download/fxdiv-prefix/src/fxdiv-stamp/download-fxdiv.cmake")
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
