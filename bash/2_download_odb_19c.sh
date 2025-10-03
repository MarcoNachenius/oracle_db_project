#!/bin/bash

ORACLE_DOWNLOAD_URL="https://download.oracle.com/otn/linux/oracle19c/190000/oracle-database-ee-19c-1.0-1.x86_64.rpm"
ORACLE_PROFILE_NAME="marconachenius@gmail.com"
ORACLE_PROFILE_PASSWORD="BePoes1992@"

# Download package into tmp/
wget --user="$ORACLE_PROFILE_NAME" --password="$ORACLE_PROFILE_PASSWORD" \
     "$ORACLE_DOWNLOAD_URL" -O /tmp/oracle-database-ee-19c-1.0-1.x86_64.rpm