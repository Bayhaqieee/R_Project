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

# Komponen - Deskripsi - Contoh

# cluster - Vector dari cluster untuk tiap titik data - [1] 2 1 5 5 4 1 2 5 3 3 5 5 2 2 1 3 3 2 3
# centers - Merupakan informasi titik centroid dari tiap cluster, seperti pada bagian "Analisa Hasil Cluster Means" - Lihat contoh pada "Analisa Hasil Cluster Means"
# totss - Total Sum of Squares (SS) untuk seluruh titik data - [1] 10990.97
# withinss - Total Sum of Squares per cluster - [1] 316.73367  58.21123 174.85164 171.67372 108.49735
# tot.withinss - Total penjumlahan dari tiap SS dari withinss - [1] 829.9676
# betweenss - Perbedaan nilai antara totss dan tot.withinss - [1] 10161.01
# size - Jumlah titik data pada tiap cluster - [1] 14  5 12  9 10
# iter - Jumlah iterasi luar yang digunakan oleh kmeans - 2
# ifault - Nilai integer yang menunjukkan indikator masalah pada algoritma - 0 (jika tidak ada masalah)

#Analisa hasil
segmentasi$withinss
segmentasi$cluster
segmentasi$tot.withinss

#Bagian K-Means (Untuk Simulasi Jumlah Cluster dan SS yang Optimal (Elbow Method)) 
set.seed(1)
sse <- sapply(1:10,
function(param_k){
	kmeans(pelanggan[field_yang_digunakan],
		   param_k, nstart=25)$tot.withinss
}
			 )
sse

# Visualisasi Elbow Method
jumlah_cluster_max <- 10
ssdata = data.frame(cluster=c(1:jumlah_cluster_max),sse)
ggplot(ssdata, aes(x=cluster,y=sse)) +
                geom_line(color="red") + geom_point() +
                ylab("Within Cluster Sum of Squares") + xlab("Jumlah Cluster") +
                geom_text(aes(label=format(round(sse, 2), nsmall = 2)),hjust=-0.2, vjust=-0.5) +
  scale_x_discrete(limits=c(1:jumlah_cluster_max))

#Ganti Fokus pada Tipe Pelanggan
#Lengkapi dengan dua vector bernama cluster dan Nama.Segmen 
Segmen.Pelanggan <- data.frame(cluster = c(1,2,3,4,5),Nama.Segmen = c("Silver Youth Gals","Diamond Senior Member","Gold Young Professional","Diamond Professional","Silver Mid Professional"))

#Menggabungkan seluruh aset ke dalam variable Identitas.Cluster
Identitas.Cluster <- list(Profesi=Profesi, Jenis.Kelamin=Jenis.Kelamin, Tipe.Residen=Tipe.Residen, Segmentasi=segmentasi, Segmen.Pelanggan=Segmen.Pelanggan, field_yang_digunakan=field_yang_digunakan)
saveRDS(Identitas.Cluster,"cluster.rds") #Simpan ke dalam file cluster.rds

# New Data Frame
databaru <- data.frame(Customer_ID="CUST-100", Nama.Pelanggan="Rudi Wilamar",Umur=20,Jenis.Kelamin="Wanita",Profesi="Pelajar",Tipe.Residen="Cluster",NilaiBelanjaSetahun=3.5)
databaru

# Load Cluster
Identitas.Cluster <- readRDS(file="cluster.rds")
Identitas.Cluster

#Masukkan perintah untuk penggabungan data
databaru <- merge(databaru,Identitas.Cluster$Profesi)
databaru <- merge(databaru,Identitas.Cluster$Jenis.Kelamin)
databaru <- merge(databaru,Identitas.Cluster$Tipe.Residen)
databaru

#membuat data baru (Ganti Umur untuk bisa melihat keberadaan data baru di cluster mana)
databaru <- data.frame(Customer_ID="CUST-100", Nama.Pelanggan="Rudi Wilamar",Umur=32,Jenis.Kelamin="Wanita",Profesi="Pelajar",Tipe.Residen="Cluster",NilaiBelanjaSetahun=3.5)

Identitas.Cluster <- readRDS(file="cluster.rds")

databaru <- merge(databaru, Identitas.Cluster$Profesi)
databaru <- merge(databaru, Identitas.Cluster$Jenis.Kelamin)
databaru <- merge(databaru, Identitas.Cluster$Tipe.Residen)

# Menentukan data baru berada di cluster mana
cluster_terdekat <- which.min(sapply(1:5, function(x) sum((databaru[Identitas.Cluster$field_yang_digunakan] - 
                                                            Identitas.Cluster$Segmentasi$centers[x,])^2)))

# Menampilkan nama segmen pelanggan, bukan nomor cluster
Identitas.Cluster$Segmen.Pelanggan[which.min(sapply( 1:5, function( x ) sum( ( databaru[Identitas.Cluster$field_yang_digunakan] - Identitas.Cluster$Segmentasi$centers[x,])^2 ) )), ]