#!/usr/bin/env bash
#/*
# * @Author: ThaumicMekanism [Stephan K.]
# * @Date: 2020-01-23 21:45:01
# * @Last Modified by: ThaumicMekanism [Stephan K.]
# * @Last Modified time: 2020-01-23 21:45:01
# */


EMAIL=cs61c@berkeley.edu

if [[ ! -z "$1" ]]; then
    EMAIL=$1
fi

if [[ -z "$DEPLOY_KEY" ]]; then
    DEPLOY_KEY=deploy_key
fi

ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f $DEPLOY_KEY -P ""