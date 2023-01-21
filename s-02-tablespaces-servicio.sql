

create tablespace servicio_multiple_tbs
datafile '/unam-bda/proyecto/d09/app/oracle/oradata/RALUPROY/servicio_multiple_tbs01.dbf' size 10m,
         '/unam-bda/proyecto/d09/app/oracle/oradata/RALUPROY/servicio_multiple_tbs02.dbf' size 10m,
         '/unam-bda/proyecto/d10/app/oracle/oradata/RALUPROY/servicio_multiple_tbs03.dbf' size 10m
extent management local autoallocate
segment space management auto;

create tablespace servicio_compress_tbs
datafile '/unam-bda/proyecto/d09/app/oracle/oradata/RALUPROY/servicio_compress_tbs01.dbf' size 20m
default row store compress advanced
extent management local autoallocate
segment space management auto;


create temporary tablespace servcio_temp_tbs
tempfile '/unam-bda/proyecto/d09/app/oracle/oradata/RALUPROY/servicio_temp_tbs01.dbf' size 20m
reuse;


create undo tablespace servicio_undo_tbs
datafile '/unam-bda/proyecto/d09/app/oracle/oradata/RALUPROY/servicio_undo_tbs01.dbf' size 20m
reuse;

create tablespace servicio_indexes_tbs
datafile '/unam-bda/proyecto/d09/app/oracle/oradata/RALUPROY/servicio_indexes_tbs01.dbf' size 20m
extent management local autoallocate
segment space management auto;

