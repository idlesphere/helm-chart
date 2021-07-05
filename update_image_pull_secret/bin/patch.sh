#!/bin/bash

secretname=${1-"regcred"}

## Delete Secret
for namespace in $(kubectl get namespace|awk 'NR>1{print $1}')
do
	kubectl delete secret/${secretname} -n ${namespace}
done