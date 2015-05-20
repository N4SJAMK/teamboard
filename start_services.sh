#!/bin/bash

START="sh /home/vagrant/teamboard-start/install_and_start_services.sh"

echo '\nStart Contriboard services (API and IO):'
vagrant ssh -c "${START}"
echo 'Contriboard services running...'
