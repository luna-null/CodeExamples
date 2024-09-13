import pandas as pd

df = pd.DataFrame({'Category1': {'Apple': 6, 'Grape': 5},
                   'Category2': {'Apple': 3, 'Grape': 2},
                   })

df = df.rename_axis('fruit').reset_index().melt('fruit', var_name='category')
