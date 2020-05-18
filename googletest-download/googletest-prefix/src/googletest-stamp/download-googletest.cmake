if(EXISTS "/users/Wei_Hao/XNNPACK/googletest-download/googletest-prefix/src/release-1.10.0.zip")
  file("SHA256" "/users/Wei_Hao/XNNPACK/googletest-download/googletest-prefix/src/release-1.10.0.zip" hash_value)
  if("x${hash_value}" STREQUAL "x94c634d499558a76fa649edb13721dce6e98fb1e7018dfaeba3cd7a083945e91")
    return()
  endif()
endif()
message(STATUS "downloading...
     src='https://github.com/google/googletest/archive/release-1.10.0.zip'
     dst='/users/Wei_Hao/XNNPACK/googletest-download/googletest-prefix/src/release-1.10.0.zip'
     timeout='none'")




file(DOWNLOAD
  "https://github.com/google/googletest/archive/release-1.10.0.zip"
  "/users/Wei_Hao/XNNPACK/googletest-download/googletest-prefix/src/release-1.10.0.zip"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://github.com/google/googletest/archive/release-1.10.0.zip' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
