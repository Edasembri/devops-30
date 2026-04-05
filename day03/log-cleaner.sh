#!/bin/bash
set -euo pipefail

LOG_DIR="${1:-./logs}"
DAYS=7

echo "== LOG CLEANER - $(date) =="
echo "Scanning: ${LOG_DIR}"
echo "Deleting files older than ${DAYS} days..."

find "${LOG_DIR}" -name '*.log' -mtime +${DAYS} -type f -delete

echo "Done. Files deleted."
