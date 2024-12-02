#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"


/*====IO Stride for 2M writes====*/
const int write_3 = 1 << 21;

static void BM_write_stride_2MB(benchmark::State& state) {
	const int variable_stride_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(write_3);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		write_one_gig(write_3, writeFile, buffer, variable_stride_amt);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_write_stride_2MB)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
