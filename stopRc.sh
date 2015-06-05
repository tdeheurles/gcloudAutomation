#! /bin/bash

display_usage() {
	echo "give :"
	echo " 1- environment. Could give all for every namespaces"
	echo " 2- service"
  echo " 3- Major version"
	echo " 4- Minor version"
	echo " 5- Patch version"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 5 ]
then
	display_usage
	exit 1
fi

source ./../default/kubernetes/config.cfg


kubectl  \
  --namespace=$1                \
  stop -f ./../default/manifests/$2/$3_$4_$5/replicationController.json
