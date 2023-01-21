connect  sys/system2 as sysdba
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'RALU_P01';
  if v_count > 0 then
    execute immediate 'drop user ralu_p01 cascade';
    execute immediate 'drop user ralu_p02 cascade';
    execute immediate 'drop user ralu_s01 cascade';
    execute immediate 'drop user ralu_s02 cascade';
  end if;
end;
/

-- Proveedor

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

-- Servicio

create user ralu_s01 identified by ralu_s01 
default tablespace servicio_multiple_tbs;

create user ralu_s02 identified by ralu_s02
default tablespace servicio_compress_tbs;

grant create session, create table, create procedure, create sequence to ralu_s01;
grant create session, create table, create procedure, create sequence to ralu_s02;

alter user ralu_s01 quota unlimited on servicio_indexes_tbs;
alter user ralu_s02 quota unlimited on servicio_indexes_tbs;


Prompt ============================
Prompt Creando objetos de proveedor
Prompt ============================
@s-03-objetos-proveedor.sql

connect ralu_p01/ralu

grant references on proveedor to ralu_s01;

connect sys/system2 as sysdba

Prompt ===========================
Prompt Creando objetos de servicio
Prompt ===========================
@s-03-objetos-servicio.sql

connect sys/system2 as sysdba
