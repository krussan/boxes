#!/bin/sh
if [ -f /vagrant_common/maven_settings.xml ]; then
   cp /vagrant_common/maven_settings.xml /home/vagrant/.m2/settings.xml
fi