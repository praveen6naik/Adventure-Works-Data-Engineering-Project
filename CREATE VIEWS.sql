CREATE VIEW gold.calendar
as 
select *
FROM
  OPENROWSET
  (
        BULK 'https://pknstoragedatalake.dfs.core.windows.net/silverlayer/Adventure_Calendar/',
        FORMAT = 'PARQUET'

  ) as quer1


CREATE VIEW gold.product_categories
AS
SELECT *
FROM
OPENROWSET(
    BULK'https://pknstoragedatalake.dfs.core.windows.net/silverlayer/AdventureWorks_Product_Categories/',
    FORMAT='PARQUET'
)
as quer2


CREATE VIEW gold.product_sub_categories
AS
SELECT *
FROM
OPENROWSET(
    BULK'https://pknstoragedatalake.dfs.core.windows.net/silverlayer/AdventureWorks_Product_Sub_Categories/',
    FORMAT='PARQUET'
)
as quer3


CREATE VIEW gold.returns
AS
SELECT *
FROM
OPENROWSET(
    BULK'https://pknstoragedatalake.dfs.core.windows.net/silverlayer/AdventureWorks_Returns/',
    FORMAT='PARQUET'
)
as quer4

CREATE VIEW gold.Customer
AS
SELECT *
FROM
OPENROWSET(
    BULK'https://pknstoragedatalake.dfs.core.windows.net/silverlayer/Adventure_Customer/',
    FORMAT='PARQUET'
)
as quer7




