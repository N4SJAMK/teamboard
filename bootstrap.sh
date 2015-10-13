#!/bin/bash
#
# Used to 'provision' the vagrant machine. Basically is run after the machine
# is created so you don't have to worry about installing everything yourself.

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# NodeJS and other stuff required by the 'api' and 'io' to run properly,
# basically all sorts of MongoDBs, Redises etc...

curl -sL https://deb.nodesource.com/setup | sudo bash -

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

apt-get update
apt-get install -y git nodejs build-essential
apt-get install -y mongodb-org redis-server

# Build tools for development

gem install sass
npm install -g gulp bower
