
connect ralu_s01/ralu_s01

-- Cliente
Prompt ================
Prompt Carga de cliente 
Prompt ================

create sequence cliente_seq
start with 1
increment by 1;

declare
begin 
  for i in 1..50 loop
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

Prompt =======================
Prompt Carga de persona fisica
Prompt =======================

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
      (select sysdate from dual)
    );
  end loop;
end;
/

Prompt =========================
Prompt Carga de estatus_servicio
Prompt =========================

create sequence estatus_servicio_seq
start with 1
increment by 1;

declare
begin 
  for i in 1..50 loop
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

-- Servicio

Prompt =================
Prompt Carga de servicio
Prompt =================

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


-- Tarjeta cliente

Prompt ================
Prompt Carga de cliente
Prompt ================

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
