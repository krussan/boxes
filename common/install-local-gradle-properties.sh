#!/bin/sh
if [ -f /vagrant_local/gradle.properties ]; then
   sudo -u vagrant mkdir -p /home/vagrant/.gradle
   sudo -u vagrant cp /vagrant_local/gradle.properties /home/vagrant/.gradle
fi