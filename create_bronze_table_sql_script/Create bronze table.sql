-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS clv_bronze;

-- COMMAND ----------

DESCRIBE DATABASE EXTENDED clv_bronze

-- COMMAND ----------

show databases

-- COMMAND ----------


CREATE TABLE IF NOT EXISTS clv_bronze.customer_info(
CustomerId String,
SignupDate Date,
LoyaltyStatus String)
USING CSV
options(path = '/mnt/clvprojectadls/bronze/customer_info.csv',header='True', inferSchema='True')

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS clv_bronze.discounts_data(
CustomerId String,
TransactionDate DATE,
DiscountAmount Double)
USING CSV
options(path = '/mnt/clvprojectadls/bronze/discounts_data.csv',header='True', inferSchema='True')

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS clv_bronze.visit_frequency(
CustomerId String,
VisitCount Integer
)
USING CSV
options(path = '/mnt/clvprojectadls/bronze/visit_frequency.csv',header='True', inferSchema='True')

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS clv_bronze.transaction_data(
CustomerId String,
TransactionDate Date,
TransactionAmount Double,
ItemPurchased String)
USING CSV
options(path = '/mnt/clvprojectadls/bronze/transaction_data.csv',header='True', inferSchema='True')

-- COMMAND ----------

