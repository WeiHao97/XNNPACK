if(EXISTS "/users/Wei_Hao/XNNPACK/FXdiv-download/fxdiv-prefix/src/b408327ac2a15ec3e43352421954f5b1967701d1.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/FXdiv-download/fxdiv-prefix/src/b408327ac2a15ec3e43352421954f5b1967701d1.zip" hash_value)
  if("x${hash_value}" STREQUAL "xab7dfb08829bee33dca38405d647868fb214ac685e379ec7ef2bebcd234cd44d")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/Maratyszcza/FXdiv/archive/b408327ac2a15ec3e43352421954f5b1967701d1.zip'
     dst='/users/Wei_Hao/XNNPACK/FXdiv-download/fxdiv-prefix/src/b408327ac2a15ec3e43352421954f5b1967701d1.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/Maratyszcza/FXdiv/archive/b408327ac2a15ec3e43352421954f5b1967701d1.zip"
  "/users/Wei_Hao/XNNPACK/FXdiv-download/fxdiv-prefix/src/b408327ac2a15ec3e43352421954f5b1967701d1.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/Maratyszcza/FXdiv/archive/b408327ac2a15ec3e43352421954f5b1967701d1.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
