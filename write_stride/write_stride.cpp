#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"



/*====IO Stride for 128K writes====*/
const int write_0 = 1 << 17;

static void BM_write_stride_128kb(benchmark::State& state) {
	static const int variable_stride_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(write_0);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		write_one_gig(write_0, writeFile, buffer, variable_stride_amt);
	}

	// free buffer
	free(buffer);

	// Bytes written = # Iterations * bytes written per iteration
	state.counters["IO Bytes"] = (MAX_BYTES / (state.range(0) + write_0)) * write_0;
}

BENCHMARK(BM_write_stride_128kb)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
