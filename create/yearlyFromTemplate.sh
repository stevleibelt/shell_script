#!/bin/bash
########
# Creates new directory with the current year by using the .template directory.
# The directory .template must be inside the current direcotry.
#
# @author stev leibelt
# @2013-02-02
########

CURRENT_DIRECTORY=$(cd $(dirname "$0"); pwd)
CURRENT_YEAR=$(date +"%Y")

if [[ -d $CURRENT_YEAR ]]; then
  echo 'Directory for current year '$CURRENT_YEAR' allready exists. Aborting creation'

  exit 1
fi

if [[ ! -d '.template' ]]; then
  echo 'Can not find template directory .template. Aborting creation'

  exit 1
fi

mkdir $CURRENT_YEAR
cd $CURRENT_DIRECTORY
cp -R .template/* $CURRENT_YEAR'/'
