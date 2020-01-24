#!/usr/bin/env bash
#/*
# * @Author: ThaumicMekanism [Stephan K.]
# * @Date: 2020-01-23 21:45:01
# * @Last Modified by: ThaumicMekanism [Stephan K.]
# * @Last Modified time: 2020-01-23 21:45:01
# */


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
