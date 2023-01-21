

connect ralu_s01/ralu_s01

-- Cliente
Prompt Carga de cliente y persona_fisica
create sequence cliente_seq
start with 1
increment by 1;

declare
begin 
  for i in 1..50 loop
    insert into cliente(
      cliente_id, fecha_registro, nombre_usuario,
      contraseña,email, telefono, direccion, tipo
    ) values (
      cliente_seq.nextval, 
      sysdate, 
      sys.dbms_random.string('A',10),
      sys.dbms_random.string('A',10),
      sys.dbms_random.string('A',10) || '@gmail.com',
      sys.dbms_random.value(1000000000,9999999999),
      'P'
    );
  end loop;
end;
/

create sequence persona_seq
start with 1
increment by 1;

declare
begin 
  for i in 1..50 loop
    insert into persona_fisica(
      cliente_id, nombre, foto, curp, fecha_nacimiento
    ) values (
      persona_seq.nextval, 
      sys.dbms_random.string('A',10),
      empty_blob(),
      sys.dbms_random.string('A',18),
      sysdate
    );
  end loop;
end;
/

-- Servicio

create sequence servicio_seq
start with 1
increment by 1;

create sequence servicio_proveedor_seq
start with 1
increment by 1;

create sequence servicio_cliente_seq
start with 1
increment by 1;

create sequence servicio_estatus_servicio_seq
start with 1
increment by 1;

declare
begin 
  for i in 1..50 loop
    insert into servicio(
      servicio_id, fecha_servicio,
      descripcion, descripcion_detallada, fecha_estatus,
      estatus_servicio_id, proveedor_id, cliente_id
    ) values (
      servicio_seq.nextval, sysdate, 
      sys.dbms_random.string('P',1000),
      empty_blob(),
      sysdate,
      servicio_estatus_servicio_seq.nextval,
      servicio_proveedor_seq.nextval,
      servicio_cliente_seq.nextval
    );
  end loop;
end;
/


-- Tarjeta cliente

connect ralu_s02/ralu_s02

create sequence tarjeta_cliente_seq
start with 1
increment by 1;

create sequence tarjeta_cliente_cliente_seq
start with 1
increment by 1;

declare
begin
  for i in 1..50 loop
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
