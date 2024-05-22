library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

# homepage ui
module_homepage <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    h1("Welcome to Our Family!"),
    img(src='family.png', width=1000),
    hr(),
    h2("About"),
    p("
      Halilintar adalah website yang dibuat untuk menghitung serta menampilkan estimasi
      biaya pada proses bea cukai. Pendirian Halilintar dilatarbelakangi oleh perdagangan 
      internasional yang berpengaruh besar dalam mendorong pertumbuhan ekonomi dan meningkatkan 
      kesejahteraan masyarakat. Namun, banyak pelaku usaha yang mengalami kesulitan akibat 
      kompleksitas proses bea cukai yang sering kali menjadi hambatan. Halilintar didirikan 
      bermotivasi untuk pentingnya mendukung pelaku usaha, khususnya Usaha Mikro, Kecil, dan 
      Menengah (UMKM), dalam kegiatan ekspor dan impor."),
    h3("Tujuan yang melandasi dibentuknya Halilintar yakni antara lain:"),
    tags$ol(
      tags$li("Memberikan estimasi biaya bea cukai."),
      tags$li("Meminimalisir risiko finansial yang tidak terduga akibat ketidakpastian biaya."),
      tags$li("Membantu eksportir dan importir dalam mengkalkulasi total biaya yang harus dikeluarkan."),
      tags$li("Membantu UMKM melakukan ekspor dan impor barang dengan menyediakan informasi dan layanan yang mudah digunakan."),
      tags$li("Meningkatkan transparansi dan memudahkan importir memahami kewajiban mereka serta proses bea cukai. "),
    ),
    p("Dengan adanya Halilintar, diharapkan ke depannya akan terjadi 
      peningkatan efisiensi dan efektivitas dalam proses perdagangan internasional. 
      Halilintar bertujuan untuk menjadi solusi yang andal bagi pelaku usaha dalam mengatasi 
      tantangan bea cukai, sehingga dapat mendorong lebih banyak UMKM untuk terlibat dalam pasar global. 
      Manfaat lain yang diharapkan adalah peningkatan pemahaman pelaku usaha mengenai regulasi 
      dan prosedur bea cukai, serta terciptanya lingkungan bisnis yang lebih transparan dan terstruktur.")
  )
}

# server
server_xxx <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    
  })
}
