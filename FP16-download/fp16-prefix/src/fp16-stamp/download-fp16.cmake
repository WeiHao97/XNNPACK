# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

function(check_file_hash has_hash hash_is_good)
  if("${has_hash}" STREQUAL "")
    message(FATAL_ERROR "has_hash Can't be empty")
  endif()

  if("${hash_is_good}" STREQUAL "")
    message(FATAL_ERROR "hash_is_good Can't be empty")
  endif()

  if("SHA256" STREQUAL "")
    # No check
    set("${has_hash}" FALSE PARENT_SCOPE)
    set("${hash_is_good}" FALSE PARENT_SCOPE)
    return()
  endif()

  set("${has_hash}" TRUE PARENT_SCOPE)

  message(STATUS "verifying file...
       file='/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip'")

  file("SHA256" "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip" actual_value)

  if(NOT "${actual_value}" STREQUAL "0d56bb92f649ec294dbccb13e04865e3c82933b6f6735d1d7145de45da700156")
    set("${hash_is_good}" FALSE PARENT_SCOPE)
    message(STATUS "SHA256 hash of
    /users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip
  does not match expected value
    expected: '0d56bb92f649ec294dbccb13e04865e3c82933b6f6735d1d7145de45da700156'
      actual: '${actual_value}'")
  else()
    set("${hash_is_good}" TRUE PARENT_SCOPE)
  endif()
endfunction()

function(sleep_before_download attempt)
  if(attempt EQUAL 0)
    return()
  endif()

  if(attempt EQUAL 1)
    message(STATUS "Retrying...")
    return()
  endif()

  set(sleep_seconds 0)

  if(attempt EQUAL 2)
    set(sleep_seconds 5)
  elseif(attempt EQUAL 3)
    set(sleep_seconds 5)
  elseif(attempt EQUAL 4)
    set(sleep_seconds 15)
  elseif(attempt EQUAL 5)
    set(sleep_seconds 60)
  elseif(attempt EQUAL 6)
    set(sleep_seconds 90)
  elseif(attempt EQUAL 7)
    set(sleep_seconds 300)
  else()
    set(sleep_seconds 1200)
  endif()

  message(STATUS "Retry after ${sleep_seconds} seconds (attempt #${attempt}) ...")

  execute_process(COMMAND "${CMAKE_COMMAND}" -E sleep "${sleep_seconds}")
endfunction()

if("/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip" STREQUAL "")
  message(FATAL_ERROR "LOCAL can't be empty")
endif()

if("https://github.com/Maratyszcza/FP16/archive/3c54eacb74f6f5e39077300c5564156c424d77ba.zip" STREQUAL "")
  message(FATAL_ERROR "REMOTE can't be empty")
endif()

if(EXISTS "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip")
  check_file_hash(has_hash hash_is_good)
  if(has_hash)
    if(hash_is_good)
      message(STATUS "File already exists and hash match (skip download):
  file='/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip'
  SHA256='0d56bb92f649ec294dbccb13e04865e3c82933b6f6735d1d7145de45da700156'"
      )
      return()
    else()
      message(STATUS "File already exists but hash mismatch. Removing...")
      file(REMOVE "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip")
    endif()
  else()
    message(STATUS "File already exists but no hash specified (use URL_HASH):
  file='/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip'
Old file will be removed and new file downloaded from URL."
    )
    file(REMOVE "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip")
  endif()
endif()

set(retry_number 5)

message(STATUS "Downloading...
   dst='/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip'
   timeout='none'"
)

foreach(i RANGE ${retry_number})
  sleep_before_download(${i})

  foreach(url https://github.com/Maratyszcza/FP16/archive/3c54eacb74f6f5e39077300c5564156c424d77ba.zip)
    message(STATUS "Using src='${url}'")

    
    

    file(
        DOWNLOAD
        "${url}" "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip"
        SHOW_PROGRESS
        # no TIMEOUT
        STATUS status
        LOG log
        
        
    )

    list(GET status 0 status_code)
    list(GET status 1 status_string)

    if(status_code EQUAL 0)
      check_file_hash(has_hash hash_is_good)
      if(has_hash AND NOT hash_is_good)
        message(STATUS "Hash mismatch, removing...")
        file(REMOVE "/users/Wei_Hao/XNNPACK/FP16-download/fp16-prefix/src/3c54eacb74f6f5e39077300c5564156c424d77ba.zip")
      else()
        message(STATUS "Downloading... done")
        return()
      endif()
    else()
      string(APPEND logFailedURLs "error: downloading '${url}' failed
       status_code: ${status_code}
       status_string: ${status_string}
       log:
       --- LOG BEGIN ---
       ${log}
       --- LOG END ---
       "
      )
    endif()
  endforeach()
endforeach()

message(FATAL_ERROR "Each download failed!
  ${logFailedURLs}
  "
)
