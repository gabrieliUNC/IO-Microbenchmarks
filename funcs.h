#pragma once
#define _GNU_SOURCE 1
#include "constants.h"
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <random>

char* setupBuffer(int bytes) {
	// Allocate memory for the buffer
        char* buffer = (char *)malloc(bytes);

        // Fill the buffer with some data (e.g., 'A')
        for (int i = 0; i < bytes; i++) {
                buffer[i] = 'A';
        }
	return buffer;
}

void write_one_gig(int bytesPerWrite, const char* pathToFile, char* buffer, const int seekAmount) {
	// Open file
	int fd = open(pathToFile, O_RDWR | O_CREAT );

	for(int cur = 0; cur < MAX_BYTES; cur += (bytesPerWrite + seekAmount)) {
		if(seekAmount > 0)
			lseek(fd, seekAmount, SEEK_CUR);
		write(fd, buffer, bytesPerWrite);
		fsync(fd);
	}

	// Close file
	close(fd);
}

void read_one_gig(int bytesPerRead, const char* pathToFile, char* buffer, const int seekAmount) {
	// Open file
	int fd = open(pathToFile, O_RDWR | O_CREAT );

	for(int cur = 0; cur < MAX_BYTES; cur += (bytesPerRead + seekAmount)) {
		if(seekAmount > 0)
			lseek(fd, seekAmount, SEEK_CUR);
		read(fd, buffer, bytesPerRead);
	}

	// Close file
	close(fd);
}

void write_random_gig(int bytesPerWrite, const char* pathToFile, char* buffer, int lb, int ub) {
	// Open file
	int fd = open(pathToFile, O_RDWR | O_CREAT );

	// Seed random generator
	std::random_device dev;
	std::mt19937 rng(dev());
	std::uniform_int_distribution<std::mt19937::result_type> dist(lb, ub);

	for(int cur = 0; cur < MAX_BYTES; cur += bytesPerWrite) {
		int offset = dist(rng);
		lseek(fd, offset, SEEK_SET);
		write(fd, buffer, bytesPerWrite);
		fsync(fd);
	}

	// Close file
	close(fd);
}

void read_random_gig(int bytesPerRead, const char* pathToFile, char* buffer, int lb, int ub) {
	// Open file
	int fd = open(pathToFile, O_RDWR | O_CREAT );

	// Seed random generator
	std::random_device dev;
	std::mt19937 rng(dev());
	std::uniform_int_distribution<std::mt19937::result_type> dist(lb, ub);

	for(int cur = 0; cur < MAX_BYTES; cur += bytesPerRead) {
		int offset = dist(rng);
		lseek(fd, offset, SEEK_SET);
		read(fd, buffer, bytesPerRead);
	}

	// Close file
	close(fd);
}
