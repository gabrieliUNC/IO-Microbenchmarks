# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build

# Include any dependencies generated for this target.
include CMakeFiles/Read_stride.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Read_stride.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Read_stride.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Read_stride.dir/flags.make

CMakeFiles/Read_stride.dir/codegen:
.PHONY : CMakeFiles/Read_stride.dir/codegen

CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o: CMakeFiles/Read_stride.dir/flags.make
CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o: /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/read_stride/read_stride.cpp
CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o: CMakeFiles/Read_stride.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o -MF CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o.d -o CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o -c /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/read_stride/read_stride.cpp

CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/read_stride/read_stride.cpp > CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.i

CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/read_stride/read_stride.cpp -o CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.s

# Object files for target Read_stride
Read_stride_OBJECTS = \
"CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o"

# External object files for target Read_stride
Read_stride_EXTERNAL_OBJECTS =

Read_stride: CMakeFiles/Read_stride.dir/read_stride/read_stride.cpp.o
Read_stride: CMakeFiles/Read_stride.dir/build.make
Read_stride: /usr/local/lib/libbenchmark.a
Read_stride: CMakeFiles/Read_stride.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Read_stride"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Read_stride.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Read_stride.dir/build: Read_stride
.PHONY : CMakeFiles/Read_stride.dir/build

CMakeFiles/Read_stride.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Read_stride.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Read_stride.dir/clean

CMakeFiles/Read_stride.dir/depend:
	cd /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5 /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5 /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build /Users/stick/Coding/Docker/Comp530/learncli211/workdir/lab5/build/CMakeFiles/Read_stride.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/Read_stride.dir/depend

