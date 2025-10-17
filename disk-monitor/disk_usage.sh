#!/bin/bash

LOG_FILE="/var/log/disk_usage.log"

THRESHOLD=80
# Defines disk usage percentage that will trigger an alert

echo -e "\n-----------------------------------------------" >> $LOG_FILE
echo "Disk check at : $(date)" >> $LOG_FILE

df -h --output=pcent,target -x tmpfs -x overlay | tail -n +2 | while read usage mountpoint; do 
	usage_val=$(echo $usage | tr -d '%')
	if [ "$usage_val" -ge "$THRESHOLD" ]; then
		echo "WARNING! $mounpoint is $usage full!" >> $LOG_FILE
	else
		echo "$mountpoint is at $usage - OK " >> $LOG_FILE
	fi
done

echo "" >> $LOG_FILE



