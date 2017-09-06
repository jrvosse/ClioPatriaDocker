#!/bin/bash
VERSION=3.1
sudo docker run \
	-v $PWD:/opt/project \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-u $( id -u $USER ):$( id -g $USER ) \
	jrvosse/cliopatria:$VERSION 
