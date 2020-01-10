#!/usr/bin/env bash

ZIP_NAME=GDA.zip

if [[ ! -z "$1" ]]; then
    ZIP_NAME=$1
fi

zip $ZIP_NAME * -x $ZIP_NAME