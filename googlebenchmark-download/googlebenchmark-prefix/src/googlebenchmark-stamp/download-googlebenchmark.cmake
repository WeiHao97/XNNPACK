if(EXISTS "/users/Wei_Hao/XNNPACK/googlebenchmark-download/googlebenchmark-prefix/src/v1.4.1.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/googlebenchmark-download/googlebenchmark-prefix/src/v1.4.1.zip" hash_value)
  if("x${hash_value}" STREQUAL "x61ae07eb5d4a0b02753419eb17a82b7d322786bb36ab62bd3df331a4d47c00a7")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/google/benchmark/archive/v1.4.1.zip'
     dst='/users/Wei_Hao/XNNPACK/googlebenchmark-download/googlebenchmark-prefix/src/v1.4.1.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/google/benchmark/archive/v1.4.1.zip"
  "/users/Wei_Hao/XNNPACK/googlebenchmark-download/googlebenchmark-prefix/src/v1.4.1.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/google/benchmark/archive/v1.4.1.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
