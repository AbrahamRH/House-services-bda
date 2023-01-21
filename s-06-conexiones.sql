connect sys/system2 as sysdba

--configura 2 dispatchers para protocolo TCP
alter system set dispatchers='(dispatchers=2)(protocol=tcp)' scope=memory;
--configura 4 shared servers
alter system set shared_servers=4 scope=memory;

show parameter dispatchers
show parameter shared_servers

alter system register;

!lsnrctl services

exec dbms_connection_pool.start_pool();

exec dbms_connection_pool.alter_param ('','MAXSIZE','50');
exec dbms_connection_pool.alter_param ('','MINSIZE','35');

exec dbms_connection_pool.alter_param ('','INACTIVITY_TIMEOUT','1800');
exec dbms_connection_pool.alter_param ('','MAX_THINK_TIME','1800');