library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

# peraturan ui
module_peraturan <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    h2("Peraturan Bea Cukai"),
    p("Berikut adalah peraturan-peraturan terkait Bea Cukai:"),
    tags$ul(
      tags$li(tags$a(href="https://jdih.kemenkeu.go.id/fullText/2006/17TAHUN2006UU.HTM", "1. UNDANG-UNDANG REPUBLIK INDONESIA NOMOR 17 TAHUN 2006 TENTANG PERUBAHAN ATAS UNDANG-UNDANG NOMOR 10 TAHUN 1995 TENTANG KEPABEANAN")),
      tags$li(tags$a(href="https://jdih.kemenkeu.go.id/fullText/2007/39TAHUN2007UU.htm", "2. UNDANG-UNDANG REPUBLIK INDONESIA NOMOR 39 TAHUN 2007 TENTANG PERUBAHAN ATAS UNDANG-UNDANG NOMOR 11 TAHUN 1995 TENTANG CUKAI")),
      tags$li(tags$a(href="https://ftzbbk.bpbatam.go.id/download/PERATURAN-PEMERINTAH-NOMOR-10-TAHUN-2012.pdf", "3. PERATURAN PEMERINTAH NOMOR 10 TAHUN 2012 TENTANG PERLAKUAN KEPABEANAN, PERPAJAKAN, DAN CUKAI SERTA TATA LAKSANA PEMASUKAN DAN PENGELUARAN BARANG KE DAN DARI SERTA BERADA DI KAWASAN YANG TELAH DITETAPKAN SEBAGAI KAWASAN PERDAGANGAN BEBAS DAN PELABUHAN BEBAS")),
      tags$li(tags$a(href="https://jdih.kemenkeu.go.id/FullText/2015/228~PMK.04~2015Per.pdf", "4. PERATURAN MENTERI KEUANGAN REPUBLIK INDONESIA NOMOR 228/PMK.04/2015 TENTANG PENGELUARAN BARANG IMPOR UNTUK DIPAKAI")),
      tags$li(tags$a(href="https://jdih.kemenkeu.go.id/fullText/2017/203~PMK.04~2017Per.pdf", "5. PERATURAN MENTERI KEUANGAN REPUBLIK INDONESIA NOMOR 203/PMK. 04/2017 TENTANG KETENTUAN EKSPOR DAN IMPOR BARANG YANG DIBAWA OLEH PENUMPANG DAN AWAK SARANA PENGANGKUT")),
      tags$li(tags$a(href="https://jdih.kemenkeu.go.id/fullText/2019/21~PMK.04~2019Per.pdf", "6. PERATURAN MENTERI KEUANGAN REPUBLIK INDONESIA NOMOR 21/ PMK.04/2019 TENTANG PERUBAHAN KETIGA ATAS PERATURAN MENTERI KEUANGAN NOMOR 145/PMK.04/ 2007 TENTANG KETENTUAN KEPABEANAN DI BIDANG EKSPOR")),
      tags$li(tags$a(href="https://jdih.kemenkeu.go.id/fullText/2016/179~PMK.04~2016Per.pdf", "7. PERATURAN MENTERI KEUANGAN REPUBLIK INDONESIA NOMOR 179/PMK.04/2016 TENTANG REGISTRASI KEPABEANAN")),
    )
  )
}

# peraturan server
server_peraturan <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    
  })
}
