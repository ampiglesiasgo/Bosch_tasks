CREATE TABLE sales (
    sales_fact_key   STRING,
    customer_key     STRING,
    material_key     STRING,
    date         DATE,
    quantity         DECIMAL(18,2),
    tgs              DECIMAL(18,2),
    tns              DECIMAL(18,2)
);