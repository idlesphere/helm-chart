install:
	kubectl apply -f ./app.yaml

snapshot:
	kubectl apply -f ./snapshot.yaml

restore:
	kubectl apply -f ./app-restore.yaml
	
uninstall:
	-kubectl delete -f ./app.yaml
	-kubectl delete -f ./app-restore.yaml
	-kubectl delete -f ./snapshot.yaml
