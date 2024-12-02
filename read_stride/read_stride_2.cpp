#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"


/*====IO Stride for 1M reads====*/
const int read_2 = 1 << 20;

static void BM_read_stride_1MB(benchmark::State& state) {
	static const int variable_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(read_2);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		read_one_gig(read_2, readFile, buffer, variable_amt);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_read_stride_1MB)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
