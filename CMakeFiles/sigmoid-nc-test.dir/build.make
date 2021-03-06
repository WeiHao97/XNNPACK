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
include CMakeFiles/sigmoid-nc-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sigmoid-nc-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sigmoid-nc-test.dir/flags.make

CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o: CMakeFiles/sigmoid-nc-test.dir/flags.make
CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o: test/sigmoid-nc.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o -c /users/Wei_Hao/XNNPACK/test/sigmoid-nc.cc

CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/test/sigmoid-nc.cc > CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.i

CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/test/sigmoid-nc.cc -o CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.s

CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.requires:

.PHONY : CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.requires

CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.provides: CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.requires
	$(MAKE) -f CMakeFiles/sigmoid-nc-test.dir/build.make CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.provides.build
.PHONY : CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.provides

CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.provides.build: CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o


# Object files for target sigmoid-nc-test
sigmoid__nc__test_OBJECTS = \
"CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o"

# External object files for target sigmoid-nc-test
sigmoid__nc__test_EXTERNAL_OBJECTS =

sigmoid-nc-test: CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o
sigmoid-nc-test: CMakeFiles/sigmoid-nc-test.dir/build.make
sigmoid-nc-test: libXNNPACK.a
sigmoid-nc-test: lib/libgtest.a
sigmoid-nc-test: lib/libgtest_main.a
sigmoid-nc-test: /usr/lib/aarch64-linux-gnu/libm.so
sigmoid-nc-test: cpuinfo/libcpuinfo.a
sigmoid-nc-test: clog/libclog.a
sigmoid-nc-test: pthreadpool/libpthreadpool.a
sigmoid-nc-test: lib/libgtest.a
sigmoid-nc-test: CMakeFiles/sigmoid-nc-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sigmoid-nc-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sigmoid-nc-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sigmoid-nc-test.dir/build: sigmoid-nc-test

.PHONY : CMakeFiles/sigmoid-nc-test.dir/build

CMakeFiles/sigmoid-nc-test.dir/requires: CMakeFiles/sigmoid-nc-test.dir/test/sigmoid-nc.cc.o.requires

.PHONY : CMakeFiles/sigmoid-nc-test.dir/requires

CMakeFiles/sigmoid-nc-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sigmoid-nc-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sigmoid-nc-test.dir/clean

CMakeFiles/sigmoid-nc-test.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/sigmoid-nc-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sigmoid-nc-test.dir/depend

