--Tabla entidad_nacimiento
create sequence entidad_nacimiento_seq
start with 1
increment by 1;

begin
  for i in 1..50 loop
    insert into ENTIDAD_NACIMIENTO(ENTIDAD_NACIMIENTO_ID,ENTIDAD) values (
      entidad_nacimiento_seq.NextVal,sys.dbms_random.string('A',20)
      );
  end loop;
end;
/


--Tabla 
create sequence nivel_estudio_seq
start with 1
increment by 1;

begin
  for i in 1..50 loop
    insert into NIVEL_ESTUDIO(NIVEL_ESTUDIO_ID,NIVEL_ESTUDIO) values (
      nivel_estudio_seq.NextVal,sys.dbms_random.string('A',80)
      );
  end loop;
end;
/

--Tabla 
create sequence estatus_proveedor_seq
start with 1
increment by 1;

begin
  for i in 1..50 loop
    insert into ESTATUS_PROVEEDOR(ESTATUS_PROVEEDOR_ID,DESCRIPCION) values (
      estatus_proveedor_seq.NextVal,sys.dbms_random.string('A',15)
      );
  end loop;
end;
/

--Tabla proveedor
create sequence proveedor_seq
start with 1
increment by 1;

create sequence proveedor_entidad_nacimiento_seq
start with 1
increment by 1;

create sequence proveedor_nivel_estudio_seq
start with 1
increment by 1;

create sequence proveedor_estatus_proveedor_seq
start with 1
increment by 1;

begin
  for i in 1..50 loop
    insert into PROVEEDOR(PROVEEDOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FOTO,
    FECHA_NACIMIENTO,DIRECCION,TELEFONO_CASA,TELEFONO_MOVIL,FECHA_STATUS,
    ENTIDAD_NACIMIENTO_ID,NIVEL_ESTUDIO_ID,ESTATUS_PROVEEDOR_ID) values (
      proveedor_seq.NextVal,
      sys.dbms_random.string('A',20),
      sys.dbms_random.string('A',20),
      sys.dbms_random.string('A',20),
      empty_blob(),
      --fecha,
      sys.dbms_random.string('A',150),
      select dbms_random.value(1000000000,9999999999),
      select dbms_random.value(1000000000,9999999999),
      --fecha_status,
      proveedor_entidad_nacimiento_seq.NextVal,
      proveedor_nivel_estudio_seq.NextVal,
      proveedor_estatus_proveedor_seq.NextVal
      );
  end loop;
end;
/