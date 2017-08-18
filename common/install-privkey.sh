#!/bin/sh
if [ -f /vagrant_local/id_rsa ]; then
   sudo -u vagrant mkdir -p /home/vagrant/.ssh
   sudo -u vagrant cp /vagrant_local/id_rsa /home/vagrant/.ssh/id_rsa
   chmod 600 /home/vagrant/.ssh/id_rsa
fi