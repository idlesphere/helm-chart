RELEASE_NAME ?= jenkins

prepare:
	helm template $(RELEASE_NAME) ./chart --set step=prepare

mount:
	helm template $(RELEASE_NAME) ./chart --set step=mount

snapshot:
	helm template $(RELEASE_NAME) ./chart --set step=snapshot

restore:
	helm template $(RELEASE_NAME) ./chart --set step=restore

cleanup:
	helm template $(RELEASE_NAME) ./chart --set step=mount    | kubectl delete -f -
#	helm template $(RELEASE_NAME) ./chart --set step=snapshot | kubectl delete -f -
	helm template $(RELEASE_NAME) ./chart --set step=restore  | kubectl delete -f -

# prepare:
# 	helm template $(RELEASE_NAME) ./chart --set step=prepare  | kubectl apply -f -

# mount:
# 	helm template $(RELEASE_NAME) ./chart --set step=mount    | kubectl apply -f -

# snapshot:
# 	helm template $(RELEASE_NAME) ./chart --set step=snapshot | kubectl apply -f -

# restore:
# 	helm template $(RELEASE_NAME) ./chart --set step=restore  | kubectl apply -f -