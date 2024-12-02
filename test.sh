#!/bin/bash -e


# Set constants head for hdd
cp constants_hdd.h constants.h
# Run benchmarks on hdd
source ./run_benchmarks.sh

# Use Constants for ssd
cp constants_sdd.h constants.h
# Run benchmarks on ssd
source ./run_benchmarks.sh

