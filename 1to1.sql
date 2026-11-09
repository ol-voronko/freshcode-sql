CREATE TABLE IF NOT EXISTS "coaches"(
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS "teams"(
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL,
    "coachId" int REFERENCES "coaches"("id")
);

ALTER TABLE "coaches"
ADD FOREIGN KEY ("id")  REFERENCES "teams"("id") DEFERRABLE INITIALLY DEFERRED;


ALTER TABLE "teams"
ADD FOREIGN KEY ("id") REFERENCES "coaches"("id") DEFERRABLE INITIALLY DEFERRED;

INSERT INTO "coaches"("name","id") VALUES('Tom',1);
INSERT INTO "teams"("name","id") VALUES('All',1);
