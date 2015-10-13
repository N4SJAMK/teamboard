#!/bin/bash

START="sh /home/vagrant/teamboard-start/install_and_start_services.sh"

echo '\nStart Contriboard services (API, IO and IMG):'
vagrant ssh -c "${START}"
echo 'Contriboard services running...'
