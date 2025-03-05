#!/bin/sh

#Change mode to be executable and run generate_cert.sh
chmod +x generate_cert.sh
./generate_cert.sh

#Build docker image in current Dockerfile
docker build -t jenkins-https .

#Run docker compose in background
docker-compose up -d
