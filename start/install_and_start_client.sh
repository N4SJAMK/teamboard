#!/bin/bash

cd /home/vagrant/teamboard-client-react/ && npm install
npm start &
nohup gulp &
sleep 30