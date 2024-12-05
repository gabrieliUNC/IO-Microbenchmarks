# IO-Microbenchmarks

This project performs micro-benchmark tests for I/O size, stride, and random I/Os using the Google Benchmark library and visualizes the data using the matplotlib library.

## Setup (Should not be necessary if all works as intended)
To get this to work on Docker, I enabled the option BENCHMARK_DOWNLOAD_DEPENDENCIES which mainly allows cmake to get the Google test library that this library relies on. This should ensure that everything works out of the box when the script runs. If not, these are the steps to rebuild the cmake build directory from [google benchmark install](https://github.com/google/benchmark). There are also issues with stale CMakeCache.txt files. These should be dealt with through .gitignore but if some have snuck in, simply remove the stale caches.


``` cd benchmark ```

If /build exists remove it

``` cmake -E make_directory "build" ```

``` cmake -E chdir "build" cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release ../ ```

``` cmake --build "build" --config Release ```

## To Run Benchmarks
``` ./run_benchmarks.sh ```
- This will run all benchmarks and print their result to the terminal in tabular format


## To Write Benchmarks to a file
``` ./run_and_write_benchmarks.sh ```
- This will run all benchmarks and write the result to `benchmark_results/'{benchmark_test}.txt'`

## To Visualize data
``` cd plot_benchmark ```

``` ./run_plot.sh ```
- This will run 5 trials of each benchmark and call `myplot.py` to save the data as a line graph in `plot_benchmark/plots/'{test_plot}.png'`

<br />

# Analysis

## Specs
All these measurements were performed on a Macbook Air laptop with M3 Chip and 256GB SSD.

## Intro
I chose to use the Google benchmark library after watching this [CppConVideo](https://www.youtube.com/watch?v=nXaxk27zwlk) by Chandler Carruth on benchmarking in cpp. Although there was some learning curve, writing the benchmarks turned out to be much easier with this library. In particular, the argument passing and custom counter features, documented in [tooling](https://github.com/google/benchmark/blob/main/docs/user_guide.md), made it simpler to run many test points with one benchmark and to calculate throughput per test. In addition, as described in [Runtime and Reporting Considerations](https://github.com/google/benchmark/blob/main/docs/user_guide.md) "the number of iterations to run is determined dynamically by running the benchmark a few times and measuring the time taken and ensuring that the ultimate result will be statistically stable". Which I found to be awesome. Despite this, for creating the plots of benchmarks my script still runs each benchmark 5 times.

## Solid State Drive

### Read Size
Based on the class lectures, I expected throughput to grow linearly with read size as this should amortize the overhead per read. In practice, this was the case up until a certain point, roughly 8MB, at which point throughput drops off a cliff. From then on, Read Size throughput yields similar results to doing tiny ~4kb-16kb reads. I am not entirely sure why this is the case. I believe that this may happen because the large read takes so long that the OS context switches out the reading process which does not allow it to take advantage of its high dynamic priority. In contrast to smaller reads which would yield more quickly and thus maintain their priority. It is also interesting to note that the variance of read throughput measurements is quite low up until this same point at which time error increases dramatically.

### Read Stride
For Read Stride, an increase in stride leads to a decrease in throughput with a large valley around the same point as in the Read Size trials (~16MB). The read stride plots form a backward s-shaped curve in that a higher stride continuously decreases throughput and then drops off a cliff with a very high stride. In addition, the larger the Read Size per request, the greater the throughput. Starting at 55 (bytes/ns) for 128kb reads and jumping to 63 (bytes/ns) for 4MB reads. It makes sense that with a higher read size, these measurements will exhibit higher throughput as we are amortizing the overhead per read. However, it is odd that the final Read Stride measurement of 4MB has a higher throughput than any Read Size measurement. I am not sure if this is an anomaly in the results or a bug in measuring but I am unsure of why this would be the case. In addition, read stride variance was very low throughout all tests in contrast to the read size measurement wherein variance increased with IO size.

### Random Reads
On an SSD, I anticipated that random reads would have slightly worse but not much worse throughput since there is no seek time. Instead, random reads were about 10x slower than sequential reads. Furthermore, a change in I/O amount made a relatively small impact on throughput, in the tens or hundredths decimal place. Throughput peaked at ~4MB Read Size with the lowest variance at this peak and higher variance toward the ends. Overall, the IO size seemed to have a minimal impact on the throughput of random reads. This was also unexpected as I would think that a higher read size would amortize the overhead that is incurred per read. 

### Write Size
I anticipated writes being much slower than reads in general but also growing in throughput linearly with an increase in write size. This is essentially what was shown on the write measurement plots - an increase in size per request increased the throughput of writes greatly. In contrast to reads, there did not appear to be a downward slope with very large writes. This tracks as large writes allow the FTL to amortize the cost of erasing and programming blocks. However, there was a large variance for all of the write measurements and the overall write throughput was about 1/30th the read throughput. Very small writes were heavily penalized which is likely the effect of large overhead per write. 

### Write Stride
For write stride, I expected the throughput measurements to be far worse than for write size. However, with a write size between 256kb and 2MB, write stride exhibited higher throughput than the sequential write size tests. This may be because we are writing more data in total, counting the stride as a write, which allows the FTL to amortize the cost of each write. Disimilar to Read Stride, larger write strides, increased throughput for these same write sizes. However, for 128kb and 4Mb write sizes, throughput was extremely low and larger strides heavily penalized write throughput, with a stride of 64MB, having almost 0 throughput. Greater IO size yielded significantly better write throughput but still yielded far worse throughput than no stride and had much higher variance. The first write stride measurement had a graph almost identical to the first read stride with very low variance and a sharp decline in write throughput with a higher stride.

### Random Writes
As expected, Random writes saw by far the worst throughput of all measurements, maxing out at ~.14 (bytes/ns). They also had extremely high variance in throughput, similar to random reads. Overall, IO size also had little impact on the throughput, as all write sizes performed poorly. This is attributable to the poor performance of writes compared to reads on SSD as well as slightly worse random IO performance than sequential IO. However, I expected the SSD to handle randomness better since it does not have the same seek cost as a hard drive.


## Hard Disk Drive
I originally wrote a second script that changed the readFile and writeFile properties of the constants header and passed the results to the ssd and hdd folders. The existing hdd and ssd folders for plots and benchmark_results are remnants of this but both contain data only measured on my Macbook SSD during the testing of the scripts. As my Mac only has an SSD, I am unable to capture any HDD measurements. However, in general, I would expect the HDD to be negatively impacted by IO stride and randomness as seeks would start to dominate IO time. I would also expect sequential reads to perform the best on an HDD due to good spatial locality and low seek cost.

## Optimal Pattern
Based on these observations, the optimal IO pattern is reading sequentially with a large read size from an SSD as it yields the best throughput. This is due to the smallest seek time and amortized overhead of per-read cost by the bytes transferred over the read.

