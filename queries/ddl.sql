CREATE TABLESPACE TOURISM_TS OWNER postgres LOCATION '/var/lib/postgresql/data/pg_tblspc';
CREATE DATABASE TOURISM_DB tablespace = TOURISM_TS;

CREATE SCHEMA tourism;

CREATE TABLE tourism.tourist_spots(
  spot_name VARCHAR NOT NULL,
  id BIGINT PRIMARY KEY,
  country VARCHAR,
  locality VARCHAR,
  type VARCHAR
);

CREATE TABLE tourism.countries(
  country_name VARCHAR PRIMARY KEY,
  continent VARCHAR NOT NULL,
  main_language VARCHAR
);

CREATE TABLE tourism.localities(
  locality_name VARCHAR PRIMARY KEY,
  country VARCHAR NOT NULL,
  population BIGINT,
  CONSTRAINT CHK_population CHECK (population >= 0)
);

CREATE TABLE tourism.ratings(
  place_id BIGINT NOT NULL,
  rating_id BIGINT PRIMARY KEY,
  user_nickname VARCHAR,
  rating smallint NOT NULL,
  comment VARCHAR
);

CREATE TABLE tourism.users(
  nickname VARCHAR PRIMARY KEY,
  country_residence VARCHAR,
  city_residence VARCHAR
);

ALTER TABLE tourism.tourist_spots ADD CONSTRAINT spots_country_fk FOREIGN KEY (country) REFERENCES tourism.countries(country_name);
ALTER TABLE tourism.tourist_spots ADD CONSTRAINT spots_locality_fk FOREIGN KEY (locality) REFERENCES tourism.localities(locality_name);

ALTER TABLE tourism.localities ADD CONSTRAINT localities_countries_fk FOREIGN KEY (country) REFERENCES tourism.countries(country_name);

ALTER TABLE tourism.ratings ADD CONSTRAINT ratings_spots_fk FOREIGN KEY (place_id) REFERENCES tourism.tourist_spots(id);
ALTER TABLE tourism.ratings ADD CONSTRAINT ratings_users_fk FOREIGN KEY (user_nickname) REFERENCES tourism.users(nickname);