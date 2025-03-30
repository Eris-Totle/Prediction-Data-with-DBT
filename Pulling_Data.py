engine = create_engine('postgresql://username:password@localhost:port/postgres') # these are generic credentials, if you run the project include you'r postgres info. 

df = pd.read_csv('') # As we are using a CSV version for the data here, and if you plan on running this yourself, include the path to where you store the CSV (would benefit if within project directory)

print(df.head()) 

df.to_sql('Population_Prediction', engine, if_exists='replace', index=False)

print("Data has been successfully loaded into PostgreSQL!")
