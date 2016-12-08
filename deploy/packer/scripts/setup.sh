#!/bin/sh

apt-get -y update

# Install Ansible repository and some python stuff for ssl.
apt-get -y install software-properties-common

apt-add-repository ppa:ansible/ansible

# Install Ansible.
apt-get -y update
apt-get -y install ansible
