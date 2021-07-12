#!/bin/bash

# Get Values From env
# PVC_NAME=""
# MAX_COUNT="7"
# VOLUMESNAPSHOTCLASS="csi-ssd"
# NAMESPACE will get from pod env
# -----
MAX=`expr ${MAX_COUNT} + 1`

die() {
    echo -e "\033[1;31m>>> $@ \033[0m"
    exit 1
}

# Check PVC_NAME  
if [ -n "${PVC_NAME}" ];then
	kubectl get pvc ${PVC_NAME} -n ${NAMESPACE} || die "persistentvolumeclaims \"${PVC_NAME}\" not found "
else
	die "PVC_NAME is empty"
fi

# Run Snapshot
cat <<EOF | kubectl apply -f -
apiVersion: snapshot.storage.k8s.io/v1beta1
kind: VolumeSnapshot
metadata:
  name: ${PVC_NAME}-$(date +"%Y%m%d")
  namespace: ${NAMESPACE}
  labels:
    name: ${PVC_NAME}
    managed-by: cronjob
spec:
  volumeSnapshotClassName: ${VOLUMESNAPSHOTCLASS}
  source:
    persistentVolumeClaimName: ${PVC_NAME}
EOF

# Retention
OLD_SNAPSHOT="`kubectl get volumesnapshot -l "managed-by=cronjob,name=${PVC_NAME}" -n ${NAMESPACE} | awk 'NR>1{print $1}' | sort -r | tail -n +${MAX} | tr '\n' ' '`"
if [ -n "${OLD_SNAPSHOT}" ];then
	echo ">>> Running Retention"
	echo ">>> Deleting ${OLD_SNAPSHOT}"
	kubectl delete volumesnapshot ${OLD_SNAPSHOT} -n ${NAMESPACE} 
  kubectl get volumesnapshot -n ${NAMESPACE} 
else
	echo ">>> No need to do retention"
fi




