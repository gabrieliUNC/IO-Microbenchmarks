
if(NOT "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/stamp/googletest-gitinfo.txt" IS_NEWER_THAN "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/stamp/googletest-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/stamp/googletest-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/google/googletest.git" "src"
    WORKING_DIRECTORY "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/google/googletest.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout v1.14.0 --
  WORKING_DIRECTORY "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v1.14.0'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/stamp/googletest-gitinfo.txt"
    "/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/stamp/googletest-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/mnt/learncli/workdir/lab5/build/benchmark/third_party/googletest/stamp/googletest-gitclone-lastrun.txt'")
endif()
