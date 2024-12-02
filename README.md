# IO-Microbenchmarks

This project performs micro-benchmark tests for I/O size, stride, and random I/Os using the Google Benchmark library and visualizes the data using the matplotlib library.

## To Run Benchmarks
``` sudo ./run_benchmarks.sh ```
- This will run all benchmarks and print their result to the terminal in tabular format


## To Write Benchmarks to a file
``` sudo ./run_and_write_benchmarks.sh ```
- This will run all benchmarks and write the result to `benchmark_results/'{benchmark_test}.txt'`

## To Visualize data
``` cd plot_benchmark ```
``` sudo ./run_plot.sh ```
- This will run 5 trials of each benchmark and call `myplot.py` to save the data as a line graph in `plot_benchmark/plots/'{test_plot}.png'`


