#! /bin/sh
#
# s-04-agrega-conexion-tnsnames.sh
# Copyright (C) 2023 AbrahamRH <AbrahamRH@pc-${host}.fi.unam>
#
# Distributed under terms of the MIT license.
#


path=/u01/app/oracle/product/19.3.0/dbhome_1/network/admin/tnsnames.ora
cp ${path} ${path}.backup
host=arh
echo \
	"

raluproy_dedicated =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA = 
      (SERVICE_NAME = raluproy.fi.unam)
      (SERVER = DEDICATED)
    )
  )

raluproy_shared =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA = 
      (SERVICE_NAME = raluproy.fi.unam)
      (SERVER = SHARED)
    )
  )

raluproy_pooled =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA = 
      (SERVICE_NAME = raluproy.fi.unam)
      (SERVER = POOLED)
    )
  )
" >> ${path}

