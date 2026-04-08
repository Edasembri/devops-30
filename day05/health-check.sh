#!/bin/bash
set -euo pipefail

# Health check script - monitors system resources
echo "== HEALTH CHECK =="
echo "Date: $(date)"

# CPU load
echo "--- CPU ---"
uptime

# Disk usage
echo "--- DISK ---"
df -h /

# Memory usage
echo "--- MEMORY ---"
free -h

echo "== DONE =="
