
/*
Stored procedure executed in the HQ database to insert inventory records from all stores in masStore table into the HQ inventory table for a specified date.
The procedure accepts the date as a parameter and uses it to process records for that day.
*/

CREATE PROCEDURE dbo.sp_DailyInventory
    @TransDate char(8)   -- ex: '20260601'
AS
BEGIN
    DECLARE
        @storecode  char(3),
        @storename  varchar(50),
        @sql        nvarchar(max)

    DECLARE cur_store CURSOR FOR
        SELECT storecode, storename
        FROM dbo.masStore
        WHERE storetype != 'H'

    OPEN cur_store
  
    FETCH NEXT FROM cur_store INTO 
        @storecode, @storename

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql = N'
            INSERT INTO dbo.inventory (
                storecode,
                sku,
                transdate,
                transtype,
                qty
            )
            SELECT
                ''' + @storecode + ''' AS storecode,
                sku,
                transdate,
                transtype,
                qty
            FROM [LS_' + @storecode + N'].[' + @storename + N'].[dbo].[inventory]
            WHERE transdate = @qTransDate
        '
        EXEC sp_executesql
            @sql,
            N'@qTransDate char(8)',
            @qTransDate = @TransDate

        FETCH NEXT FROM cur_store INTO @storecode, @storename;
    END

    CLOSE cur_store;
    DEALLOCATE cur_store;
END;
GO
