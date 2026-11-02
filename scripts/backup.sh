#!/usr/bin/env bash
set -euo pipefail
: "${VELERO_NAMESPACE:?Set VELERO_NAMESPACE to the application namespace}"
name="dr-$(date -u +%Y%m%d-%H%M%S)"
velero backup create "$name" --include-namespaces "$VELERO_NAMESPACE" --wait
velero backup describe "$name" --details
printf 'Backup name: %s\n' "$name"
