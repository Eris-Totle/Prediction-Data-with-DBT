WITH Yearly_Differences AS
(
    SELECT 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE", 
        SUM("POPESTIMATE2021" - "POPESTIMATE2020") AS Diff_Between_2021_2020, 
        SUM("POPESTIMATE2022" - "POPESTIMATE2021") AS Diff_Between_2022_2021, 
        SUM("POPESTIMATE2023" - "POPESTIMATE2022") AS Diff_Between_2023_2022, 
        SUM("POPESTIMATE2023" - "POPESTIMATE2020") AS Total_difference 
    FROM 
        {{ ref('Population_Prediction') }} 
    GROUP BY 
        "REGION", 
        "STATE", 
        "SEX", 
        "ORIGIN", 
        "RACE", 
        "AGE"
)

SELECT * FROM Yearly_Differences;
