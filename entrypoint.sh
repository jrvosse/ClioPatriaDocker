#!/bin/bash
CLIOPATRIA_DIR=${CLIOPATRIA_DIR:-/opt/ClioPatria}
udaemon=daemon

init() {
	# Make sure that ClioPatria is configured in the current directory:
	[ ! -x ./daemon.pl ] && /opt/ClioPatria/configure --with-localhost
}

# `mkuser file user` creates user with the uid and gid of file.

mkuser()
{ f="$1"
  u="$2"

  groupadd "$(ls -nd "$f" | awk '{printf "-g %s\n",$4 }')" -o $u
  useradd  "$(ls -nd "$f" | awk '{printf "-u %s\n",$3 }')" -g $u -o $u
}

cp_daemon() {
	# Make sure we are not running as root, run as $udaemon if we are root
	if [[ $EUID -ne 0 ]]; then
		CMD="./daemon.pl --no-fork $@ --port=3020"
	else
		CMD="./daemon.pl --no-fork --user=$udaemon $@ --port=3020"
	fi
	echo "Running cliopatria in daemon mode, use 'docker run -it jrvosse/cliopatria run' to run in interactive mode"
	echo $CMD
	$CMD
}

# If there is a RDF-store directory, reuse it and set our user to be the
# native user of this directory.

if [ -d RDF-store ]; then
  mkuser RDF-store swish
  udaemon=swish
else
  mkdir RDF-store
  chown $udaemon.$udaemon RDF-store
fi

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
