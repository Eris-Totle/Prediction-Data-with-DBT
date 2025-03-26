-- Setting up for use with prophet
WITH population_data AS (
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        "POPESTIMATE2020",
        "POPESTIMATE2021",
        "POPESTIMATE2022",
        "POPESTIMATE2023"
    FROM 
        "Population_Prediction"  -- Using the table you loaded into PostgreSQL
),
population_long AS (
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        '2020-07-01' AS "DATE", "POPESTIMATE2020" AS "POPULATION"
    FROM population_data
    UNION ALL
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        '2021-07-01' AS "DATE", "POPESTIMATE2021" AS "POPULATION"
    FROM population_data
    UNION ALL
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        '2022-07-01' AS "DATE", "POPESTIMATE2022" AS "POPULATION"
    FROM population_data
    UNION ALL
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        '2023-07-01' AS "DATE", "POPESTIMATE2023" AS "POPULATION"
    FROM population_data
)
SELECT * 
FROM population_long;

