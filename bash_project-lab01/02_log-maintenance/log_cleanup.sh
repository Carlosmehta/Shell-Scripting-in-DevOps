#!/bin/bash

# Log directory and retention period (in days)
log_dir="/var/log"
retain_days=30

# Find and compress old logs
find "$log_dir" -name "*.log" -type f -mtime +$retain_days -exec gzip {} \;

# Delete logs older than retention period
find "$log_dir" -name "*.gz" -type f -mtime +$((retain_days + 7)) -exec rm -f {} \;

# Report
echo "Log rotation and cleanup completed for $log_dir"

