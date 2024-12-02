#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"



/*====IO Stride for 4M writes====*/
const int write_4 = 1 << 22;

static void BM_write_stride_4MB(benchmark::State& state) {
	static const int variable_stride_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(write_4);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
	}

	// free buffer
	free(buffer);

	// Bytes written = # Iterations * bytes written per iteration
         state.counters["IO Bytes"] = (MAX_BYTES / (state.range(0) + write_4)) * write_4;
}

BENCHMARK(BM_write_stride_4MB)->RangeMultiplier(2)->Range(1<<12, 1<<27);

BENCHMARK_MAIN();
