library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

# ui
module_kurs <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    h2("Kurs"),
    p("Berikut adalah kurs yang digunakan dalam perhitungan bea cukai"),
    tags$embed(src="https://fiskal.kemenkeu.go.id/files/kurs/file/1717492941_nilai_kurs_sebagai_dasar_pelunasan_bea_masuk,__pajak_pertambahan_nilai_barang_dan_jasa_dan_pajak__penjualan_atas_barang_mewah,_bea_keluar,_dan_pajak_penghasilan_yang_berlaku_untuk_tanggal_5_juni_2024_sampai_d.pdf", width="800px", height="1200px"),
  )
}

# server
server_kurs <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    
  })
}
