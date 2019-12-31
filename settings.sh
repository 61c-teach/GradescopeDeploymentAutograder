#!/usr/bin/env bash

export REPOHOST=github.com
export REPOUSER=git
export REMOTEURL=$REPOUSER@$REPOHOST
export GHUSER=61c-teach
export REPO=GradescopeBaseAG.git
export BRANCH=master

export REMOTE=$REMOTEURL:$GHUSER/$REPO

export AGROOT=/autograder/source


export KEY_STORE=/root/.ssh/keys
export DEPLOY_KEY=deploy_key
