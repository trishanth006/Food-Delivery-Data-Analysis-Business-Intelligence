# 🍔 Food Delivery Data Analysis & Business Intelligence

**An End-to-End Data Analytics and Business Intelligence Project using Python, MySQL, and Power BI.**

## 📌 Project Overview

This project focuses on analyzing food delivery operations to understand customer behavior, restaurant performance, order trends, delivery efficiency, and revenue patterns.

The project follows an end-to-end analytics workflow, starting with raw data exploration and transformation in Python, followed by dimensional data modelling and storage in MySQL, and finally building an interactive Power BI dashboard to support business decision-making.

The objective is to transform raw food delivery data into structured, meaningful business insights.

## 🎯 Project Objectives

- Explore and understand food delivery business data.
- Perform data cleaning and transformation using Python.
- Build a structured relational database using MySQL.
- Implement a dimensional data model using fact and dimension tables.
- Validate data quality and database relationships.
- Develop an interactive Power BI dashboard.
- Identify business trends and performance indicators.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Python | Data processing and ETL |
| Pandas | Data cleaning and transformation |
| Jupyter Notebook | Data exploration and development |
| MySQL | Relational database and data modelling |
| SQL | Database creation and data validation |
| SQLAlchemy | Python–MySQL connectivity |
| Power BI | Interactive dashboard and visualization |

## 📂 Project Structure

```text
Food-Delivery-Data-Analysis-Business-Intelligence/
│
├── Food Delivery DashBoard.pbix
│
├── food_delivery_ETL_pipeline.ipynb
│
├── food_delivery_db.sql
│
├── food_delivery_raw.csv
│
└── README.md
```

## 📊 Dataset Overview

The project uses a food delivery dataset containing **21,252 records and 33 columns**.

The dataset includes information about:

- **Customers:** Customer ID, age, gender, area and signup date.
- **Restaurants:** Restaurant ID, name, area, cuisine and ratings.
- **Orders:** Order ID, timestamps, order status and payment methods.
- **Items:** Item ID, item name, category, quantity and unit price.
- **Delivery:** Estimated delivery time, actual delivery time and distance.
- **Financials:** Discounts, delivery fees, packaging fees, GST, tips and final amount.
- **Ratings:** Food ratings and delivery ratings.

## ⚙️ ETL Workflow

### 1. Extract – Data Loading

- Imported the raw CSV dataset using Pandas.
- Created a working copy of the original dataset.
- Inspected dataset dimensions, columns, data types and missing values.

### 2. Transform – Data Processing

Performed data transformations using Pandas:

- Standardized text columns using string operations.
- Handled missing item names using group-based forward and backward filling.
- Converted timestamp columns into appropriate datetime formats.
- Removed duplicate records using unique identifiers.
- Created a separate date dimension with year, month, day, month name, weekday and quarter.
- Separated transactional data into dimension and fact tables.
- Derived order item subtotals using quantity and unit price.
- Applied appropriate data types for database storage.

### 3. Load – MySQL Database

Loaded the transformed datasets into MySQL using SQLAlchemy.

The database follows a dimensional modelling approach with six tables:

| Table | Type | Description |
|---|---|---|
| DIM_CUSTOMERS | Dimension | Customer information |
| DIM_RESTAURANTS | Dimension | Restaurant information |
| DIM_ITEMS | Dimension | Food item information |
| DIM_DATE | Dimension | Calendar attributes |
| FACT_ORDERS | Fact | Order-level transactional data |
| FACT_ORDER_ITEMS | Fact | Individual order item details |

### 4. Data Quality & Validation

Performed validation checks to verify database integrity:

- Checked primary key uniqueness.
- Verified foreign key relationships.
- Identified orphan records using LEFT JOIN.
- Compared record counts across transformed tables.
- Validated relationships between orders, customers, restaurants, dates and items.

## 📈 Power BI Dashboard

The interactive Power BI dashboard provides insights into food delivery business performance through multiple analytical views.

### Dashboard Preview

**1. Overview Dashboard**

<p align="center">
  <img src="https://github.com/user-attachments/assets/a81956cf-6eeb-4258-a6d8-e2afda2fda0e" width="100%" alt="Food Delivery Dashboard Overview"/>
</p>

**2. Customer & Order Analysis**

<p align="center">
  <img src="https://github.com/user-attachments/assets/afbac431-f9e8-4079-ad58-05d32634e4d2" width="100%" alt="Food Delivery Customer and Order Analysis"/>
</p>

**3. Restaurant & Delivery Analysis**

<p align="center">
  <img src="https://github.com/user-attachments/assets/e822b728-a833-4d6c-8e72-b500729c0650" width="100%" alt="Food Delivery Restaurant and Delivery Analysis"/>
</p>

**Dashboard File:** `Food Delivery DashBoard.pbix`

Open the PBIX file using Microsoft Power BI Desktop to explore the interactive report.
