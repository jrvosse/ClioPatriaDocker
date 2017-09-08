#!/bin/bash
VERSION=latest
APP=cliopatria
REPO=jrvosse
sudo docker run \
	-v $PWD:/opt/project \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-u $( id -u $USER ):$( id -g $USER ) \
	$REPO/$APP:$VERSION 
