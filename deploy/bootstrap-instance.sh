#!/bin/bash
set -e

APP=pathfinder-character-tool
VERSION=0.0.1
APP_PATH=/opt/${APP}
START_SCRIPT_PATH=${APP_PATH}/start.sh
PUBLIC_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/public-hostname -s)
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4 -s)
KEY_NAME=$(curl http://169.254.169.254/latest/meta-data/public-keys/ -s | cut -d= -f2)
ARTIFACT_PATH=/tmp/${APP}-${VERSION}.tar.gz

apt-get update
apt-get install python-pip python-dev build-essential -y
pip install awscli

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

install -g ubuntu -o ubuntu -d ${APP_PATH}

aws s3 cp s3://jhg-sw-releases/${APP}/${APP}-${VERSION}.tar.gz ${JAR_PATH}
if [ ! -e "${ARTIFACT_PATH}" ]; then
    echo "Failed to download app artifact from s3://jhg-sw-releases/${APP}/${APP}-${VERSION}.jar"
    exit 1
fi

tar -zxf ${APP}-${VERSION}.tar.gz -C ${APP_PATH}
chown ubuntu:ubuntu -R ${APP_PATH}

AWS_CONFIGURATION="""
[default]
output = json
region = us-west-2
"""

mkdir /root/.aws/
echo ${AWS_CONFIGURATION} > /root/.aws/config

install -g ubuntu -o ubuntu -d  /home/ubuntu/.aws/
echo ${AWS_CONFIGURATION} > /home/ubuntu/.aws/config

echo """
node ${APP_PATH}/index.js
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
Congrats. You have an app server up.

ssh ubuntu@${PUBLIC_HOSTNAME} -i ~/.ssh/KEY


1. Configure the database @ ${DB_ENDPOINT} using 
   
   psql -h ${DB_ENDPOINT} -p 5432 -U politiloc -W politiloc

2. Start the app using ${START_SCRIPT_PATH}
"""

# aws sns publish --phone-number +16626940191 --message "${PUBLIC_IP} is ready. ssh ubuntu@${PUBLIC_HOSTNAME} -i ~/.ssh/${KEY_NAME}"
