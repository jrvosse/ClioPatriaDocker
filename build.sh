#!/bin/bash
VERSION=latest
APP=cliopatria
REPO=jrvosse
sudo docker rmi $REPO/$APP:$VERSION
sudo docker build --tag $REPO/$APP:$VERSION  .
