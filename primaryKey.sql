-- messages
--встановлення модулю для генерації uuid в даному випадку надлишково
--CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "chats";

CREATE TABLE IF NOT EXISTS "chats"(
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL CHECK("name"!=''),
    "ownerId" int REFERENCES "users"("id"),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO "chats"("name","ownerId") VALUES ('Work',1),('life',2),('joke',3);


DROP TABLE IF EXISTS "users_to_chat";

CREATE TABLE IF NOT EXISTS "users_to_chat"(
    "chatId" int REFERENCES "chats"("id"),
    "userId" int REFERENCES "users"("id"),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY ("chatId","userId")
);


DROP TABLE IF EXISTS "messages";

CREATE TABLE IF NOT EXISTS "messages"(
    --"id" uuid PRIMARY KEY DEFAULT uuid_generate_v1(),
    "id" bigserial PRIMARY KEY,
    "body" varchar(2048) CHECK("body"<>'') NOT NULL,
    "authorId" int,
    "chatId" int,
    "createdAt" timestamp NOT NULL  DEFAULT current_timestamp,
    "isRead" boolean  DEFAULT false,
      FOREIGN KEY ("authorId", "chatId") REFERENCES "users_to_chat" ("userId",  "chatId")
);

INSERT INTO "messages" ("body","authorId")
 VALUES
('Hello',2),
('Hello',1),
(')))',4);