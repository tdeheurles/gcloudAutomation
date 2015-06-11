#! /bin/bash

display_usage() {
	echo "give :"
	echo " 1- environment. Could give all for every namespaces"
	echo " 2- google container registry"
	echo " 3- service"
  echo " 4- Major version"
	echo " 5- Minor version"
	echo " 6- Patch version"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 6 ]
then
	display_usage
	exit 1
fi

source ./../default/kubernetes/config.cfg


kubectl  \
  --namespace=$1                \
  stop -f ./../default/manifests/$2/$3/$4_$5_$6/service.json
