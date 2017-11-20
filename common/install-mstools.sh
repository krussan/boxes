#!/bin/sh
curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo
ACCEPT_EULA=Y yum install mssql-tools unixODBC-devel -y

if [ ! -f /usr/local/bin/sqlcmd ]; then
    ln -s /opt/mssql-tools/bin/sqlcmd /usr/local/bin/sqlcmd
fi

if [ ! -f /usr/local/bin/bcp ]; then
    ln -s /opt/mssql-tools/bin/bcp /usr/local/bin/bcp
fi