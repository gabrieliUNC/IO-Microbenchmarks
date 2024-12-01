#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Compile all benchmark exe's
cd build
cmake ..
make
cd ..

# Start running benchmark's

printf "\n${RED}======Performing Read Size Benchmark Test======${NC}\n"
./build/Read_size
printf "\n${RED}======Done with Read Size Benchmark Test======${NC}\n\n"
printf "\n"


printf "\n${RED}======Performing Write Size Benchmark Test======${NC}\n"
./build/Write_size
printf "\n${RED}======Done with Write Size Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Write Stride 0 Benchmark Test======${NC}\n"
./build/Write_stride
printf "\n${RED}======Done with Write Stride 0 Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Write Stride 1 Benchmark Test======${NC}\n"
./build/Write_stride_1
printf "\n${RED}======Done with Write Stride 1 Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Write Stride 2 Benchmark Test======${NC}\n"
./build/Write_stride_2
printf "\n${RED}======Done with Write Stride 2 Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Write Stride 3 Benchmark Test======${NC}\n"
./build/Write_stride_3
printf "\n${RED}======Done with Write Stride 3 Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Write Stride 4 Benchmark Test======${NC}\n"
./build/Write_stride_4
printf "\n${RED}======Done with Write Stride 4 Benchmark Test======${NC}\n"
printf "\n"


printf "\n${RED}======Performing Read Stride 0 Benchmark Test======${NC}\n"
./build/Read_stride
printf "\n${RED}======Done with Read Stride 0 Benchmark Test======${NC}\n"
printf "\n"


printf "\n${RED}======Performing Read Stride 1 Benchmark Test======${NC}\n"
./build/Read_stride_1
printf "\n${RED}======Done with Read Stride 1 Benchmark Test======${NC}\n"
printf "\n"


printf "\n${RED}======Performing Read Stride 2 Benchmark Test======${NC}\n"
./build/Read_stride_2
printf "\n${RED}======Done with Read Stride 2 Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Read Stride 3 Benchmark Test======${NC}\n"
./build/Read_stride_3
printf "\n${RED}======Done with Read Stride 3 Benchmark Test======${NC}\n"
printf "\n"

printf "\n${RED}======Performing Read Stride 4 Benchmark Test======${NC}\n"
./build/Read_stride_4
printf "\n${RED}======Done with Read Stride 4 Benchmark Test======${NC}\n"
printf "\n"



printf "\n${RED}======Performing Write Random Benchmark Test======${NC}\n"
./build/Write_random
printf "\n${RED}======Done with Write Random Benchmark Test======${NC}\n\n"
printf "\n"


printf "\n${RED}======Performing Read Random Benchmark Test======${NC}\n"
./build/Read_random
printf "\n${RED}======Done with Read Random Benchmark Test======${NC}\n\n"
printf "\n"
