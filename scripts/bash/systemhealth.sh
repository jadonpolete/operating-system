
#!/usr/bin/env bash
# Outputs: Date/Time, Hostname, Current User, Disk usage for /

echo "=== System Health Snapshot ==="
echo "Date/Time:  $(date)"
echo "Hostname:   $(hostname)"
echo "User:       $(whoami)"

# Disk usage for root (/)
# Output: Free vs Total
df -h / | awk 'NR==1 {next} {print "Disk (/):   Free " $4 " / Total " $2}'
