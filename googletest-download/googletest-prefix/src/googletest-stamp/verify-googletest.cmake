set(file "/users/Wei_Hao/XNNPACK/googletest-download/googletest-prefix/src/release-1.10.0.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "94c634d499558a76fa649edb13721dce6e98fb1e7018dfaeba3cd7a083945e91")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/googletest-download/googletest-prefix/src/googletest-stamp/download-googletest.cmake")
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
