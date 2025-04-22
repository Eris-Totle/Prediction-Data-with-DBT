WITH Percent_Differences AS
(
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        SUM(("POPESTIMATE2021" - "POPESTIMATE2020") / NULLIF("POPESTIMATE2020", 0) * 100) AS Percent_Change_2021_2020, 
        SUM(("POPESTIMATE2022" - "POPESTIMATE2021") / NULLIF("POPESTIMATE2021", 0) * 100) AS Percent_Change_2022_2021, 
        SUM(("POPESTIMATE2023" - "POPESTIMATE2022") / NULLIF("POPESTIMATE2022", 0) * 100) AS Percent_Change_2023_2022, 
        SUM(("POPESTIMATE2023" - "POPESTIMATE2020") / NULLIF("POPESTIMATE2020", 0) * 100) AS Percent_Change_2023_2020 
    FROM 
        {{ source('raw_data', 'Population_Prediction') }}  
    GROUP BY 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE"
)

SELECT * FROM Percent_Differences
