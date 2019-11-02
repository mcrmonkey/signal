#!/bin/bash

[[ ! -z "$nosandbox" ]] && SANDBOXOPT="--no-sandbox"

useradd -u ${USERID} -d /data signal

chown signal:signal /data

su signal -c "/usr/bin/signal-desktop $SANDBOXOPT"
