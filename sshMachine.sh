#! /bin/bash
display_usage() {
	echo "give :"
	echo " 1- name of the node"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 1 ]
then
	display_usage
	exit 1
fi

source ./configs/config.cfg

echo " "
echo "Now you can :"
echo "    $ sudo docker ps"
echo "  find the CONTAINER ID (on left)"
echo " type this command with the 3/4 first caracters of the CONTAINER ID"
echo "    $ sudo docker exec -i -t 3_4firstChar /bin/bash"
echo " "
echo " "

gcloud compute ssh \
	$1 \
	--zone=$kube_zone
