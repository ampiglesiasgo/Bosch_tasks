CREATE TABLE sat_sales_measures (
    sales_lk_hk       STRING,
    billing_doc_date  DATE,
    sales_group       STRING,
    distribution_channel STRING,
    quantity          DECIMAL(18,2),
    tgs               DECIMAL(18,2),
    tns               DECIMAL(18,2),
    load_date         TIMESTAMP,
    record_source     STRING
);