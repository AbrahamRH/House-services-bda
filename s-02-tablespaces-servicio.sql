

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

create user ralu_s01 identified by ralu_s01 
default tablespace servicio_multiple_tbs;

create user ralu_s02 identified by ralu_s02
default tablespace servicio_compress_tbs;

grant create session, create table, create procedure, create sequence to ralu_s01;
grant create session, create table, create procedure, create sequence to ralu_s02;

