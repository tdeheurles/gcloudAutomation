#! /bin/bash
cd ..

source ./default/kubernetes/config.cfg

gcloud alpha container get-credentials --cluster=$kube_cluster --zone=$kube_zone

kubectl config use-context gke_$kube_project\_$kube_zone\_$kube_cluster
