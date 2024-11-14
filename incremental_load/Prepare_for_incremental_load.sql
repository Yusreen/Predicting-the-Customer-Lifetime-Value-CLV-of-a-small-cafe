-- Databricks notebook source
DROP DATABASE IF EXISTS clv_silver CASCADE

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS clv_silver
LOCATION '/mnt/clvprojectadls/silver';

-- COMMAND ----------

DROP DATABASE IF EXISTS clv_gold CASCADE

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS clv_gold
LOCATION '/mnt/clvprojectadls/gold';