#! /bin/bash

# ==== What do the script
run_script() {

  cd ./manifests

  for file in $(ls | grep namespace)
  do
    gcloud alpha container kubectl	\
      --cluster=$1  \
      --zone=$2 \
      create -f $file
  done
}

source ./kubernetes/config.cfg

run_script $kube_cluster $kube_zone
