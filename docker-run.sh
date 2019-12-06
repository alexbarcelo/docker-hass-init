#!/bin/sh

set -e

source /config

if [ "$GIT_USE_SSH" = true ] ; then
    mkdir ~/.ssh
    # Prepare the known hosts for the given server
    ssh-keyscan -t rsa $GIT_SERVER > ~/.ssh/known_hosts

    # And put the provided keys in place
    cp /ssh_key/id_* ~/.ssh/
    chmod 600 ~/.ssh/id_*

    git clone $GIT_USER@$GIT_SERVER:$GIT_REPO.git /git
else
    git clone $GIT_URL /git
fi

# Retrieve the remote zip from the server
mc cp origin/$MC_PATH /tmp/file.zip

# Unzip in the provided path
unzip /tmp/file.zip -d /git/$MC_LOCAL_DESTINATION
