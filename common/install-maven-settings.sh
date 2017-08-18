#!/bin/sh
if [ -f /vagrant_common/maven_settings.xml ]; then
   sudo -u vagrant mkdir -p /home/vagrant/.m2
   sudo -u vagrant cp /vagrant_common/maven_settings.xml /home/vagrant/.m2/settings.xml
fi