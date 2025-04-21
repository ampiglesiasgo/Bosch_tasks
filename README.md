# Bosch tasks

# Task_1 - Data Vault & Dimensional Model

This project implements a Data Vault 2.0 architecture, complemented by a dimensional model to support analytical use cases. 

The solution is organized into three main layers: Raw Vault, Business Vault, and Dimensional Model.

---

### Component Selection:

#### Hubs
- Hubs capture the core business entities using their unique natural business keys. They provide a stable and auditable foundation.
- Examples: hub_customer,hub_material,hub_sales_document.

#### Links
- Links model the relationships or transactions between hubs. They represent interactions such as sales, combining multiple business entities.
- Example: lnk_sales connects customers, materials, and sales documents to represent a sales event.

#### Satellites
- Satellites store descriptive and historical context for hubs or links, enabling data traceability and history tracking.
- Example: Sat_Sales_Measures stores quantitative sales data like amounts, prices, and dates.

---

###  Business Vault
- The bv_kpi_flag.sql file introduces derived business rules and KPIs for easier analysis by business

---

### Dimensional Model Explanation

The Dimensional Model is designed to support fast and intuitive analytics. It transforms the raw, highly normalized Data Vault structure into a more user-friendly star schema, made up of fact and dimension tables.


## 1. Data Vault Model Components

### Raw Vault

| File                      | Type       | Description                                                                 |
|--------------------------|------------|-----------------------------------------------------------------------------|
| `hub_customer.sql`       | Hub        | Defines the unique business key for customers.                             |
| `hub_material.sql`       | Hub        | Represents the unique business key for materials/products.                 |
| `hub_sales_document.sql` | Hub        | Captures the unique identifier of sales documents.                         |
| `lnk_sales.sql`          | Link       | Links customers, materials, and sales documents to model sales events.     |
| `Sat_Sales_Measures.sql` | Satellite  | Stores historical measures and descriptive attributes for sales.           |
| `original_data.sql`      | Raw Load   | Contains untransformed source data, used as the foundation for Raw Vault.  |

---
### Business Vault

| File             | Type                | Description                                                                 |
|------------------|---------------------|-----------------------------------------------------------------------------|
| `bv_kpi_flag.sql`| Calculated / Logical Satellite | Computes business KPIs based on Raw Vault data.                |

### Dimensional Model

| File              | Type        | Description                                                                 |
|-------------------|-------------|-----------------------------------------------------------------------------|
| `dim_customer.sql`| Dimension   | Customer dimension derived from hub and satellite data.                     |
| `dim_material.sql`| Dimension   | Material/product dimension for analytical purposes.                         |
| `sales.sql`       | Fact Table  | Sales fact table derived from satellite measures.                           |


These dimensions allow analysts to group, filter, and aggregate data by meaningful business categories.

### Fact Table

| File      | Purpose                                                                 |
|-----------|-------------------------------------------------------------------------|
| `sales.sql` | Represents measurable business events (e.g., sales transactions), combining metrics from `Sat_Sales_Measures` and keys from links and hubs. |

The fact table serves as the central point of analysis. It is often filtered or grouped by dimensions during reporting.

---
# Task_2 - Data Warehouse Design Proposal

The proposed data model is based on a dimensional star schema, looking for being useful for fast analytical queries and business insights. 
Divided in dimension tables, that have the data from the entities and the fact tables, that will be the ones that link the content of the dimension tables. 

Find the documents and presentation in the folder Task_2 


