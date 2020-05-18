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
include CMakeFiles/f32-dwconv-bench.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/f32-dwconv-bench.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/f32-dwconv-bench.dir/flags.make

CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o: CMakeFiles/f32-dwconv-bench.dir/flags.make
CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o: bench/f32-dwconv.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o -c /users/Wei_Hao/XNNPACK/bench/f32-dwconv.cc

CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/bench/f32-dwconv.cc > CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.i

CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/bench/f32-dwconv.cc -o CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.s

CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.requires:

.PHONY : CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.requires

CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.provides: CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.requires
	$(MAKE) -f CMakeFiles/f32-dwconv-bench.dir/build.make CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.provides.build
.PHONY : CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.provides

CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.provides.build: CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o


# Object files for target f32-dwconv-bench
f32__dwconv__bench_OBJECTS = \
"CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o"

# External object files for target f32-dwconv-bench
f32__dwconv__bench_EXTERNAL_OBJECTS =

f32-dwconv-bench: CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o
f32-dwconv-bench: CMakeFiles/f32-dwconv-bench.dir/build.make
f32-dwconv-bench: libXNNPACK.a
f32-dwconv-bench: cpuinfo/libcpuinfo.a
f32-dwconv-bench: deps/googlebenchmark/src/libbenchmark.a
f32-dwconv-bench: libbench-utils.a
f32-dwconv-bench: /usr/lib/aarch64-linux-gnu/libm.so
f32-dwconv-bench: pthreadpool/libpthreadpool.a
f32-dwconv-bench: cpuinfo/libcpuinfo.a
f32-dwconv-bench: clog/libclog.a
f32-dwconv-bench: deps/googlebenchmark/src/libbenchmark.a
f32-dwconv-bench: /usr/lib/aarch64-linux-gnu/librt.so
f32-dwconv-bench: CMakeFiles/f32-dwconv-bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable f32-dwconv-bench"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/f32-dwconv-bench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/f32-dwconv-bench.dir/build: f32-dwconv-bench

.PHONY : CMakeFiles/f32-dwconv-bench.dir/build

CMakeFiles/f32-dwconv-bench.dir/requires: CMakeFiles/f32-dwconv-bench.dir/bench/f32-dwconv.cc.o.requires

.PHONY : CMakeFiles/f32-dwconv-bench.dir/requires

CMakeFiles/f32-dwconv-bench.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/f32-dwconv-bench.dir/cmake_clean.cmake
.PHONY : CMakeFiles/f32-dwconv-bench.dir/clean

CMakeFiles/f32-dwconv-bench.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/f32-dwconv-bench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/f32-dwconv-bench.dir/depend

