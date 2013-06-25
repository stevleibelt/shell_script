#!/bin/bash
########
# update script for phpstorm
#
# @author stev leibelt
# @since 2013-06-25
########

TODAY=$(date +'%y_%m_%d')
BACKUPNAME='phpstorm_'$TODAY'.tar.gz'

if [[ $# -eq 2 ]]; then
    PHPSTORM="$1"
    GROUPNAME="$2"
else
    echo 'No valid arguments supplied.'
    echo 'script $pathToPhpStorm*.tar.gz $groupName'
    return 1
fi

echo 'creating backup "'$BACKUPNAME'"'
tar --ignore-failed-read -zcf $BACKUPNAME /opt/phpstorm

echo 'removing old installation'
sudo rm -fr /opt/phpstorm

echo 'updating to new installation'
#@TODO - here it starts with the problem, the provided archive always as another directory inside
# we have to figure out that name or prevent tar from creating this archve
sudo mkdir /opt/phpstorm
sudo tar -zxf "$PHPSTORM" -C /opt/phpstorm

echo 'setting rights'
sudo chgrp -R "$GROUPNAME" /opt/phpstorm/
sudo chmod -R 770 /opt/phpstorm/

echo 'done'
