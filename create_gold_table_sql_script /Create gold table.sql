-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS clv_gold
LOCATION "/mnt/clvprojectadls/gold";

-- COMMAND ----------

DESCRIBE DATABASE EXTENDED clv_gold

-- COMMAND ----------

show databases