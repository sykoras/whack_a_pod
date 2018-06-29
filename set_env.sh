 #!/bin/bash

export NODEDISKSIZE=200
export NODECOUNT=2
export NODETYPE=n1-standard-4

export PROJECT=$DEVSHELL_PROJECT_ID
export ZONE=us-central1-c
export REGION=us-central1
export CLUSTER=whack-a-pod

export DOCKERREPO=gcr.io/$PROJECT

export INGRESSNAME=whack-a-pod-ingress

gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable containerregistry.googleapis.com
