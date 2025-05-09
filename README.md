# DBT Population Projection Data

This is an extention/ experiment with engineering tools expanding on use with the Population Prediction dataset. This will eventually lead to automatic the DBT process with scheduled flows via Prefect, but for now will be handling the CSV data sent to Postgres. The corresponding Marts and Staging Models within the directory serve to support useful visualzations of the data, with the Marts preparing the data for predictive analysis. Here, the growth factors Marts will prepare the data for Time-Series Forecasting ([This Tutorial](https://www.kaggle.com/code/prashant111/tutorial-time-series-forecasting-with-prophet) was helpful in supporting time series forecasting with Prophet), Regression Modeling, and Clustering. The predicitve modeling differences will help support prediction based on distinct qualities/ features of the data. Prior to running the visualizations, it's important to pushing the data to postgres if interested in running. You can run the script, queries, predictions, and visualization using this approach outside of the dbt process (jupyter notebooks/ visual studio code) and even wrangle/ analyze in your own way if that's your interest. 

## Project Structure
Below is the structure I used prior to running the project (post run the project directory will change to include new features like logs). Though, the set up below worked great at builing the tables from the corresponding qeuries. 
```
dbt_project
├── dbt_project.yml
├── profiles.yml
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
        ├── state_population.sql
        └── schema.yml
```
# Running the Pipeline

#### 1). Setting up Pipeline. 
You'll need to access the [raw data](https://www.census.gov/programs-surveys/popest/data/data-sets.html)via CSV, sending it to postgres prior to running this project. I've included a working process under the pushing_data.py file. Once the data is in Postgres, set up your project structure accordingly (you can add/ remove models per your preference). Set up your profiles.yml to match the credentials for your PostgreSQL database.

#### 2). Run the Pipline
Once everything is set up, run the pipline in your terminal with:

```dbt run```

#### 3). Test the Pipline

Dbt offers the function to test the integreity of the pipeline with: 

```dbt test```

#### 4). Snapshots

This particular dataset is stationary, though it can be updated through the years. Snapshots of the project process can be used to look at changes in the data over time.

```dbt snapshot```

This would be particularly useful if the project is adjusted to a streaming data source, or refreshed per yearly update of the current data.

## Visualizations and Analysis

I've included some directions for visualizing and analyzing the data, which is based on data resulting from queries. They can be copied and saved as, for example, demographics_stg_view.py. You can then run them directly from the command line: ```python demographics_stg_view.py``` which will create views, prediction values, etc. from the transformed data in the DBT pipeline. 
