#! /bin/bash

# ==== usages
display_usage() {
  echo " give :"
  echo " 1- yes (just a protection)"
  echo " "
}

control_usages() {
  if [[ $1 != yes ]]; then
    display_usage
    exit 1
  fi

  if [[ $# != 1 ]]; then
    display_usage
    exit 1
  fi
}

control_usages $@

source ./kubernetes/config.cfg

gcloud alpha container clusters \
  delete $kube_cluster  \
  --zone $kube_zone   \
  --quiet
