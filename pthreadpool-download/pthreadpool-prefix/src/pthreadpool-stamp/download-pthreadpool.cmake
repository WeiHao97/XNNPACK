if(EXISTS "/users/Wei_Hao/XNNPACK/pthreadpool-download/pthreadpool-prefix/src/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/pthreadpool-download/pthreadpool-prefix/src/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip" hash_value)
  if("x${hash_value}" STREQUAL "xaf8c518b6ec65dca216143ddf5ef9d2e6b133123f9a47a24841ef447c5d91bd1")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/Maratyszcza/pthreadpool/archive/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip'
     dst='/users/Wei_Hao/XNNPACK/pthreadpool-download/pthreadpool-prefix/src/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/Maratyszcza/pthreadpool/archive/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip"
  "/users/Wei_Hao/XNNPACK/pthreadpool-download/pthreadpool-prefix/src/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/Maratyszcza/pthreadpool/archive/6525d8bb736b323eb4df9e4f3afdd3a8458d1a20.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
