#!/bin/bash
# log-cleaner.sh - Deletes log files older than 7 days
# Usage: bash log-cleaner.sh /path/to/logs
# Author: edase
# Date: 2026-04-04

#!/bin/bash
set -euo pipefail

LOG_DIR="${1:-./logs}"
DAYS=7

echo "== LOG CLEANER - $(date) =="
echo "Scanning: ${LOG_DIR}"
echo "Deleting files older than ${DAYS} days..."

find "${LOG_DIR}" -name '*.log' -mtime +${DAYS} -type f -delete

echo "Done. Files deleted."
