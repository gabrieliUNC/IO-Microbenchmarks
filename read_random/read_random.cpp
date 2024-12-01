#include "../funcs.h"
#include <benchmark/benchmark.h>

const int lb = 0;
const int ub = 1 << 30;

static void BM_4k(benchmark::State& state) {
	static const int read_amt = 1 << 12;
	// Set up buffer
	char* buffer = setupBuffer(read_amt);


	// Run Bench mark tests
	for(auto _ : state) {
		read_random_gig(read_amt, readFile, buffer, lb, ub);
	}

	// free buffer
	free(buffer);
}

BENCHMARK(BM_4k);

static void BM_8k(benchmark::State& state) {
        static const int read_amt = 1 << 13;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_8k);

static void BM_16k(benchmark::State& state) {
        static const int read_amt = 1 << 14;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_16k);

static void BM_32k(benchmark::State& state) {
        static const int read_amt = 1 << 15;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_32k);

static void BM_64k(benchmark::State& state) {
        static const int read_amt = 1 << 16;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_64k);

static void BM_128k(benchmark::State& state) {
        static const int read_amt = 1 << 17;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_128k);

static void BM_256k(benchmark::State& state) {
        static const int read_amt = 1 << 18;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_256k);

static void BM_512k(benchmark::State& state) {
        static const int read_amt = 1 << 19;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_512k);

static void BM_1M(benchmark::State& state) {
        static const int read_amt = 1 << 20;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_1M);

static void BM_2M(benchmark::State& state) {
        static const int read_amt = 1 << 21;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_2M);

static void BM_4M(benchmark::State& state) {
        static const int read_amt = 1 << 22;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_4M);

static void BM_8M(benchmark::State& state) {
        static const int read_amt = 1 << 23;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_8M);

static void BM_16M(benchmark::State& state) {
        static const int read_amt = 1 << 24;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_16M);

static void BM_32M(benchmark::State& state) {
        static const int read_amt = 1 << 25;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_32M);

static void BM_64M(benchmark::State& state) {
        static const int read_amt = 1 << 26;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_64M);

static void BM_128M(benchmark::State& state) {
        static const int read_amt = 1 << 27;
        // Set up buffer
        char* buffer = setupBuffer(read_amt);
         

        // Run Bench mark tests
        for(auto _ : state) {
                read_random_gig(read_amt, readFile, buffer, lb, ub);
        }

        // free buffer
        free(buffer);
}

BENCHMARK(BM_128M);

BENCHMARK_MAIN();
