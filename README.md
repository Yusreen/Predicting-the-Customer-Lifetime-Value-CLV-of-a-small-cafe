## Project Overview

Customer Lifetime Value (CLV) is a crucial metric for businesses to understand how valuable each customer is over their entire relationship with the brand. For a cafe, CLV can help determine how much revenue a customer will likely generate, allowing for targeted marketing, personalized offers, and improving customer retention strategies.
This project involves calculating the CLV for a cafe based on customer transaction data, using a structured approach called Medallion Architecture to manage and process data efficiently. The goal is to create an automated pipeline for incremental data processing and CLV calculation, allowing the business to derive actionable insights and make data-driven decisions.

## Solution Architecture
![image](https://github.com/user-attachments/assets/a91c85c6-c766-4c5b-9318-cdb4bd86d207)


## Datasets Used

The project is based on the following datasets:

1. Transaction Data:

- Customer ID: A unique identifier for each customer.

- Transaction Date: The date the transaction occurred.

- Transaction Amount: The total amount spent by the customer in the transaction.

- Item Purchased: A description of the items purchased (e.g., coffee, pastry).

- Discount Applied: The discount applied during the transaction, if any.

2. Customer Data:
   
- Customer ID: A unique identifier for each customer.

- Signup Date: The date the customer signed up for the loyalty program (if applicable).

- Loyalty Program Status: A flag or status indicating whether the customer is part of the loyalty program.

3. Visit Frequency:
   
- Customer ID: A unique identifier for each customer.

- Number of Visits in the Last Year: The total number of visits the customer made to the cafe over the past year.

4. Discounts/Promotions:
   
- Transaction Date: The date the transaction occurred.

- Discount Applied: The discount applied during the transaction, if any.

## Medallion Architecture Overview

This project follows the Medallion Architecture for data processing, which involves organizing data into three layers:

- Bronze Layer (Raw Data): This is where all the raw, unprocessed transactional data is stored. It contains the data as-is, without any transformations.

- Silver Layer (Cleaned and Transformed Data): In this layer, data is cleaned and enriched. We perform necessary transformations, such as renaming columns, adding ingestion_date in all datasets.

- Gold Layer (Aggregated Data): This layer contains business-ready, aggregated data for reporting and analysis. [see feature engineering for more information]
   


## Project Steps and Workflow

The project follows the following key steps to calculate CLV and incrementally update the datasets:

### 1. Data Ingestion (Bronze Layer). 
- Raw transaction, customer, visit frequency, and discount data are ingested and stored in the Bronze Layer.

- The raw data is stored in Azure Data Lake or Azure Blob Storage in formats like Parquet or Delta Lake to optimize storage and enable schema evolution.

### 2. Data Transformation (Silver Layer)
   
- The raw data is cleaned, transformed, and enriched in the Silver Layer.

- Data from multiple sources (Transaction Data, Customer Data, Visit Frequency, Discounts) is joined based on Customer ID.

### Feature engineering is performed to create useful features such as:

1. average customer spending
2. clv estimate
3. item purchased
4. loyalty spending
5. signup date analysis
6. spending loyalty status
7. spending per day

### 3. Incremental Loads
   
Data is incrementally loaded using timestamps or unique identifiers like Transaction Date or Customer ID.

Each incremental load updates only the new or modified records from the previous load, reducing the processing time and resource usage.

In the Silver Layer, a MERGE operation is used to update customer profiles and transactional data based on new data from the Bronze Layer.

Metadata Tables are used to track the last processed date to ensure that only new or updated records are processed during each incremental load.

### 4. CLV Calculation (Gold Layer)
    
In the Gold Layer, aggregated business metrics are calculated, such as:

- Retention analysis

- Spending analysis


### 5. Reporting and Insights
The following visualizations were created:
### Retention Analysis
1. #### CLV

 ![image](https://github.com/user-attachments/assets/cc5890fc-58a4-4e37-93d2-b5506ede1d77)

 2. #### Churn Prediction
![ChurnPrediction](https://github.com/user-attachments/assets/0bbf9c1f-06e6-43bc-b595-da748b874ef9)

### Spending Analysis
1. #### Item purchased
![ItemPurchased](https://github.com/user-attachments/assets/74655695-27ac-48dc-9be5-48e7f68330c4)

2. #### Average spending per week
![AverageSpendingPerWeek](https://github.com/user-attachments/assets/7d75ba6f-f23e-4bc7-9805-37da0a4c2251)

3. #### Average spending per visit
![AverageSpendingPerVisit](https://github.com/user-attachments/assets/60e9e1c4-1822-49af-a16b-ec42d8ce294c)

4. #### Average spending per loyalty status
![AverageSpendingPerLoyalStatus](https://github.com/user-attachments/assets/59af4014-daaa-46fd-baeb-b81a1156e2e1)








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


## Getting Started

### Prerequisites

Azure subscription (for using Azure Data Lake, Azure Databricks, and Azure Synapse Analytics).


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
