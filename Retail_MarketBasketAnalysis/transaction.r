# Block Spesific Lines on this code for more select-based code instead of running all code
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

#Tampilan item frequency plot
itemFrequencyPlot(transaksi)

#Menggunakan inspect terhadap transaksi
inspect(transaksi)

#Menghasilkan associaton rules
apriori(transaksi)

#Menghasilkan association rules dan disimpan sebagai variable mba
mba <- apriori(transaksi)

#Melihat isi dari rules dengan menggunakan fungsi inspect
inspect(mba)

#Menghasilkan association rules dan disimpan sebagai variable mba
aba <- apriori(transaksi)

#Filter rhs dengan item "Sirup" dan tampilkan 
inspect(subset(aba, rhs %in% "Sirup"))