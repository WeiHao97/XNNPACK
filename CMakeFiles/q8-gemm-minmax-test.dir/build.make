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
include CMakeFiles/q8-gemm-minmax-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/q8-gemm-minmax-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/q8-gemm-minmax-test.dir/flags.make

CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o: CMakeFiles/q8-gemm-minmax-test.dir/flags.make
CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o: test/q8-gemm-minmax.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o -c /users/Wei_Hao/XNNPACK/test/q8-gemm-minmax.cc

CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/q8-gemm-minmax.cc > CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.i

CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/q8-gemm-minmax.cc -o CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.s

CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.requires:

.PHONY : CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.requires

CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.provides: CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.requires
	$(MAKE) -f CMakeFiles/q8-gemm-minmax-test.dir/build.make CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.provides.build
.PHONY : CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.provides

CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.provides.build: CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o


# Object files for target q8-gemm-minmax-test
q8__gemm__minmax__test_OBJECTS = \
"CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o"

# External object files for target q8-gemm-minmax-test
q8__gemm__minmax__test_EXTERNAL_OBJECTS =

q8-gemm-minmax-test: CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o
q8-gemm-minmax-test: CMakeFiles/q8-gemm-minmax-test.dir/build.make
q8-gemm-minmax-test: libXNNPACK.a
q8-gemm-minmax-test: cpuinfo/libcpuinfo.a
q8-gemm-minmax-test: lib/libgtest.a
q8-gemm-minmax-test: lib/libgtest_main.a
q8-gemm-minmax-test: /usr/lib/aarch64-linux-gnu/libm.so
q8-gemm-minmax-test: clog/libclog.a
q8-gemm-minmax-test: pthreadpool/libpthreadpool.a
q8-gemm-minmax-test: lib/libgtest.a
q8-gemm-minmax-test: CMakeFiles/q8-gemm-minmax-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable q8-gemm-minmax-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/q8-gemm-minmax-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/q8-gemm-minmax-test.dir/build: q8-gemm-minmax-test

.PHONY : CMakeFiles/q8-gemm-minmax-test.dir/build

CMakeFiles/q8-gemm-minmax-test.dir/requires: CMakeFiles/q8-gemm-minmax-test.dir/test/q8-gemm-minmax.cc.o.requires

.PHONY : CMakeFiles/q8-gemm-minmax-test.dir/requires

CMakeFiles/q8-gemm-minmax-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/q8-gemm-minmax-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/q8-gemm-minmax-test.dir/clean

CMakeFiles/q8-gemm-minmax-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/q8-gemm-minmax-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/q8-gemm-minmax-test.dir/depend
