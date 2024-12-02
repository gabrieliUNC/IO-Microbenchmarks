#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"


static void BM_read_size(benchmark::State& state) {
	const int read_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(read_amt);
	
	// Run benchmark tests
	for(auto _ : state) {
		read_one_gig(read_amt, readFile, buffer, 0);
	}

	// free buffer
	free(buffer);

	state.counters["IO Bytes"] = MAX_BYTES;
}

BENCHMARK(BM_read_size)->RangeMultiplier(2)->Range(1<<12, 1<<27);

BENCHMARK_MAIN();
