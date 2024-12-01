import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as stats
import os

arr = input().split(',')
title = arr[0]
xlabel = arr[1]
BYTES = int(arr[2])
saveFile = arr[3]

try:
    os.remove(saveFile)
except OSError:
    pass

# Bytes of IO to compute throughput
BYTES_ARRAY = [BYTES] * 16

#Get data as DataFrame
df = pd.read_csv("benchmark.csv")
names = df.loc[:, ['name']]

df = df.loc[:, ['real_time']]
df['real_time'] = BYTES_ARRAY / df['real_time']

df2 = pd.read_csv("benchmark_2.csv")
df2 = df2.loc[:, ['real_time']]
df2['real_time'] = BYTES_ARRAY / df2['real_time']

df3 = pd.read_csv("benchmark_3.csv")
df3 = df3.loc[:, ['real_time']]
df3['real_time'] = BYTES_ARRAY / df3['real_time']

df4 = pd.read_csv("benchmark_4.csv")
df4 = df4.loc[:, ['real_time']]
df4['real_time'] = BYTES_ARRAY / df4['real_time']

df5 = pd.read_csv("benchmark_5.csv")
df5 = df5.loc[:, ['real_time']]
df5['real_time'] = BYTES_ARRAY / df5['real_time']

# Get 5 trial data
res = pd.concat([df, df2, df3, df4, df5], axis=1)
#print(res)

# Compute Stats
means = res.mean(axis=1)
sem = res.sem(axis=1)

res['mean'] = means
res['sem'] = sem

# Confidence Interval
lower, upper = [], []
for i in range(16):
    l, r = stats.t.interval(.95, 15, loc=means[i], scale=sem[i])
    lower.append(l)
    upper.append(r)
res['upper'] = upper
res['lower'] = lower


#print(res)


#Plot DataFrame as Line graph
to_plot = names
df = res.loc[:, ['mean']]
to_plot = pd.concat([to_plot, df], axis=1)
#print(to_plot)

cur = to_plot.plot(x='name', y='mean')
cur.errorbar(to_plot['name'], to_plot['mean'], yerr=[res['mean'] - res['lower'], res['upper'] - res['mean']], fmt='none', capsize=5)
plt.xlabel(xlabel)
plt.title(title)
plt.ylabel('Throughput (bytes / ns)')

# Save files
plt.savefig(saveFile, dpi=300);
#plt.show()
