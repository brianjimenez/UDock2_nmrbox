# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm

# Include any dependencies generated for this target.
include test/ext/CMakeFiles/test-ext_matrix_common.dir/depend.make

# Include the progress variables for this target.
include test/ext/CMakeFiles/test-ext_matrix_common.dir/progress.make

# Include the compile flags for this target's objects.
include test/ext/CMakeFiles/test-ext_matrix_common.dir/flags.make

test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o: test/ext/CMakeFiles/test-ext_matrix_common.dir/flags.make
test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o: test/ext/ext_matrix_common.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o"
	cd /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o -c /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext/ext_matrix_common.cpp

test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.i"
	cd /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext/ext_matrix_common.cpp > CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.i

test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.s"
	cd /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext/ext_matrix_common.cpp -o CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.s

test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.requires:

.PHONY : test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.requires

test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.provides: test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.requires
	$(MAKE) -f test/ext/CMakeFiles/test-ext_matrix_common.dir/build.make test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.provides.build
.PHONY : test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.provides

test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.provides.build: test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o


# Object files for target test-ext_matrix_common
test__ext_matrix_common_OBJECTS = \
"CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o"

# External object files for target test-ext_matrix_common
test__ext_matrix_common_EXTERNAL_OBJECTS =

test/ext/test-ext_matrix_common: test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o
test/ext/test-ext_matrix_common: test/ext/CMakeFiles/test-ext_matrix_common.dir/build.make
test/ext/test-ext_matrix_common: test/ext/CMakeFiles/test-ext_matrix_common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test-ext_matrix_common"
	cd /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-ext_matrix_common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/ext/CMakeFiles/test-ext_matrix_common.dir/build: test/ext/test-ext_matrix_common

.PHONY : test/ext/CMakeFiles/test-ext_matrix_common.dir/build

test/ext/CMakeFiles/test-ext_matrix_common.dir/requires: test/ext/CMakeFiles/test-ext_matrix_common.dir/ext_matrix_common.cpp.o.requires

.PHONY : test/ext/CMakeFiles/test-ext_matrix_common.dir/requires

test/ext/CMakeFiles/test-ext_matrix_common.dir/clean:
	cd /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext && $(CMAKE_COMMAND) -P CMakeFiles/test-ext_matrix_common.dir/cmake_clean.cmake
.PHONY : test/ext/CMakeFiles/test-ext_matrix_common.dir/clean

test/ext/CMakeFiles/test-ext_matrix_common.dir/depend:
	cd /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext /home/nmrbox/0015/brjimenez/UDock2_win/UDock2_linux/src/glm/test/ext/CMakeFiles/test-ext_matrix_common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/ext/CMakeFiles/test-ext_matrix_common.dir/depend
