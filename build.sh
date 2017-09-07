#!/bin/bash
VERSION=latest
sudo docker rmi jrvosse/cliopatria:$VERSION
sudo docker build --tag jrvosse/cliopatria:$VERSION  .
