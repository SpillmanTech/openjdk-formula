#!/bin/bash

if [ "$(ls /vagrant)" ]
then
    SRCDIR=/vagrant
else
    SRCDIR=/home/vagrant/sync
fi
sudo mkdir -p /srv/salt
sudo mkdir -p /srv/pillar
sudo mkdir -p /srv/formulas
sudo mkdir -p /var/cache/salt/master
sudo cp $SRCDIR/salt-top.example /srv/salt/top.sls
