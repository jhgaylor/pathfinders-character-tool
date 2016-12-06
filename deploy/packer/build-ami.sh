#!/bin/sh
APP_VERSION=$(node -p -e "require('../../app/package.json').version")
packer build -var "app_version=${APP_VERSION}" app.json