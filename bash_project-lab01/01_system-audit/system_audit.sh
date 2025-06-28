#!/bin/bash

# System Audit and Health Report Script
# Version: 1.2
# Fixed: CPU usage calculation error and last command not found

REPORT_FILE="system_health_report_$(date +%Y%m%d_%H%M%S).txt"

# Header
cat <<EOF > $REPORT_FILE
========================================
 SYSTEM HEALTH AUDIT REPORT
 Generated: $(date)
========================================

EOF

# System Info
echo "=== SYSTEM INFORMATION ===" >> $REPORT_FILE
echo "Hostname: $(hostname)" >> $REPORT_FILE
echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)" >> $REPORT_FILE
echo "Kernel: $(uname -r)" >> $REPORT_FILE
echo "Uptime: $(uptime -p)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Fixed CPU Usage Calculation
echo "=== CPU INFORMATION ===" >> $REPORT_FILE
echo "CPU Model: $(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//')" >> $REPORT_FILE
echo "CPU Cores: $(nproc)" >> $REPORT_FILE
echo "CPU Load: $(uptime | awk -F 'load average:' '{print $2}' | cut -d',' -f2)" >> $REPORT_FILE

# Simpler CPU usage calculation that works reliably
get_cpu_usage() {
    local cpu_usage=$(top -bn1 | awk '/Cpu\$s\$:/ {print 100 - $8}')
    echo "${cpu_usage}%" 
}

echo "Current CPU Usage: $(get_cpu_usage)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Remaining checks (unchanged)
echo "=== MEMORY INFORMATION ===" >> $REPORT_FILE
free -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "=== DISK INFORMATION ===" >> $REPORT_FILE
df -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "=== NETWORK INFORMATION ===" >> $REPORT_FILE
ip addr show >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "=== USER INFORMATION ===" >> $REPORT_FILE
echo "Logged-in Users:" >> $REPORT_FILE
who >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "=== SECURITY INFORMATION ===" >> $REPORT_FILE
echo "Failed SSH Attempts:" >> $REPORT_FILE
journalctl -u sshd.service | grep "Failed password" | tail -10 >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Footer
cat <<EOF >> $REPORT_FILE
========================================
 REPORT COMPLETE
========================================
EOF

echo "System audit completed. Report generated: $REPORT_FILE"
