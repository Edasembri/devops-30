#!/bin/bash
set -euo pipefail

echo '===== SYSTEM INFO ====='
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo ''
echo '=== OS ==='
grep PRETTY_NAME /etc/os-release
echo ''
echo '=== MEMORY ==='
free -m | grep Mem
echo ''
echo '=== DISK ==='
df -h | grep -v tmpfs
echo ''
echo '=== KERNEL ==='
uname -r
