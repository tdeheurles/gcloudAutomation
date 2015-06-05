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

source ./../default/kubernetes/config.cfg

gcloud compute firewall-rules delete $1 \
  --quiet
