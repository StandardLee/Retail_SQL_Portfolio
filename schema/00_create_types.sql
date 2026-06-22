-- User-defined types for the Retail_SQL_Portfolio schema

-- 3 characters store codes, not NULL
CREATE TYPE [dbo].[u_char003] FROM [char](3) NOT NULL
GO

-- status flag indicating active/inactive, not NULL
CREATE TYPE [dbo].[u_status] FROM [bit] NOT NULL
GO
