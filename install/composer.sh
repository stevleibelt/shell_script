#!/bin/bash
########
# Installscript for composer
#
# @author stev leibelt
# @since 2013-02-03
########
#http://getcomposer.org/

echo 'make sure you have added the path /usr/bin/local/composer/ to the open_basedir path in php.ini'
echo 'make sure you have enabled extnsion phar.so in php.ini'

#install
echo 'creating directory /usr/local/bin/composer'
sudo mkdir /usr/local/bin/composer
cd /usr/local/bin/composer
echo 'downloading and installing composer'
sudo curl -s https://getcomposer.org/installer | php
sudo chmod +x composer.phar
cd /usr/bin
sudo ln -s /usr/local/bin/composer/composer.phar composer
echo 'done'
