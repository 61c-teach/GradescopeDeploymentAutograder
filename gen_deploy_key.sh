#!/usr/bin/env bash

EMAIL=cs61c@berkeley.edu

if [[ ! -z "$1" ]]; then
    EMAIL=$1
fi

ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f deploy_key -P ""