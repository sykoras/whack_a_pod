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

kubectl run admin-deployment --image=$DOCKERREPO/admin --replicas=1 --port=8080 --labels=app=admin --env="APIIMAGE=$DOCKERREPO/api"

kubectl run api-deployment --image=$DOCKERREPO/api --replicas=12 --port=8080 --labels=app=api

kubectl run game-deployment --image=$DOCKERREPO/game --replicas=4 --port=8080 --labels=app=game

kubectl expose deployment game-deployment --name=game --target-port=8080  --type=NodePort --labels="app=api"

kubectl expose deployment api-deployment --name=api --target-port=8080  --type=NodePort --labels="app=api"

kubectl expose deployment admin-deployment --name=admin --target-port=8080  --type=NodePort --labels="app=admin"

kubectl apply -f "ingress.yaml"
