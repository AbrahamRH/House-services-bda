--Tablespace multiple
create tablespace proveedor_multiple_tbs
datafile '/unam-bda/proyecto/d07/app/oracle/oradata/RALUPROY/proveedor_multiple_tbs01.dbf' size 10m,
         '/unam-bda/proyecto/d07/app/oracle/oradata/RALUPROY/proveedor_multiple_tbs02.dbf' size 10m,
         '/unam-bda/proyecto/d08/app/oracle/oradata/RALUPROY/proveedor_multiple_tbs03.dbf' size 10m
extent management local autoallocate
segment space management auto;

--Tablespace big
create bigfile tablespace proveedor_big_tbs
datafile '/unam-bda/proyecto/d07/app/oracle/oradata/RALUPROY/proveedor_big_tbs01.dbf' size 100m
extent management local autoallocate
segment space management auto;

--Tablespace temporal
create temporary tablespace proveedor_temp_tbs
tempfile '/unam-bda/proyecto/d07/app/oracle/oradata/RALUPROY/proveedor_temp_tbs01.dbf' size 20m
reuse;

--Tablespace undo
create undo tablespace proveedor_undo_tbs
datafile '/unam-bda/proyecto/d07/app/oracle/oradata/RALUPROY/proveedor_undo_tbs01.bdf' size 20m
extent management local autoallocate;

--Tablespace indices
create tablespace proveedor_indices_tbs
datafile '/unam-bda/proyecto/d07/app/oracle/oradata/RALUPROY/proveedor_indices_tbs01.dbf' size 20m
extent management local autoallocate
segment space management auto;


create user ralu_p01 identified by ralu
default tablespace proveedor_multiple_tbs
quota unlimited on proveedor_multiple_tbs;

create user ralu_p02 identified by ralu
default tablespace proveedor_big_tbs
quota unlimited on proveedor_big_tbs;

grant create session, create table, create procedure, create sequence to ralu_p01;
grant create session, create table, create procedure, create sequence to ralu_p02;

alter user ralu_p01 quota unlimited on proveedor_indices_tbs;
alter user ralu_p02 quota unlimited on proveedor_indices_tbs;
