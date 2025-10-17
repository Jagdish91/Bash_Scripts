#!/bin/bash

echo "Delete files older than 30 days"

path="$1"
retention_time="$2"

echo "Path: $path"

count=$(find $path -type f -mtime +$retention_time -print -delete | wc -l)

if [[ $count -gt 0 ]];
then
	echo "$count files are deleted  successfully"
else
	echo "No files older than $retention_time found"
fi


