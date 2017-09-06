# ClioPatriaDocker

This is a ClioPatria image intended to run within your local project directory, which should be mounted as a volume in the docker container as /opt/project/. 

See the config.sh and run.sh scripts for examples.

## Example usage
```bash 
mkdir project
cd project
../config.sh # run docker image to configure a new ClioPatria project under your username
../run.sh    # run project cliopatria server exposed as http://localhost:3020/
```
