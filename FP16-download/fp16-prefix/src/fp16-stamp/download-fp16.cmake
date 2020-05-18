if(EXISTS "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip" hash_value)
  if("x${hash_value}" STREQUAL "x0d56bb92f649ec294dbccb13e04865e3c82933b6f6735d1d7145de45da700156")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/Maratyszcza/FP16/archive/3c54eacb74f6f5e39077300c5564156c424d77ba.zip'
     dst='/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/Maratyszcza/FP16/archive/3c54eacb74f6f5e39077300c5564156c424d77ba.zip"
  "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/Maratyszcza/FP16/archive/3c54eacb74f6f5e39077300c5564156c424d77ba.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
