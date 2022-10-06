# Docker Workshop

## Docker Image

```bash
# To show Docker Image on your machine
docker images
# To pull ubuntu image with tag latest from Docker Hub
docker pull ubuntu
# To show your newly pull ubuntu image on your machine
docker images
```

## Docker Image Name and Tag

```bash
# Pull Ubuntu 18.04
docker pull ubuntu:18.04
# To show Docker Image on your machine
docker images
# Pull Ubuntu 20.04
docker pull ubuntu:20.04
# See the Image ID
docker images
```

## Docker Container

```bash
# Run first ubuntu container
docker run ubuntu echo "Hello World"
# Run container with bash command
docker run -i -t ubuntu bash
# Below command are run inside container
whoami
hostname
cat /etc/*release*
exit
```

## Docker Container Basic Operation

```bash
# Show running containers
docker ps
# Show running and stopped containers
docker ps -a
# Run container with specify name
docker run --name ubuntu-universe ubuntu echo "Hello Universe"
docker ps -a
# Delete container by name
docker rm ubuntu-universe
docker ps -a
# Delete container by part of container id
docker rm 07f
docker ps -a
```

## Run Docker as daemon and expose port

```bash
# Run Nginx
docker run nginx:alpine
docker ps -a
# Run Nginx in background
docker run -d nginx:alpine
docker ps
# Export 8080 port from outside forward to port 80 on container
docker run -d -p 8080:80 nginx:alpine
```

* Click on icon `Web preview` and `Preview on port 8080` on the top right of Cloud Shell to access to nginx container

```bash
# What happen if try to expose same port again
docker run -d -p 8080:80 nginx:alpine
# What happen if we expose difference outside port
docker run -d -p 8888:80 nginx:alpine
# You can try Web preview again
docker ps
```

### Docker Exercise

* Try to run Apache Server on Alpine Linux and expose to port 8083

> Hint: <https://hub.docker.com> and search for apache

## Docker Utilities Commands

```bash
# Rename container name
docker rename <current contianer name> nginx
# To go inside running container
docker exec -it nginx sh
ls -l
ps -ef
exit
# Show container processes
docker top nginx
# Show logs
docker logs nginx
# Follow logs
docker logs nginx -f
# Try Web preview to see log running
# Show container resource consumes
docker stats
# Show container all metadatas
docker inspect nginx
```

* Delete all the containers

```bash
docker rm -f $(docker ps -aq)
```

## Create Dockerfile for test Service

* Create `Dockerfile` with below content

```Dockerfile
# Pull base image
FROM ruby:2.7-slim

WORKDIR /usr/src/app/

COPY src/ /usr/src/app/

EXPOSE 9080

CMD ["ruby", "test.rb", "9080"]
```

* Run below commands to build and run nginx service container

```bash
# Build Docker Image name nginx
docker build -t image_name .
# See newly build Docker Image
docker images
# Run nginx service
docker run -d --name container -p 9080:9080 image_name
docker ps -a
# Try Web Preview 

```

## Docker Registry
 ```bash
 #view current image
 docker images

 #tag docker to change name with full path
 docker tag <current image name>:<current tag> <docker hub username>/<Repo name>/<image name>:<image tag>

 #view image for sure
 docker images

 #login to docker hub
 docker login
 
 #fill username & password

 #push image to docker hub

 docker push <docker hub username>/<Repo name>/<image name>:<image tag>

 ```