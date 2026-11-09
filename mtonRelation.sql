DROP TABLE IF EXISTS  "products";
CREATE TABLE IF NOT EXISTS "products"(
    "id" serial PRIMARY KEY,
    "name" varchar(256) NOT NULL CHECK ("name"!='') ,
    "category" varchar(256) NOT NULL CHECK("category"<>''),
    "price" numeric(16,2) NOT NULL CHECK("price">0 ),
    "amount" smallint NOT NULL CHECK("amount">=0 AND "amount"<=1000) DEFAULT 0,
    CONSTRAINT "unique_pair_name_category" UNIQUE("name","category")

);
INSERT INTO "products" ("name", "category", "price", "amount")
VALUES ('egg','eggs',50.5,500),
('milk','milk products',50,300),
('yougurt','milk products',40.8,100),
('cheese','milk products',350.5,500),
('lolly-pop','candy',20.5,500);

DROP TABLE IF EXISTS "orders";

CREATE   TABLE IF NOT EXISTS "orders"(
    "id" bigserial PRIMARY KEY,
    "userId" int REFERENCES "users" ("id"),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO "orders"("userId") VALUES (2),(1),(3);

DROP TABLE  IF EXISTS "products_to_orders";

CREATE TABLE IF NOT EXISTS "products_to_orders"(
    "productId" int REFERENCES "products"("id"),
    "orderId" bigint REFERENCES "orders"("id"),
    "quantity" smallint NOT NULL CHECK("quantity">0) DEFAULT 1,
    PRIMARY KEY ("productId","orderId")
) 

INSERT INTO "products_to_orders" ("productId", "orderId", "quantity")
VALUES 
(1,1,20),
(2,1,1),
(3,1,1),
(5,2,4),
(4,3,10),
(4,2,3),
(5,3,2);