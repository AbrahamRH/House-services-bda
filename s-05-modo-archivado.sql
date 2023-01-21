connect sys/system2 as sysdba

alter system set log_archive_max_processes = 2 scope = spfile;
alter system set log_archive_dest_1 = 'LOCATION=/unam-bda/proyecto/d04/app/oracle/oradata/RALUPROY MANDATORY' scope = spfile;
alter system set log_archive_dest_2 = 'LOCATION=/unam-bda/proyecto/d05/app/oracle/oradata/RALUPROY' scope = spfile;
alter system set log_archive_dest_3 = 'LOCATION=/unam-bda/proyecto/d06/app/oracle/oradata/RALUPROY' scope = spfile;
alter system set log_archive_format = 'arch_raluproy_%t_%s_%r.arc' scope = spfile;
alter system set log_archive_min_succeed_dest = 1 scope = spfile;

shutdown
startup mount
alter database archivelog;
alter database open;
archive log list