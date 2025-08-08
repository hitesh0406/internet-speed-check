#!/bin/bash

LOG_FILE="$HOME/internet_speed_log.csv"

##Creates log file header if it does not exists 

if [! -f "$LOG_FILE"]; then
    echo "Date,time,Ping (ms),Download (Mbps),Upload (Mbps)" >> "$LOG_FILE"
fi

DATE=$(date + "%Y-%m-%d")
TIME=$(date+ "%H:%M:%S")

SPEED_TEST_OUTPUT=$(speedtest-cli --simple)

##Extract PING DOWNLOAD and UPLOAD values

PING=$(echo "$SPEED_TEST_OUTPUT" | grep "Ping" | awk '{print $2}')
DOWNLOAD=$(echo "$SPEED_TEST_OUTPUT" | grep "Download" | awk '{print $2}')
UPLOAD=$(echo "$SPEED_TEST_OUTPUT" | grep "Upload" | awk '{print $2}')

echo "$DATE,$TIME,$PING,$DOWNLOAD,$UPLOAD" >> "$LOG_FILE"
echo "[$DATE $TIME] Logged: Ping=${PING}ms, Download=${DOWNLOAD}Mbps, Upload=${UPLOAD}Mbps"


