#!/bin/sh
sudo -u vagrant mkdir -p /home/vagrant/.ssh

if [ -f /vagrant_local/id_rsa ]; then   
   echo "Installing private key"

   sudo -u vagrant cp /vagrant_local/id_rsa /home/vagrant/.ssh/id_rsa
   chmod 600 /home/vagrant/.ssh/id_rsa
fi

if [ -f /vagrant_local/known_hosts ]; then
   echo "Installing known hosts"

   sudo -u vagrant cp /vagrant_local/id_rsa /home/vagrant/.ssh/known_hosts
   chmod 644 /home/vagrant/.ssh/known_hosts
fi
