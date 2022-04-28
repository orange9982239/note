USE [master]
    --創建帳號
    CREATE LOGIN [IIS APPPOOL\enro_test] FROM WINDOWS;
    CREATE LOGIN [IIS APPPOOL\egrn_test] FROM WINDOWS;
GO

USE [#mydatabase#]
    --創建使用者
    CREATE USER [IIS APPPOOL\egrn_test] FOR LOGIN [IIS APPPOOL\egrn_test]
    CREATE USER [IIS APPPOOL\enro_test] FOR LOGIN [IIS APPPOOL\enro_test]

    --使用者增加權限
    ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\egrn_test]
    ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\enro_test]
GO