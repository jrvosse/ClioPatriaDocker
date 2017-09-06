# ClioPatriaDocker

This is a ClioPatria image intended to run within your local project directory, which should be mounted as a volume in the docker container as /opt/project/. 

See the config.sh and run.sh scripts for examples.

## Example usage
This uses the docker image to create a new ClioPatria project:
```bash 
mkdir project
cd project
../config.sh # run docker image to configure a new ClioPatria project under your username
../run.sh    # run project cliopatria server exposed as http://localhost:3020/
```

But you can also run the config.sh script in an existing ClioPatria project dir. 
It will override your daemon.pl and run.pl scripts to match the paths of swipl and ClioPatria to those in the docker image,
but should leave the rest of your project alone.

