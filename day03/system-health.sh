#!/bin/bash
# system-health.sh - Monitors CPU, memory and disk usage
# Usage: bash system-health.sh
# Author: edase
# Date: 2026-04-04

#!/bin/bash
set -euo pipefail

DISK_WARN=80
MEM_WARN=80

echo "== HEALTH CHECK - $(date) =="

LOAD=$(awk '{print $1}' /proc/loadavg)
echo "CPU Load: ${LOAD}"

MEM_TOTAL=$(awk '/MemTotal/{print $2}' /proc/meminfo)
MEM_AVAIL=$(awk '/MemAvailable/{print $2}' /proc/meminfo)
MEM_USED=$(( MEM_TOTAL - MEM_AVAIL ))
MEM_PCT=$(( MEM_USED * 100 / MEM_TOTAL ))

if [ "${MEM_PCT}" -gt "${MEM_WARN}" ]; then
  echo "WARNING MEMORY: ${MEM_PCT}%"
else
  echo "OK MEMORY: ${MEM_PCT}%"
fi

DISK_PCT=$(df / | awk 'NR==2{print $5}' | tr -d '%')
if [ "${DISK_PCT}" -gt "${DISK_WARN}" ]; then
  echo "WARNING DISK: ${DISK_PCT}%"
else
  echo "OK DISK: ${DISK_PCT}%"
fi

echo ""
echo "Top 5 processes by CPU:"
ps aux --sort=-%cpu | head -6 | tail -5 | awk '{print $11, $3"%"}'
