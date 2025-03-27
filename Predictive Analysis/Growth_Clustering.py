# In progress - Initial clustering for growth analysis using k - prototypes...

from kmodes.kprototypes import KPrototypes

X = df[['REGION', 'STATE', 'growth_2021_2020', 'growth_2022_2021', 'growth_2023_2022']].values

kproto = KPrototypes(n_clusters=3, init='Cao', verbose=2)
clusters = kproto.fit_predict(X, categorical=[0, 1])

df['cluster'] = clusters

print(df)
