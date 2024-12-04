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
Macbook Air laptop with M3 Chip

## Solid State Drive

### Read Size
For Read Size, an increase in the amount of data read per request increases the overall throughput up to a certain point (~8MB). Then, the increase in throughput falls off a cliff with similar results to doing tiny ~4kb-16kb reads. This may happen because the large read takes so long that the OS context switches out the reading process which does not allow it to take advantage of its high priority as an I/O bound process. In general, the variance of read measurements was quite stable with very high confidence.

### Read Stride
For Read Stride, over all IO size amounts, an increase in stride leads to a decrease in throughput with a large valley around the same point as in the Read Size trials (~16MB). It makes sense that moving the cursor away from the data hurts spatial locality and therefore throughput. The read stride curves form a backward s-shaped curve in that higher stride continuously decreases throughput and then drops off a cliff with very high stride. In addition, the larger the Read Size per request, the greater the throughput. Starting at 55 (bytes / ns) for 128kb reads and jumping to 63 (bytes / ns) for 4MB reads.

In addition, there is a correlation between size of Read stride size and variance in read stride throughput. Read Stride with 128kb size had very high confidence / low error and a sharp decline from 55 bytes / ns to ~35 bytes / ns. Read Stride of 4MB size had low confidence / high error with a more sporadic graph and a smaller drop from 63 bytes / ns to 55 bytes / ns.

### Random Reads
With random reads, a change in I/O amount made a relatively small impact on throughput, in the tens or hundredths decimal place. However, these random reads peaked at ~4MB Read Size with the lowest variance at this peak and higher variance toward the ends. This variance may be attributable to reads that look "more sequential" vs. "more random" in that some patterns will exhibit better spatial locality than others. Overall, the IO size seemed to have a minimal impact on the throughput of random reads.

Although random reads did suffer on throughput, this was not as significant as I expected which may be due to these reads occuring on SSD which is generally better at handling random reads then a hard disk drive. In addition, random reads and all reads performed signficantly better than writes which is a result of writes being ~7x slower than reads on SSD.

### Write Size
For Write Size, an increase in size per request increased the throughput of writes greatly. In contrast to reads, there did not appear to be a downward slope with very large writes. However, there was large variance for all of the write measurements and the overall write throughput was about 1/30th the read throughput. Very small writes were heavily penalized which is likely the effect of large overhead per write which is amortized over larger write requests.

### Write Stride
Similar to Read Stride, over all IO sizes, larger strides heavily penalized write throughput, with a stride of 64MB, having almost 0 throughput. This could be attributed to the combination of poor spatial locality and overhead in write requests. Greater IO size, yielded significantly better write throughput but still yielded far worse throughput then no stride and had much higher variance. 

The first write stride measurement had a graph almost identical to the first read stride with very low variance and a sharp decline in write throughput with higher stride. In general, write stride measurements were analagous to read stride measurements except that write throughput was much lower and saw higher variance and steeper decline in throughput with an increase in stride.

### Random Writes
Random writes saw by far the worst throughput of all measurements, maxxing out at ~.14 (bytes / ns). They also had extremely high variance in throughput, similar to random reads, again likely due to some sequential write patterns which had better locality and some very random patterns which had poor locality. Overall, IO size also had little impact on the overall throughput, as all write sizes performed poorly. 


## Hard Disk Drive

I was unable to gather data for a hard disk drive as I could not access adams during the two time slots I had as it was down. However, I will make educated guesses based on the lecture slides of how hdd performance would compare to the ssd performance I observed.

### Read Size
I would expect that Read Size would show a similar increase in throughput on HDD to the SSD with slightly worse throughput overall but a steeper positive graph as its throughput is more heavily impacted by the spatial locality of reads on disk. 

### Read Stride
I would expect read stride to be heavily impacted by any stride on the HDD. In particular, a very small stride may experience worse throughput than a larger stride because the disk may rotate past the point that we would like to read forcing us to wait a full rotation to read the desired data.


### Random Reads
I expect random reads to perform significantly worse on a disk drive than SSD because there would be little to no spatial locality which a HDD relies on to supply good throughput. 

### Write Size
Write size will likely suffer slightly on HDD, but because these writes are sequential, and an SSD struggles with writes, it may not be significant. I also expect write throughput to increase consistently with greater write size.

### Write Stride
Write stride will probably be consistent with read stride for an HHD with lower throughput and many of the same issues.

### Random Writes
Random writes should have by far the worst throughput and highest variance on HHD of any of the tests that have been performed. Write patterns that are more sequential will have the highest impact on HHD because of spatial locality. While those that are more random will lead to the highest seek time and therefore worse throughput.


## Optimal Pattern
Based on these observations, the optimal IO pattern is reading sequentially with large read size from an SSD as it yields the best throughput. This is due to the smallest seek time and amortized overhead of per-read cost by the bytes transferred over the read.
