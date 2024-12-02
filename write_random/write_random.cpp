#include "../funcs.h"
#include <benchmark/benchmark.h>

static void BM_write_random(benchmark::State& state) {
	static const int write_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(write_amt);


	// Run Bench mark tests
	for(auto _ : state) {
		write_random_gig(write_amt, writeFile, buffer, lb, ub);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_write_random)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
