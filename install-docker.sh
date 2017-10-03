#!/usr/bin/env bash

hosts=($(sh get-ips.sh))

for host in ${hosts[*]}
do
    echo "checking for host: ${host}"
    ssh -o StrictHostKeyChecking=no root@$host "curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh"
    ssh -o StrictHostKeyChecking=no root@$host "echo main-machine-hostname: $(hostname)" < /dev/null
    ssh -o StrictHostKeyChecking=no root@$host "echo docker-machine-hostname: $(docker run --rm ubuntu hostname)" < /dev/null
done
