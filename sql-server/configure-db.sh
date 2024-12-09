#!/bin/bash

touch subst_setup.sql
chmod +x subst_setup.sql
envsubst < setup.sql >> subst_setup.sql
cat subst_setup.sql

# Run the setup script to create the DB and the schema in the DB
sleep 30
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -d master -i subst_setup.sql

tail -f /dev/null