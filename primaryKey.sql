-- messages
--встановлення модулю для генерації uuid в даному випадку надлишково
--CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "messages";

CREATE TABLE IF NOT EXISTS "messages"(
    --"id" uuid PRIMARY KEY DEFAULT uuid_generate_v1(),
    "id" bigserial PRIMARY KEY,
    "body" varchar(2048) CHECK("body"<>'') NOT NULL,
    "author" varchar(64) NOT NULL CHECK("author"<>''),
    "createdAt" timestamp NOT NULL  DEFAULT current_timestamp,
    "isRead" boolean  DEFAULT false
);

INSERT INTO "messages" ("body","author")
 VALUES
('Hello','I am'),
('Hello','Me'),
(')))','I am');