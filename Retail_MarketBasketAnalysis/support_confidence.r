library(arules)
library(arulesViz)
# transaksi <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/data_transaksi.txt", format="single", sep="\t", cols=c(1,2), skip=1)
transaksi <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/data_transaksi.txt", format="single", sep="\t", cols=c(1,2), skip=1)
apriori(transaksi,parameter = list(supp = 0.1, confidence = 0.5))
inspect(mba)

# Left Hand Side "Teh Celup" atau Right Hand Side "Teh Celup"
subset(mba, lhs %in% "Teh Celup" | rhs %in% "Teh Celup")

# Inspect subset
inspect(subset(mba, lhs %in% "Teh Celup" | rhs %in% "Teh Celup"))

# Filter lift > 1
subset(mba, (lhs %in% "Teh Celup" | rhs %in% "Teh Celup") & lift>1)

# Inspect subset
inspect(subset(mba, (lhs %in% "Teh Celup" | rhs %in% "Teh Celup") & lift>1))

# Filter lhs "Pet Food" dan rhs "Gula"
subset(mba, (lhs %ain% c("Pet Food", "Gula" )))

# Inspect subset
inspect(subset(mba, (lhs %ain% c("Pet Food", "Gula" ))))

# Filter lift > 1.1 dan tampilkan dalam bentuk graph
plot(subset(mba, lift>1.1), method="graph")