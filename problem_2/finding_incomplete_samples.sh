#!/usr/bin/env bash
 
# Function to display usage information
usage() {
    echo "Usage: $0 <directory_path> <expected_number>"
    exit 1
}
 
# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments"
    usage
fi
 
# Assign input arguments to variables
directory_path="$1"
expected_number="$2"
 
# Check if the provided directory exists
if [ ! -d "$directory_path" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi
 
# Navigate to the provided directory
cd "$directory_path" || exit
 
# Identify files with fewer than the expected number of values
wc * -w | grep -v "$expected_number"
