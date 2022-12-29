#! /bin/sh

# @Authors:
# @Fecha:
# @Descripción:

export ORACLE_SID=raluproy

raiz=/unam-bda/proyecto

echo "Creando directorios para datafiles"

cd /u01/app/oracle/oradata
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}

echo "Creando directorios para los redologs"

cd ${raiz}
mkdir -p d01/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p d02/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p d03/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p d04/app/oracle/oradata/${ORACLE_SID^^}

chown -R oracle:oinstall d01/app
chown -R oracle:oinstall d02/app
chown -R oracle:oinstall d03/app
chown -R oracle:oinstall d04/app

chmod -R 750 d01/app
chmod -R 750 d02/app
chmod -R 750 d03/app
chmod -R 750 d04/app

echo "Mostrando directorio de data files"
ls -l /u01/app/oracle/oradata

echo "Mostrando directorios para control files y redo logs"
ls -l /unam-bda/d0*/app/oracle/oradata
