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
include CMakeFiles/x32-pad-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/x32-pad-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/x32-pad-test.dir/flags.make

CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o: CMakeFiles/x32-pad-test.dir/flags.make
CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o: test/x32-pad.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o -c /users/Wei_Hao/XNNPACK/test/x32-pad.cc

CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/x32-pad.cc > CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.i

CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/x32-pad.cc -o CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.s

CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.requires:

.PHONY : CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.requires

CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.provides: CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.requires
	$(MAKE) -f CMakeFiles/x32-pad-test.dir/build.make CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.provides.build
.PHONY : CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.provides

CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.provides.build: CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o


# Object files for target x32-pad-test
x32__pad__test_OBJECTS = \
"CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o"

# External object files for target x32-pad-test
x32__pad__test_EXTERNAL_OBJECTS =

x32-pad-test: CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o
x32-pad-test: CMakeFiles/x32-pad-test.dir/build.make
x32-pad-test: libXNNPACK.a
x32-pad-test: cpuinfo/libcpuinfo.a
x32-pad-test: lib/libgtest.a
x32-pad-test: lib/libgtest_main.a
x32-pad-test: /usr/lib/aarch64-linux-gnu/libm.so
x32-pad-test: clog/libclog.a
x32-pad-test: pthreadpool/libpthreadpool.a
x32-pad-test: lib/libgtest.a
x32-pad-test: CMakeFiles/x32-pad-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable x32-pad-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/x32-pad-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/x32-pad-test.dir/build: x32-pad-test

.PHONY : CMakeFiles/x32-pad-test.dir/build

CMakeFiles/x32-pad-test.dir/requires: CMakeFiles/x32-pad-test.dir/test/x32-pad.cc.o.requires

.PHONY : CMakeFiles/x32-pad-test.dir/requires

CMakeFiles/x32-pad-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/x32-pad-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/x32-pad-test.dir/clean

CMakeFiles/x32-pad-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/x32-pad-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/x32-pad-test.dir/depend

