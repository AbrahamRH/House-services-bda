
connect ralu_p01/ralu
begin
  for i in 1..2000 loop
    insert into ENTIDAD_NACIMIENTO(ENTIDAD_NACIMIENTO_ID,ENTIDAD) values (
      entidad_nacimiento_seq.NextVal,sys.dbms_random.string('A',20)
      );
  end loop;
end;
/
begin
  for i in 1..2000 loop
    insert into NIVEL_ESTUDIO(NIVEL_ESTUDIO_ID,NIVEL_ESTUDIO) values (
      nivel_estudio_seq.NextVal,sys.dbms_random.string('A',80)
      );
  end loop;
end;
/
begin
  for i in 1..2000 loop
    insert into ESTATUS_PROVEEDOR(ESTATUS_PROVEEDOR_ID,DESCRIPCION) values (
      estatus_proveedor_seq.NextVal,sys.dbms_random.string('A',15)
      );
  end loop;
end;
/
begin
  for i in 1..2000 loop
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
      sys.dbms_random.value(1000000000,9999999999),
      sys.dbms_random.value(1000000000,9999999999),
      (select sysdate from dual),
      proveedor_entidad_nacimiento_seq.NextVal,
      proveedor_nivel_estudio_seq.NextVal,
      proveedor_estatus_proveedor_seq.NextVal
      );
  end loop;
end;
/

commit;
connect ralu_p02/ralu
begin
  for i in 1..2000 loop
    insert into DOC_PROVEEDOR(
      DOC_PROVEEDOR_ID,
      IDENTIFICACION,
      COMPROBANTE_DOMICILIO,
      CLABE,
      BANCO,
      PROVEEDOR_ID) values (
      doc_proveedor_seq.NextVal,
      empty_blob(),
      empty_blob(),
      sys.dbms_random.value(000000000000000000,999999999999999999),
      sys.dbms_random.string('A',30),
      doc_proveedor_proveedor_seq.NextVal
      );
  end loop;
end;
/
commit;

-- Servicio

connect ralu_s01/ralu_s01

declare
begin 
  for i in 1..2000 loop
    insert into cliente(
      cliente_id,
      fecha_registro,
      nombre_usuario,
      contrasena,
      email,
      telefono,
      direccion,
      tipo
    ) values (
      cliente_seq.nextval, 
      (select sysdate from dual), 
      sys.dbms_random.string('A',10),
      sys.dbms_random.string('A',10),
      sys.dbms_random.string('A',10) || '@gmail.com',
      sys.dbms_random.value(1000000000,9999999999),
      sys.dbms_random.string('A',150),
      'P'
    );
  end loop;
end;
/
declare
begin 
  for i in 1..2000 loop
    insert into persona_fisica(
      cliente_id, nombre, foto, curp, fecha_nacimiento
    ) values (
      persona_seq.nextval, 
      sys.dbms_random.string('A',10),
      empty_blob(),
      sys.dbms_random.string('A',18),
      (select sysdate from dual)
    );
  end loop;
end;
/
declare
begin 
  for i in 1..2000 loop
    insert into estatus_servicio(
      estatus_servicio_id,
      descripcion
    ) values (
      estatus_servicio_seq.nextval,
      sys.dbms_random.string('A',15)
    );
  end loop;
end;
/
declare
begin 
  for i in 1..2000 loop
    insert into servicio(
      servicio_id, fecha_servicio,
      descripcion, descripcion_detallada, fecha_status,
      estatus_servicio_id, proveedor_id, cliente_id
    ) values (
      servicio_seq.nextval, sysdate, 
      sys.dbms_random.string('P',1000),
      empty_blob(),
      (select sysdate from dual),
      servicio_estatus_servicio_seq.nextval,
      servicio_proveedor_seq.nextval,
      servicio_cliente_seq.nextval
    );
  end loop;
end;
/
commit;

connect ralu_s02/ralu_s02
declare
begin
  for i in 1..2000 loop
    insert into tarjeta_cliente(
      tarjeta_cliente_id,
      numero_tarjeta,
      cliente_id
    ) values (
      tarjeta_cliente_seq.nextval,
      sys.dbms_random.value(1000000000000000,9999999999999999),
      tarjeta_cliente_cliente_seq.nextval
    );
  end loop;
end;
/
commit;
