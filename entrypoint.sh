#!/bin/bash
PORT=${PORT:-3020}
[ ! -x ./daemon.pl ] && /opt/ClioPatria/configure --with-localhost
[   -x ./daemon.pl ] && ./daemon.pl --no-fork --port=$PORT $@
