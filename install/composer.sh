#!/bin/bash
########
# Installscript for composer
#
# @author stev leibelt
# @since 2013-02-03
########
#http://getcomposer.org/

echo 'make sure you have added the path /usr/bin/composer to the open_basedir path in php.ini'
echo 'make sure you have enabled extnsion phar.so in php.ini'

#install
echo 'creating directory /usr/bin/composer'
sudo mkdir /usr/bin/composer
sudo cd /usr/bin/composer
echo 'downloading and installing composer'
curl -s https://getcomposer.org/installer | php
sudo chmod +x composer.phar
echo 'done'
