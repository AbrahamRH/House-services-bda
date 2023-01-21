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

