/* 
NOTE: user-defined types like u_char003 are defined as not NULL by default, but Null/not NULL is still specified on each coulmn for clarity
Each table is designed to use unique keys when needed to improve sorting and search performance.
*/

/*
This table contains store information. HQ stores are marked as storetype = "H" and are used for data consolidation rather than sales, 
while regular stores are marked as storetype = "S" and handle sales activity.
*/
CREATE TABLE [dbo].[masStore](
	[storecode] [dbo].[u_char003] NOT NULL,
	[storetype] [dbo].[u_char001] NOT NULL,
	[storename] [dbo].[u_varchar050] NOT NULL,
  CONSTRAINT [PK_masStore] PRIMARY KEY CLUSTERED ([storecode] ASC)
);
GO

/*
This table stores only sales header data.
The type column indicates whether the transaction is a sale (S) or a return (R), and sales are identified by the unique sales number in the sono column.
*/
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

/*
This is the sales detail table, showing which items were included in each transaction and the quantity of each item.
It also contains item information such as SKU and UPC.
*/
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

-- This table stores item names and prices using SKU as the unique key, and the status column indicates whether the item is active or inactive.
CREATE TABLE [dbo].[itmList](
	[sku] [dbo].[u_char009] NOT NULL,
	[itmName] [dbo].[u_varchar200] NOT NULL,
	[retailprice] [dbo].[u_decimal] NOT NULL,
	[status] [dbo].[u_status] NOT NULL,
  CONSTRAINT [PK_itmList] PRIMARY KEY CLUSTERED ([sku] ASC)
);
GO

/* 
This table records inventory changes.
For each store, it logs every quantity change for a given SKU item, making it possible to track when and how much inventory was added or reduced.
By summing the quantity of all transactions for a given item, the current inventory can be calculated.
In the transtype column, I indicates the initial stock, S indicates a sale and decreases the quantity, and R indicates a return and increases the quantity.	
*/
CREATE TABLE [dbo].[inventory](
 	[storecode] [dbo].[u_char003] NOT NULL,
	[sku] [dbo].[u_char009] NOT NULL,
	[transdate] [dbo].[u_char009] NOT NULL,
	[transtype] [dbo].[u_char001] NOT NULL,
	[qty] [dbo].[u_int] NOT NULL
);
GO
