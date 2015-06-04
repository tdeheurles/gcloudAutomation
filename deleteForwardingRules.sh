#! /bin/bash

# ==== usages
control_usages() {
  if [ $# != 1 ]
  then
    echo " give :"
  	echo " 1- the name of the rule"
  	echo " "
    exit 1
  fi
}

control_usages $@

source ./kubernetes/config.cfg

#TODO: find a better way
if [[ $kube_zone == *"europe-west1"* ]]; then
  export region=--region=europe-west1
fi
if [[ $kube_zone == *"asia-east1"* ]]; then
  region=--region=asia-east1
fi
if [[ $kube_zone == *"us-central1"* ]]; then
  region=--region=us-central1
fi

gcloud compute forwarding-rules delete $1 \
  $region \
  --quiet
