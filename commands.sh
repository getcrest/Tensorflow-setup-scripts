#!/usr/bin/env bash

# To stop all containers
sudo docker stop $(sudo docker ps -aq)

# To remove all containers
sudo docker rm $(sudo docker ps -aq)

# To remove a docker image
sudo docker rmi your-docker-image

# To create a docker image using the Dockerfile(Path of the Dockerfile)
sudo docker build -t new-docker-image:tag docker-file-path

# To run a docker image as a container
sudo docker run docker-image-name:tag


