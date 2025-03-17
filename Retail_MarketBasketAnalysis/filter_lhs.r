library(arules)
transaksi <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/data_transaksi.txt", format="single", sep="\t", cols=c(1,2), skip=1)
mba <- apriori(transaksi)
# Left Hand Side "Gula"
inspect(subset(mba, lhs %in% "Gula"))

# Left Hand Side "Pet Food" dan Right Hand Side "Sirup"
inspect(subset(mba, lhs %in% "Pet Food" & rhs %in% "Sirup"))