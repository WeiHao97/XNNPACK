if(EXISTS "/users/Wei_Hao/XNNPACK/psimd-download/psimd-prefix/src/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/psimd-download/psimd-prefix/src/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip" hash_value)
  if("x${hash_value}" STREQUAL "xdb23c2bc4a58d6f40c181797e43103300edac7cf9d286ca81590543f66ab95d2")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/Maratyszcza/psimd/archive/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip'
     dst='/users/Wei_Hao/XNNPACK/psimd-download/psimd-prefix/src/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/Maratyszcza/psimd/archive/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip"
  "/users/Wei_Hao/XNNPACK/psimd-download/psimd-prefix/src/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/Maratyszcza/psimd/archive/85427dd4c8521cc037a1ffa6fcd25c55fafc8a00.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
