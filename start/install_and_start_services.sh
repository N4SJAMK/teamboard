#!/bin/bash


cd /home/vagrant/teamboard-api/ && npm install
nohup npm start &
sleep 5
cd ..
cd /home/vagrant/teamboard-io/ && npm install
nohup npm start &
sleep 5
cd ..
cd /home/vagrant/teamboard-img/ && npm install
nohup npm start &
sleep 5
