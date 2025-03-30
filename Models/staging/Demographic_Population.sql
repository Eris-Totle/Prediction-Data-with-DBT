WITH demographic_estimates AS (
  SELECT 
    "AGE", 
    "RACE",
    "ORIGIN",
    "SEX",
    "ESTIMATESBASE2020", 
    "POPESTIMATE2020", 
    "POPESTIMATE2021", 
    "POESTIMATE2022", 
    "POPESTIMATE2023"
  FROM {{ ref('Population_Prediction') }} ##running this outside of the staging process - you can replace with "Population_Predictions", or whatever you decide to sent it to postgres as.
)
SELECT * 
FROM demographic_estimates;
