  #!/bin/bash

  # Change to main dir
  cd ..
  # Set constants head for hdd
  cp constants_hdd.h constants.h
  # change to plot dir
  cd plot_benchmark
  # Run benchmarks on hdd
  sudo ./run_plot.sh "hdd"

  # Change to main dir
  cd ..
  # Use Constants for ssd
  cp constants_ssd.h constants.h
  # change to plot dir
  cd plot_benchmark
  # Run benchmarks on ssd
  sudo ./run_plot.sh "ssd"
