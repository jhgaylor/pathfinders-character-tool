#!/bin/sh
API_VERSION=$(node -p -e "require('../../api-app/package.json').version")
UI_VERSION=$(node -p -e "require('../../ui-app/package.json').version")
packer build -var "api_version=${API_VERSION}" -var "ui_version=${UI_VERSION}" app.json