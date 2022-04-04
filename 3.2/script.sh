#!/bin/bash

REPO_URL=$1
IMAGE_NAME=$2
DOCKER_HUB_URL=$3
DOCKER_USERNAME=$4
DOCKER_ACCESS_TOKEN=$5

if [ -z $REPO_URL ]
then
  echo "Expected github repo url as parameter #1"
  exit 1
fi

if [ -z $IMAGE_NAME ]
then
  echo "Expected image name as parameter #2"
  exit 1
fi

if [ -z $DOCKER_HUB_URL ]
then
  echo "Expected docker hub url as parameter #3"
  exit 1
fi

if [ -z $DOCKER_USERNAME ]
then
  echo "Expected username as parameter #4"
  exit 1
fi

if [ -z $DOCKER_ACCESS_TOKEN ]
then
  echo "Expected access token as parameter #5"
  exit 1
fi

git clone $REPO_URL repo
docker build ./repo -t $IMAGE_NAME
docker tag $IMAGE_NAME $DOCKER_HUB_URL
docker login -u $DOCKER_USERNAME -p $DOCKER_ACCESS_TOKEN
docker push $DOCKER_HUB_URL
