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
include CMakeFiles/bench-utils.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bench-utils.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bench-utils.dir/flags.make

CMakeFiles/bench-utils.dir/bench/utils.cc.o: CMakeFiles/bench-utils.dir/flags.make
CMakeFiles/bench-utils.dir/bench/utils.cc.o: bench/utils.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bench-utils.dir/bench/utils.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bench-utils.dir/bench/utils.cc.o -c /users/Wei_Hao/XNNPACK/bench/utils.cc

CMakeFiles/bench-utils.dir/bench/utils.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bench-utils.dir/bench/utils.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /users/Wei_Hao/XNNPACK/bench/utils.cc > CMakeFiles/bench-utils.dir/bench/utils.cc.i

CMakeFiles/bench-utils.dir/bench/utils.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bench-utils.dir/bench/utils.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /users/Wei_Hao/XNNPACK/bench/utils.cc -o CMakeFiles/bench-utils.dir/bench/utils.cc.s

CMakeFiles/bench-utils.dir/bench/utils.cc.o.requires:

.PHONY : CMakeFiles/bench-utils.dir/bench/utils.cc.o.requires

CMakeFiles/bench-utils.dir/bench/utils.cc.o.provides: CMakeFiles/bench-utils.dir/bench/utils.cc.o.requires
	$(MAKE) -f CMakeFiles/bench-utils.dir/build.make CMakeFiles/bench-utils.dir/bench/utils.cc.o.provides.build
.PHONY : CMakeFiles/bench-utils.dir/bench/utils.cc.o.provides

CMakeFiles/bench-utils.dir/bench/utils.cc.o.provides.build: CMakeFiles/bench-utils.dir/bench/utils.cc.o


# Object files for target bench-utils
bench__utils_OBJECTS = \
"CMakeFiles/bench-utils.dir/bench/utils.cc.o"

# External object files for target bench-utils
bench__utils_EXTERNAL_OBJECTS =

libbench-utils.a: CMakeFiles/bench-utils.dir/bench/utils.cc.o
libbench-utils.a: CMakeFiles/bench-utils.dir/build.make
libbench-utils.a: CMakeFiles/bench-utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/users/Wei_Hao/XNNPACK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libbench-utils.a"
	$(CMAKE_COMMAND) -P CMakeFiles/bench-utils.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bench-utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bench-utils.dir/build: libbench-utils.a

.PHONY : CMakeFiles/bench-utils.dir/build

CMakeFiles/bench-utils.dir/requires: CMakeFiles/bench-utils.dir/bench/utils.cc.o.requires

.PHONY : CMakeFiles/bench-utils.dir/requires

CMakeFiles/bench-utils.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bench-utils.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bench-utils.dir/clean

CMakeFiles/bench-utils.dir/depend:
	cd /users/Wei_Hao/XNNPACK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK /users/Wei_Hao/XNNPACK/CMakeFiles/bench-utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bench-utils.dir/depend

