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
include CMakeFiles/f32-spmm-bench.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/f32-spmm-bench.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/f32-spmm-bench.dir/flags.make

CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o: CMakeFiles/f32-spmm-bench.dir/flags.make
CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o: bench/f32-spmm.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o -c /users/Wei_Hao/XNNPACK/bench/f32-spmm.cc

CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/bench/f32-spmm.cc > CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.i

CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/bench/f32-spmm.cc -o CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.s

CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.requires:

.PHONY : CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.requires

CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.provides: CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.requires
	$(MAKE) -f CMakeFiles/f32-spmm-bench.dir/build.make CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.provides.build
.PHONY : CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.provides

CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.provides.build: CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o


# Object files for target f32-spmm-bench
f32__spmm__bench_OBJECTS = \
"CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o"

# External object files for target f32-spmm-bench
f32__spmm__bench_EXTERNAL_OBJECTS =

f32-spmm-bench: CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o
f32-spmm-bench: CMakeFiles/f32-spmm-bench.dir/build.make
f32-spmm-bench: libXNNPACK.a
f32-spmm-bench: cpuinfo/libcpuinfo.a
f32-spmm-bench: deps/googlebenchmark/src/libbenchmark.a
f32-spmm-bench: libbench-utils.a
f32-spmm-bench: /usr/lib/aarch64-linux-gnu/libm.so
f32-spmm-bench: pthreadpool/libpthreadpool.a
f32-spmm-bench: cpuinfo/libcpuinfo.a
f32-spmm-bench: clog/libclog.a
f32-spmm-bench: deps/googlebenchmark/src/libbenchmark.a
f32-spmm-bench: /usr/lib/aarch64-linux-gnu/librt.so
f32-spmm-bench: CMakeFiles/f32-spmm-bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable f32-spmm-bench"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/f32-spmm-bench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/f32-spmm-bench.dir/build: f32-spmm-bench

.PHONY : CMakeFiles/f32-spmm-bench.dir/build

CMakeFiles/f32-spmm-bench.dir/requires: CMakeFiles/f32-spmm-bench.dir/bench/f32-spmm.cc.o.requires

.PHONY : CMakeFiles/f32-spmm-bench.dir/requires

CMakeFiles/f32-spmm-bench.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/f32-spmm-bench.dir/cmake_clean.cmake
.PHONY : CMakeFiles/f32-spmm-bench.dir/clean

CMakeFiles/f32-spmm-bench.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/f32-spmm-bench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/f32-spmm-bench.dir/depend

