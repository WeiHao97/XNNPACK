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
include CMakeFiles/average-pooling-bench.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/average-pooling-bench.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/average-pooling-bench.dir/flags.make

CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o: CMakeFiles/average-pooling-bench.dir/flags.make
CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o: bench/average-pooling.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o -c /users/Wei_Hao/XNNPACK/bench/average-pooling.cc

CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/bench/average-pooling.cc > CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.i

CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/bench/average-pooling.cc -o CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.s

CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.requires:

.PHONY : CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.requires

CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.provides: CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.requires
	$(MAKE) -f CMakeFiles/average-pooling-bench.dir/build.make CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.provides.build
.PHONY : CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.provides

CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.provides.build: CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o


# Object files for target average-pooling-bench
average__pooling__bench_OBJECTS = \
"CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o"

# External object files for target average-pooling-bench
average__pooling__bench_EXTERNAL_OBJECTS =

average-pooling-bench: CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o
average-pooling-bench: CMakeFiles/average-pooling-bench.dir/build.make
average-pooling-bench: libXNNPACK.a
average-pooling-bench: cpuinfo/libcpuinfo.a
average-pooling-bench: deps/googlebenchmark/src/libbenchmark.a
average-pooling-bench: libbench-utils.a
average-pooling-bench: /usr/lib/aarch64-linux-gnu/libm.so
average-pooling-bench: pthreadpool/libpthreadpool.a
average-pooling-bench: cpuinfo/libcpuinfo.a
average-pooling-bench: clog/libclog.a
average-pooling-bench: deps/googlebenchmark/src/libbenchmark.a
average-pooling-bench: /usr/lib/aarch64-linux-gnu/librt.so
average-pooling-bench: CMakeFiles/average-pooling-bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable average-pooling-bench"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/average-pooling-bench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/average-pooling-bench.dir/build: average-pooling-bench

.PHONY : CMakeFiles/average-pooling-bench.dir/build

CMakeFiles/average-pooling-bench.dir/requires: CMakeFiles/average-pooling-bench.dir/bench/average-pooling.cc.o.requires

.PHONY : CMakeFiles/average-pooling-bench.dir/requires

CMakeFiles/average-pooling-bench.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/average-pooling-bench.dir/cmake_clean.cmake
.PHONY : CMakeFiles/average-pooling-bench.dir/clean

CMakeFiles/average-pooling-bench.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/average-pooling-bench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/average-pooling-bench.dir/depend
