.PHONY:patch

lint:
	helm lint --strict chart/

patch:
	bash bin/patch.sh

install:
	kubectl create namespace utilities
	helm upgrade -i "regcred" chart/ -n "utilities"

delete:
	helm delete "regcred" -n "utilities"