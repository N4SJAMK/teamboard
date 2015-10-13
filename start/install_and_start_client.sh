#!/bin/bash

cd /home/vagrant/teamboard-client-react/ && npm install
nohup gulp &
sleep 60
