#!/bin/bash

START="sh /home/vagrant/stats/install_and_start.sh"

echo '\nStart Contriboard:'
vagrant ssh -c "${START}"
echo 'Contriboard runnig...'