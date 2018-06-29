 #!/bin/bash

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o "apps/admin/containers/main" "apps/admin/containers/main.go" "apps/admin/containers/kubernetes.go"

gcloud container builds submit "apps/admin/containers/." --tag=$DOCKERREPO/admin

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o "apps/api/containers/main" "apps/api/containers/main.go"

gcloud container builds submit "apps/api/containers/." --tag=$DOCKERREPO/api

gcloud container builds submit "apps/game/containers/." --tag=$DOCKERREPO/game
