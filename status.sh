#! /bin/bash

display_usage() {
	echo "give :"
	echo " 1- environment. Could give default for the default namespace"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 1 ]
then
	display_usage
	exit 1
fi

source ./../default/kubernetes/config.cfg

export CLOUDSDK_CORE_PROJECT=$kube_project
export CLOUDSDK_CONTAINER_CLUSTER=$kube_cluster
export CLOUDSDK_COMPUTE_ZONE=$kube_zone

print_title(){
	echo -e "\e[92m============== $1 =================\e[39m"
}

if [[ $1 != default ]]; then
	param="--namespace=$1"
fi

clear

echo -e "\e[94m === NAMESPACE\e[39m"
echo -e "\e[94m ====== $1\e[39m"

print_title SERVICE
kubectl $param get service

print_title RC
kubectl $param get rc

print_title PODS
kubectl $param get pods

print_title NAMESPACES
kubectl $param get namespaces

print_title FIREWALL-RULES
gcloud compute firewall-rules list

print_title FORWARDING-RULES
gcloud compute forwarding-rules list

echo " "
echo " "
