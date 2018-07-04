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

# set cluster variables
export NODEDISKSIZE=200
export NODECOUNT=2
export NODETYPE=n1-standard-4
export PROJECT=$DEVSHELL_PROJECT_ID
export ZONE=us-central1-c
export REGION=us-central1
export CLUSTER=whack-a-pod

# set contrainer registry variable
export DOCKERREPO=gcr.io/$PROJECT

# set ingress variable
export INGRESSNAME=whack-a-pod-ingress

# enable the needed services
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable containerregistry.googleapis.com
