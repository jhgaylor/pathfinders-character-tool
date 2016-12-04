#!/bin/sh
set -e

APP_NAME="pathfinder-character-tool"
PROJECT_ROOT_DIR="${0%/*}/../"
SOURCE_DIR="${PROJECT_ROOT_DIR}app"
APP_VERSION=$(node -p -e "require('${SOURCE_DIR}/package.json').version")
ARTIFACT_PATH="${PROJECT_ROOT_DIR}${APP_NAME}-${APP_VERSION}.tar.gz"
echo $ARTIFACT_PATH

if [ ! -e "${PROJECT_ROOT_DIR}deploy/build-and-upload.sh" ]; then
  echo "Please run this script from the root of the git repo in which this script lives."
  exit 1
fi




pushd $PROJECT_ROOT_DIR

  

  echo "Building App"
  if [ -e "${ARTIFACT_PATH}" ]; then
    rm ${ARTIFACT_PATH}
  fi

  tar -czvf ${ARTIFACT_PATH} ${SOURCE_DIR}

  aws s3

popd