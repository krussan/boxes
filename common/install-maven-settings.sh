#!/bin/sh
if [ -f /vagrant_common/maven_settings.xml ]; then
   if [ -d /home/vagrant/.m2 ]; then
       mkdir /home/vagrant/.m2
   fi
   
   cp /vagrant_common/maven_settings.xml /home/vagrant/.m2/settings.xml
fi