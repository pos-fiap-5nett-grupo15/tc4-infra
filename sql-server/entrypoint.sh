#!/bin/bash

# start sql server
/opt/mssql/bin/sqlservr &

/usr/config/configure-db.sh

