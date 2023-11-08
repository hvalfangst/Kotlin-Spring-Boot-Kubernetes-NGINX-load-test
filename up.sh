#!/bin/sh

# Exits immediately if a command exits with a non-zero status
set -e

# Build docker image
  echo "[Building image [kotlin-spring-boot-with-exposed] from Dockerfile]"
  if ! docker build -t hardokkerdokker/hvalfangst:kotlin-spring-boot-with-exposed .; then
    echo
    echo "[Error building image 'kotlin-spring-boot-with-exposed' - Exiting script]"
    exit 1
  else
    echo -e "\n\n"
  fi

kubectl apply -f k8s/database.yml
kubectl apply -f k8s/nginx.yml
kubectl apply -f k8s/without_nginx.yml
kubectl apply -f k8s/with_nginx.yml

#
#docker-compose -f "db/cars/docker-compose.yml" up -d;
#
#mvn spring-boot:run;