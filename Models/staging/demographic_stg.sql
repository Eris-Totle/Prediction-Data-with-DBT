WITH demographic_stg AS (
  SELECT 
    "AGE",
    CASE
        WHEN "RACE"=1 THEN 'White'
        WHEN "RACE"=2 THEN 'African_American_Black'
        WHEN "RACE"=3 THEN 'American_Indian_or_Alaska_Native'
        WHEN "RACE"=4 THEN 'Asian'
        WHEN "RACE"=5 THEN 'Native_Hawaiian_or_Other_Pacific_Islander'
        WHEN "RACE"=6 THEN 'Two_or_more_races'
    END AS RACE_CAT,
  
    CASE
        WHEN "ORIGIN"=0 THEN 'Total'
        WHEN "ORIGIN"=1 THEN 'Not_Hispanic'
        WHEN "ORIGIN"=2 THEN 'HISPANIC'
    END AS ORIGIN_CAT,
  
    CASE 
        WHEN "SEX"=0 THEN 'Total'
        WHEN "SEX"=1 THEN 'Male' 
        WHEN "sex"=2 THEN 'Female'
    END AS SEX_CAT,
  
    "ESTIMATESBASE2020", 
    "POPESTIMATE2020", 
    "POPESTIMATE2021", 
    "POPESTIMATE2022", 
    "POPESTIMATE2023"
  FROM {{ ref('Population_Prediction') }} ## for folks interested in running this outside of the staging process - you can replace with "Population_Predictions", or whatever you decide to sent it to postgres as.
)
)
SELECT * 
FROM demographic_stg
