# Assigning Datasets
# pelanggan <- read.csv("https://storage.googleapis.com/dqlab-dataset/customer_segments.txt", sep="\t")
pelanggan <- read.csv("customer_segments.txt", sep="\t")
pelanggan[c("Jenis.Kelamin","Umur","Profesi","Tipe.Residen")]