#!/bin/sh
if [ -f maven_settings.xml ]; then
   cp maven_settings.xml /home/vagrant/.m2/settings.xml
fi