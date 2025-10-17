#!/bin/bash
#==============================================
# Script Name: backup_script.sh
# Purpose:     Create a compressed backup of a directory
# Author:      Jagdish Singh
# Date:        $(date +%Y-%m-%d)
#==============================================

# ---- User Inputs ----
backup_dir="$1"
dest_dir="$2"

# ---- Configurable Variables ----
backup_date=$(date +%b-%d-%y)
log_file="/var/log/backup_script.log"


# ---- Input Validation ----
if [ -z "$backup_dir" ] || [ -z "$dest_dir" ]; then
    echo "!Error: Missing arguments."
fi

if [ ! -d "$backup_dir" ]; then
    echo "! Error: Source directory '$backup_dir' does not exist."
    exit 1
fi

# ---- Create destination if not exists ----
if [ ! -d "$dest_dir" ]; then
    echo "Destination folder not found. Creating it..."
    sudo mkdir -p "$dest_dir"
fi

# ---- Start Backup ----
backup_file="$dest_dir/backup-$backup_date.tar.gz"

echo "================ Backup Started ================"
echo "Source: $backup_dir"
echo "Destination: $backup_file"
echo "Date: $(date)"
echo "==============================================="

# ---- Run tar ----
sudo tar -Pczf "$backup_file" "$backup_dir" > /dev/null 2>&1
status=$?

# ---- Log Results ----
{
    echo "[$(date)] Backup from $backup_dir to $backup_file"
    if [ $status -eq 0 ]; then
        echo "Backup succeeded"
    else
        echo "Backup failed (exit code: $status)"
    fi
    echo "-----------------------------------------------"
} >> "$log_file"

# ---- Print Output ----
if [ $status -eq 0 ]; then
    echo "$backup_dir backup succeeded"
    echo "Backup file created at: $backup_file"
else
    echo "$backup_dir backup failed"
    echo "Check log file for details: $log_file"
fi

echo "Backup complete!"

