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
include CMakeFiles/convolution-bench.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/convolution-bench.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/convolution-bench.dir/flags.make

CMakeFiles/convolution-bench.dir/bench/convolution.cc.o: CMakeFiles/convolution-bench.dir/flags.make
CMakeFiles/convolution-bench.dir/bench/convolution.cc.o: bench/convolution.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/convolution-bench.dir/bench/convolution.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/convolution-bench.dir/bench/convolution.cc.o -c /users/Wei_Hao/XNNPACK/bench/convolution.cc

CMakeFiles/convolution-bench.dir/bench/convolution.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/convolution-bench.dir/bench/convolution.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/bench/convolution.cc > CMakeFiles/convolution-bench.dir/bench/convolution.cc.i

CMakeFiles/convolution-bench.dir/bench/convolution.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/convolution-bench.dir/bench/convolution.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/bench/convolution.cc -o CMakeFiles/convolution-bench.dir/bench/convolution.cc.s

CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.requires:

.PHONY : CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.requires

CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.provides: CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.requires
	$(MAKE) -f CMakeFiles/convolution-bench.dir/build.make CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.provides.build
.PHONY : CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.provides

CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.provides.build: CMakeFiles/convolution-bench.dir/bench/convolution.cc.o


# Object files for target convolution-bench
convolution__bench_OBJECTS = \
"CMakeFiles/convolution-bench.dir/bench/convolution.cc.o"

# External object files for target convolution-bench
convolution__bench_EXTERNAL_OBJECTS =

convolution-bench: CMakeFiles/convolution-bench.dir/bench/convolution.cc.o
convolution-bench: CMakeFiles/convolution-bench.dir/build.make
convolution-bench: libXNNPACK.a
convolution-bench: cpuinfo/libcpuinfo.a
convolution-bench: deps/googlebenchmark/src/libbenchmark.a
convolution-bench: libbench-utils.a
convolution-bench: /usr/lib/aarch64-linux-gnu/libm.so
convolution-bench: pthreadpool/libpthreadpool.a
convolution-bench: cpuinfo/libcpuinfo.a
convolution-bench: clog/libclog.a
convolution-bench: deps/googlebenchmark/src/libbenchmark.a
convolution-bench: /usr/lib/aarch64-linux-gnu/librt.so
convolution-bench: CMakeFiles/convolution-bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable convolution-bench"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/convolution-bench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/convolution-bench.dir/build: convolution-bench

.PHONY : CMakeFiles/convolution-bench.dir/build

CMakeFiles/convolution-bench.dir/requires: CMakeFiles/convolution-bench.dir/bench/convolution.cc.o.requires

.PHONY : CMakeFiles/convolution-bench.dir/requires

CMakeFiles/convolution-bench.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/convolution-bench.dir/cmake_clean.cmake
.PHONY : CMakeFiles/convolution-bench.dir/clean

CMakeFiles/convolution-bench.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/convolution-bench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/convolution-bench.dir/depend
