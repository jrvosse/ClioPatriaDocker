#!/bin/bash
CLIOPATRIA_DIR=${CLIOPATRIA_DIR:-/opt/ClioPatria}

init() {
	# Make sure that ClioPatria is configured in the current directory:
	[ ! -x ./daemon.pl ] && /opt/ClioPatria/configure --with-localhost
}

cp_daemon() {
	# Make sure we are not running as root, run as nobody if we are root
	if [[ $EUID -ne 0 ]]; then
		CMD="./daemon.pl --no-fork $@ --port=3020"
	else
		CMD="./daemon.pl --no-fork --user=nobody $@ --port=3020"
	fi
	echo "Running cliopatria in daemon mode, use 'docker run -it jrvosse/cliopatria run' to run in interactive mode"
	echo $CMD
	$CMD
}

case "$1" in
	daemon)	init
		shift
		cp_daemon $@
		;;
	rdf_load)
		init
		shift
		./run.pl $@
		cp_daemon
		;;
	cpack) 	init
		./run.pl $@
		cp_daemon
		;;
	run)	init
		shift
		./run.pl $@
		;;
	bash)	shift
		bash $@
		;;
	*)	echo "Fatal: $1 not implemented";
		exit 1;
		;;
esac
