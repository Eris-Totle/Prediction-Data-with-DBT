WITH growth_rate AS (
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        ("POPESTIMATE2021" - "POPESTIMATE2020") / NULLIF("POPESTIMATE2020", 0) * 100 AS growth_rate_2021_2020,
        ("POPESTIMATE2022" - "POPESTIMATE2021") / NULLIF("POPESTIMATE2021", 0) * 100 AS growth_rate_2022_2021,
        ("POPESTIMATE2023" - "POPESTIMATE2022") / NULLIF("POPESTIMATE2022", 0) * 100 AS growth_rate_2023_2022
    FROM 
        {{ ref('population_prediction') }}
)
SELECT 
    "REGION",
    "STATE",
    AVG(growth_rate_2021_2020) AS avg_growth_rate_2021_2020,
    AVG(growth_rate_2022_2021) AS avg_growth_rate_2022_2021,
    AVG(growth_rate_2023_2022) AS avg_growth_rate_2023_2022
FROM growth_rate
GROUP BY 
    "REGION", 
    "STATE";
