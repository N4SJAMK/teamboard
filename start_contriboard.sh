#!/bin/bash

START="sh /home/vagrant/teamboard-start/install_and_start.sh"

echo '\nStart Contriboard:'
vagrant ssh -c "${START}"
echo 'Contriboard running...'
