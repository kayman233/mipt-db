/*Представления*/

/*1) Представление по среднему рейтингу достопримечательностей города*/
CREATE OR REPLACE VIEW tourism.localities_view AS
SELECT locality,
       AVG(rating) AS rating
FROM tourism.tourist_spots
       LEFT JOIN tourism.ratings
                 ON tourist_spots.id = tourism.ratings.place_id
GROUP BY locality
ORDER BY locality;

/*2) Представление для храмов*/
CREATE VIEW tourism.cathedrals_view AS
SELECT spot_name,
       locality
FROM tourism.tourist_spots
WHERE type = 'Cathedral';

/*3) Самые популярные места*/
CREATE VIEW tourism.most_popular_view AS
SELECT spot_name,
       locality,
       COUNT(rating) AS visits
FROM tourism.tourist_spots
       LEFT JOIN tourism.ratings
                 ON tourist_spots.id = tourism.ratings.place_id
GROUP BY spot_name, locality
ORDER BY COUNT(rating) DESC;

/*Функции и триггеры*/
/*Функция - Уменьшить население у городов с населением свыше 10 миллионов(например чтобы не учитывать часть населения живущих в пригороде)*/
CREATE OR REPLACE FUNCTION tourism.decrease_population (population_limit integer)
RETURNS TABLE(locality_name VARCHAR, population BIGINT) AS $$
  UPDATE tourism.localities
  SET population = population - 1000000
  WHERE population > population_limit;
  SELECT locality_name, population
  FROM tourism.localities
  WHERE population > population_limit;
$$ LANGUAGE SQL;

SELECT * FROM tourism.decrease_population(10000000);

/*Логирование апдейтов на таблицу ratings через триггер и функцию*/
CREATE TABLE tourism.Logs(
  user_nickname VARCHAR,
  rating_id BIGINT,
  rating SMALLINT
);

CREATE OR REPLACE FUNCTION tourism.add_to_log()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO tourism.Logs
    VALUES (OLD.user_nickname, OLD.rating_id, NEW.rating);
    RETURN NEW;
  END IF;
END
$$
LANGUAGE plpgsql;

CREATE TRIGGER rating_trig
  AFTER UPDATE
  ON tourism.ratings
  FOR EACH ROW
  WHEN ( OLD.rating IS DISTINCT FROM NEW.rating)
  EXECUTE PROCEDURE tourism.add_to_log();

UPDATE tourism.ratings SET rating = 6 WHERE rating_id = 117;

SELECT * FROM tourism.logs;
