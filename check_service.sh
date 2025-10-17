#!/bin/bash

echo "This script will check status of the service"
read -p "Enter the service name to check its status: " service_name
if [ -z $service_name ];
then
	echo "Please enter valid service name"
else
	systemctl status $service_name
fi
