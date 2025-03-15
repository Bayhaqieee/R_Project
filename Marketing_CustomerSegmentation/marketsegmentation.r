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