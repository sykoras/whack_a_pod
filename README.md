# Whack-a-pod
This is a demo that can be used to show how resilient services running on Kubernetes can be.

Use either the version available at /next.html, or the more advanced version at /advanced.html.


## Getting Started

1. Create Project in Cloud Console
1. Open Cloud Shell
1. Clone this repo `git clone https://github.com/sykoras/whack_a_pod`
1. Change directories into repo `cd whack_a_pod`
1. To enable services and set variables, run `. ./env.sh`
1. To create the GKE cluster, run `. ./cluster.sh`
1. To build the images, run `. ./images.sh`
> __Warning__ This fails sometimes with 403 error. If it does, simply redo the `gcloud push` that failed
8. To deploy app and serices, run `. ./deploy.sh`

You will need to wait a good 5-7 minutes after the deployments for the Ingress to be functional.


## Run demo - advanced skin
1. Find the pod external ip with `kubectl get ingress wap-ingress`
1. Visit `<ingress-ip>/advanced.html`
1. Click to deploy
1. Show nodes and pods in GUI
1. Show pod info in log pane on right side
1. Kill one pod, show it terminating and then respawning in log pane
1. Kill multiple pods and show them being replaced
1. Kill one node and show all pods on another node
1. Reinstate node and kill some nodes to show respawning on new node
1. Show yaml files, etc.

### Clean Up
1. In Cloud Shell, run . ./cleanup.sh


## Architecture
There are three Kubernetes services that make up the whole application:
1. Game
Game contains all of the front end clients for the game, both the carnival
version and the Google Cloud Next version.
1. Admin
Admin contains all of the logic for managing the whole application.  This is
the application the front end calls to get a list of the pods running the
color api, it also has calls to create and delete deployments, delete pods, and
drain and uncordon nodes.
1. Api
Api contains two service calls: color and color-complete. Color is a random
hexidecimal RGB color value. Color-complete is the same as color, but also
sends the pod name of the pod that answered the service call.
