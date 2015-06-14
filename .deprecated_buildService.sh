#! /bin/bash

# ==== functions ====
control_usages() {

  if [ $# != 5 ]
  then
    echo " give :"
  	echo " - a service to compile name"
  	echo " - a Major version"
  	echo " - a Minor version"
    echo " - a Patch version"
  	echo " - a container Port"
  	echo " "
    exit 1
  fi
}

run_script(){
  ./.buildContainer.sh $1 $2 $3 $4 $5

  ./.pushToGcloudContainerRegistry.sh $1 $2 $3 $4
}


# ==== main ====
control_usages $@
source ./configs/config.cfg
run_script $1 $2 $3 $4 $5
