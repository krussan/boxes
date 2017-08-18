#!/bin/sh
if [ -f /vagrant_local/id_rsa ]; then
   cp /vagrant_local/id_rsa /home/vagrant/.ssh/id_rsa
fi