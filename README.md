# DBT Population Projection Data

This is an extention/ experiment with engineering tools expanding on use with the Population Prediction Data set. This will eventually lead to automatic the DBT process with scheduled flows via Prefect, but for now will be handling the CSV data sent to Postgres. The corresponding Marts and Staging Models within the directory serve to support useful visualzations of the data, with the Marts preparing the data for predictive analysis. Here, the growth factors Marts will prepare the data for Time-Series Forecasting, Regression Modeling, and Clustering. The predicitve modeling differences will help support prediction based on distinct qualities/ features of the data. 

## Project Structure

