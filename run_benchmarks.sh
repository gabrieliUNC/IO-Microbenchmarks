#!/bin/bash


# Set constants head for hdd
cp constants_hdd.h constants.h
# Run benchmarks on hdd
source ./benchmark_helper.sh

# Use Constants for ssd
cp constants_ssd.h constants.h
# Run benchmarks on ssd
source ./benchmark_helper.sh

