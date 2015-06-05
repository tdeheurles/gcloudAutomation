#! /bin/bash
display_usage() {
	echo "give :"
	echo " 1- node number or master"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 1 ]
then
	display_usage
	exit 1
fi

source ./../default/kubernetes/config.cfg

echo " "
echo "Now you can :"
echo "    $ sudo docker ps"
echo "  find the CONTAINER ID (on left)"
echo " type this command with the 3/4 first caracters of the CONTAINER ID"
echo "    $ sudo docker exec -i -t 3_4firstChar /bin/bash"
echo " "
echo " "

if [[ $1 == master ]]; then
	gcloud compute ssh \
	  k8s-$kube_cluster-master \
	  --zone=$kube_zone
else
	gcloud compute ssh \
	  k8s-$kube_cluster-node-$1 \
	  --zone=$kube_zone
fi
