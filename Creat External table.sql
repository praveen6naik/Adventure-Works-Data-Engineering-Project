CREATE MASTER KEY  ENCRYPTION BY PASSWORD ='Praveen' 

CREATE DATABASE SCOPED CREDENTIAL cred_pk
WITH IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
  (  
    LOCATION = 'https://pknstoragedatalake.dfs.core.windows.net/silverlayer',
    CREDENTIAL=cred_pk
   
  )

CREATE EXTERNAL DATA SOURCE source_gold
WITH
  (  
    LOCATION = 'https://pknstoragedatalake.dfs.core.windows.net/goldlayer',
    CREDENTIAL=cred_pk
   
  )


CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION= 'extsales',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * from gold.sales

select * from gold.extsales
