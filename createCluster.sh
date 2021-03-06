#! /bin/bash

main() {
  gcloud alpha container clusters	\
    --project $1                  \
    --zone $2                     \
    create $3                     \
    --num-nodes $4                \
    --machine-type $5
}


# ==== run
source ./configs/config.cfg
main \
  $kube_project \
  $kube_zone \
  $kube_cluster \
  $kube_num_nodes \
  $kube_machinetype
