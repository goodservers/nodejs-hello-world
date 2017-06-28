#!/bin/sh

# pull from repository
RUN_DIR="/app"

if [ -d "$RUN_DIR/.git" ]; then
    echo "Pulling from git repository"
    cd $RUN_DIR
    git pull
else
    mkdir $RUN_DIR
    cd $RUN_DIR
    git clone ssh://git@github.com:goodservers/nodejs-hello-world.git .
fi

# install dependencies
yarn install

# run app
yarn run app
