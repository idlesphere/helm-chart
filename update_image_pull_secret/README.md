

## Prepare

You need to delete the raw secret accross namespaces.

So as to avoid these issues.

- Field immutable issue 
  - `type: kubernetes.io/dockerconfigjson`
  - `type: kubernetes.io/dockercfg`
- Annotation issue
  - `meta.helm.sh/release-name: regcred`

Run

```
make patch
```

## Install

```
$ ➜ helm upgrade -i "regcred" chart/ -n "utilities" --debug
history.go:56: [debug] getting history for release regcred
Release "regcred" does not exist. Installing it now.
install.go:173: [debug] Original chart version: ""
install.go:190: [debug] CHART PATH: ~/auto_scripts/CHDEX-1994/update_jfrog_authenticate/chart

client.go:122: [debug] creating 3 resource(s)
NAME: regcred
LAST DEPLOYED: Mon Mar  8 09:05:42 2021
NAMESPACE: utilities
STATUS: deployed
REVISION: 1
TEST SUITE: None
USER-SUPPLIED VALUES:
{}

COMPUTED VALUES:
ignore:
- kube-public
- kube-system
- kube-node-lease
- local-path-storage
imageCredentials:
- registry: https://harbor.sample.com
  username: "changeme"
  password: "changeme"
- registry: https://harbor-proxy.sample.com
  username: "changeme"
  password: "changeme"
- registry: https://harbor-test.sample.com
  username: "changeme"
  password: "changeme"
- registry: https://index.docker.io/v1/
  username: "changeme"
  password: "changeme"
secretname: regcred
```
