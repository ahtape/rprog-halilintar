library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

pertanyaan <- c("Apa itu Bea Cukai?", 
                "Siapa yang wajib membayar Bea Cukai?", 
                "Bagaimana cara menghitung Bea Cukai?", 
                "Di mana saya bisa mendapatkan informasi lebih lanjut tentang Bea Cukai?", 
                "Bagaimana cara mengurus Bea Cukai?",
                "Apakah yang dimaksud dengan Nilai Pabean untuk penghitungan Bea Masuk?",
                "Mengapa Bea Cukai mengurusi barang kiriman luar negeri?",
                "Kenapa barang kiriman bisa terkena denda?",
                "Apakah ketentuan larangan dan pembatasan impor juga berlaku untuk impor barang kiriman? Bagaimana dengan barang contoh?")

jawaban <- c("Bea Cukai adalah pungutan negara atas barang yang masuk atau keluar dari wilayah pabean Indonesia.", 
             "Bea Cukai wajib dibayar oleh pengimpor, pemilik barang impor titipan, dan pemilik barang impor untuk keperluan pribadi (nilai pabean > Rp1.000.000).", 
             "Bea Cukai = NP x TBM + PPN Impor (NP: Nilai Pabean, TBM: Tarif Bea Masuk, PPN Impor: 11%).", 
             "Website DJ Bea Cukai, Kantor Bea Cukai, Layanan informasi Bea Cukai.", 
             "Melalui SKEP (online) atau Biro Jasa Kepabeanan (BJKS).",
             "Nilai Pabean adalah Nilai dasar yang digunakan untuk menghitung Bea Masuk, dan ditetapkan berdasarkan nilai transaksi barang impor yang bersangkutan sepanjang  memenuhi persyaratan tertentu untuk menggunakan nilai transaksi.",
             "Barang kiriman dari luar negeri merupakan barang impor dan terutang bea masuk. Untuk itu, Pejabat Bea Cukai perlu memastikan bahwa atas pemasukan barang kiriman tersebut telah memenuhi peraturan perundang-undangan dengan melakukan pemeriksaan pabean secara selektif dengan mempertimbangkan risiko yang melekat pada barang dan importir. Selain itu, DJBC memiliki fungsi melindungi masyarakat dari beredarnya barang berbahaya dari Luar Negeri, serta fungsi melindungi industri dalam negeri dan fasilitasi perdagangan. Pengenaan Bea Masuk ini tidak sekedar terkait penerimaan negara, lebih penting lagi merupakan instrumen fiskal untuk mengendalikan barang impor dalam rangka melindungi industri dalam negeri termasuk UMKM.",
             "Menyampaikan pemberitahuan data barang kiriman dengan benar dan menghitung sendiri pungutan Bea Masuk dan PDRI (sistem self assessment), karena yang bersangkutan mengetahui detil jenis, jumlah, dan nilai barang yang sebenarnya. Sebagai konsekuensi self-assessment tersebut, maka importir akan dikenakan sanksi administrasi berupa denda jika terdapat kesalahan pemberitahuan nilai pabean yang mengakibatkan kekurangan pembayaran bea masuk. Hal ini untuk memberikan keadilan bagi importir maupun negara dan menciptakan persaingan yang sehat dengan industri dan UMKM dalam negeri.",
             "Ya. Ketentuan larangan dan pembatasan tetap berlaku untuk impor Barang Kiriman sebagaimana yang diatur oleh kementerian atau instansi teknis terkait. Terdapat beberapa komoditas yang terkena larangan dan pembatasan yang diberikan pengecualian. Terhadap barang contoh tetap berlaku ketentuan larangan dan pembatasan.")

# faq ui
module_faq <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    h1("Frequently Asked Question (FAQ)"),
    selectInput(ns("pertanyaan"), "Pilih Pertanyaan:", pertanyaan),
    uiOutput(NS(id, "jawaban"))
  )
}

# faq server
server_faq <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    output$jawaban <- renderText({
      jawaban[which(pertanyaan == input$pertanyaan)]
    })
  })
}
