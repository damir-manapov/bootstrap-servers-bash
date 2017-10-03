#!/usr/bin/env bash

while read p; do

    echo $p
    ssh -o StrictHostKeyChecking=no root@$p "echo main-machine-hostname: $(hostname)" < /dev/null
    ssh -o StrictHostKeyChecking=no root@$p "echo docker-machine-hostname: $(docker run --rm ubuntu hostname)" < /dev/null

done < ips.txt
