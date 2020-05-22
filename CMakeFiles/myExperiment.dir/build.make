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
include CMakeFiles/myExperiment.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/myExperiment.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/myExperiment.dir/flags.make

CMakeFiles/myExperiment.dir/myExperiment.cc.o: CMakeFiles/myExperiment.dir/flags.make
CMakeFiles/myExperiment.dir/myExperiment.cc.o: myExperiment.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/myExperiment.dir/myExperiment.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/myExperiment.dir/myExperiment.cc.o -c /users/Wei_Hao/XNNPACK/myExperiment.cc

CMakeFiles/myExperiment.dir/myExperiment.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/myExperiment.dir/myExperiment.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/myExperiment.cc > CMakeFiles/myExperiment.dir/myExperiment.cc.i

CMakeFiles/myExperiment.dir/myExperiment.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/myExperiment.dir/myExperiment.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/myExperiment.cc -o CMakeFiles/myExperiment.dir/myExperiment.cc.s

CMakeFiles/myExperiment.dir/myExperiment.cc.o.requires:

.PHONY : CMakeFiles/myExperiment.dir/myExperiment.cc.o.requires

CMakeFiles/myExperiment.dir/myExperiment.cc.o.provides: CMakeFiles/myExperiment.dir/myExperiment.cc.o.requires
	$(MAKE) -f CMakeFiles/myExperiment.dir/build.make CMakeFiles/myExperiment.dir/myExperiment.cc.o.provides.build
.PHONY : CMakeFiles/myExperiment.dir/myExperiment.cc.o.provides

CMakeFiles/myExperiment.dir/myExperiment.cc.o.provides.build: CMakeFiles/myExperiment.dir/myExperiment.cc.o


# Object files for target myExperiment
myExperiment_OBJECTS = \
"CMakeFiles/myExperiment.dir/myExperiment.cc.o"

# External object files for target myExperiment
myExperiment_EXTERNAL_OBJECTS =

myExperiment: CMakeFiles/myExperiment.dir/myExperiment.cc.o
myExperiment: CMakeFiles/myExperiment.dir/build.make
myExperiment: libXNNPACK.a
myExperiment: deps/googlebenchmark/src/libbenchmark.a
myExperiment: libbench-models.a
myExperiment: libbench-utils.a
myExperiment: libXNNPACK.a
myExperiment: /usr/lib/aarch64-linux-gnu/libm.so
myExperiment: pthreadpool/libpthreadpool.a
myExperiment: deps/googlebenchmark/src/libbenchmark.a
myExperiment: /usr/lib/aarch64-linux-gnu/librt.so
myExperiment: cpuinfo/libcpuinfo.a
myExperiment: clog/libclog.a
myExperiment: CMakeFiles/myExperiment.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable myExperiment"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/myExperiment.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/myExperiment.dir/build: myExperiment

.PHONY : CMakeFiles/myExperiment.dir/build

CMakeFiles/myExperiment.dir/requires: CMakeFiles/myExperiment.dir/myExperiment.cc.o.requires

.PHONY : CMakeFiles/myExperiment.dir/requires

CMakeFiles/myExperiment.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/myExperiment.dir/cmake_clean.cmake
.PHONY : CMakeFiles/myExperiment.dir/clean

CMakeFiles/myExperiment.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/myExperiment.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/myExperiment.dir/depend
