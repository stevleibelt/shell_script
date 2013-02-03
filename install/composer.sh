#!/bin/bash
########
# Installscript for composer
#
# @author stev leibelt
# @since 2013-02-03
########
#http://getcomposer.org/

#install
curl -s https://getcomposer.org/installer | php

sudo mkdir /usr/local/bin/composer
sudo mv composer.phar /usr/local/bin/composer

#informations
echo 'Possiblie modifications on the php.ini'
echo ''
echo 'make shure you have enabled the extension phar.so'
echo 'make shure you have added "/usr/local/bin:" to your open_basedir setting'
