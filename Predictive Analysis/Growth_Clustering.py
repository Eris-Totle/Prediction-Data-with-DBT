# In progress - Initial clustering for growth analysis using k - prototypes...

import pandas as pd
from sqlalchemy import create_engine

# PostgreSQL connection string from DBT example
db_connection_url = "(Use your postgres creds)"

# Create SQLAlchemy engine
engine = create_engine(db_connection_url)

# Test connection and list the tables
tables = pd.read_sql("SELECT table_name FROM information_schema.tables WHERE table_schema='public'", engine)
print(tables)

# Query sales data
growth_query = '''
SELECT*FROM growth_trends;
'''
df = pd.read_sql(growth_query, engine)

# Display the first few rows
print(df.head())

df['REGION']=df['REGION'].astype('category')

from kmodes.kprototypes import KPrototypes

X = df[['REGION', 'STATE', 'growth_2021_2020', 'growth_2022_2021', 'growth_2023_2022']].values

kproto = KPrototypes(n_clusters=3, init='Cao', verbose=2)
clusters = kproto.fit_predict(X, categorical=[0, 1])

df['cluster'] = clusters

print(df)
