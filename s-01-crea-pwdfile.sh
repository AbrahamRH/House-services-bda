#! /bin/sh

# @Authors:
# @Fecha:
# @Descripción:

echo "Creando archivo de passwords"

echo "Configurando ORACLE_SID"

export ORACLE_SID=raluproy

echo "ORACLE_SID=${ORACLE_SID}"

echo "Creando archivo de passwords, se sobre escribe si existe"

orapwd FORCE=Y \
	FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' \
	FORMAT=12.2 \
	SYS=password \
	SYSBACKUP=password

echo "Comprobando la creación del archivo"
ls -l ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}
