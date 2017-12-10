#!/bin/sh
CERTS_FILE=/usr/lib/jvm/jre/lib/security/cacerts
PYDEV_CERTS_URL=http://pydev.org/pydev_certificate.cer

echo Adding pydev_certificate.cer to $CERTS_FILE

wget $PYDEV_CERTS_URL
yes | keytool -import -file ./pydev_certificate.cer -keystore $CERTS_FILE -storepass changeit

echo 
echo Certificate installed
echo 

eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/oxygen/,http://pydev.org/updates/ -installIU org.python.pydev.feature.feature.group

yum install epel-release -y
yum install python-pip -y