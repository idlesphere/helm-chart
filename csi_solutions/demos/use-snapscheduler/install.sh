helm repo add backube https://backube.github.io/helm-charts/

kubectl create namespace backube-snapscheduler

helm install -n backube-snapscheduler snapscheduler backube/snapscheduler


