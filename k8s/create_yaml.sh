#!/bin/bash

if [[ -z "$1" ]]
then
	echo "Please set argument REGISTRY_NS (Harbor Project)"
	echo "USAGE > ./create_yaml.sh REGISTRY_NS RELEASE_NAME"
	echo "e.g) ./create_yaml.sh group01 demo-kb01"
  exit
fi

if [[ -z "$2" ]]
then
	echo "Please set argument RELEASE_NAME"
	echo "USAGE > ./create_yaml.sh REGISTRY_NS RELEASE_NAME"
	echo "e.g) ./create_yaml.sh group01 demo-kb01"
  exit
fi

IMAGE_REG_PATH="harbor.gaeco.net\\/${1}\\/${2}:0.1.1"
#echo $IMAGE_REG_PATH
# create deployment.yaml
cat ./deployment.template.yaml | sed "s/{{RELEASE_NAME}}/${2}/g" | sed "s/{{IMAGE_REG_PATH}}/${IMAGE_REG_PATH}/g" > deployment-${2}.yaml
# create service.yaml
cat ./service.template.yaml | sed "s/{{RELEASE_NAME}}/${2}/g" > service-${2}.yaml
# create ingress.yaml
cat ./ingress.template.yaml | sed "s/{{RELEASE_NAME}}/${2}/g" > ingress-${2}.yaml
