## 保守做法

```
cd /tmp
git clone https://github.com/coredns/deployment.git

cd deployment/kubernetes

./deploy.sh | kubectl apply -f -

kubectl scale deployment -n kube-system coredns --replicas=3
kubectl scale deployment -n kube-system kube-dns-autoscaler --replicas=0
kubectl scale deployment -n kube-system kube-dns --replicas=0
```

## 其他做法

```
# Add Helm Repo && install

helm repo add coredns https://coredns.github.io/helm
helm upgrade -i coredns/ \
    --set replicaCount=3

kubectl scale deployment -n kube-system kube-dns-autoscaler --replicas=0
kubectl scale deployment -n kube-system kube-dns --replicas=0
```

---

## 说明


- 将kube-dns和kube-dns-autoscaler缩小到零个pod可以防止DNS流量使用kube-dns。CoreDNS可以处理流量。
- 如果kube-dns和CoreDNS都在群集中运行，则所有DNS查询流量都将在两者之间分配。
    - 如果CoreDNS有1个Pod，而kube-dns有3个，则CoreDNS将占所有流量的25%。

