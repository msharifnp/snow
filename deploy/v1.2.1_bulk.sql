
CREATE SCHEMA IF NOT EXISTS bulk;

-- create table
 
CREATE OR REPLACE TABLE bulk.bulk.customer
(
ID INT,
FIRST_NAME VARCHAR(30),
LAST_NAME VARCHAR(30),
GENDER VARCHAR(20),
COMPANY VARCHAR(20),
OCCUPATION VARCHAR(100)
);

CREATE OR REPLACE TABLE bulk.bulk.foods
(
FOOD_ID INT,
FOOD_ITEM VARCHAR(20),
PRICE VARIANT
);

CREATE OR REPLACE TABLE bulk.bulk.week_1_sales
(
CUSTOMER_ID INT,
FOOD_ID INT
);

CREATE OR REPLACE TABLE bulk.bulk.week_2_sales
(
CUSTOMER_ID INT,
FOOD_ID INT
);

-- create integration

CREATE OR REPLACE storage integration bulk
TYPE=EXTERNAL_STAGE
STORAGE_PROVIDER=S3
ENABLED=TRUE
STORAGE_AWS_ROLE_ARN='arn:aws:iam::305644124672:role/snowpip'
STORAGE_ALLOWED_LOCATIONS=('s3://foods.snowpip/csv/');

desc integration bulk;

-- create file format

CREATE OR REPLACE FILE FORMAT bulk.bulk.csv
TYPE = 'CSV'
COMPRESSION = 'NONE'
FIELD_DELIMITER = ','
RECORD_DELIMITER = '\n'
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
TRIM_SPACE = TRUE;

-- create stages


CREATE OR REPLACE STAGE bulk.bulk.customers
URL='s3://foods.snowpip/csv/'
STORAGE_INTEGRATION=snowpip
FILE_FORMAT=snowpip.pip.csv;

list @bulk.bulk.customers

-- copy data from stages to table


COPY INTO bulk.bulk.customer
FROM @bulk.bulk.customers
FILE_FORMAT=bulk.bulk.csv
PATTERN='.*Customers.*';


COPY INTO bulk.bulk.foods
FROM @bulk.bulk.customers
FILE_FORMAT=bulk.bulk.csv
PATTERN='.*Foods.*';


COPY INTO bulk.bulk.WEEK_1_SALES
FROM @bulk.bulk.customers
FILE_FORMAT=bulk.bulk.csv
PATTERN='.*Week1_Sales.*';


COPY INTO bulk.bulk.WEEK_2_SALES
FROM @bulk.bulk.customers
FILE_FORMAT=bulk.bulk.csv
PATTERN='.*Week2_Sales.*';





