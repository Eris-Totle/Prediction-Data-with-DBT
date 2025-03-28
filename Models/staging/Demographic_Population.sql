WITH demographic_estimates AS (
  SELECT 
    "AGE", 
    "RACE",
    "ORIGIN",
    "SEX",
    "ESTIMATEBASE2020", 
    "POPULATIONESTIMATE2020", 
    "POPULATIONESTIMATE2021", 
    "POPULATIONESTIMATE2022", 
    "POPULATIONESTIMATE2023"
  FROM {{ ref('Population_Prediction') }}
)
SELECT * 
FROM demographic_estimates;
