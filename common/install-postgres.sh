#!/bin/bash

yum install postgresql-server postgresql-contrib -y
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql

sed -i -e 's/ident$/md5/g' /var/lib/pgsql/data/pg_hba.conf
