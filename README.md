# Retail_SQL_Portfolio

SQL portfolio showcasing synthetic multi‑store retail data, database schema design, and complex T‑SQL queries for reporting.

## Project Structure

```
retail-sql-portfolio/
 ├─ README.md
 ├─ schema/
 │   ├─ 00_create_types.sql            -- create user defined types like u_char003, u_status
 │   ├─ 01_create_tables.sql           -- masStore, itmList, slsOrder, slsOrderDetail, inventory
 │   ├─ 02_create_views.sql            -- views for reviewing sales and inventory
 │   ├─ 03_create_linkedserver.sql     -- link local servers of stores based on the data of masStore table 
 │   └─ 04_create_storedprocedures.sq  -- stored procedures for collecting inventory data from lined servers
 ├─ data/
 │   ├─ masStore.csv                 -- 000(HQ), 001~029 stores
 │   ├─ itmList.csv                  -- test_itm001~100, retailprice, status
 │   ├─ slsOrder.csv                 -- header data of Sales/Return
 │   ├─ slsOrderDetail.csv           -- body data of transactions
 │   └─ inventory.csv                -- initial data of inventory and sales/return
 └─ queries/
     └─ sales_by_store.sql        -- sales by date/stores

```

### data/
Contains sample CSV files used for loading source data.
- inventory.csv
- itmList.csv
- masStore.csv
- slsOrder.csv
- slsOrderDetail.csv

### schema/
Contains SQL scripts for setting up the database schema.
- 00_create_types.sql
  <br>This script defines several user-defined data types. u_decimal is set to represent monetary values with two decimal places, and these types are intended for columns that should not accept NULL values by default.<br>
  
- 01_create_tables.sql
  <br>This script creates tables for store information (masStore), sales data (slsOrder, slsOrderDetail), item information (itmList), and inventory data (inventory). It uses user-defined data types to keep the schema consistent across tables, reduce errors, and make join easier.<br>
  
- 02_create_views.sql
  <br>This script creates views for querying sales and inventory data, and for displaying both sales status and inventory status of items that have recorded sales or return.<br>
  
- 03_create_linkedserver.sql
  <br>This script is based on the assumption that each store has a local server and links them to the main server through linked servers. By using store information from masStore table, it standardizes the schema across linked servers and makes the structure easier to work with.<br>
  
- 04_create_storedprocedures.sql
  <br>This script is a stored procedure that is a query that must be executed with parameter. If automated using SQL Server Agent, it would make it much easier to collect data from each local server into the main server.<br>

### queries/
Contains sales analysis queries for reporting.
- sales_by_store.sql

## Features
- Created user-defined types and tables
- Built views for reusable reporting logic
- Configured linked servers for multi-store data access
- Developed stored procedures for automated data processing
- Wrote analysis queries for sales reporting by store

## How to Run
1. Execute the schema scripts that creates types and tables.
2. Load the CSV files into the corresponding tables.
3. Run 02_create_views.sql, 03_create_linkedserver.sql, and 04_create_storedprocedures.sql as needed.
