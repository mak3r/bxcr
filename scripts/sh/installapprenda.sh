#!/bin/bash

cd /apprenda/repo/sys/6.8.0/System/Nodes/RPM && ls | xargs rpm -Uvh
/apprenda/apprenda-updater/bin/configure-node.sh -a /apprenda/repo/apps -s /apprenda/repo/sys -h apprlin

echo "Waiting 60 seconds for services to come online..."
sleep 60
OUT="$(curl -X POST -k -s --header "Content-type: application/json" -d '{"username":"bxcr@apprenda.com","password":"password"}' https://apps.apprenda.bxcr/authentication/api/v1/sessions/soc | jq '.apprendaSessionToken')"
temp="${OUT%\"}"
temp="${temp#\"}"
TOKEN="ApprendaSessionToken: ${temp}"
curl -X PUT -k -s --header "Content-type: application/json" --header "${TOKEN}" -d '{"transitionReason": "onlining new linux node", "state": "Online"}' https://apps.apprenda.bxcr/soc/api/v1/nodes/Linux/roleState?nodeName=apprlin
echo "Done"