#! /bin/bash

# ==== What do the script
run_script() {

  cd ./manifests

  for file in $(ls | grep namespace)
  do
    kubectl	create -f $file
  done
}

#--zone=$2 \

source ./kubernetes/config.cfg

run_script $kube_cluster $kube_zone
