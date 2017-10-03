#!/usr/bin/env bash

vpses=($(sh get-vpsids.sh))

for vps in ${vpses[*]}
do
    echo "removing vps: ${vps}"
    curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" "https://api.simplecloud.ru/v2/vps/$vps"
done