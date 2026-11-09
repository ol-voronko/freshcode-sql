DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
    "id" serial PRIMARY KEY,
    "firstName" varchar(32) NOT NULL CHECK("firstName"<>''),
    "lastName" varchar(32) NOT NULL CHECK(length("lastName")>3 AND "lastName"!=''),
    "email" varchar(256)NOT NULL CHECK("email"!='') UNIQUE,
    "height" smallint NOT NULL CHECK("height">100 AND "height"<250),
    "weight" numeric(5,2) CHECK("weight">40 AND "weight"<200),
    "birthday" date CHECK("birthday"<current_date),
    "isMale" boolean NOT NULL DEFAULT true 
);

INSERT INTO users("firstName","lastName","email","height","weight","birthday","isMale") 
VALUES 
('John','Snow','snow@mail.com',188,90,'1981-12-01' ,true),
('RITA','Snow','snow2@mail.com',168,50.5,'1991-12-01' ,false),
('Nef','Sand','sand@mail.com',178,90,'1971-12-01' ,true),
('ox','fjgkhk','vn@mail.com',150,50,'1999-12-03',true);