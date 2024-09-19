# Data Mart Implementation (P01) - Decision Support Systems

## Project Overview

This project involves the implementation of a data mart to enhance the efficiency of sales analysis and stock management for World Wide Importers (WWI). The data mart is built upon the operational database provided by the instructor, enabling deep data analysis and the creation of customized reports on sales, stock, and more.

## Business Processes Supported

The database supports the following business processes:
- Customer order management
- Stock maintenance
- Supplier interaction
- Transaction recording

## Project Phases

The project is divided into three main phases:

1. **Data Profiling**: 
   - Identification of relevant database tables.
   - Evaluation of data quality and consistency.
   - Verification of missing, duplicated, or incorrect data.

2. **Dimensional Modeling**: 
   - Definition of key analysis objectives and corresponding reports.
   - Development of a Data Warehouse (DW) matrix listing fact tables, dimensions, and attributes.
   - Creation of an Entity-Relationship (ER) model and data description maps for visual representation.

3. **Extract, Transform, Load (ETL)**:
   - Development of ETL processes using Pentaho Data Integration.
   - Data extraction, transformation, and loading into fact and dimension tables.
   - Documentation of ETL processes and execution of jobs to keep the data mart updated.

## Dimensional Model

The dimensional model includes the following fact tables (TF) and corresponding dimensions:

- **Customer Purchase Facts**:
  - Metrics: Total purchase value by customer.
- **Product Sales Growth Facts**:
  - Metrics: Sales growth percentage.
- **Delivery Method Facts**:
  - Metrics: Number of deliveries by method.
- **Backorder Facts**:
  - Metrics: Number of backorders by product.
- **Order Delivery Time Facts**:
  - Metrics: Average time between order and delivery.

## Data Mart Implementation

The ETL process was executed, transforming and loading data into the data mart. The implementation involved creating and populating the fact and dimension tables to support the analysis needs of WWI.

## Conclusion

The project successfully identified relevant dimensions and facts, resulting in a well-organized data mart. However, some data quality issues were encountered, requiring additional ETL efforts. Future work could explore additional dimensions and metrics to further enhance the data analysis capabilities for WWI.

## Authors

- Nuno Mendes
- Rosário Silva
- Tiago Azevedo
