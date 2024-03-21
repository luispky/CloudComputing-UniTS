#!/bin/bash

# Create a data directory if it doesn't exist
mkdir -p data

# Generate 1kb of random data and save it to a file in the data directory
head -c 1K /dev/urandom > data/1KB_random_data.bin

# Generate 1mb of random data and save it to a file in the data directory
head -c 1M /dev/urandom > data/1MB_random_data.bin

# Generate 1gb of random data and save it to a file in the data directory
head -c 1G /dev/urandom > data/1GB_random_data.bin

# Generate a file with a simple message
echo "Hello World from Locust!!!" > data/hello_world.txt