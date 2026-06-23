/* 
NOTE: user-defined types like u_char003 are defined as not NULL by default, but Null/not NULL is still specified on each coulmn for clarity
*/

CREATE TABLE [dbo].[masStore](
	[storecode] [dbo].[u_char003] NOT NULL,
	[storetype] [dbo].[u_char001] NOT NULL,
	[storename] [dbo].[u_varchar050] NOT NULL,
  CONSTRAINT [PK_masStore] PRIMARY KEY CLUSTERED ([storecode] ASC)
);
GO

CREATE TABLE [dbo].[slsOrder](
  [storecode] [dbo].[u_char003] NOT NULL,
	[sono] [dbo].[u_char009] NOT NULL,
	[type] [dbo].[u_char001] NOT NULL,
	[sodate] [dbo].[u_char009] NOT NULL,
	[soamount] [dbo].[u_decimal] NOT NULL,
	[taxamount] [dbo].[u_decimal] NOT NULL,
	[totalamount] [dbo].[u_decimal] NOT NULL,
  CONSTRAINT [PK_slsOrder] PRIMARY KEY CLUSTERED ([storecode] ASC, [sono] ASC)
);
GO

CREATE TABLE [dbo].[slsOrderDetail](
	[storecode] [dbo].[u_char003] NOT NULL,
	[sono] [dbo].[u_char009] NOT NULL,
	[sku] [dbo].[u_char009] NOT NULL,
	[itmName] [dbo].[u_varchar200] NOT NULL,
	[price] [dbo].[u_decimal] NOT NULL,
	[qty] [dbo].[u_int] NOT NULL,
	[salesamount] [dbo].[u_decimal] NOT NULL,
	[taxamount] [dbo].[u_decimal] NOT NULL,
	[UPC] [dbo].[u_varchar020] NOT NULL,
  CONSTRAINT [PK_slsOrderDetail] PRIMARY KEY CLUSTERED ([storecode] ASC, [sono] ASC, [sku] ASC)
);
GO

CREATE TABLE [dbo].[itmList](
	[sku] [dbo].[u_char009] NOT NULL,
	[itmName] [dbo].[u_varchar200] NOT NULL,
	[retailprice] [dbo].[u_decimal] NOT NULL,
	[status] [dbo].[u_status] NOT NULL,
  CONSTRAINT [PK_itmList] PRIMARY KEY CLUSTERED ([sku] ASC)
);
GO

CREATE TABLE [dbo].[inventory](
 	[storecode] [dbo].[u_char003] NOT NULL,
	[sku] [dbo].[u_char009] NOT NULL,
	[transdate] [dbo].[u_char009] NOT NULL,
	[transtype] [dbo].[u_char001] NOT NULL,
	[qty] [dbo].[u_int] NOT NULL,
  CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED ([storecode] ASC, [sku] ASC)
);
GO
