~ #!/bin/bash

  # Change to main dir
  cd ..
  # Set constants head for hdd
  cp constants_hdd.h constants.h
  # change to plot dir
  cd plot_benchmark
  # Run benchmarks on hdd
  source ./run_plot.sh

  # Change to main dir
  cd ..
  # Use Constants for ssd
  cp constants_sdd.h constants.h
  # change to plot dir
  cd plot_benchmark
  # Run benchmarks on ssd
  source ./run_plot.sh
