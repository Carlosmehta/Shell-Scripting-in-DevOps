#!/bin/bash

# System Audit Script 
# Author: Bhaskar Mehta
# Date: $(date)

REPORT_DIR="../reports"
REPORT_FILE="$REPORT_DIR/system_audit_$(date +%F_%T).log"

mkdir -p "$REPORT_DIR"

echo " Generating system audit report..."
{
    echo "===== System Information ====="
    uname -a
    lsb_release -a 2>/dev/null

    echo -e "\n=====  Memory Usage ====="
    free -h

    echo -e "\n=====  Disk Usage ====="
    df -h

    echo -e "\n=====  Top 5 CPU-Consuming Processes ====="
    ps aux --sort=-%cpu | head -n 6

    echo -e "\n=====  Open Network Ports ====="
    ss -tuln

    echo -e "\n=====  SUID Binaries ====="
    find / -perm -4000 -type f 2>/dev/null

    echo -e "\n=====  World-Writable Files ====="
    find / -type f -perm -o+w 2>/dev/null

    echo -e "\n=====  Logged-In Users ====="
    who

    echo -e "\n=====  Last 10 Logins ====="
if command -v last >/dev/null 2>&1; then
    last -n 10
else
    echo "'last' command not found. Please install util-linux."
fi

} > "$REPORT_FILE"

echo " Report saved to: $REPORT_FILE"

