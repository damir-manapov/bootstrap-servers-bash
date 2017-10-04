#!/usr/bin/env bash

hosts=($(sh $(dirname "$0")/get-ips.sh))

for host in ${hosts[*]}
do
    echo "checking for host: ${host}"
    ssh -o StrictHostKeyChecking=no root@$host "curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh"
    ssh -o StrictHostKeyChecking=no root@$host "echo main-machine-hostname: $(hostname)" < /dev/null
    ssh -o StrictHostKeyChecking=no root@$host "docker run --rm -d --name dummy-service manapov/dummy-service" < /dev/null
done
