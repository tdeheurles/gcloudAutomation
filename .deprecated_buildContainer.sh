#! /bin/bash

echo "This script is deprecated"
exit 0



display_title() {
	echo "Error on ==> Build Container <=="
}

display_usage() {
	echo "give :"
	echo " 1- a service to compile name"
	echo " 2- a Major version"
	echo " 3- a Minor version"
	echo " 4- a Patch version"
	echo " 5- a Port"
	echo " "
	echo " You need running in sudo mode"
}


# if less than two arguments supplied, display usage
if [[ $# != 5 ]]; then
	display_usage
	exit 1
fi

# import env parameters
source ./configs/config.cfg

# go to the service path
pwd
cd ./../../$1/


# prepare context
cd deployment
./prepareContainer.sh
sed "s/__PORT__/$5/g" DockerfileTemplate > ./container/Dockerfile


# build container
docker build -t gcr.io/$kube_project/$1:$2.$3.$4 ./container/.
