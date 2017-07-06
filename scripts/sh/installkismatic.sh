#!/bin/bash

curl -L https://github.com/apprenda/kismatic/releases/download/v1.4.0/kismatic-v1.4.0-linux-amd64.tar.gz | tar -zx
useradd -d /home/kismaticuser -m kismaticuser
echo "kismaticuser:kismaticpass" | chpasswd
echo "kismaticuser ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/kismaticuser
chmod 0440 /etc/sudoers.d/kismaticuser
ssh-keygen -t rsa -b 4096 -f kismaticuser.key -P ""
mkdir /home/kismaticuser/.ssh
cat kismaticuser.key.pub >> /home/kismaticuser/.ssh/authorized_keys
./kismatic install apply --skip-preflight
