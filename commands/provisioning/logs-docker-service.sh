#!/usr/bin/env bash

hosts=($(sh $(dirname "$0")/get-ips.sh))

for host in ${hosts[*]}
do
    echo "running docker service on host: ${host}"
    ssh -o StrictHostKeyChecking=no root@$host "docker logs --tail 5 dummy-service" < /dev/null
done