# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /users/Wei_Hao/XNNPACK

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /users/Wei_Hao/XNNPACK

# Include any dependencies generated for this target.
include CMakeFiles/global-average-pooling-ncw-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/global-average-pooling-ncw-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/global-average-pooling-ncw-test.dir/flags.make

CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o: CMakeFiles/global-average-pooling-ncw-test.dir/flags.make
CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o: test/global-average-pooling-ncw.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o -c /users/Wei_Hao/XNNPACK/test/global-average-pooling-ncw.cc

CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/global-average-pooling-ncw.cc > CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.i

CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/global-average-pooling-ncw.cc -o CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.s

CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.requires:

.PHONY : CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.requires

CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.provides: CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.requires
	$(MAKE) -f CMakeFiles/global-average-pooling-ncw-test.dir/build.make CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.provides.build
.PHONY : CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.provides

CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.provides.build: CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o


# Object files for target global-average-pooling-ncw-test
global__average__pooling__ncw__test_OBJECTS = \
"CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o"

# External object files for target global-average-pooling-ncw-test
global__average__pooling__ncw__test_EXTERNAL_OBJECTS =

global-average-pooling-ncw-test: CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o
global-average-pooling-ncw-test: CMakeFiles/global-average-pooling-ncw-test.dir/build.make
global-average-pooling-ncw-test: libXNNPACK.a
global-average-pooling-ncw-test: lib/libgtest.a
global-average-pooling-ncw-test: lib/libgtest_main.a
global-average-pooling-ncw-test: /usr/lib/aarch64-linux-gnu/libm.so
global-average-pooling-ncw-test: cpuinfo/libcpuinfo.a
global-average-pooling-ncw-test: clog/libclog.a
global-average-pooling-ncw-test: pthreadpool/libpthreadpool.a
global-average-pooling-ncw-test: lib/libgtest.a
global-average-pooling-ncw-test: CMakeFiles/global-average-pooling-ncw-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable global-average-pooling-ncw-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/global-average-pooling-ncw-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/global-average-pooling-ncw-test.dir/build: global-average-pooling-ncw-test

.PHONY : CMakeFiles/global-average-pooling-ncw-test.dir/build

CMakeFiles/global-average-pooling-ncw-test.dir/requires: CMakeFiles/global-average-pooling-ncw-test.dir/test/global-average-pooling-ncw.cc.o.requires

.PHONY : CMakeFiles/global-average-pooling-ncw-test.dir/requires

CMakeFiles/global-average-pooling-ncw-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/global-average-pooling-ncw-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/global-average-pooling-ncw-test.dir/clean

CMakeFiles/global-average-pooling-ncw-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/global-average-pooling-ncw-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/global-average-pooling-ncw-test.dir/depend

