#! /bin/bash

# ==== What do the script
run_script(){
  ./.prepareManifest.sh $1 $2 $3 $4 $5 $6 $7 $8 $9
  ./.pushToGCE.sh $1 $2 $3 $4 $5 $8
}



# ==== usages
control_usages() {
  if [ $# != 9 ]
  then
    echo " give :"
    echo " 1- a google registry name"
  	echo " 2- a service to deploy name"
  	echo " 3- a Major version"
  	echo " 4- a Minor version"
  	echo " 5- a Build version"
  	echo " 6- a container private Port"
    echo " 7- a public Port"
    echo " 8- the Environment where to deploy"
    echo " 9- replicas quantity"
  	echo " "
    exit 1
  fi
}


# ==== run
source ./configs/config.cfg
control_usages $@
run_script $1 $2 $3 $4 $5 $6 $7 $8 $9
