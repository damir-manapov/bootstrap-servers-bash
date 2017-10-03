#!/usr/bin/env bash

curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" "https://api.simplecloud.ru/v2/vps" | jq -r '.vps | map("\(.id)") | .[]'
