1. Create the StorageClass and VolumeSnapshotClass

```
make install
kubectl exec app1 -- tail /data/out.txt
```

2. Create a VolumeSnapshot:

```
make snapshot
```

3. Wait for the status `Ready To Use` turn to true:

```
watch -n 1 kubectl describe volumesnapshot ebs-volume-snapshot

make restore

kubectl exec app2 -- tail /data/out.txt

kubectl exec app1 -- tail /data/out.txt
```

