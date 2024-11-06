## Project Overview

Customer Lifetime Value (CLV) is a crucial metric for businesses to understand how valuable each customer is over their entire relationship with the brand. For a cafe, CLV can help determine how much revenue a customer will likely generate, allowing for targeted marketing, personalized offers, and improving customer retention strategies.
This project involves calculating the CLV for a cafe based on customer transaction data, using a structured approach called Medallion Architecture to manage and process data efficiently. The goal is to create an automated pipeline for incremental data processing and CLV calculation, allowing the business to derive actionable insights and make data-driven decisions.

## Datasets Used

The project is based on the following datasets:

1. Transaction Data:

Customer ID: A unique identifier for each customer.

Transaction Date: The date the transaction occurred.

Transaction Amount: The total amount spent by the customer in the transaction.

Item Purchased: A description of the items purchased (e.g., coffee, pastry).

Discount Applied: The discount applied during the transaction, if any.

2. Customer Data:
   
Customer ID: A unique identifier for each customer.

Signup Date: The date the customer signed up for the loyalty program (if applicable).

Loyalty Program Status: A flag or status indicating whether the customer is part of the loyalty program.

3. Visit Frequency:
   
Customer ID: A unique identifier for each customer.

Number of Visits in the Last Year: The total number of visits the customer made to the cafe over the past year.

4. Discounts/Promotions:
   
Transaction Date: The date the transaction occurred.

Discount Applied: The discount applied during the transaction, if any.

## Medallion Architecture Overview

This project follows the Medallion Architecture for data processing, which involves organizing data into three layers:

Bronze Layer (Raw Data): This is where all the raw, unprocessed transactional data is stored. It contains the data as-is, without any transformations.

Silver Layer (Cleaned and Transformed Data): In this layer, data is cleaned and enriched. We perform necessary transformations, such as joining datasets, handling missing values, and creating features like Total Spend, Visit Frequency, and CLV.

Gold Layer (Aggregated Data): This layer contains business-ready, aggregated data for reporting and analysis. Key metrics like Customer Lifetime Value (CLV) and Customer Segmentation are calculated and stored here.

## Project Steps and Workflow

The project follows the following key steps to calculate CLV and incrementally update the datasets:

### 1. Data Ingestion (Bronze Layer). 
Raw transaction, customer, visit frequency, and discount data are ingested and stored in the Bronze Layer.

The raw data is stored in Azure Data Lake or Azure Blob Storage in formats like Parquet or Delta Lake to optimize storage and enable schema evolution.

### 2. Data Transformation (Silver Layer)
   
The raw data is cleaned, transformed, and enriched in the Silver Layer.

Data from multiple sources (Transaction Data, Customer Data, Visit Frequency, Discounts) is joined based on Customer ID.

### Feature engineering is performed to create useful features such as:

Average Transaction Value (ATV)

Total Spend

Customer Tenure

Discount Usage

RFM (Recency, Frequency, Monetary) Analysis is applied to segment customers based on their transaction history.

### 3. Incremental Loads
   
Data is incrementally loaded using timestamps or unique identifiers like Transaction Date or Customer ID.

Each incremental load updates only the new or modified records from the previous load, reducing the processing time and resource usage.

In the Silver Layer, a MERGE operation is used to update customer profiles and transactional data based on new data from the Bronze Layer.

Metadata Tables are used to track the last processed date to ensure that only new or updated records are processed during each incremental load.

### 4. CLV Calculation (Gold Layer)
    
In the Gold Layer, aggregated business metrics are calculated, such as:

Customer Lifetime Value (CLV): Calculated by summing up the Total Spend per customer over their tenure.

Customer Segments: Customers are grouped into segments based on their CLV, visit frequency, and loyalty status.

KPIs: Key performance indicators such as Total CLV, Average CLV per Customer, and Customer Retention Rate are generated.
These metrics are stored in a business-ready format for reporting, dashboarding, and decision-making.

### 5. Reporting and Insights
The aggregated data is used for reporting purposes in Tableau.

Customer Segmentation reports help target different customer groups based on their spending behavior.

Promotions Impact: The effects of discounts or promotions on CLV and visit frequency are analyzed.

## Future Developments

While the current implementation focuses on basic CLV calculations and customer segmentation, there are many areas for future improvement and expansion:

Churn Prediction: Leverage machine learning to predict customer churn based on historical data.

Predictive CLV: Use machine learning models to predict future CLV, considering changes in customer behavior.

Advanced Segmentation: Apply clustering techniques like K-means or DBSCAN to identify more refined customer segments.

Real-time Data Processing: Implement real-time data processing using tools like Azure Stream Analytics or Azure Databricks Structured Streaming to update CLV metrics in near real-time.

Recommendation Systems: Develop recommendation engines to suggest products based on customer purchase history, increasing customer retention and satisfaction.

Cross-Sell/Up-Sell Analysis: Analyze opportunities for cross-selling or up-selling based on customer spending patterns.


### Technologies Used

Azure Data Lake / Azure Blob Storage: Data storage.

Azure Databricks: Data processing and transformation.

Delta Lake: Optimized storage with ACID transactions for incremental loads.

SQL: Data manipulation and transformation.

Power BI: Visualization and reporting.

## Getting Started

### Prerequisites

Azure subscription (for using Azure Data Lake, Azure Databricks, and Azure Synapse Analytics).

Power BI or another reporting tool for visualizations.

Basic knowledge of SQL and data engineering concepts.

### Steps to Run the Project
Set up Azure Data Lake or Azure Blob Storage for storing raw and transformed data.

Load the initial dataset into the Bronze Layer.

Set up Azure Databricks for running the data transformation and aggregation steps.

Implement incremental loading and MERGE operations to keep data up-to-date.

Aggregate customer data and calculate CLV in the Gold Layer.

Create visualizations and insights in Power BI based on the Gold Layer metrics.

### Conclusion

This project demonstrates a scalable and efficient approach to calculating Customer Lifetime Value (CLV) for a cafe using the Medallion Architecture. By implementing incremental loads and leveraging Delta Lake for optimized processing, this solution enables data-driven decision-making, enhanced customer retention strategies, and insights into how to better serve your customer base.
