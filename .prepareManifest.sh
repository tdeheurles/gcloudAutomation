#! /bin/bash
display_title() {
	echo "Error on ==> Prepare Manifest <=="
}

display_usage() {
	echo "give :"
	echo " 1- docker username"
	echo " 2- a service to compile name"
	echo " 3- Major version"
	echo " 4- Major version"
	echo " 5- Major version"
	echo " 6- a container Port"
	echo " 7- a public Port"
	echo " 8- replicas quantity"
	echo " 9- project name"
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
manifestpath=./../default/manifests
directory=$2/$3_$4_$5
mkdir -p manifestpath/$2
mkdir -p manifestpath/$directory


# parse manifests
templates=(replicationController.json service.json)
for template in ${templates[*]}
do
	pathToOutput=$manifestpath/$directory/$template
	sed "s/__USERNAME__/$1/g" 							./templates/$template > $pathToOutput
	sed -i "s/__SERVICE__/$2/g" 						$pathToOutput
	sed -i "s/__MAJOR__/$3/g" 							$pathToOutput
	sed -i "s/__MINOR__/$4/g" 							$pathToOutput
	sed -i "s/__PATCH__/$5/g" 							$pathToOutput
	sed -i "s/__VERSION__/$3.$4.$5/g" 			$pathToOutput
	sed -i "s/__PRIVATE-PORT__/$6/g" 				$pathToOutput
	sed -i "s/__PUBLIC-PORT__/$7/g" 				$pathToOutput
	sed -i "s/__REPLICAS__/$8/g" 						$pathToOutput
	sed -i "s/__PROJECT__/$9/g" 						$pathToOutput
done
