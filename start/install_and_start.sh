#!/bin/bash


cd /home/vagrant/teamboard-api/ && npm install
nohup npm start &
cd ..
cd /home/vagrant/teamboard-io/ && npm install
cd .. 
nohup npm start &
cd /home/vagrant/teamboard-client-react/ && npm install
npm start &
nohup gulp &
sleep 20