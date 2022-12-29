-- @Autores
-- @Fecha: 
-- @Descripción: 


Prompt Connectando como sys
connect sys/hola1234* as sysdba

Prompt Iniciando la instancia como nomount
startup nomount

Prompt Creando base de datos

whenever sqlerror exit rollback;

create database raluproy
user sys identified by system2
user system identified by system2
user sysbackup identified by system2
logfile group 1 (
'/unam-bda/proyecto/d01/app/oracle/oradata/RALUPROY/redo01a.log',
'/unam-bda/proyecto/d02/app/oracle/oradata/RALUPROY/redo01b.log',
'/unam-bda/proyecto/d03/app/oracle/oradata/RALUPROY/redo01c.log') size 50m blocksize 512,
group 2 (
'/unam-bda/proyecto/d01/app/oracle/oradata/RALUPROY/redo02a.log',
'/unam-bda/proyecto/d02/app/oracle/oradata/RALUPROY/redo02b.log',
'/unam-bda/proyecto/d03/app/oracle/oradata/RALUPROY/redo02c.log') size 50m blocksize 512,
group 3 (
'/unam-bda/proyecto/d01/app/oracle/oradata/RALUPROY/redo03a.log',
'/unam-bda/proyecto/d02/app/oracle/oradata/RALUPROY/redo03b.log',
'/unam-bda/proyecto/d03/app/oracle/oradata/RALUPROY/redo03c.log') size 50m blocksize 512
maxloghistory 1
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16
extent management local
datafile '/u01/app/oracle/oradata/RALUPROY/system01.dbf'
size 700m reuse autoextend on next 10240k maxsize unlimited
sysaux datafile '/u01/app/oracle/oradata/RALUPROY/sysaux01.dbf'
size 550m reuse autoextend on next 10240k maxsize unlimited
default tablespace users
datafile '/u01/app/oracle/oradata/RALUPROY/users01.dbf'
size 500m reuse autoextend on maxsize unlimited
default temporary tablespace tempts1
tempfile '/u01/app/oracle/oradata/RALUPROY/temp01.dbf'
size 20m reuse autoextend on next 640k maxsize unlimited
undo tablespace undotbs1
datafile '/u01/app/oracle/oradata/RALUPROY/undotbs01.dbf'
size 200m reuse autoextend on next 5120k maxsize unlimited;

Prompt cambiando contraseñas a los usuarios
alter user sys identified by system2;
alter user system identified by system2;
alter user sysbackup identified bt system2;
