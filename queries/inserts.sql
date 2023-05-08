INSERT INTO tourism.countries(
    country_name,
    continent,
    main_language
)
 VALUES (
    'Russia',
    'Europe',
    'Russian'
),
(
    'The United Kingdom',
    'Europe',
    'English'
),
(
    'The United States of America',
    'North America',
    'English'
),
(
    'Japan',
    'Asia',
    'Japanese'
),
(
    'Korea',
    'Asia',
    'Korean'
),
(
    'Spain',
    'Europe',
    'Spanish'
),
(
    'New Zealand',
    'Australia/Oceania',
    'English'
),
(
    'Sweden',
    'Europe',
    'Swedish'
),
(
    'Angola',
    'Africa',
    'Portuguese'
),
(
    'Brazil',
    'South America',
    'Portuguese'
),
(
    'Israel',
    'Asia',
    'Hebrew'
);

INSERT INTO tourism.localities(
    locality_name,
    country,
    population
)
VALUES
(
    'Moscow',
    'Russia',
    '12500000'
),
(
    'Saint Petersburg',
    'Russia',
    '5350000'
),
(
    'Dmitrov',
    'Russia',
    '61000'
),
(
    'London',
    'The United Kingdom',
    '8500000'
),
(
    'Los Angeles',
    'The United States of America',
    '3900000'
),
(
    'Miami',
    'The United States of America',
    '463000'
),
(
    'Tokyo',
    'Japan',
    '13700000'
),
(
    'Kyoto',
    'Japan',
    '1400000'
),
(
    'Barcelona',
    'Spain',
    '1600000'
),
(
    'Christchurch',
    'New Zealand',
    '375000'
),
(
    'Goteborg',
    'Sweden',
    '570000'
),
(
    'Luanda',
    'Angola',
    '2400000'
),
(
    'Sao Paulo',
    'Brazil',
    '12100000'
),
(
    'Brazilia',
    'Brazil',
    '2400000'
),
(
    'Jerusalem',
    'Israel',
    '857000'
);

INSERT INTO tourism.tourist_spots(
    spot_name,
    id,
    country,
    locality,
    type
)
VALUES
(
    'Moscow Kremlin',
    1,
    'Russia',
    'Moscow',
    'Kremlin'
),
(
    'Bolshoi Theatre',
    2,
    'Russia',
    'Moscow',
    'Theatre'
),
(
    'Sokolniki Park',
    3,
    'Russia',
    'Moscow',
    'Park'
),
(
    'The State Hermitage Museum',
    4,
    'Russia',
    'Saint Petersburg',
    'Museum'
),
(
    'The Lahta Center',
    5,
    'Russia',
    'Saint Petersburg',
    'Skyscraper'
),
(
    'Saint Isaacs Cathedral',
    6,
    'Russia',
    'Saint Petersburg',
    'Cathedral'
),
(
    'Dmitrovs Kremlin',
    7,
    'Russia',
    'Dmitrov',
    'Kremlin'
),
(
    'Tower Bridge',
    8,
    'The United Kingdom',
    'London',
    'Bridge'
),
(
    'Museum of London',
    9,
    'The United Kingdom',
    'London',
    'Museum'
),
(
    'Hollywood sign',
    10,
    'The United States of America',
    'Los Angeles',
    'Sign'
),
(
    'The Vincent Thomas Bridge',
    11,
    'The United States of America',
    'Los Angeles',
    'Bridge'
),
(
    'Miami Beach',
    12,
    'The United States of America',
    'Miami',
    'Beach'
),
(
    'Tokyo Skytree',
    13,
    'Japan',
    'Tokyo',
    'Tower'
),
(
    'Kyoto Imperial Palace',
    14,
    'Japan',
    'Kyoto',
    'Palace'
),
(
    'Kyoto Tower',
    15,
    'Japan',
    'Kyoto',
    'Tower'
),
(
    'Palau Nacional',
    16,
    'Spain',
    'Barcelona',
    'Palace'
),
(
    'ChristChurch  Cathedral',
    17,
    'New Zealand',
    'Christchurch',
    'Cathedral'
),
(
    'Sao Paulo Cathedral',
    18,
    'Brazil',
    'Sao Paulo',
    'Cathedral'
),
(
    'The Garden Tomb',
    19,
    'Israel',
    'Jerusalem',
    'Tomb'
);

INSERT INTO tourism.users(
    nickname,
    country_residence,
    city_residence
)
VALUES
(
    'kayman233',
    'Russia',
    'Dmitrov'
),
(
    'user123',
    'France',
    'Paris'
),
(
    'tourist',
    'Belarus',
    'Gomel'
),
(
    'chingchong',
    'China',
    'Beijing'
),
(
    'xxx_Vasya_xxx',
    'Russia',
    'Moscow'
),
(
    'Maria',
    'Russia',
    'Rostov-on-Don'
),
(
    'Valter',
    'Mexico',
    'Mexico-city'
);

INSERT INTO tourism.ratings(
    place_id,
    rating_id,
    user_nickname,
    rating,
    comment
)

VALUES
(   1,
    101,
    'kayman233',
    10,
    'Cool!'
),
(   3,
    102,
    'kayman233',
    8,
    'A nice place'
),
(   7,
    103,
    'kayman233',
    8,
    'I live here!!'
),
(   1,
    104,
    'user123',
    8,
    ''
),
(   13,
    105,
    'user123',
    8,
    ''
),
(   19,
    106,
    'user123',
    7,
    ''
),
(   15,
    107,
    'user123',
    10,
    ''
),
(   15,
    108,
    'user123',
    10,
    ''
),
(   16,
    109,
    'kayman233',
    9,
    'Amazing'
),
(   13,
    110,
    'chingchong',
    9,
    'Yeee'
),
(   14,
    111,
    'chingchong',
    9,
    'Yee'
),
(   15,
    112,
    'chingchong',
    7,
    'Yeee'
),
(   4,
    113,
    'xxx_Vasya_xxx',
    5,
    'BORING'
),
(   5,
    114,
    'xxx_Vasya_xxx',
    5,
    'BORING'
),
(   6,
    115,
    'xxx_Vasya_xxx',
    5,
    'BORING'
),
(   1,
    116,
    'Maria',
    10,
    'WOW'
),
(   8,
    117,
    'Maria',
    10,
    'UWU'
),
(   9,
    118,
    'Maria',
    10,
    'OWO'
),
(   17,
    119,
    'Maria',
    10,
    'oWo'
),
(   1,
    120,
    'Valter',
    10,
    'Muy bonito'
),
(   10,
    121,
    'Valter',
    9,
    'Me gusta'
),
(   11,
    122,
    'Valter',
    8,
    'Bonito'
),
(   7,
    123,
    'Valter',
    9,
    'Me encanta'
);