set(file "/users/Wei_Hao/XNNPACK/cpuinfo-download/cpuinfo-prefix/src/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "599ec5036fd225de01a866e7226ba6a5bca480d841ff0a0bede9138db7a655be")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/cpuinfo-download/cpuinfo-prefix/src/cpuinfo-stamp/download-cpuinfo.cmake")
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
