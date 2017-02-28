#!/bin/bash

KEY=$1
BAST=$2
USER=$3

for ARG in ${@:4}
do
    echo ${ARG}
    PORT=$(unused_port.sh)
    IP=${ARG}

    ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ubuntu@${BAST} -i ${KEY} -p 22 -NMS ~/.ssh/${PORT} -f -C -L ${PORT}:${IP}:22

    ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ${KEY} ${USER}@localhost -p ${PORT} < dps.sh
done
