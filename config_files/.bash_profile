# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


# /u01/
# ├── app/
# │   └── oracle/
# │       ├── product/
# │       │   └── 19c/
# │       │       └── db_home/          # ORACLE_HOME - Oracle binaries
# │       ├── admin/                    # Database administration files
# │       ├── oradata/                  # Database data files
# │       ├── fast_recovery_area/       # Backup and recovery files
# │       └── diag/                     # Diagnostic logs
# └── app/
#     └── oraInventory/                 # Oracle inventory


export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/19c/db_home

export ORACLE_SID=CDB

export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib
export NLS_LANG=american_america.al32utf8
export NLS_DATE_FORMAT="yyyy-mm-dd:hh24:mi:ss"

PATH=$PATH:$HOME/.local/bin:$ORACLE_HOME/bin
export PATH