if(EXISTS "/users/Wei_Hao/XNNPACK/clog-download/clog-prefix/src/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz")
  file("SHA256" "/users/Wei_Hao/XNNPACK/clog-download/clog-prefix/src/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz" hash_value)
  if("x${hash_value}" STREQUAL "x3f2dc1970f397a0e59db72f9fca6ff144b216895c1d606f6c94a507c1e53a025")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/pytorch/cpuinfo/archive/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz'
     dst='/users/Wei_Hao/XNNPACK/clog-download/clog-prefix/src/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/pytorch/cpuinfo/archive/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz"
  "/users/Wei_Hao/XNNPACK/clog-download/clog-prefix/src/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/pytorch/cpuinfo/archive/d5e37adf1406cf899d7d9ec1d317c47506ccb970.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
