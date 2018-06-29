 #!/bin/bash

gcloud container clusters create $CLUSTER \
  --num-nodes $NODECOUNT  \
  --disk-size=$NODEDISKSIZE \
  --machine-type=$NODETYPE \
  --zone=$ZONE \
  --verbosity=error

kubectl create -f rbac.yaml
