# 📊 Advanced Data Analytics Project (SQL)

> Advanced SQL analytics built on top of the **Gold layer** of the [SQL Data Warehouse Project](https://github.com/Duddukuri-Avinash/sql-data-warehouse-project) — exploring sales, customer, and product performance using T-SQL.

---

## 📘 Project Overview

This project picks up where the data warehouse leaves off. Using the star-schema **Gold layer** (`gold.fact_sales`, `gold.dim_customers`, `gold.dim_product`), it applies a series of advanced SQL analytics techniques — exploratory analysis, trend analysis, segmentation, and reusable reporting views — to answer real business questions about sales performance and customer behavior.

🎯 This repository demonstrates expertise in:

- Exploratory Data Analysis (EDA) with SQL
- Window functions (running totals, moving averages, LAG/YoY comparisons)
- Customer & Product segmentation
- Building reusable SQL **reporting views**
- Business KPI calculation

---

## 🗄️ Data Source

Built on top of the Gold-layer star schema:

| Table | Description |
|---|---|
| `gold.fact_sales` | Sales transactions (orders, quantity, price, sales amount, dates) |
| `gold.dim_customers` | Customer attributes (name, country, gender, birthdate) |
| `gold.dim_product` | Product attributes (category, subcategory, cost) |

---

## 📂 Repository Structure

```
Advanced-DataAnalytics-project/
│
├── datasets/                          # Source data (gold-layer extracts)
├── docs/                              # Documentation
├── scripts/
│   ├── _database_exploration.sql      # EDA: dimensions, ranges, business metrics
│   ├── _monthly_sales_trends.sql      # Time-series sales trend analysis
│   ├── _cumulative_analysis.sql       # Running totals & moving averages
│   ├── _performance_analysis.sql      # YoY product performance vs. average
│   ├── _part_to_whole_analysis.sql    # Category contribution to total sales
│   ├── _product_cost_segmentation.sql # Cost-range product segmentation
│   ├── gold.report_customers.sql      # Reusable customer analytics view
│   └── gold.report_products.sql       # Reusable product analytics view
├── tests/
└── README.md
```

---

## 🔍 Analysis Modules

### 1. Database Exploration (`_database_exploration.sql`)
Initial EDA over the gold layer — distinct countries/categories, order date range, total sales/quantity/orders, top 5 and bottom 5 products by revenue, top 10 customers by revenue, and customers with the fewest orders.

### 2. Monthly Sales Trends (`_monthly_sales_trends.sql`)
Aggregates sales, customer count, and quantity by month using `DATETRUNC` to identify seasonality and growth patterns.

### 3. Cumulative Analysis (`_cumulative_analysis.sql`)
Uses **window functions** (`SUM() OVER`, `AVG() OVER`) to calculate running total sales and moving average price over time.

### 4. Performance Analysis (`_performance_analysis.sql`)
Compares each product's yearly sales against its **own historical average** and the **previous year** (using `LAG()`), flagging products as "Above Avg" / "Below Avg".

### 5. Part-to-Whole Analysis (`_part_to_whole_analysis.sql`)
Calculates each product category's percentage contribution to overall sales using window aggregates.

### 6. Product Cost Segmentation (`_product_cost_segmentation.sql`)
Buckets products into cost ranges (`Below 100`, `100–500`, `500–1000`, `Above 1000`) and counts products per segment.

### 7. Customer Report View (`gold.report_customers.sql`)
A reusable SQL **view** consolidating customer-level KPIs:
- Customer segmentation (VIP / Regular / New) and age groups
- Total orders, sales, quantity, products purchased, lifespan (months)
- Recency (months since last order), average order value, average monthly spend

### 8. Product Report View (`gold.report_products.sql`)
A reusable SQL **view** consolidating product-level KPIs:
- Revenue-based segmentation (High-Performer / Mid-Range / Low-Performer)
- Total orders, sales, quantity sold, unique customers, lifespan (months)
- Recency, Average Order Revenue (AOR), average monthly revenue

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **SQL Server / T-SQL** | All querying and view creation |
| **SSMS** | Query development and execution |

---

## 🛡 License

This project is licensed under the [MIT License](LICENSE).

## 👤 Author

**Duddukuri Avinash** — B.Tech student, building a data analytics & engineering portfolio.
