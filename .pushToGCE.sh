#! /bin/bash
# ==== usages ====
display_title() {
	echo "Error on ==> Push to GCE <=="
}

display_usage() {
	echo " give :"
	echo " 1- registry of container"
	echo " 2- service to push"
	echo " 3- a Major version"
	echo " 4- a Minor version"
	echo " 5- a Patch version"
	echo " 6- the environment"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 6 ]
then
	display_title
	display_usage
	exit 1
fi



# prepare args
source ./../default/kubernetes/config.cfg


# Prepare env & variables
export CLOUDSDK_CORE_PROJECT=$kube_project
export CLOUDSDK_CONTAINER_CLUSTER=$kube_cluster
export CLOUDSDK_COMPUTE_ZONE=$kube_zone

namespace=$6
pathToManifests=./../default/manifests/$1/$2/$3_$4_$5

# Do the work
# == RC
kubectl	\
	--namespace=$namespace        \
	stop -f $pathToManifests/replicationController.json

kubectl	\
	--namespace=$namespace        \
  create -f $pathToManifests/replicationController.json


# == SERVICE
kubectl	\
 	--namespace=$namespace 				\
   stop -f $pathToManifests/service.json

kubectl	\
 	--namespace=$namespace 				\
   create -f $pathToManifests/service.json
