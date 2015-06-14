#! /bin/bash

# ==== usages ====
display_title() {
	echo "Error on ==> Push to GCloud container registry <=="
}

display_usage() {
	echo " give :"
	echo " 1- a service to compile name"
	echo " 2- a Major version"
	echo " 3- a Minor version"
	echo " 4- a Patch version"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 4 ]
then
	display_title
	display_usage
	exit 1
fi

# import env parameters
source ./configs/config.cfg

# Push to docker
gcloud preview docker	push gcr.io/$kube_project/$1:$2.$3.$4
