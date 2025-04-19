WITH State_Estimates AS (
  SELECT 
    "STATE", 
    "NAME", 
    "ESTIMATESBASE2020", 
    "POPESTIMATE2020", 
    "POPESTIMATE2021", 
    "POPESTIMATE2022", 
    "POPESTIMATE2023"
  FROM {{ ref('Population_Prediction') }}
  WHERE "SEX" = 0 AND "ORIGIN" = 0
)
SELECT * 
FROM State_Estimates;
