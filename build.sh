#!/bin/bash
VERSION=latest
APP=cliopatria
REPO=jrvosse
SUDO=
$SUDO docker build --tag $REPO/$APP:$VERSION  .
