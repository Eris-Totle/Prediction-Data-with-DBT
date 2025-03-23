WITH p_data AS (
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
        {{ ref('population_prediction') }}  
),
population_long AS (
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        2020 AS "YEAR", "POPESTIMATE2020" AS "POPULATION"
    FROM population_data
    UNION ALL
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        2021 AS "YEAR", "POPESTIMATE2021" AS "POPULATION"
    FROM population_data
    UNION ALL
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        2022 AS "YEAR", "POPESTIMATE2022" AS "POPULATION"
    FROM population_data
    UNION ALL
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        2023 AS "YEAR", "POPESTIMATE2023" AS "POPULATION"
    FROM population_data
)
SELECT * 
FROM population_long;
