#!/bin/bash
docker stop auto-container
docker rm auto-container
docker build -t lbgapp .
docker push lbgapp

docker stop app
docker rm app

docker run -d -p 8080:8080 --name app lbgapp