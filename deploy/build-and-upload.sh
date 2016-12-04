#!/bin/sh
set -e

APP_NAME="pathfinder-character-tool"
SW_RELEASE_BUCKET="jhg-sw-releases"
PROJECT_ROOT_DIR="${0%/*}/../"
SOURCE_DIR="${PROJECT_ROOT_DIR}app"
APP_VERSION=$(node -p -e "require('${SOURCE_DIR}/package.json').version")
ARTIFACT_FILENAME="${APP_NAME}-${APP_VERSION}.tar.gz"
ARTIFACT_PATH="${PROJECT_ROOT_DIR}${ARTIFACT_FILENAME}"
APP_S3_PATH="s3://${SW_RELEASE_BUCKET}/${APP_NAME}/${ARTIFACT_FILENAME}"

if [ ! -e "${PROJECT_ROOT_DIR}deploy/build-and-upload.sh" ]; then
  echo "Please run this script from the root of the git repo in which this script lives."
  exit 1
fi


pushd $PROJECT_ROOT_DIR
  echo "Building App"
  if [ -e "${ARTIFACT_PATH}" ]; then
    rm ${ARTIFACT_PATH}
  fi

  tar -czf ${ARTIFACT_PATH} ${SOURCE_DIR} > /dev/null

  ARTIFACT_EXISTS_AWS=$(aws s3 ls ${APP_S3_PATH})
  if [ ! -z "${ARTIFACT_EXISTS_AWS}" ]; then
    echo "This file exists in s3 already. Cancel this script with ^C within 10s or it will be overwritten."
    sleep 10
  fi
  aws s3 cp ${ARTIFACT_PATH} ${APP_S3_PATH}

popd