#!/bin/sh
####
# Prepares debian to handle ruby gems and installs zendesk_app_tools
#
# @author artodeto
# @since 2013-03-22
####

sudo apt-get update
sudo apt-get install ruby1.8-dev libzlib-ruby libyaml-ruby rubygems
sudo gem install rubygems-update
sudo gem install zendesk_apps_tools
sudo echo "PATH=/var/lib/gems/1.8/bin:$PATH" > /etc/profile.d/rubygems1.8.sh 
sudo ln -s /var/lib/gems/1.8/gems/zendesk_apps_tools-1.0.1/bin/zat /usr/bin/zat
