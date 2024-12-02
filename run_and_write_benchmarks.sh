#!/bin/bash


# Set constants headers for hdd
cp constants_hdd.h constants.h
# Run benchmarks on hdd
source ./benchmark_writer_helper.sh "hdd"

# Use Constants for ssd
cp constants_ssd.h constants.h
# Run benchmarks on ssd
source ./benchmark_writer_helper.sh "ssd"

