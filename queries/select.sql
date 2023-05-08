/*1. Англоговорящие страны*/
SELECT tourism.countries.country_name
FROM tourism.countries
WHERE countries.main_language = 'English';

/*2. Страны и общее суммарное население по ним*/
SELECT tourism.countries.country_name, SUM(tourism.localities.population)
FROM tourism.countries
INNER JOIN tourism.localities ON tourism.localities.country = tourism.countries.country_name
GROUP BY tourism.countries.country_name
ORDER BY tourism.countries.country_name;

/*3. Рейтинг всех достопримечательностей по убыванию*/
SELECT tourism.tourist_spots.spot_name, avg(tourism.ratings.rating)
FROM tourism.tourist_spots
INNER JOIN tourism.ratings ON tourism.ratings.place_id = tourism.tourist_spots.id
GROUP BY tourism.tourist_spots.spot_name
ORDER BY avg(tourism.ratings.rating) DESC;

/*4. Страны, у которых нет достопримечательностей*/
SELECT tourism.countries.country_name
FROM tourism.countries
FULL JOIN tourism.tourist_spots ON countries.country_name = tourist_spots.country
GROUP BY country_name
HAVING count(tourist_spots.spot_name) = 0;

/*5. Среднияя оценка, поставленная пользователем по убыванию, а если нет оценок, то вывести 0*/
SELECT tourism.users.nickname, ROUND(coalesce(avg(tourism.ratings.rating), 0), 2) AS "average_rating"
FROM tourism.users
FULL JOIN tourism.ratings on users.nickname = ratings.user_nickname
GROUP BY nickname
ORDER BY avg(tourism.ratings.rating) DESC NULLS LAST;

/*6. Вывод населения городов по странам с нарастающим итогом*/
SELECT tourism.localities.locality_name, tourism.localities.country,
       SUM(localities.population) OVER (PARTITION BY localities.country ORDER BY localities.locality_name) AS "total_population"
FROM tourism.localities;

/*7. Вывод нарастающего среденего населения(с округлением)*/
SELECT tourism.localities.locality_name, tourism.localities.country,
       ROUND(AVG(localities.population) OVER (ORDER BY localities.population), 0)AS "average_population"
FROM tourism.localities;
