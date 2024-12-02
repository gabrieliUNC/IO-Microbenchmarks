#include "../funcs.h"
#include <benchmark/benchmark.h>

static void BM_read_random(benchmark::State& state) {
	static const int read_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(read_amt);


	// Run Bench mark tests
	for(auto _ : state) {
		read_random_gig(read_amt, readFile, buffer, lb, ub);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_read_random)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
