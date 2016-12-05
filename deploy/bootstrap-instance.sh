#!/bin/bash
set -e

# ubuntu 14's ssl something or another needs upgrading to work with the ansible provisioner
# http://stackoverflow.com/questions/29134512/insecureplatformwarning-a-true-sslcontext-object-is-not-available-this-prevent
apt-get install libffi-dev libssl-dev python-dev build-essential -y
