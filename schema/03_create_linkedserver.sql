/*
This query adds linked servers assuming that each store has its own local server.
The database schema is assumed to be the same across all stores, and login mapping is omitted for simplicity.
*/

DECLARE 
    @storecode  char(3),
    @storename  varchar(50),
    @sql        nvarchar(max);

DECLARE cur_store CURSOR LOCAL FAST_FORWARD FOR
    SELECT storecode, storename
    FROM dbo.masStore
    WHERE storecode <> '000'; 

OPEN cur_store;
FETCH NEXT FROM cur_store INTO @storecode, @storename;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'
        EXEC master.dbo.sp_addlinkedserver
            @server     = N''LS_' + @storecode + ''',
            @srvproduct = N'''',
            @provider   = N''MSOLEDBSQL'',      
            @datasrc    = N''EXAMPLE-SQL-HOST'', 
            @catalog    = N''' + @storename + ''';';

    EXEC (@sql);

    FETCH NEXT FROM cur_store INTO @storecode, @storename;
END

CLOSE cur_store;
DEALLOCATE cur_store;
GO
