# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/learncli/workdir/lab5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/learncli/workdir/lab5/build

# Include any dependencies generated for this target.
include CMakeFiles/Read_size.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Read_size.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Read_size.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Read_size.dir/flags.make

CMakeFiles/Read_size.dir/read_size/read_size.cpp.o: CMakeFiles/Read_size.dir/flags.make
CMakeFiles/Read_size.dir/read_size/read_size.cpp.o: ../read_size/read_size.cpp
CMakeFiles/Read_size.dir/read_size/read_size.cpp.o: CMakeFiles/Read_size.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/learncli/workdir/lab5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Read_size.dir/read_size/read_size.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Read_size.dir/read_size/read_size.cpp.o -MF CMakeFiles/Read_size.dir/read_size/read_size.cpp.o.d -o CMakeFiles/Read_size.dir/read_size/read_size.cpp.o -c /mnt/learncli/workdir/lab5/read_size/read_size.cpp

CMakeFiles/Read_size.dir/read_size/read_size.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Read_size.dir/read_size/read_size.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/learncli/workdir/lab5/read_size/read_size.cpp > CMakeFiles/Read_size.dir/read_size/read_size.cpp.i

CMakeFiles/Read_size.dir/read_size/read_size.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Read_size.dir/read_size/read_size.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/learncli/workdir/lab5/read_size/read_size.cpp -o CMakeFiles/Read_size.dir/read_size/read_size.cpp.s

# Object files for target Read_size
Read_size_OBJECTS = \
"CMakeFiles/Read_size.dir/read_size/read_size.cpp.o"

# External object files for target Read_size
Read_size_EXTERNAL_OBJECTS =

Read_size: CMakeFiles/Read_size.dir/read_size/read_size.cpp.o
Read_size: CMakeFiles/Read_size.dir/build.make
Read_size: benchmark/src/libbenchmark.a
Read_size: CMakeFiles/Read_size.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/learncli/workdir/lab5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Read_size"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Read_size.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Read_size.dir/build: Read_size
.PHONY : CMakeFiles/Read_size.dir/build

CMakeFiles/Read_size.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Read_size.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Read_size.dir/clean

CMakeFiles/Read_size.dir/depend:
	cd /mnt/learncli/workdir/lab5/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/learncli/workdir/lab5 /mnt/learncli/workdir/lab5 /mnt/learncli/workdir/lab5/build /mnt/learncli/workdir/lab5/build /mnt/learncli/workdir/lab5/build/CMakeFiles/Read_size.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Read_size.dir/depend

