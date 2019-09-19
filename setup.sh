#!/usr/bin/env bash

export GHUSER=61c-teach
export REPO=fa19-labs-autograder
export REMOTE=git@github.com:$GHUSER/$REPO
export AGROOT=/autograder/$REPO

if [ $1 = "ag" ]; then
exit
fi

cd /autograder/source

apt-get install -y python3 python3-pip python3-dev

mkdir -p /root/.ssh
cp ssh_config /root/.ssh/config
# Make sure to include your private key here
cp deploy_key /root/.ssh/deploy_key
# To prevent host key verification errors at runtime
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clone autograder files
git clone $REMOTE $AGROOT
# Install python3 dependencies
FILE=$AGROOT/requirements.txt
if test -f "$FILE"; then
    pip3 install -r $FILE
fi
