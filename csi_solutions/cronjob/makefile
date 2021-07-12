RELEASE_NAME ?= snapshot

DOCKER_IMAGE ?= iherb-docker.jfrog.io/cronsnapshot:latest

build:
	@docker build \
		-t $(DOCKER_IMAGE) ./image
	  
push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE)

install:
	helm template $(RELEASE_NAME) ./chart | kubectl apply -f -

uninstall:
	helm template $(RELEASE_NAME) ./chart --set uninstall=true | kubectl delete -f -
