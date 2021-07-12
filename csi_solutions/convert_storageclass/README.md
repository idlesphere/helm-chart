
## 1.Found the source disk, and run clone disk

When you are using GCP, your new disk volumehandle will like this:

projects/`$PROJECT`/zones/`$ZONE`/disks/`diskname`

## 2.Modify makefile and values.yaml as you need

Usually `prepare` part in values.yaml doesn't need to change

## 3.Run command

```
make prepare
make mount
sleep 90s
make snapshot
sleep 120s
make restore
```

## Ref

Use disk clone function, and bound the disk to pv.

[Doc](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/preexisting-pd)
