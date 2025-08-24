# Log-Archive-Tool
https://roadmap.sh/projects/log-archive-tool
Log Archive Tool
Project Page: https://github.com/your-username/your-repository-name

This project contains a simple command-line interface (CLI) tool, log-archive.sh, to archive log directories with a date and time stamp.

Purpose
The script automates the process of compressing log files, which is useful for cleaning up disk space while maintaining a record of old logs for future reference.

The tool performs the following actions:

Accepts a directory path as a command-line argument.

Compresses all files and subdirectories within the specified path into a tar.gz archive.

Names the archive with the format directoryname_YYYYMMDD_HHMMSS.tar.gz.

Stores the new archive in a dedicated archive directory.

How to Run the Script
1. Make the file executable
First, navigate to the script's directory and grant it executable permissions.

chmod +x log-archive.sh

2. Run the script
Execute the script from your terminal, providing the path to the directory you want to archive as an argument.

./log-archive.sh <log-directory>

Example:
If you want to archive the /var/log directory, you would run:

./log-archive.sh /var/log

This will create an archive file, for example, log_20240824_100645.tar.gz, and place it in the ./archive directory.
