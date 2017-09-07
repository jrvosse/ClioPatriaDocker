# ClioPatriaDocker

This builds a ClioPatria docker image intended to run within your local project directory. 
Your project dir should be mounted as a volume in the docker container as /opt/project/. 

See the config.sh and run.sh scripts for examples.

## Example usage
This uses the docker image to create a new ClioPatria project:
```bash 
mkdir project
cd project
../config.sh # run docker image to configure a new ClioPatria project under your username
../run.sh    # run project cliopatria server exposed as http://localhost:3020/
```

You can also run the config.sh script in an existing ClioPatria project dir.  It will override your daemon.pl and run.pl scripts to match the paths of swipl and ClioPatria to those in the docker image, but should leave the rest of your project alone.

## Docker repo
This repo is the source repo for the docker image jrvosse/cliopatria:
```bash
docker pull jrvosse/cliopatria
```

See also https://hub.docker.com/r/jrvosse/cliopatria/ .

## Details
The image is based on the standard swipl image, to which the git and wget packages are added, and the ClioPatria tarball is extracted in /opt/ClioPatria.

The default CMD is to run /opt/ClioPatria/configure --with-localhost in /opt/project
