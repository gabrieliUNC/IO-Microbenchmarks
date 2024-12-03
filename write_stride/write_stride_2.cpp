#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"

/*====IO Stride for 1M writes====*/
const int write_2 = 1 << 20;

static void BM_write_stride_1MB(benchmark::State& state) {
	const int variable_stride_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(write_2);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		write_one_gig(write_2, writeFile, buffer, variable_stride_amt);
	}

	// free buffer
	free(buffer);

	 // Bytes written = # Iterations * bytes written per iteration
         state.counters["IO Bytes"] = (MAX_BYTES / (double)(state.range(0) + write_2)) * write_2;
}

BENCHMARK(BM_write_stride_1MB)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
