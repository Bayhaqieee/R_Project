library(arules)
# transaksi <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/data_transaksi.txt", format="single", sep="\t", cols=c(1,2), skip=1)
transaksi <- read.transactions(file="Retail_MarketBasketAnalysis/data_transaksi3.txt", format="single", sep="\t", cols=c(1,2), skip=1)
transaksi@itemInfo
transaksi@itemsetInfo
transaksi@data

# Item Frequency
itemFrequency(transaksi)
itemFrequency(transaksi, type="absolute") # absolute frequency
itemFrequency(transaksi, type="relative") # relative frequency