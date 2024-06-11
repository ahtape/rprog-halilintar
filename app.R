library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

source("modules/module-home.R")
source("modules/module-kalkulator.R")
source("modules/module-faq.R")
source("modules/module-peraturan.R")
source("modules/module-berita.R")
source("modules/module-kurs.R")
source("modules/module-dashboard.R")

ui <- navbarPage(
  ### Title
  title = img(src="logo.png", width=25),
  
  ### Home page
  nav_panel(
    title = div(bs_icon("house-fill"), "Halilintar"),
    module_homepage("homepage"),
  ),
  
  ### Calculator
  nav_menu(
    title = "Kalkulator Bea Masuk",
    nav_panel(
      title = "Impor Umum",
      module_kalkulator_impor_umum("impor_umum")
    ),
    nav_panel(
      title = "Barang Kiriman",
      module_kalkulator_barang_kiriman("barang_kiriman")
    ),
    nav_panel(
      title = "Barang Bawaan Penumpang",
      module_kalkulator_barang_bawaan("barang_bawaan")
    ),
  ),
  
  ### Dashboard
  nav_panel(
    title = div(bs_icon("speedometer2"), "Dashboard"),
    module_dashboard("dashboard")
  ),
  nav_menu(
    title = "Informasi",
    nav_panel(
      title = "Peraturan",
      module_peraturan("peraturan")
    ),
    nav_panel(
      title = "Berita",
      module_berita("berita")
    ),
    nav_panel(
      title = "kurs",
      module_kurs("Kurs")
    ),
  ),
  nav_panel(
    title = div(bs_icon("question-circle-fill"), "FAQ"),
    module_faq("faq")
  ),
)

server <- function(input, output, session) {
  server_kalkulator_barang_kiriman("barang_kiriman")
  server_kalkulator_impor_umum("impor_umum")
  server_kalkulator_barang_bawaan("barang_bawaan")
  server_faq("faq")
  server_peraturan("peraturan")
  server_berita("berita")
  server_kurs("kurs")
  server_dashboard("dashboard")
}

shinyApp(ui, server)