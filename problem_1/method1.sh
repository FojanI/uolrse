#!/usr/bin/env bash
 
# Function to display usage information
usage() {
    echo "Usage: $0 <source_extension> <target_extension>.This command line utility changes the file extension from <source_extension> to <target_extension>."
    exit 1
}
 
# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments. Please specify a source and destination extension."
    usage
fi
 
# Assign input arguments to variables for better readability.
source_ext="$1"
target_ext="$2"
 
 
# Check if any files with the source extension exist
if ! ls *."$source_ext" >/dev/null 2>&1; then
    echo "Error: No files found with the extension .$source_ext"
    exit 1
fi
 
# Rename files with the given source extension to the target extension
ls *."$source_ext" | cut -d"." -f 1 | xargs -I {} mv {}."$source_ext" {}."$target_ext"
