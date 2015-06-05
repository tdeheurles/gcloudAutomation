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

export CLOUDSDK_CORE_PROJECT=$kube_project
export CLOUDSDK_CONTAINER_CLUSTER=$kube_cluster
export CLOUDSDK_COMPUTE_ZONE=$kube_zone

namespace=$1
pathToManifests=../default/manifests/$2/$3_$4_$5

kubectl	\
 	--namespace=$namespace 				\
   stop -f $pathToManifests/service.json

kubectl	\
 	--namespace=$namespace 				\
   create -f $pathToManifests/service.json
