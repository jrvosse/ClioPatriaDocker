#!/bin/bash
VERSION=3.1
RUN=${1-./run.pl}
sudo docker run \
	-v $PWD:/opt/project \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-u $( id -u $USER ):$( id -g $USER ) \
	-p 3020:3020 -it  \
	jrvosse/cliopatria:$VERSION $RUN
