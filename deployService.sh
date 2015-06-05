#! /bin/bash

# ==== What do the script
run_script(){

  ./.prepareManifest.sh $1 $2 $3 $4 $5 $6 $7 $9 $kube_project

  ./.pushToGCE.sh $2 $3 $4 $5 $8
}



# ==== usages
control_usages() {
  if [ $# != 8 ]
  then
    echo " give :"
  	echo " 1- a service to deploy name"
  	echo " 2- a Major version"
  	echo " 3- a Minor version"
  	echo " 4- a Patch version"
  	echo " 5- a container private Port"
    echo " 6- a public Port"
    echo " 7- the Environment where to deploy"
    echo " 8- replicas quantity"
  	echo " "
    exit 1
  fi
}


# ==== run
source ./../default/kubernetes/config.cfg
control_usages $@
run_script $docker_username $1 $2 $3 $4 $5 $6 $7 $8
