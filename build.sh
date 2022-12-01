#!/bin/bash

docker build -t lbgapp .
docker push lbgapp

docker stop auto-container
docker rm autocontainer

docker run -d -p 8080:8080 --name app lbgapp