#!/bin/bash
echo "$@"
PORT=${PORT:-3020}

# Make sure that ClioPatria is configured in the current directory:
[ ! -x ./daemon.pl ] && /opt/ClioPatria/configure --with-localhost

# Make sure we are not running as root, run as nobody if we are root
if [[ $1 == 'daemon' ]]; then
	if [[ $EUID -ne 0 ]]; then
		./daemon.pl --no-fork --port=$PORT $@
	else
		./daemon.pl --no-fork --port=$PORT --user=nobody $@
	fi
elif [[ $1 == 'cpack' ]]; then
	./run.pl $@
else 
	echo "Fatal: $1 not implemented"
fi
