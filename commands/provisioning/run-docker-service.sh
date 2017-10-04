#!/usr/bin/env bash

hosts=($(sh $(dirname "$0")/get-ips.sh))

for host in ${hosts[*]}
do
    echo "running docker service on host: ${host}"
    ssh -o StrictHostKeyChecking=no root@$host "docker pull manapov/dummy-service" < /dev/null
    ssh -o StrictHostKeyChecking=no root@$host "docker run --rm -d --name dummy-service manapov/dummy-service" < /dev/null
done