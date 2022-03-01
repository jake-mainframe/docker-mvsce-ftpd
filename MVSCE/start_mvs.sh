#!/bin/bash
socat -v TCP4-LISTEN:21021,reuseaddr,fork tcp4:127.0.0.1:2121 &
hercules -f conf/local.cnf -r conf/mvsce.rc
