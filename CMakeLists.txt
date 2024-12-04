cmake_minimum_required(VERSION 3.10)
project(MyProject)
set(CMAKE_CXX_STANDARD 17)

# Google Benchmark Setup
add_subdirectory(benchmark)
# All benchmark executables

# Read size exe
add_executable(Read_size read_size/read_size.cpp)

# Write size exe
add_executable(Write_size write_size/write_size.cpp)

# Read Stride exe's
add_executable(Read_stride read_stride/read_stride.cpp)
add_executable(Read_stride_1 read_stride/read_stride_1.cpp)
add_executable(Read_stride_2 read_stride/read_stride_2.cpp)
add_executable(Read_stride_3 read_stride/read_stride_3.cpp)
add_executable(Read_stride_4 read_stride/read_stride_4.cpp)

# Write Stride exe's
add_executable(Write_stride write_stride/write_stride.cpp)
add_executable(Write_stride_1 write_stride/write_stride_1.cpp)
add_executable(Write_stride_2 write_stride/write_stride_2.cpp)
add_executable(Write_stride_3 write_stride/write_stride_3.cpp)
add_executable(Write_stride_4 write_stride/write_stride_4.cpp)

# Read Random exe
add_executable(Read_random read_random/read_random.cpp)

# Write Random exe
add_executable(Write_random write_random/write_random.cpp)

# Link executables
target_link_libraries(Read_size benchmark::benchmark)

target_link_libraries(Write_size benchmark::benchmark)

target_link_libraries(Read_stride benchmark::benchmark)
target_link_libraries(Read_stride_1 benchmark::benchmark)
target_link_libraries(Read_stride_2 benchmark::benchmark)
target_link_libraries(Read_stride_3 benchmark::benchmark)
target_link_libraries(Read_stride_4 benchmark::benchmark)

target_link_libraries(Write_stride benchmark::benchmark)
target_link_libraries(Write_stride_1 benchmark::benchmark)
target_link_libraries(Write_stride_2 benchmark::benchmark)
target_link_libraries(Write_stride_3 benchmark::benchmark)
target_link_libraries(Write_stride_4 benchmark::benchmark)

target_link_libraries(Read_random benchmark::benchmark)

target_link_libraries(Write_random benchmark::benchmark)
