#!/usr/bin/env bash

export REPOHOST=github.com
export REPOUSER=git
export REMOTEURL=$REPOUSER@$REPOHOST
export GHUSER=61c-teach
export REPO=fa19-lab-autograder.git
export BRANCH=lab05

export REMOTE=$REMOTEURL:$GHUSER/$REPO

export AGROOT=/autograder/root


export KEY_STORE=/root/.ssh/keys
export DEPLOY_KEY=deploy_key
