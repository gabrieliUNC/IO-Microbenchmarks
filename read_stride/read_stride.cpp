#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"


/*====IO Stride for 128K reads====*/
const int read_0 = 1 << 17;

static void BM_read_stride_128kb(benchmark::State& state) {
	const int variable_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(read_0);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		read_one_gig(read_0, readFile, buffer, variable_amt);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_read_stride_128kb)->RangeMultiplier(2)->Range(1<<12, 1<<27);



BENCHMARK_MAIN();
