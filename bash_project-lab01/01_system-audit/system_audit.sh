#!/bin/bash

# System Audit and Health Report Script
# Author: Bhaskar Mehta
# Version: 1.0
# Description: Generates comprehensive system health report

# Define output file
REPORT_FILE="system_health_report_$(date +%Y%m%d_%H%M%S).txt"

# Header
echo "========================================" > $REPORT_FILE
echo " SYSTEM HEALTH AUDIT REPORT" >> $REPORT_FILE
echo " Generated: $(date)" >> $REPORT_FILE
echo "========================================" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 1. System Information
echo "=== SYSTEM INFORMATION ===" >> $REPORT_FILE
echo "Hostname: $(hostname)" >> $REPORT_FILE
echo "Operating System: $(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)" >> $REPORT_FILE
echo "Kernel Version: $(uname -r)" >> $REPORT_FILE
echo "Uptime: $(uptime -p)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 2. CPU Information
echo "=== CPU INFORMATION ===" >> $REPORT_FILE
echo "CPU Model: $(grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | sed 's/^[ \t]*//')" >> $REPORT_FILE
echo "CPU Cores: $(nproc)" >> $REPORT_FILE
echo "CPU Load (15 min avg): $(uptime | awk -F 'load average:' '{print $2}' | cut -d',' -f2)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Function to get CPU usage percentage
get_cpu_usage() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\$[0-9.]*\$%* id.*/\1/" | awk '{print 100 - $1}')
    echo "$cpu_usage%"
}

echo "Current CPU Usage: $(get_cpu_usage)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 3. Memory Information
echo "=== MEMORY INFORMATION ===" >> $REPORT_FILE
free -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 4. Disk Information
echo "=== DISK INFORMATION ===" >> $REPORT_FILE
echo "Disk Usage:" >> $REPORT_FILE
df -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Inode Usage:" >> $REPORT_FILE
df -i >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 5. Network Information
echo "=== NETWORK INFORMATION ===" >> $REPORT_FILE
ip addr show >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 6. User Information
echo "=== USER INFORMATION ===" >> $REPORT_FILE
echo "Logged-in Users:" >> $REPORT_FILE
who >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Sudo Users:" >> $REPORT_FILE
grep -Po '^sudo.+:\K.*$' /etc/group >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Users with UID 0:" >> $REPORT_FILE
awk -F: '($3 == "0") {print}' /etc/passwd >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 7. Security Information
echo "=== SECURITY INFORMATION ===" >> $REPORT_FILE
echo "Failed SSH Attempts:" >> $REPORT_FILE
journalctl _SYSTEMD_UNIT=sshd.service | grep "Failed password" | tail -n 10 >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Recent SSH Logins:" >> $REPORT_FILE
last -10 >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 8. Critical Errors
echo "=== CRITICAL ERRORS (Last 24 Hours) ===" >> $REPORT_FILE
journalctl --since "24 hours ago" -p err >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 9. Process Information
echo "=== TOP PROCESSES ===" >> $REPORT_FILE
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10 >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Footer
echo "========================================" >> $REPORT_FILE
echo " REPORT COMPLETE" >> $REPORT_FILE
echo "========================================" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Final message
echo "System audit completed. Report generated at: $REPORT_FILE"
