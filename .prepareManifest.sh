#! /bin/bash
display_title() {
	echo "Error on ==> Prepare Manifest <=="
}

display_usage() {
	echo "give :"
	echo " 1- a google registry name"
	echo " 2- a service to deploy name"
	echo " 3- a Major version"
	echo " 4- a Minor version"
	echo " 5- a Build version"
	echo " 6- a container private Port"
	echo " 7- a public Port"
	echo " 8- the Environment where to deploy"
	echo " 9- replicas quantity"
	echo " "
}

# if less than two arguments supplied, display usage
if [ $# != 9 ]
then
	display_title
	display_usage
	exit 1
fi


# making file directory
manifestpath=./manifests
directory=$1/$2/$3_$4_$5
mkdir -p $manifestpath/$1
mkdir -p $manifestpath/$1/$2
mkdir -p $manifestpath/$directory


# parse manifests
templates=(replicationController.json service.json)
for template in ${templates[*]}
do
	pathToOutput=$manifestpath/$directory/$template
	sed "s/__REGISTRY__/$1/g" 							./templates/$template > $pathToOutput
	sed -i "s/__SERVICE__/$2/g" 						$pathToOutput
	sed -i "s/__MAJOR__/$3/g" 							$pathToOutput
	sed -i "s/__MINOR__/$4/g" 							$pathToOutput
	sed -i "s/__BUILD__/$5/g" 							$pathToOutput
	sed -i "s/__VERSION__/$3.$4.$5/g" 			$pathToOutput
	sed -i "s/__PRIVATE-PORT__/$6/g" 				$pathToOutput
	sed -i "s/__PUBLIC-PORT__/$7/g" 				$pathToOutput
	sed -i "s/__REPLICAS__/$9/g" 						$pathToOutput
done
