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
include CMakeFiles/multiply-nd-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/multiply-nd-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/multiply-nd-test.dir/flags.make

CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o: CMakeFiles/multiply-nd-test.dir/flags.make
CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o: test/multiply-nd.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o -c /users/Wei_Hao/XNNPACK/test/multiply-nd.cc

CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/multiply-nd.cc > CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.i

CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/multiply-nd.cc -o CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.s

CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.requires:

.PHONY : CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.requires

CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.provides: CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.requires
	$(MAKE) -f CMakeFiles/multiply-nd-test.dir/build.make CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.provides.build
.PHONY : CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.provides

CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.provides.build: CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o


# Object files for target multiply-nd-test
multiply__nd__test_OBJECTS = \
"CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o"

# External object files for target multiply-nd-test
multiply__nd__test_EXTERNAL_OBJECTS =

multiply-nd-test: CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o
multiply-nd-test: CMakeFiles/multiply-nd-test.dir/build.make
multiply-nd-test: libXNNPACK.a
multiply-nd-test: lib/libgtest.a
multiply-nd-test: lib/libgtest_main.a
multiply-nd-test: /usr/lib/aarch64-linux-gnu/libm.so
multiply-nd-test: cpuinfo/libcpuinfo.a
multiply-nd-test: clog/libclog.a
multiply-nd-test: pthreadpool/libpthreadpool.a
multiply-nd-test: lib/libgtest.a
multiply-nd-test: CMakeFiles/multiply-nd-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable multiply-nd-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/multiply-nd-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/multiply-nd-test.dir/build: multiply-nd-test

.PHONY : CMakeFiles/multiply-nd-test.dir/build

CMakeFiles/multiply-nd-test.dir/requires: CMakeFiles/multiply-nd-test.dir/test/multiply-nd.cc.o.requires

.PHONY : CMakeFiles/multiply-nd-test.dir/requires

CMakeFiles/multiply-nd-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/multiply-nd-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/multiply-nd-test.dir/clean

CMakeFiles/multiply-nd-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/multiply-nd-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/multiply-nd-test.dir/depend

