#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"



/*====IO Stride for 256K reads====*/
const int read_1 = 1 << 18;

static void BM_read_stride_256kb(benchmark::State& state) {
	static const int variable_amt = state.range(0);
	// Set up buffer
	char* buffer = setupBuffer(read_1);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		read_one_gig(read_1, readFile, buffer, variable_amt);
	}

	// free buffer
	free(buffer);

	// Bytes written = # Iterations * bytes written per iteration
         state.counters["IO Bytes"] = (MAX_BYTES / (double)(state.range(0) + read_1)) * read_1;
}

BENCHMARK(BM_read_stride_256kb)->RangeMultiplier(2)->Range(1<<12, 1<<27);


BENCHMARK_MAIN();
