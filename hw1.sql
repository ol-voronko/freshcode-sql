DROP TABLE IF EXISTS  products;
CREATE TABLE IF NOT EXISTS products(
    "product_name" varchar(64) NOT NULL CHECK ("product_name"!='') UNIQUE,
    "price" numeric(7,2) NOT NULL CHECK("price">0 AND "price"<=10000),
    "production_date" date CHECK("production_date"<= current_date),
    "amount" smallint NOT NULL CHECK("amount">=0 AND "amount"<=1000) DEFAULT 0,
    "currency" char(3)NOT NULL CHECK(length("currency")=3 AND "currency"=upper("currency") ) DEFAULT 'UAH',
    "is_sale" boolean NOT NULL DEFAULT false

);

INSERT INTO products ("product_name", "price", "production_date", "amount")
 VALUES
('bread',56.5, '2026-11-07',10),
('tuna fresh',5000.99,'2026-08-12',250);

INSERT INTO products VALUES
('IPhone',9999.99,'2025-10-25',1000,'EUR',true);
