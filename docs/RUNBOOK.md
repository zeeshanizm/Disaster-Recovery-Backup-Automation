# Runbook

Prerequisites: Kubernetes test cluster, Velero CLI/server, Azure Blob backup storage and correctly scoped identity. Configure Azure object storage and volume snapshot or file-system backup support using the current Velero Azure plugin documentation. Verify backup storage location is Available.

```bash
velero backup-location get
export VELERO_NAMESPACE=portfolio-demo
bash scripts/backup.sh
velero backup get
export BACKUP_NAME=YOUR_BACKUP_NAME
export CONFIRM_RESTORE=yes
bash scripts/restore.sh
velero restore get
```

For recurring backups apply `velero/schedule.yaml` after replacing the namespace. Perform restore drills in a separate test cluster or namespace-mapped restore where supported, and verify application data consistency, RPO/RTO and permissions. Restoring into an existing namespace can overwrite resources. This sample does not provision Azure Backup or storage accounts; it demonstrates the Velero operational workflow.
