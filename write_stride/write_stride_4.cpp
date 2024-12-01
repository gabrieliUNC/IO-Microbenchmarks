#include <benchmark/benchmark.h>
#include <unistd.h>
#include <fcntl.h>
#include "../funcs.h"



/*====IO Stride for 4M writes====*/
const int write_4 = 1 << 22;

static void BM_4k(benchmark::State& state) {
	static const int variable_stride_amt = 1 << 12;
	// Set up buffer
	char* buffer = setupBuffer(write_4);
	 

	// Run Bench mark tests
	for(auto _ : state) {
		write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_4k);

static void BM_8k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 13;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_8k);

static void BM_16k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 14;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_16k);

static void BM_32k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 15;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_32k);

static void BM_64k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 16;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_64k);

static void BM_128k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 17;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_128k);

static void BM_256k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 18;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_256k);

static void BM_512k(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 19;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_512k);

static void BM_1M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 20;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_1M);

static void BM_2M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 21;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_2M);

static void BM_4M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 22;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_4M);

static void BM_8M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 23;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_8M);

static void BM_16M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 24;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_16M);

static void BM_32M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 25;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_32M);

static void BM_64M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 26;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_64M);

static void BM_128M(benchmark::State& state) {
        static const int variable_stride_amt = 1 << 27;
        // Set up buffer
        char* buffer = setupBuffer(write_4);
         

        // Run Bench mark tests
        for(auto _ : state) {
                write_one_gig(write_4, writeFile, buffer, variable_stride_amt);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_128M);

BENCHMARK_MAIN();
