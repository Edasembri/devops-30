#!/bin/bash
set -euo pipefail

echo "== HEALTH CHECK =="
echo "Date: $(date)"
uptime
df -h /
free -h
echo "echo 'Done!'" >> health-check.sh
