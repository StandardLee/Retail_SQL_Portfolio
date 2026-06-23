-- User-defined types for the Retail_SQL_Portfolio schema

-- characters, not NULL
CREATE TYPE [dbo].[u_char001] FROM [char](1) NOT NULL
GO
  
CREATE TYPE [dbo].[u_char003] FROM [char](3) NOT NULL
GO
  
CREATE TYPE [dbo].[u_char008] FROM [char](8) NOT NULL
GO

-- varchar, not NULL
CREATE TYPE [dbo].[u_varchar020] FROM [varchar](20) NOT NULL
GO

CREATE TYPE [dbo].[u_varchar050] FROM [varchar](50) NOT NULL
GO

CREATE TYPE [dbo].[u_varchar200] FROM [varchar](200) NOT NULL
GO

-- deciamal with two decimal places, not NULL
CREATE TYPE [dbo].[u_decimal] FROM [decimal](10, 2) NOT NULL
GO

-- bigint, not Null
CREATE TYPE [dbo].[u_int] FROM [bigint] NOT NULL
GO

-- status flag indicating active/inactive, not NULL
CREATE TYPE [dbo].[u_status] FROM [bit] NOT NULL
GO
