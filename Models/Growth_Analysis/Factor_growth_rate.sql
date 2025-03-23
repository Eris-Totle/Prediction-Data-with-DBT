-- models/population_growth.sql

WITH population_diff AS (
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
        "POPESTIMATE2023",
        -- Calculate year-over-year population growth
        ("POPESTIMATE2021" - "POPESTIMATE2020") / NULLIF("POPESTIMATE2020", 0) * 100 AS growth_2021_2020,
        ("POPESTIMATE2022" - "POPESTIMATE2021") / NULLIF("POPESTIMATE2021", 0) * 100 AS growth_2022_2021,
        ("POPESTIMATE2023" - "POPESTIMATE2022") / NULLIF("POPESTIMATE2022", 0) * 100 AS growth_2023_2022
    FROM 
        {{ ref('population_prediction') }}  -- Reference your existing table or source model
)
SELECT * 
FROM population_diff;
