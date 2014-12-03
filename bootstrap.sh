#!/bin/bash

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

curl -sL https://deb.nodesource.com/setup | sudo bash -

apt-get update
apt-get install -y git nodejs build-essential
apt-get install -y mongodb-server redis-server

gem install sass

npm install -g gulp bower
