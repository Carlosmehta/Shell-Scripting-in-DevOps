#!/bin/bash

<<<<<<< HEAD
# System Audit Script 
# Author: Bhaskar Mehta
# Date: $(date)

REPORT_DIR="../reports"
REPORT_FILE="$REPORT_DIR/system_audit_$(date +%F_%T).log"
=======
# Timestamp for the report
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')

# Report file
report_file="reports/audit_${timestamp}.log"
>>>>>>> 0a5e365 (system_audit.sh)

# Start report
echo "System Audit Report - $timestamp" > "$report_file"
echo "======================================" >> "$report_file"
echo "Uptime: $(uptime)" >> "$report_file"
echo "--------------------------------------" >> "$report_file"

# CPU usage
echo "CPU Load: $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')" >> "$report_file"

# Memory usage
echo "Memory Usage: $(free -h)" >> "$report_file"

# Disk usage
echo "Disk Usage: $(df -h)" >> "$report_file"

# Logged-in users
echo "Logged-in Users: $(who)" >> "$report_file"

# Last failed login attempts
echo "Failed SSH Attempts: $(grep 'Failed' /var/log/auth.log | tail -n 10)" >> "$report_file"

# End report
echo "Audit Completed" >> "$report_file"
echo "======================================" >> "$report_file"

# Output location
echo "Audit report generated: $report_file"

