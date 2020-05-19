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
include CMakeFiles/hardswish-nc-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hardswish-nc-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hardswish-nc-test.dir/flags.make

CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o: CMakeFiles/hardswish-nc-test.dir/flags.make
CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o: test/hardswish-nc.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o -c /users/Wei_Hao/XNNPACK/test/hardswish-nc.cc

CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/hardswish-nc.cc > CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.i

CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/hardswish-nc.cc -o CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.s

CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.requires:

.PHONY : CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.requires

CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.provides: CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.requires
	$(MAKE) -f CMakeFiles/hardswish-nc-test.dir/build.make CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.provides.build
.PHONY : CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.provides

CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.provides.build: CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o


# Object files for target hardswish-nc-test
hardswish__nc__test_OBJECTS = \
"CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o"

# External object files for target hardswish-nc-test
hardswish__nc__test_EXTERNAL_OBJECTS =

hardswish-nc-test: CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o
hardswish-nc-test: CMakeFiles/hardswish-nc-test.dir/build.make
hardswish-nc-test: libXNNPACK.a
hardswish-nc-test: lib/libgtest.a
hardswish-nc-test: lib/libgtest_main.a
hardswish-nc-test: /usr/lib/aarch64-linux-gnu/libm.so
hardswish-nc-test: cpuinfo/libcpuinfo.a
hardswish-nc-test: clog/libclog.a
hardswish-nc-test: pthreadpool/libpthreadpool.a
hardswish-nc-test: lib/libgtest.a
hardswish-nc-test: CMakeFiles/hardswish-nc-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hardswish-nc-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hardswish-nc-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hardswish-nc-test.dir/build: hardswish-nc-test

.PHONY : CMakeFiles/hardswish-nc-test.dir/build

CMakeFiles/hardswish-nc-test.dir/requires: CMakeFiles/hardswish-nc-test.dir/test/hardswish-nc.cc.o.requires

.PHONY : CMakeFiles/hardswish-nc-test.dir/requires

CMakeFiles/hardswish-nc-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hardswish-nc-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hardswish-nc-test.dir/clean

CMakeFiles/hardswish-nc-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/hardswish-nc-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hardswish-nc-test.dir/depend
