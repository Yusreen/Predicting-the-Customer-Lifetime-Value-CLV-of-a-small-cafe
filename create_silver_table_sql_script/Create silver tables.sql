-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS clv_silver
LOCATION "/mnt/clvprojectadls/silver";

-- COMMAND ----------

SHOW DATABASES

-- COMMAND ----------

USE clv_silver;

-- COMMAND ----------

SHOW TABLES