#Menggunakan library arules
library(arules)

#Membaca transaksi dari file data_transaksi2.txt
# transaksi <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/data_transaksi2.txt", format="single", sep="\t", cols=c(1,2), skip=1)
transaksi <- read.transactions(file="Retail_MarketBasketAnalysis/data_transaksi2.txt", format="single", sep="\t", cols=c(1,2), skip=1)

#Menampilkan jumlah kombinasi dari produk yang terdapat pada daftar transaksi yang ada
inspect(apriori(transaksi, parameter = list(support=.03, minlen=2, target='frequent itemsets')))