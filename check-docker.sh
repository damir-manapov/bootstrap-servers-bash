#!/usr/bin/env bash

hosts=($(sh get-ips.sh))

for host in ${hosts[*]}
do
    echo "checking for host: ${host}"
    ssh -o StrictHostKeyChecking=no root@$host "echo main-machine-hostname: $(hostname)" < /dev/null
    ssh -o StrictHostKeyChecking=no root@$host "echo docker-machine-hostname: $(docker run --rm debian hostname)" < /dev/null
done