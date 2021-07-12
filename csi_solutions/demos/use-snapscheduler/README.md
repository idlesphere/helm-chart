apiVersion: snapscheduler.backube/v1
kind: SnapshotSchedule
metadata:
  name: daily
spec:
  claimSelector:
    matchLabels:
      "schedule/daily": "enabled"
  retention:
    maxCount: 7
  schedule: "0 0 * * *"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jenkins
  labels:
    "schedule/daily": "enabled"
spec:
  # ...omitted...
---
# Set snapshot quota
apiVersion: v1
kind: ResourceQuota
metadata:
  name: snapshots
  namespace: default
spec:
  hard:
    count/volumesnapshots.snapshot.storage.k8s.io: "50"
---
# template: <pvc_name>-<schedule_name>-<snapshot_time>
$ kubectl get volumesnapshots
NAME                         AGE
jenkins-daily-202103080000   2d
jenkins-daily-202103070000   1d
---
# View schedules
$ kubectl get snapshotschedules
NAME     SCHEDULE    MAX AGE   MAX NUM   DISABLED   NEXT SNAPSHOT
dailly   0 0 * * *   168h      10                   2021-03-09T00:00:00Z
