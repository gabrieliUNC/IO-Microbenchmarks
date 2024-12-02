import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as stats
import os

arr = input().split(',')
title = arr[0]
xlabel = arr[1]
BYTES = int(arr[2])
saveFile = arr[3]

translate = {4096 : '4k', 8192: '8k', 16384: '16k', 32768: '32k', 65536: '64k', 131072: '128k', 262144: '256k', 524288: '512k', 1048576: '1M', 2097152: '2M', 4194304: '4M', 8388608: '8M', 16777216: '16M', 33554432: '32M', 67108864: '64M', 134217728: '128M'}

try:
    os.remove(saveFile)
except OSError:
    pass





# Bytes of IO to compute throughput
BYTES_ARRAY = [BYTES] * 16


#Get data as DataFrame
df = pd.read_csv("benchmark.csv")
names = df.loc[:, ['name']]
for idx, row in names.iterrows():
    name: str = str(row['name'])
    j = name.find('/')
    name = name[j + 1:]
    row['name'] = translate[int(name)]

df['Throughput'] = df['IO Bytes'] / df['real_time']
df = df.loc[:, ['Throughput']]

df2 = pd.read_csv("benchmark_2.csv")
df2['Throughput'] = df2['IO Bytes'] / df2['real_time']
df2 = df2.loc[:, ['Throughput']]

df3 = pd.read_csv("benchmark_3.csv")
df3['Throughput'] = df3['IO Bytes'] / df3['real_time']
df3 = df3.loc[:, ['Throughput']]


df4 = pd.read_csv("benchmark_4.csv")
df4['Throughput'] = df4['IO Bytes'] / df4['real_time']
df4 = df4.loc[:, ['Throughput']]

df5 = pd.read_csv("benchmark_5.csv")
df5['Throughput'] = df5['IO Bytes'] / df5['real_time']
df5 = df5.loc[:, ['Throughput']]

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
