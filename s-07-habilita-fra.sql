
connect sys/system2 as sysdba


alter system set db_recovery_file_dest_size=20g scope=spfile;

alter system set db_recovery_file_dest='/unam-bda/proyecto/d06/app/oracle/oradata/RALUPROY/FRA' scope=spfile;

alter system set db_flashback_retention_target=720 scope=spfile;

shutdown immediate
startup
