set(file "/users/Wei_Hao/XNNPACK/psimd-download/psimd-prefix/src/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "db23c2bc4a58d6f40c181797e43103300edac7cf9d286ca81590543f66ab95d2")
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
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/users/Wei_Hao/XNNPACK/psimd-download/psimd-prefix/src/psimd-stamp/download-psimd.cmake")
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
