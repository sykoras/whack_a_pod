kubectl run admin-deployment --image=$DOCKERREPO/admin --replicas=1 --port=8080 --labels=app=admin --env="APIIMAGE=$DOCKERREPO/api"

kubectl run api-deployment --image=$DOCKERREPO/api --replicas=12 --port=8080 --labels=app=api

kubectl run game-deployment --image=$DOCKERREPO/game --replicas=4 --port=8080 --labels=app=game

  kubectl expose deployment game-deployment --name=game --target-port=8080  --type=NodePort --labels="app=api"

kubectl expose deployment api-deployment --name=api --target-port=8080  --type=NodePort --labels="app=api"

kubectl expose deployment admin-deployment --name=admin --target-port=8080  --type=NodePort --labels="app=admin"

kubectl apply -f "ingress.yaml"
