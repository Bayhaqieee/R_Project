# Assigning Datasets
# pelanggan <- read.csv("https://storage.googleapis.com/dqlab-dataset/customer_segments.txt", sep="\t")
pelanggan <- read.csv("customer_segments.txt", sep="\t")
pelanggan[c("Jenis.Kelamin","Umur","Profesi","Tipe.Residen")]

#Buat variable field_yang_digunakan dengan isi berupa vector "Jenis.Kelamin", "Umur" dan "Profesi"
field_yang_digunakan <- c("Jenis.Kelamin","Umur","Profesi")
#Tampilan data pelanggan dengan nama kolom sesuai isi vector field_yang_digunakan
pelanggan[field_yang_digunakan]

#Konversi data menjadi numerik (Guna mempermudah perhitungan, kita akan mengkonversi data kategorikal menjadi numerik)
pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin","Profesi","Tipe.Residen")])
pelanggan_matrix

#Penggabungan data
pelanggan <- data.frame(pelanggan, pelanggan_matrix)
#Tampilkan kembali data hasil penggabungan
pelanggan

#Normalisasi Nilai (Guna mempermudah perhitungan, kita akan melakukan normalisasi pada data numerik yang ada)
pelanggan$NilaiBelanjaSetahun <- pelanggan$NilaiBelanjaSetahun/1000000 
pelanggan

#Mengisi data master (Guna mempermudah kita dalam melakukan analisis data, kita akan membuat data master untuk data kategorikal yang telah kita Encode)
Profesi <- unique(pelanggan[c("Profesi","Profesi.1")])
Jenis.Kelamin <- unique(pelanggan[c("Jenis.Kelamin","Jenis.Kelamin.1")])
Tipe.Residen <- unique(pelanggan[c("Tipe.Residen","Tipe.Residen.1")])

#Bagian K-Means (Membentuk Cluster)
set.seed(1)
#fungsi kmeans untuk membentuk 5 cluster dengan 25 skenario random dan simpan ke dalam variable segmentasi
segmentasi <- kmeans(x=pelanggan[c("Umur","Profesi.1")], centers=5, nstart=25)
#tampilkan hasil k-means
segmentasi

#Penggabungan hasil cluster

segmentasi$cluster
pelanggan$cluster <- segmentasi$cluster
str(pelanggan)

#Analisa hasil
#Filter cluster ke-1
which(pelanggan$cluster == 1)
length(which(pelanggan$cluster == 1))

#Analisa hasil
#Melihat data cluster ke 3-5
pelanggan[which(pelanggan$cluster == 3),] 
pelanggan[which(pelanggan$cluster == 4),] 
pelanggan[which(pelanggan$cluster == 5),]

#Analisa hasil
#Melihat cluster means dari objek
segmentasi$centers

#Membandingkan dengan 2 cluster kmeans, masing-masing 2 dan 5 (Membandingkan hasil cluster dengan 2 dan 5 cluster dari faktor Sum Squared Error (SSE))
set.seed(1)
kmeans(x=pelanggan[field_yang_digunakan], centers=2, nstart=25)
set.seed(1)
kmeans(x=pelanggan[field_yang_digunakan], centers=5, nstart=25)