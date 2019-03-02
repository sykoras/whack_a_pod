#!/bin/bash

# Copyright 2018 ROI Training, Inc. All Rights Reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# install go library
go get -u github.com/gorilla/mux

# build admin image
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o "apps/admin/containers/main" "apps/admin/containers/main.go" "apps/admin/containers/kubernetes.go"
gcloud builds submit "apps/admin/containers/." --tag=$DOCKERREPO/admin

# build api image
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o "apps/api/containers/main" "apps/api/containers/main.go"
gcloud builds submit "apps/api/containers/." --tag=$DOCKERREPO/api

# build game image
gcloud builds submit "apps/game/containers/." --tag=$DOCKERREPO/game
