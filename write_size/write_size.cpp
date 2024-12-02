#include "../funcs.h"
#include <benchmark/benchmark.h>


static void BM_write_size(benchmark::State& state) {
	const int write_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(write_amt);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		write_one_gig(write_amt, writeFile, buffer, 0);
	}

	// free buffer
	free(buffer);

	state.counters["IO Size"] = MAX_BYTES;
}

BENCHMARK(BM_write_size)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
