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
include CMakeFiles/convolution-nchw-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/convolution-nchw-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/convolution-nchw-test.dir/flags.make

CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o: CMakeFiles/convolution-nchw-test.dir/flags.make
CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o: test/convolution-nchw.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o -c /users/Wei_Hao/XNNPACK/test/convolution-nchw.cc

CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/convolution-nchw.cc > CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.i

CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/convolution-nchw.cc -o CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.s

CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.requires:

.PHONY : CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.requires

CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.provides: CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.requires
	$(MAKE) -f CMakeFiles/convolution-nchw-test.dir/build.make CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.provides.build
.PHONY : CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.provides

CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.provides.build: CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o


# Object files for target convolution-nchw-test
convolution__nchw__test_OBJECTS = \
"CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o"

# External object files for target convolution-nchw-test
convolution__nchw__test_EXTERNAL_OBJECTS =

convolution-nchw-test: CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o
convolution-nchw-test: CMakeFiles/convolution-nchw-test.dir/build.make
convolution-nchw-test: libXNNPACK.a
convolution-nchw-test: lib/libgtest.a
convolution-nchw-test: lib/libgtest_main.a
convolution-nchw-test: /usr/lib/aarch64-linux-gnu/libm.so
convolution-nchw-test: cpuinfo/libcpuinfo.a
convolution-nchw-test: clog/libclog.a
convolution-nchw-test: pthreadpool/libpthreadpool.a
convolution-nchw-test: lib/libgtest.a
convolution-nchw-test: CMakeFiles/convolution-nchw-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable convolution-nchw-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/convolution-nchw-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/convolution-nchw-test.dir/build: convolution-nchw-test

.PHONY : CMakeFiles/convolution-nchw-test.dir/build

CMakeFiles/convolution-nchw-test.dir/requires: CMakeFiles/convolution-nchw-test.dir/test/convolution-nchw.cc.o.requires

.PHONY : CMakeFiles/convolution-nchw-test.dir/requires

CMakeFiles/convolution-nchw-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/convolution-nchw-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/convolution-nchw-test.dir/clean

CMakeFiles/convolution-nchw-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/convolution-nchw-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/convolution-nchw-test.dir/depend

