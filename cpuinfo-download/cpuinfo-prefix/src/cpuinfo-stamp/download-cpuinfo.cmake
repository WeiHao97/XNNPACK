if(EXISTS "/users/Wei_Hao/XNNPACK/cpuinfo-download/cpuinfo-prefix/src/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/cpuinfo-download/cpuinfo-prefix/src/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip" hash_value)
  if("x${hash_value}" STREQUAL "x599ec5036fd225de01a866e7226ba6a5bca480d841ff0a0bede9138db7a655be")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/pytorch/cpuinfo/archive/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip'
     dst='/users/Wei_Hao/XNNPACK/cpuinfo-download/cpuinfo-prefix/src/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/pytorch/cpuinfo/archive/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip"
  "/users/Wei_Hao/XNNPACK/cpuinfo-download/cpuinfo-prefix/src/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/pytorch/cpuinfo/archive/2b14e445016dd46f7de821cdf3093e2823b9ab21.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
