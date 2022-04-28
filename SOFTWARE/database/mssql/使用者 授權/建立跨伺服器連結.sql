--建立跨伺服器連結
USE [master]
EXEC master.dbo.sp_addlinkedserver @server = N'NTTU_TEST', @srvproduct=N'SQLNCLI', @provider=N'SQLNCLI11', @datasrc=N'#target_server_ip#'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'data access', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'dist', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'rpc', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'rpc out', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'NTTU_TEST', @optname=N'remote proc transaction promotion', @optvalue=N'true'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'NTTU_TEST', @locallogin = NULL , @useself = N'False', @rmtuser = N'#account#', @rmtpassword = N'#password#'
GO