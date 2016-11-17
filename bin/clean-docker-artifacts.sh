#!/usr/bin/env bash

echo "Cleaning stopped docker containers"
docker rm $(docker ps -a -q)

echo "Cleaning dangling docker images"
docker rmi -f $(docker images -q -a -f dangling=true)
