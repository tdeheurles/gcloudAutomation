#! /bin/bash
# ==== usages ====
display_title() {
	echo "Error on ==> Push to GCE <=="
}

display_usage() {
	echo " give :"
	echo " 1- service to push"
	echo " 2- a Major version"
	echo " 3- a Minor version"
	echo " 4- a Patch version"
	echo " 5- the environment"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 5 ]
then
	display_title
	display_usage
	exit 1
fi



# prepare args
source ./kubernetes/config.cfg


# Prepare env & variables
export CLOUDSDK_CORE_PROJECT=$kube_project
export CLOUDSDK_CONTAINER_CLUSTER=$kube_cluster
export CLOUDSDK_COMPUTE_ZONE=$kube_zone

namespace=$5
pathToManifests=manifests/$1/$2_$3_$4

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
