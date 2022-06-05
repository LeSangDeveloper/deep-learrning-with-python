
#! /bin/bash

sudo apt --yes install curl git && \
echo "YOUR PRIVATE SSH KEY HERE" > ~/.ssh/id_rsa && \
chmod 600 ~/.ssh/id_rsa && \
eval `ssh-agent` && \
ssh-add ~/.ssh/id_rsa
# enter password
