#!/bin/bash

START="sh /home/vagrant/teamboard-start/install_and_start_client.sh"

echo '\nStart Contriboard client:'
vagrant ssh -c "${START}"
echo 'Contriboard client running...'
