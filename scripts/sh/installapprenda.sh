#!/bin/bash

cd /apprenda/repo/sys/6.8.0/System/Nodes/RPM && ls | xargs rpm -Uvh
./apprenda/apprenda-updater/bin/configure-node.sh -a /apprenda/repo/apps -s /apprenda/repo/sys