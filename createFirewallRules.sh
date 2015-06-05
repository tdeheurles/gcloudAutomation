#! /bin/bash

# ==== usages
control_usages() {

  if [ $# != 2 ]
  then
    echo " give :"
  	echo " - a name for the rule"
  	echo " - port to open"
  	echo " "
    exit 1
  fi
}

control_usages $@

source ./../default/kubernetes/config.cfg

gcloud compute firewall-rules create $1-$2 \
  --allow tcp:$2                \
  --target-tags k8s-$kube_cluster-node
