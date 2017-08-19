#!/bin/sh
yum update -y --skip-broken
localectl set-keymap se
localectl set-x11-keymap se

yum install wget -y
#yum -y groups install "GNOME Desktop"

yum install -y dos2unix

dos2unix /vagrant/*.sh
dos2unix /vagrant_common/*.sh
