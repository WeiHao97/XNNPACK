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
include CMakeFiles/prelu-bench.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/prelu-bench.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/prelu-bench.dir/flags.make

CMakeFiles/prelu-bench.dir/bench/prelu.cc.o: CMakeFiles/prelu-bench.dir/flags.make
CMakeFiles/prelu-bench.dir/bench/prelu.cc.o: bench/prelu.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/prelu-bench.dir/bench/prelu.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/prelu-bench.dir/bench/prelu.cc.o -c /users/Wei_Hao/XNNPACK/bench/prelu.cc

CMakeFiles/prelu-bench.dir/bench/prelu.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prelu-bench.dir/bench/prelu.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/bench/prelu.cc > CMakeFiles/prelu-bench.dir/bench/prelu.cc.i

CMakeFiles/prelu-bench.dir/bench/prelu.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prelu-bench.dir/bench/prelu.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/bench/prelu.cc -o CMakeFiles/prelu-bench.dir/bench/prelu.cc.s

CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.requires:

.PHONY : CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.requires

CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.provides: CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.requires
	$(MAKE) -f CMakeFiles/prelu-bench.dir/build.make CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.provides.build
.PHONY : CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.provides

CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.provides.build: CMakeFiles/prelu-bench.dir/bench/prelu.cc.o


# Object files for target prelu-bench
prelu__bench_OBJECTS = \
"CMakeFiles/prelu-bench.dir/bench/prelu.cc.o"

# External object files for target prelu-bench
prelu__bench_EXTERNAL_OBJECTS =

prelu-bench: CMakeFiles/prelu-bench.dir/bench/prelu.cc.o
prelu-bench: CMakeFiles/prelu-bench.dir/build.make
prelu-bench: libXNNPACK.a
prelu-bench: cpuinfo/libcpuinfo.a
prelu-bench: deps/googlebenchmark/src/libbenchmark.a
prelu-bench: libbench-utils.a
prelu-bench: /usr/lib/aarch64-linux-gnu/libm.so
prelu-bench: pthreadpool/libpthreadpool.a
prelu-bench: cpuinfo/libcpuinfo.a
prelu-bench: clog/libclog.a
prelu-bench: deps/googlebenchmark/src/libbenchmark.a
prelu-bench: /usr/lib/aarch64-linux-gnu/librt.so
prelu-bench: CMakeFiles/prelu-bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable prelu-bench"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/prelu-bench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/prelu-bench.dir/build: prelu-bench

.PHONY : CMakeFiles/prelu-bench.dir/build

CMakeFiles/prelu-bench.dir/requires: CMakeFiles/prelu-bench.dir/bench/prelu.cc.o.requires

.PHONY : CMakeFiles/prelu-bench.dir/requires

CMakeFiles/prelu-bench.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/prelu-bench.dir/cmake_clean.cmake
.PHONY : CMakeFiles/prelu-bench.dir/clean

CMakeFiles/prelu-bench.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/prelu-bench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/prelu-bench.dir/depend

