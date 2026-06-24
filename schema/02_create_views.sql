-- A set of views designed for querying information in real time.

-- A view that provides real-time sales and inventory information.
CREATE VIEW [dbo].[vwSalesInventory]
AS
with Z as(
	select 
		B.sodate,
		A.storecode,
		A.sku,
		sum(case when B.type = 'S'
				 then qty
				 else -qty
			end) as salesqty
	from slsorderdetail A inner join slsorder B on A.sono = B.sono
	group by A.storecode, A.sku, B.sodate
	
)
select
	Z.sodate,
	Z.storecode,
	B.itmname,
	Z.salesqty,
	D.qty as currentInventory
from Z
	left outer join itmlist B on Z.sku = B.sku
	left outer join(
		select 
			storecode,
			sku,
			sum(qty) as qty
		FROM [dbo].[inventory]
		GROUP BY storecode, sku
	) D on Z.sku = D.sku and Z.storecode = D.storecode

GO

-- A view that displays daily sales amounts by store and date.
CREATE VIEW [dbo].[vwSales]
AS
SELECT
    storecode,
    sodate,
    SUM(CASE WHEN [type] = 'S' THEN totalamount
             ELSE -totalamount
        END) AS slsAmount
FROM [dbo].[slsOrder]
GROUP BY storecode, sodate
GO

--
  
-- A view for querying current inventory.
CREATE VIEW [dbo].[vwInventory]
AS
select 
	storecode,
	sku,
	sum(qty) as qty
FROM [dbo].[inventory]
GROUP BY storecode, sku
GO
