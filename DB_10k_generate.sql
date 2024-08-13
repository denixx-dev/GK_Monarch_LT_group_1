========== HOUSE ========== 
WITH generated_data AS (
    SELECT
        generate_series(1, 5) AS id, 
        FLOOR(RANDOM() * 15 + 1)::INT AS floor_count,
        FLOOR(RANDOM() * 50000 + 1)::INT AS price
)
INSERT INTO house (id, floor_count, price)
SELECT id, floor_count, price
FROM generated_data;


========== PESRON ========== 
WITH generated_data AS (
    SELECT
        generate_series(1, 5) AS id, 
        'Nagruzka' AS first_name,
        'Group1' AS second_name,
        random() < 0.5 AS sex,
        FLOOR(RANDOM() * 80 + 1)::INT AS age,
        FLOOR(RANDOM() * 10000000 + 1)::INT  AS money,
       generate_series(1, 5) AS house_id
)
INSERT INTO person (id, first_name, second_name, sex, age, money, house_id)
SELECT id, first_name, second_name, sex, age, money, house_id
FROM generated_data;


========== CARS ========== 
WITH generated_data AS (
    SELECT
        generate_series(1, 5) AS id,
        (SELECT case WHEN ROUND(RANDOM() * 2 + 1) = 1 THEN 'Toyota'
         WHEN ROUND(RANDOM() * 2 + 1) = 2 THEN 'Land Roverer'
                     ELSE 'Tesla' end ) AS mark,
        'Group1' AS model,
        (SELECT id FROM engine_type ORDER BY RANDOM() LIMIT 1) AS engine_type_id,
        FLOOR(RANDOM() * 5000 + 1)::INT AS price,
        generate_series(1, 5)  AS person_id
)
INSERT INTO car (id, mark, model, engine_type_id, price, person_id)
SELECT id, mark, model, engine_type_id, price, person_id
FROM generated_data;



========== PARKING PLACE ========== 
WITH generated_data AS (
    SELECT
        generate_series(1, 5) AS id,
        random() < 0.5 AS is_covered,
        random() < 0.5 AS is_warm,
        FLOOR(RANDOM() * 3 + 1)::INT AS places_count,
        generate_series(1, 5) AS house_id
)
INSERT INTO parking_place (id, is_covered, is_warm, places_count,house_id)
SELECT id, is_covered, is_warm, places_count,house_id 
FROM generated_data;