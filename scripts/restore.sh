#!/usr/bin/env bash
set -euo pipefail
: "${BACKUP_NAME:?Set BACKUP_NAME to an existing Velero backup}"
: "${CONFIRM_RESTORE:?Set CONFIRM_RESTORE=yes after reviewing restore impact}"
[[ "$CONFIRM_RESTORE" == yes ]] || { echo 'Confirmation required'; exit 1; }
velero restore create --from-backup "$BACKUP_NAME" --wait
