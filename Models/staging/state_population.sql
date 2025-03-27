WITH State_Estimates AS (SELECT "STATE", 
  "NAME", 
  "ESTIMATEBASE2020", 
  "POPULATIONESTIMATE2020", 
  "POPULATIONESTIMATE2021", 
  "POPULATIONESTIMATE2022", 
  "POPULATIONESTIMATE2023", 
  FROM Population_Estimates) SELECT * FROM State_Estimates
