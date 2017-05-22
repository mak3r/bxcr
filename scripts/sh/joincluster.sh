#!/bin/bash

OUT="$(curl -X POST -k -s --header "Content-type: application/json" -d '{"username":"bxcr@apprenda.com","password":"password"}' https://apps.apprenda.bxcr/authentication/api/v1/sessions/soc | jq '.apprendaSessionToken')"
temp="${OUT%\"}"
temp="${temp#\"}"
TOKEN="ApprendaSessionToken: ${temp}"
echo "Attempting to join cluster to ACP grid..."
curl -X POST -k -s --header "Content-type: application/json" \
 --header "${TOKEN}" \
 -d '{"name": "bxcrk8s", "url": "https://apprk8s:6443/", "cloudid": 1, "username": "admin", "password": "bxcrk8spass", "gatewayhostnames": "apprk8s"}' \
 https://apps.apprenda.bxcr/soc/api/v1/clusters | jq .