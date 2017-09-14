#!/bin/bash
PORT=${PORT:-3020}
echo "$@"

init() {
	# Make sure that ClioPatria is configured in the current directory:
	[ ! -x ./daemon.pl ] && /opt/ClioPatria/configure --with-localhost
}

cp_daemon() {
	# Make sure we are not running as root, run as nobody if we are root
	if [[ $EUID -ne 0 ]]; then
		./daemon.pl --no-fork --port=$PORT $@
	else
		./daemon.pl --no-fork --port=$PORT --user=nobody $@
	fi
}

init
case "$1" in
	daemon)	cp_daemon
		;;
	rdf_load)
		shift
		./run.pl $@
		cp_daemon
		;;
	cpack) 	./run.pl $@
		cp_daemon
		;;
	*)	echo "Fatal: $1 not implemented";
		exit 1;
		;;
esac
