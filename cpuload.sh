#!/bin/bash
# Checking CPU load

echo "================ CPU Load Average Check ================"

# Extract 1-minute load average
load=$(uptime | awk -F'load average:' '{print $2}' | cut -d',' -f1 | xargs)

echo "Current CPU Load Average: $load"

# Set threshold
threshold=1.00

# Compare using bc (floating-point)
if (( $(echo "$load > $threshold" | bc -l) )); then
    echo "⚠️  CPU Load is HIGH: $load"
else
    echo "✅ CPU Load is Normal"
fi
