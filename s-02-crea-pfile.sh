#! /bin/sh
#
# s-02-crea-pfile.sh
# Copyright (C) 2022 AbrahamRH <abrahamrzhz@gmail.com>
#
# Distributed under terms of the MIT license.
#


echo "1. Creando un archivo de parámetros básico"

export ORACLE_SID=raluproy

pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora

if [ -f "${pfile}" ]; then
	read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;

echo \
"db_name='${ORACLE_SID}'
db_domain='fi.unam'
memory_target=768M
control_files=(
		/unam-bda/proyecto/d01/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
		/unam-bda/proyecto/d02/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
		/unam-bda/proyecto/d03/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl)
" >$pfile

echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}
