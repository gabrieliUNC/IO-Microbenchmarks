  #!/bin/bash

  # Change to main dir
  cd ..
  # Set constants head for hdd
  cp constants_hdd.h constants.h
  # change to plot dir
  cd plot_benchmark
  # Run benchmarks on hdd
  sudo ./plot_helper.sh "hdd"

  # Change to main dir
  cd ..
  # Use Constants for ssd
  cp constants_ssd.h constants.h
  # change to plot dir
  cd plot_benchmark
  # Run benchmarks on ssd
  sudo ./plot_helper.sh "ssd"
