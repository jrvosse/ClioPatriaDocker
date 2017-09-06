#!/bin/bash

sudo docker rmi jrvosse/cliopatria:3.1 
sudo docker build --tag jrvosse/cliopatria:3.1  .

