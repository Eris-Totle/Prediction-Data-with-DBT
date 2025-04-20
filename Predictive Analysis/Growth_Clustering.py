# In progress - Initial clustering for growth analysis using k - prototypes...

import pandas as pd
from sqlalchemy import create_engine
import seaborn as sns
import matplotlib.pyplot as plt
from kmodes.kprototypes import KPrototypes

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

X = df[['REGION', 'STATE', 'growth_2021_2020', 'growth_2022_2021', 'growth_2023_2022']].values

kproto = KPrototypes(n_clusters=3, init='Cao', verbose=2)
clusters = kproto.fit_predict(X, categorical=[0, 1])

df['cluster'] = clusters

print(df.head(10)
print(df['clusters'].value_counts())

# some simple graphs from the output, assuming the project handles the raw data leaving room for further analysis as needed. 

plt.figure(figsize=(12, 6))
sns.countplot(data=df, x='REGION', hue='cluster')
plt.title("Cluster Distribution by Region")
plt.xlabel("Region")
plt.ylabel("Number of States")
plt.legend(title='Cluster')
plt.show()

sns.scatterplot(data=df, x='growth_2022_2021', y='growth_2023_2022', hue='cluster', palette='tab10')
plt.title("Clusters based on Population Growth")
plt.xlabel("Growth 2022–2021")
plt.ylabel("Growth 2023–2022")
plt.show()


