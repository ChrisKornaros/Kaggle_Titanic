-- SQL File for Importing the Raw Data
-- From the CLI, simply use .read file/path/database.duckdb
CREATE TABLE train_raw AS SELECT * FROM 'files/train.csv';
CREATE TABLE test_raw AS SELECT * FROM 'files/test.csv';