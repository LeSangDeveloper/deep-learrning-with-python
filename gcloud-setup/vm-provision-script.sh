
#! /bin/bash

sudo apt --yes install curl git && sudo apt install python3-pip &&\
pip install notebook &&\
echo "YOUR PRIVATE SSH KEY HERE" > ~/.ssh/id_rsa && \
chmod 600 ~/.ssh/id_rsa && \
eval `ssh-agent` && \
ssh-add ~/.ssh/id_rsa
# enter password

#gen SSH key pair for github
ssh-keygen -t rsa -b 4096
