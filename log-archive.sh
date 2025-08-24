#!/bin/bash

# log-archive.sh
# A tool to archive logs from the CLI with the date and time.

#  Script Configuration
# Set the name for the archive directory.
ARCHIVE_DIR="archive"

# Function to display usage information 
show_help() {
  echo "Usage: $0 <log-directory>"
  echo ""
  echo "This script compresses logs from a specified directory into a tar.gz file"
  echo "and stores them in a new directory named '${ARCHIVE_DIR}'."
  echo ""
  echo "Arguments:"
  echo "  <log-directory>  The path to the directory containing the logs to archive."
}

#  Main Script Logic 

# Check if a directory was provided as a command-line argument.
if [ -z "$1" ]; then
  echo "Error: You must provide a log directory to archive."
  show_help
  exit 1
fi

LOG_DIR="$1"

# Check if the provided directory exists.
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory '$LOG_DIR' not found."
  exit 1
fi

# Create the archive directory if it doesn't exist.
if [ ! -d "$ARCHIVE_DIR" ]; then
  echo "Creating archive directory: $ARCHIVE_DIR"
  mkdir "$ARCHIVE_DIR"
fi

# Get the current date and time in the specified format (YYYYMMDD_HHMMSS).
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Construct the filename for the archive.
ARCHIVE_FILENAME="${LOG_DIR##*/}_${TIMESTAMP}.tar.gz"

# Compress the logs and move the archive to the new directory.
echo "Compressing logs from '$LOG_DIR'..."
tar -czf "${ARCHIVE_FILENAME}" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"
mv "${ARCHIVE_FILENAME}" "$ARCHIVE_DIR"

echo "Logs successfully archived to: ${ARCHIVE_DIR}/${ARCHIVE_FILENAME}"

