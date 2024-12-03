#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"



/*====IO Stride for 4M reads====*/
const int read_4 = 1 << 22;

static void BM_read_stride_4MB(benchmark::State& state) {
	const int variable_stride_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(read_4);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		read_one_gig(read_4, readFile, buffer, variable_stride_amt);
	}

	// free buffer
	free(buffer);

	// Bytes written = # Iterations * bytes written per iteration
         state.counters["IO Bytes"] = (MAX_BYTES / (double)(state.range(0) + read_4)) * read_4;
}

BENCHMARK(BM_read_stride_4MB)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
