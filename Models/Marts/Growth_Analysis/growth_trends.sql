# prep for k clustering

WITH state_totals AS (
    SELECT 
        "REGION", 
        "NAME", 
        SUM("POPESTIMATE2020") AS pop_2020,
        SUM("POPESTIMATE2021") AS pop_2021,
        SUM("POPESTIMATE2022") AS pop_2022,
        SUM("POPESTIMATE2023") AS pop_2023
    FROM {{ source('raw_data', 'Population_Prediction') }}
    WHERE "SEX" = 0 AND "ORIGIN" = 0
    GROUP BY "REGION", "NAME"
),

growth_trends AS (
    SELECT 
        "REGION", 
        "NAME", 
        (pop_2021 - pop_2020) / NULLIF(pop_2020, 0) * 100 AS growth_2021_2020,
        (pop_2022 - pop_2021) / NULLIF(pop_2021, 0) * 100 AS growth_2022_2021,
        (pop_2023 - pop_2022) / NULLIF(pop_2022, 0) * 100 AS growth_2023_2022
    FROM state_totals
)

SELECT * FROM growth_trends
