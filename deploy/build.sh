#!/bin/sh
set -e


PROJECT_ROOT_DIR="${0%/*}/../"
SOURCE_DIR="${PROJECT_ROOT_DIR}app"
echo $SOURCE_DIR
if [ ! -e "${PROJECT_ROOT_DIR}deploy/build.sh" ]; then
  echo "Please run this script from the root of the git repo in which this script lives."
  exit 1
fi

pushd $PROJECT_ROOT_DIR
  echo "Building App"
  tar -czvf ${PROJECT_ROOT_DIR}/app.tar.gz ${PROJECT_ROOT_DIR}/app
popd