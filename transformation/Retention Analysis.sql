-- Databricks notebook source
-- MAGIC %python
-- MAGIC dbutils.widgets.text("p_file_date", "2024-11-01")
-- MAGIC v_file_date = dbutils.widgets.get("p_file_date")

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Customer Lifetime Value (CLV) Estimation

-- COMMAND ----------

-- MAGIC %python
-- MAGIC spark.sql("""
-- MAGIC     CREATE TABLE IF NOT EXISTS clv_gold.clv_estimates (
-- MAGIC         customer_id STRING,
-- MAGIC         estimated_clv DECIMAL(10,2),
-- MAGIC         created_date TIMESTAMP,
-- MAGIC         updated_date TIMESTAMP
-- MAGIC     )
-- MAGIC     USING DELTA
-- MAGIC """)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC spark.sql(f"""
-- MAGIC     CREATE OR REPLACE TEMP VIEW clv_estimates_updated
-- MAGIC     AS 
-- MAGIC     SELECT 
-- MAGIC         t.customer_id,
-- MAGIC         ROUND(AVG(t.transaction_amount) * MAX(v.visit_count), 2) AS Estimated_CLV
-- MAGIC     FROM 
-- MAGIC         clv_silver.transaction_data AS t
-- MAGIC     JOIN 
-- MAGIC         clv_silver.visit_frequency AS v ON t.customer_id = v.customer_id
-- MAGIC     WHERE 
-- MAGIC         t.file_date = '{v_file_date}'
-- MAGIC     GROUP BY 
-- MAGIC         t.customer_id
-- MAGIC     ORDER BY 
-- MAGIC         t.customer_id
-- MAGIC """)
-- MAGIC

-- COMMAND ----------

SELECT *
FROM clv_estimates_updated

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS clv_gold.clv_estimates
USING DELTA
AS 
SELECT 
    t.customer_id,
    ROUND (AVG(t.transaction_amount) * MAX(v.visit_count),2) AS Estimated_CLV
FROM 
     clv_silver.transaction_data AS t 
JOIN 
    clv_silver.visit_frequency AS v ON t.customer_id = v.customer_id
GROUP BY 
    t.customer_id
ORDER BY
t.customer_id

-- COMMAND ----------

MERGE INTO clv_gold.clv_estimates AS target
USING clv_estimates_updated AS source
ON target.customer_id = source.customer_id
WHEN MATCHED THEN 
    UPDATE SET
        target.Estimated_ClV = source.Estimated_CLV, 
        target.updated_date = CURRENT_TIMESTAMP
WHEN NOT MATCHED THEN 
    INSERT (customer_id, estimated_clv, created_date)
    VALUES (source.customer_id, source.Estimated_CLV, CURRENT_TIMESTAMP)


-- COMMAND ----------

SELECT *
FROM clv_gold.clv_estimates