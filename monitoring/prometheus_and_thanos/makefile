.PHONY: lint dependencies

lint: dependencies
	docker run -v "$(PWD)/chart/rules:/work" -v "$(PWD)/build:/build" --entrypoint /build/lint-prom-rules.sh prom/prometheus
	helm lint ./chart/

dependencies:
	helm dep up ./chart

dry-run:
	helm template --debug ./chart

install:
	helm upgrade -i -n utilities prometheus ./chart --reuse-values

install-operator:
	helm repo add prometheus https://prometheus-community.github.io/helm-charts
	helm pull prometheus/prometheus-operator --version '6.7.4'
	tar xf prometheus-operator*.tgz
	cp ./build/overrides/job*yaml ./prometheus-operator/templates/prometheus-operator/admission-webhooks/
	helm upgrade -i -n utilities prometheus-operator ./prometheus-operator \
		-f ./build/prometheus-operator-values.yaml

install-clusterA:
	helm upgrade -i -n utilities prometheus ./chart \
		-f ./overrides/clusterA.values.yaml \
		--set datacenter=clusterA

install-clusterB:
	helm upgrade -i -n utilities prometheus ./chart \
		-f ./overrides/clusterB.values.yaml \
		--set datacenter=clusterB
