#!/usr/bin/env bash

while read p; do

    echo $p

    ssh -o StrictHostKeyChecking=no root@$p "curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh"
    ssh -o StrictHostKeyChecking=no root@$p "echo main-machine-hostname: $(hostname)"
    ssh -o StrictHostKeyChecking=no root@$p "echo docker-machine-hostname: $(docker run --rm ubuntu hostname)"

done < ips.txt

