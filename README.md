# Whack-a-pod
This is a demo that can be used to show how resilient services running on Kubernetes can be.

Use either the version available at /next.html, or the more advanced version at /advanced.html.


## Getting Started

1. Create Project in Cloud Console
1. Open Cloud Shell
1. Clone this repo `git clone /https://github.com/roitraining/whack_a_pod`
1. Change directories into repo `cd whack_a_pod`
1. To enable services and set variables, run `. ./env.sh`
1. To create the GKE cluster, run `. ./cluster.sh`
1. To build the images, run `. ./images.sh`
1. To deploy app and serices, run `. ./deploy.sh`

You will need to wait a good 5-7 minutes after the deployments for the Ingress to be functional.


## Run demo
There are two skins to the game.
1. Visit <ingress-ip>/advanced.html
2. Show nodes and pods in GUI
3. Show pod info in log pane on right side
4. Kill one pod, show it terminating and then respawning in log pane
5. Play around and make your points

### Clean Up
1. Open a terminal in `/`.
1. Run `make clean`
1. Open a terminal in `/infrastructure/`.
1. Run `make clean`


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
