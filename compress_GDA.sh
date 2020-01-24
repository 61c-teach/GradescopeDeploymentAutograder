#!/usr/bin/env bash
#/*
# * @Author: ThaumicMekanism [Stephan K.]
# * @Date: 2020-01-23 21:45:01
# * @Last Modified by: ThaumicMekanism [Stephan K.]
# * @Last Modified time: 2020-01-23 21:45:01
# */

ZIP_NAME=GDA.zip

if [[ ! -z "$1" ]]; then
    ZIP_NAME=$1
fi

zip $ZIP_NAME * -x $ZIP_NAME