#!/bin/bash

# Compile all benchmark exe's
cd build
cmake ..
make
cd ..

printf '\n'
echo Running benchmarks on ssd and writing results to ssd folder
printf '\n'


# Start running benchmark's

printf "\n======Performing Read Size Benchmark Test======\n"
./build/Read_size --benchmark_counters_tabular=true > benchmark_results/ssd/read_size.txt
printf "\n======Done with Read Size Benchmark Test======\n\n"
printf "\n"


printf "\n======Performing Write Size Benchmark Test======\n"
./build/Write_size --benchmark_counters_tabular=true > benchmark_results/ssd/write_size.txt
printf "\n======Done with Write Size Benchmark Test======\n"
printf "\n"

printf "\n======Performing Write Stride 0 Benchmark Test======\n"
./build/Write_stride --benchmark_counters_tabular=true > benchmark_results/ssd/write_stride.txt
printf "\n======Done with Write Stride 0 Benchmark Test======\n"
printf "\n"

printf "\n======Performing Write Stride 1 Benchmark Test======\n"
./build/Write_stride_1 --benchmark_counters_tabular=true > benchmark_results/ssd/write_stride_1.txt
printf "\n======Done with Write Stride 1 Benchmark Test======\n"
printf "\n"

printf "\n======Performing Write Stride 2 Benchmark Test======\n"
./build/Write_stride_2 --benchmark_counters_tabular=true > benchmark_results/ssd/write_stride_2.txt
printf "\n======Done with Write Stride 2 Benchmark Test======\n"
printf "\n"

printf "\n======Performing Write Stride 3 Benchmark Test======\n"
./build/Write_stride_3 --benchmark_counters_tabular=true > benchmark_results/ssd/write_stride_3.txt
printf "\n======Done with Write Stride 3 Benchmark Test======\n"
printf "\n"

printf "\n======Performing Write Stride 4 Benchmark Test======\n"
./build/Write_stride_4 --benchmark_counters_tabular=true > benchmark_results/ssd/write_stride_4.txt
printf "\n======Done with Write Stride 4 Benchmark Test======\n"
printf "\n"


printf "\n======Performing Read Stride 0 Benchmark Test======\n"
./build/Read_stride --benchmark_counters_tabular=true > benchmark_results/ssd/read_stride.txt
printf "\n======Done with Read Stride 0 Benchmark Test======\n"
printf "\n"


printf "\n======Performing Read Stride 1 Benchmark Test======\n"
./build/Read_stride_1 --benchmark_counters_tabular=true > benchmark_results/ssd/read_stride_1.txt
printf "\n======Done with Read Stride 1 Benchmark Test======\n"
printf "\n"


printf "\n======Performing Read Stride 2 Benchmark Test======\n"
./build/Read_stride_2 --benchmark_counters_tabular=true > benchmark_results/ssd/read_stride_2.txt
printf "\n======Done with Read Stride 2 Benchmark Test======\n"
printf "\n"

printf "\n======Performing Read Stride 3 Benchmark Test======\n"
./build/Read_stride_3 --benchmark_counters_tabular=true > benchmark_results/ssd/read_stride_3.txt
printf "\n======Done with Read Stride 3 Benchmark Test======\n"
printf "\n"

printf "\n======Performing Read Stride 4 Benchmark Test======\n"
./build/Read_stride_4 --benchmark_counters_tabular=true > benchmark_results/ssd/read_stride_4.txt
printf "\n======Done with Read Stride 4 Benchmark Test======\n"
printf "\n"



printf "\n======Performing Write Random Benchmark Test======\n"
./build/Write_random --benchmark_counters_tabular=true > benchmark_results/ssd/write_random.txt
printf "\n======Done with Write Random Benchmark Test======\n\n"
printf "\n"


printf "\n======Performing Read Random Benchmark Test======\n"
./build/Read_random --benchmark_counters_tabular=true > benchmark_results/ssd/read_random.txt
printf "\n======Done with Read Random Benchmark Test======\n\n"
printf "\n"
