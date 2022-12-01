#!/bin/bash

docker build -t lbgapp .
docker push lbgapp


docker run -d -p 8080:8080 --name auto-container lbgapp