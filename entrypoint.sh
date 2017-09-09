#!/bin/bash
echo "Configure/run cliopatria in $PWD"
[ ! -x ./run.pl ] && /opt/ClioPatria/configure --with-localhost
[   -x ./run.pl ] && ./run.pl $@
