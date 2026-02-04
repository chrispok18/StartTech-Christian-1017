#!/usr/bin/env bash
set -euo pipefail

echo "Rollback strategy:"
echo "1) Re-run the previous successful GitHub Actions workflow run (preferred)."
echo "2) Or upload an older binary to S3 and trigger ASG refresh."
