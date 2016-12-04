#!/bin/bash
set -e

APP=pathfinder-character-tool
VERSION=0.0.3
APP_PATH=/opt/${APP}
START_SCRIPT_PATH=${APP_PATH}/start.sh
PUBLIC_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/public-hostname -s)
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4 -s)
KEY_NAME=$(curl http://169.254.169.254/latest/meta-data/public-keys/ -s | cut -d= -f2)
ARTIFACT_PATH=/tmp/${APP}-${VERSION}.tar.gz

mkdir /root/.aws/
echo """
[default]
output = json
region = us-west-2
""" > /root/.aws/config

install -g ubuntu -o ubuntu -d  /home/ubuntu/.aws/
echo """
[default]
output = json
region = us-west-2
""" > /home/ubuntu/.aws/config

apt-get update
apt-get install python-pip python-dev build-essential -y
pip install awscli

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

install -g ubuntu -o ubuntu -d ${APP_PATH}

aws s3 cp s3://jhg-sw-releases/${APP}/${APP}-${VERSION}.tar.gz ${ARTIFACT_PATH}
if [ ! -e "${ARTIFACT_PATH}" ]; then
    echo "Failed to download app artifact from s3://jhg-sw-releases/${APP}/${APP}-${VERSION}.jar"
    exit 1
fi

tar -zxf ${ARTIFACT_PATH} -C ${APP_PATH}
chown ubuntu:ubuntu -R ${APP_PATH}

echo """
node ${APP_PATH}/app/index.js
""" > ${START_SCRIPT_PATH}
chown ubuntu:ubuntu ${START_SCRIPT_PATH}
chmod +x ${START_SCRIPT_PATH}

echo """
description \"${APP} Service\"
author \"Jake Gaylor\"

start on runlevel [3]
stop on shutdown

expect fork

script
    ${START_SCRIPT_PATH}
    emit ${APP}_running
end script
""" > /etc/init/${APP}.conf

sudo start ${APP}

echo """
            _
           /(|
          (  :
         __\  \_______
       (____)   |
      (____)|   |
       (____).__|
        (___)__.|_____
 
"""

aws sns publish --phone-number +16626940191 --message "Ready: http://${PUBLIC_HOSTNAME}:3000"
