#!/bin/bash

# Compile all benchmark exe's
cd ..
cd build
cmake ..
make
cd ..
cd plot_benchmark

printf '\n'
echo "Running benchmarks on $1 and putting results in $1 folder"
printf '\n'

STRIDE_BYTES=33554432
IO_SIZE_BYTES=1073741824

# Compile Benchmark csv's for Read Size Trials
./../build/Read_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Read Size
# "Title,X-axis Label,Bytes Read"
echo "Read Size,IO Size,plots/$1/read_size.png" | python3 myplot.py



# Compile Benchmark csv's for Write Size Trials
./../build/Write_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_size --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Write Size
# "Title,X-axis Label,Bytes Written"
echo "Write Size,IO Size,plots/$1/write_size.png" | python3 myplot.py


# Compile Benchmark csv's for Read Stride 128kb Trials
./../build/Read_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Read Stride
# "Title,X-axis Label,Bytes Read"
echo "Read Stride 128kb,IO Stride,plots/$1/read_stride.png" | python3 myplot.py

# Compile Benchmark csv's for Read Stride 256kb Trials
./../build/Read_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Read Stride
# "Title,X-axis Label,Bytes Read"
echo "Read Stride 256kb,IO Stride,plots/$1/read_stride_1.png" | python3 myplot.py


# Compile Benchmark csv's for Read Stride 1MB Trials
./../build/Read_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Read Stride
# "Title,X-axis Label,Bytes Read"
echo "Read Stride 1MB,IO Stride,plots/$1/read_stride_2.png" | python3 myplot.py


# Compile Benchmark csv's for Read Stride 2MB Trials
./../build/Read_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Read Stride
# "Title,X-axis Label,Bytes Read"
echo "Read Stride 2MB,IO Stride,plots/$1/read_stride_3.png" | python3 myplot.py


# Compile Benchmark csv's for Read Stride 4MB Trials
./../build/Read_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Read Stride
# "Title,X-axis Label,Bytes Read"
echo "Read Stride 4MB,IO Stride,plots/$1/read_stride_4.png" | python3 myplot.py



# Compile Benchmark csv's for Write Stride 128kb Trials
./../build/Write_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_stride --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Write Stride
# "Title,X-axis Label,Bytes Written"
echo "Write Stride 128kb,IO Stride,plots/$1/write_stride.png" | python3 myplot.py

# Compile Benchmark csv's for Write Stride 256kb Trials
./../build/Write_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_stride_1 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Write Stride
# "Title,X-axis Label,Bytes Written"
echo "Write Stride 256kb,IO Stride,plots/$1/write_stride_1.png" | python3 myplot.py


# Compile Benchmark csv's for Write Stride 1MB Trials
./../build/Write_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_stride_2 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Write Stride
# "Title,X-axis Label,Bytes Written"
echo "Write Stride 1MB,IO Stride,plots/$1/write_stride_2.png" | python3 myplot.py


# Compile Benchmark csv's for Write Stride 2MB Trials
./../build/Write_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_stride_3 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Write Stride
# "Title,X-axis Label,Bytes Written"
echo "Write Stride 2MB,IO Stride,plots/$1/write_stride_3.png" | python3 myplot.py


# Compile Benchmark csv's for Write Stride 4MB Trials
./../build/Write_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_stride_4 --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv


# Plot Benchmark for Write Stride
# "Title,X-axis Label,Bytes Written"
echo "Write Stride 4MB,IO Stride,plots/$1/write_stride_4.png" | python3 myplot.py


# Compile Benchmark csv for Read Random
./../build/Read_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Read_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Read_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Read_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Read_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv

# Plot Benchmark for Read Random
# "Title,X-axis Label,Bytes Read"
echo "Read Random,IO Size,plots/$1/read_random.png" | python3 myplot.py


# Compile Benchmark csv for Write Random
./../build/Write_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark.csv
./../build/Write_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_2.csv
./../build/Write_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_3.csv
./../build/Write_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_4.csv
./../build/Write_random --benchmark_format=csv --benchmark_counters_tabular=true > benchmark_5.csv

# Plot Benchmark for Write Random
# "Title,X-axis Label,Bytes Read"
echo "Write Random,IO Size,plots/$1/write_random.png" | python3 myplot.py
