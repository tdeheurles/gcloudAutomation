#! /bin/bash

# ==== What do the script
run_script() {

  cd ./../default/manifests

  for file in $(ls | grep namespace)
  do
    kubectl	\
      --kubeconfig=$kubeconfig  \
      create -f $file
  done
}

#--zone=$2 \

source ./configs/config.cfg

run_script $kube_cluster $kube_zone
