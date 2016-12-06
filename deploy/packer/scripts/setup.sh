#!/bin/sh

# install some python stuff for ssl
apt-get install libffi-dev libssl-dev python-dev python-pip build-essential -y

# Install Ansible repository.
apt-add-repository ppa:ansible/ansible

# Install Ansible.
apt-get -y update
apt-get -y install ansible