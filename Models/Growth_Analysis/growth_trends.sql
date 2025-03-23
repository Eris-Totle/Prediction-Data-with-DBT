WITH growth_trends AS (
    SELECT 
        "REGION", 
        "STATE", 
        ("POPESTIMATE2021" - "POPESTIMATE2020") / NULLIF("POPESTIMATE2020", 0) * 100 AS growth_2021_2020,
        ("POPESTIMATE2022" - "POPESTIMATE2021") / NULLIF("POPESTIMATE2021", 0) * 100 AS growth_2022_2021,
        ("POPESTIMATE2023" - "POPESTIMATE2022") / NULLIF("POPESTIMATE2022", 0) * 100 AS growth_2023_2022
    FROM 
        {{ ref('population_prediction') }}
)
SELECT 
    "REGION", 
    "STATE", 
    growth_2021_2020,
    growth_2022_2021,
    growth_2023_2022
FROM growth_trends;