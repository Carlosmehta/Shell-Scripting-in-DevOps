#!/bin/bash

# Create logs directory if it doesn't exist
mkdir -p logs

# Define the log file
LOG_FILE="logs/service_monitor.log"

# Function to check and restart services
check_service() {
    SERVICE_NAME=$1
    if ! systemctl is-active --quiet $SERVICE_NAME; then
        echo "$SERVICE_NAME is down, restarting..." | tee -a $LOG_FILE
        if systemctl restart $SERVICE_NAME; then
            echo "$SERVICE_NAME restarted successfully." | tee -a $LOG_FILE
        else
            echo "Failed to restart $SERVICE_NAME.service: Unit $SERVICE_NAME.service not found." | tee -a $LOG_FILE
        fi
    else
        echo "$SERVICE_NAME is running." | tee -a $LOG_FILE
    fi
}

# Check services
check_service nginx
check_service docker
check_service jenkins
