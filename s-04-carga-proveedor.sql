connect ralu_p01/ralu

Prompt Tabla entidad_nacimiento
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


Prompt Tabla nivel_estudio
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

Prompt Tabla estatus_proveedor
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

Prompt Tabla proveedor
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
      (select sysdate from dual),
      sys.dbms_random.string('A',150),
      select dbms_random.value(1000000000,9999999999),
      select dbms_random.value(1000000000,9999999999),
      (select sysdate from dual),
      proveedor_entidad_nacimiento_seq.NextVal,
      proveedor_nivel_estudio_seq.NextVal,
      proveedor_estatus_proveedor_seq.NextVal
      );
  end loop;
end;
/

connect ralu_p02/ralu
Prompt Tabla doc_proveedor
create sequence doc_proveedor_seq
start with 1
increment by 1;

create sequence doc_proveedor_proveedor_seq
start with 1
increment by 1;

begin
  for i in 1..50 loop
    insert into DOC_PROVEEDOR(DOC_PROVEEDOR_ID,IDENTIFICACION,COMPROBANTE_DOMICILIO,
    CLABE,BANCO,PROVEEDOR_ID) values (
      doc_proveedor_seq.NextVal,
      empty_blob(),
      empty_blob(),
      sys.dbms_random.string('A',18),
      sys.dbms_random.string('A',30),
      doc_proveedor_proveedor_seq.NextVal
      );
  end loop;
end;
/