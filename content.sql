DROP TABLE IF EXISTS "comment";
DROP TABLE IF EXISTS "reaction";
DROP TABLE IF EXISTS "content";

CREATE TABLE IF NOT EXISTS "content"(
    "id" serial PRIMARY KEY,
    "authorId" int NOT NULL REFERENCES "users"("id"),
    "body" varchar(2048) NOT NULL CHECK(TRIM("body")!=''),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);

CREATE TABLE IF NOT EXISTS "reaction"(
    "authorId" int NOT NULL REFERENCES "users"("id"),
    "contentId" int NOT NULL REFERENCES "content"("id"),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY("authorId","contentId")
);

CREATE TABLE IF NOT EXISTS "comment"(
    "id" serial PRIMARY KEY,
    "authorId" int NOT NULL REFERENCES "users"("id"),
    "contentId" int NOT NULL REFERENCES "content"("id"),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
    "body" varchar(2032) NOT NULL CHECK(TRIM("body")!='')
);