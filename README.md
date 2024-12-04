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

<br />

# Analysis

## Specs
All these measurements were performed on a Macbook Air laptop with M3 Chip and 256GB SSD.

## Intro
I chose to use the Google benchmark library after watching this [CppConVideo](https://www.youtube.com/watch?v=nXaxk27zwlk) by Chandler Carruth on benchmarking in cpp. Although there was some learning curve, writing the benchmarks turned out to be much easier with this library then it would have been on my own. In particular, the argument passing and custom counter features provided, [tooling](https://github.com/google/benchmark/blob/main/docs/user_guide.md), made it much simpler to run many test points with one benchmark and to calculate throughput. In addition, as described in [Runtime and Reporting Considerations](https://github.com/google/benchmark/blob/main/docs/user_guide.md) "the number of iterations to run is determined dynamically by running the benchmark a few times and measuring the time taken and ensuring that the ultimate result will be statistically stable". Which I found to be awesome. Despite this, for creating the plots of benchmarks my script still runs each benchmark 5 times.

The main pain point of doing these measurements was in writing the script to execute all these benchmarks and fine tuning them to work well. This was an issue because the benchmarks for writing and stride in particular take quite some time which increases debugging time. This was all made much simpler by setting up a CMake file for all the executables and simply having cmake rebuild all of them at the beginning of each script. The second pain point was visualizing the data using the python script. The pandas and matplotlib libraries made this much simpler but there was still some work to be done with getting everything in the right format, and small details such as if matplotlib was actually overwriting old image files. In addition, writing a script to then call this python script with the output of each set of benchmark trials for each test (Read Size, Write Size, Read Stride,...,) took some time. In all, I had a great time performing all the benchmarks and connecting all the pieces to run in one call to a bash script. On my machine, it takes roughly 1 hour to run all benchmark trials and visualize the data for the SSD.

## Solid State Drive

### Read Size
Based on the class lectures, I expected throughput to grow somewhat linearily with read size as this should amortize the overhead per read. In practice, this was the case up until a certain point, roughly 8MB, at which point throughput drops off a cliff. From then on, Read Size throughput yields similar results to doing tiny ~4kb-16kb reads. I am not entirely sure why this is the case. I belive that this may happen because the large read takes so long that the OS context switches out the reading process which does not allow it to take advantage of its high dynamic pririty. In contrast to smaller reads which would yield more quickly and thus maintain their priority. It is also interesting to note that the variance of read throughput measurements is quite low up until this same point at which error increases dramatically.

### Read Stride
For Read Stride, over all IO size amounts, an increase in stride leads to a decrease in throughput with a large valley around the same point as in the Read Size trials (~16MB). The read stride curves form a backward s-shaped curve in that higher stride continuously decreases throughput and then drops off a cliff with very high stride. In addition, the larger the Read Size per request, the greater the throughput. Starting at 55 (bytes / ns) for 128kb reads and jumping to 63 (bytes / ns) for 4MB reads. It makes sense that with higher read size, these measurements will exhibit higher throughput as we are amortizing the overhead per read. However, it is odd that the final Read Stride measurement of 4MB has higher throughput than any Read Size measurement. I am not sure if this is an anomaly in the results or a bug in measuring but I am unsure of why this would be the case. In addition, read stride variance was very low throughout all read sizes and read stride amounts in contrast to the read size measurement which had higher variance at higher read sizes.

### Random Reads
On an SSD, I anticipated that random reads would have slightly worse but not much worse throughput since there is no seek time
With random reads, a change in I/O amount made a relatively small impact on throughput, in the tens or hundredths decimal place. However, these random reads peaked at ~4MB Read Size with the lowest variance at this peak and higher variance toward the ends. Overall, the IO size seemed to have a minimal impact on the throughput of random reads.

Although random reads did suffer on throughput, this was not as significant as I expected which may be due to these reads occuring on SSD which is generally better at handling random reads then a hard disk drive. In addition, random reads and all reads performed signficantly better than writes which is a result of writes being ~7x slower than reads on SSD.

### Write Size
For Write Size, an increase in size per request increased the throughput of writes greatly. In contrast to reads, there did not appear to be a downward slope with very large writes. However, there was large variance for all of the write measurements and the overall write throughput was about 1/30th the read throughput. Very small writes were heavily penalized which is likely the effect of large overhead per write which is amortized over larger write requests.

### Write Stride
Similar to Read Stride, over all IO sizes, larger strides heavily penalized write throughput, with a stride of 64MB, having almost 0 throughput. Greater IO size, yielded significantly better write throughput but still yielded far worse throughput then no stride and had much higher variance. 

The first write stride measurement had a graph almost identical to the first read stride with very low variance and a sharp decline in write throughput with higher stride. In general, write stride measurements were analagous to read stride measurements except that write throughput was much lower and saw higher variance and steeper decline in throughput with an increase in stride.

### Random Writes
Random writes saw by far the worst throughput of all measurements, maxxing out at ~.14 (bytes / ns). They also had extremely high variance in throughput, similar to random reads, again likely due to some sequential write patterns which had better  and some very random patterns which had poor . Overall, IO size also had little impact on the overall throughput, as all write sizes performed poorly. 


## Hard Disk Drive
I originally wrote a second script that change the readFile and writeFile properties of the constants header and pass the results to the ssd and hdd folders. The existing hdd and ssd folders for plots and benchmark_results are remnants of this but both contain data only measured on my macbook SSD during testing of the scripts. I was unable to capture any measurements on a hard disk drive but I can make educated guesses about how these measurements might differ from my SSD measurements.

### Read Size
I would expect that Read Size would show a similar increase in throughput on HDD to the SSD with slightly worse throughput overall but a steeper positive graph as its throughput is more heavily impacted by the spatial  of reads on disk. 

### Read Stride
I would expect read stride to be heavily impacted by any stride on the HDD. In particular, a very small stride may experience worse throughput than a larger stride because the disk may rotate past the point that we would like to read forcing us to wait a full rotation to read the desired data.


### Random Reads
I expect random reads to perform significantly worse on a disk drive than SSD because there would be little to no spatial  which a HDD relies on to supply good throughput. 

### Write Size
Write size will likely suffer slightly on HDD, but because these writes are sequential, and an SSD struggles with writes, it may not be significant. I also expect write throughput to increase consistently with greater write size.

### Write Stride
Write stride will probably be consistent with read stride for an HHD with lower throughput and many of the same issues.

### Random Writes
Random writes should have by far the worst throughput and highest variance on HHD of any of the tests that have been performed. Write patterns that are more sequential will have the highest impact on HHD because of spatial locality. While those that are more random will lead to the highest seek time and therefore worse throughput.


## Optimal Pattern
Based on these observations, the optimal IO pattern is reading sequentially with large read size from an SSD as it yields the best throughput. This is due to the smallest seek time and amortized overhead of per-read cost by the bytes transferred over the read.

