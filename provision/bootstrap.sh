#!/bin/bash

set -e

## Install Ansible via official PPA
## See http://docs.ansible.com/intro_installation.html for more info

sudo apt-get update
sudo apt-get install -y python-software-properties
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
