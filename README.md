# DBT Population Projection Data

This is an extention/ experiment with engineering tools expanding on use with the Population Prediction dataset. This will eventually lead to automatic the DBT process with scheduled flows via Prefect, but for now will be handling the CSV data sent to Postgres. The corresponding Marts and Staging Models within the directory serve to support useful visualzations of the data, with the Marts preparing the data for predictive analysis. Here, the growth factors Marts will prepare the data for Time-Series Forecasting ([This Tutorial](https://www.kaggle.com/code/prashant111/tutorial-time-series-forecasting-with-prophet) was helpful in supporting time series forecasting with Prophet), Regression Modeling, and Clustering. The predicitve modeling differences will help support prediction based on distinct qualities/ features of the data. Prior to running the visualizations, it's important to pushing the data to postgres if interested in running. You can run the script, queries, predictions, and visualization using this approach outside of the dbt process (jupyter notebooks/ visual studio code) and even wrangle/ analyze in your own way if that's your interest. 

## Project Structure
```
dbt_project
└── models
    ├── marts
    │   ├── differences
    │   │   ├── percent_differences.sql
    │   │   └── yearly_differences.sql
    │   └── growth
    │       ├── growth_rate.sql
    │       ├── growth_trends.sql
    │       └── time_series.sql
    └── staging
        ├── demographic_stg.sql
        └── state_population.sql
```
