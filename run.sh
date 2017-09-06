#!/bin/bash

sudo docker run -v $PWD:/opt/project -p 3020:3020 -it jrvosse/cliopatria:3.1  ./run.pl

