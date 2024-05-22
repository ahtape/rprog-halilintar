library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

source("modules/kurs.R")

### impor umum ui
module_kalkulator_impor_umum <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    h2("KALKULATOR BEA MASUK IMPOR UMUM"),
    numericInput(ns("fob"), "FOB / Cost (Harga Barang)", value = 0),
    numericInput(ns("freight"), "Freight (Biaya Angkut)", value = 0),
    numericInput(ns("asuransi"), "Asuransi", value = 0),
    selectInput(ns("kurs"), "Mata Uang",
                choices = kurs,
                selected = 1),
    numericInput(ns("tarif_bm"), "Tarif Bea Masuk (%)", value = 0),
    numericInput(ns("tarif_ppn"), "Tarif PPN (%)",value = 1),
    selectInput(ns("tarif_pph"), "Tarif PPh (%)",
                choices = list("Non NPWP (15%)", "NPWP / Non API (7,5%)", "API (2,5%)"),
                selected = 1),
    numericInput(ns("tarif_ppnbm"), "PPnBM (%)", value = 0),
    
    h3("RINCIAN PEMBAYARAN"),
    p("Total Bea Masuk"),
    textOutput(NS(id, "bea_masuk")),
    p("Total PPN"),
    textOutput(NS(id, "ppn")),
    p("Total PPh"),
    textOutput(NS(id, "pph")),
    p("Total PPnBM"),
    textOutput(NS(id, "ppnbm")),
    
    h3("-----------------------------------------------"),
    p("Total Bayar"),
    textOutput(NS(id, "total"))
  )
}

# impor umum server
server_kalkulator_impor_umum <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    total_harga <- reactive({
      (input$fob + input$freight + input$asuransi) * as.numeric(input$kurs)
    })
    bea_masuk <- reactive({
      total_harga() * (input$tarif_bm / 100)
    })
    ppn <- reactive({
      (total_harga() + bea_masuk()) * (input$tarif_ppn / 100)
    })
    pph <- reactive({
      x <- switch(input$tarif_pph,
                    "Non NPWP (15%)" = 0.15,
                    "NPWP / Non API (7,5%)" = 0.075,
                    "API (2,5%)" = 0.025)
      (total_harga() + bea_masuk()) * x
    })
    ppnbm <- reactive({
      (total_harga() + bea_masuk()) * (input$tarif_ppnbm / 100)
    })
    
    # Output
    output$bea_masuk <- renderText({
      if (total_harga() != 0) {
        paste(bea_masuk())
      }
    })
    output$ppn <- renderText({
      paste(ppn())
    })
    output$pph <- renderText({
      paste(pph())
    })
    output$ppnbm <- renderText({
      paste(ppnbm())
    })
    output$total <- renderText({
      paste(bea_masuk() + ppn() + pph() + ppnbm())
    })
  })
}


### barang kiriman ui
module_kalkulator_barang_kiriman <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    h2("KALKULATOR BEA MASUK BARANG KIRIMAN"),
    numericInput(ns("fob"), "FOB / Cost (Harga Barang)", value = 0),
    numericInput(ns("freight"), "Freight (Biaya Angkut)", value = 0),
    numericInput(ns("asuransi"), "Asuransi", value = 0),
    selectInput(ns("kurs"), "Mata Uang",
                choices = kurs,
                selected = 1),
    selectInput(ns("bea_masuk"), "Tarif Bea Masuk (%)",
                choices = list("Flat 7,5%"),
                selected = 1),
    
    h3("PERHITUNGAN PAJAK DALAM RANGKA IMPOR"),
    selectInput(ns("ppn"), "Tarif PPN (%)",
                choices = list("Flat 10%"),
                selected = 1),
    
    h3("RINCIAN PEMBAYARAN"),
    p("Total Bea Masuk"),
    textOutput(NS(id, "bea_masuk")),
    p("Total PPN"),
    textOutput(NS(id, "ppn")),
    
    h3("-----------------------------------------------"),
    p("Total Bayar"),
    textOutput(NS(id, "total"))
  )
}

# barang kiriman server
server_kalkulator_barang_kiriman <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    total_harga <- reactive({
      (input$fob + input$freight + input$asuransi) * as.numeric(input$kurs)
    })
    bea_masuk <- reactive({
      total_harga() * 0.075
    })
    ppn <- reactive({
      (total_harga() + bea_masuk()) * 0.1
    })
    
    # Output
    output$bea_masuk <- renderText({
      if (total_harga() != 0) {
        paste(bea_masuk())
      }
    })
    output$ppn <- renderText({
      paste(ppn())
    })
    output$total <- renderText({
      paste(bea_masuk() + ppn())
    })
  })
}


### barang bawaan ui
module_kalkulator_barang_bawaan <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    selectInput(ns("sebagai"), "Anda sebagai?",
                choices = list("Penumpang", "Awak Sarana Pengangkut"),
                selected = 1),
    selectInput(ns("personal"), "Apakah Barang Bawaan Anda merupakan personal use / non-personal use?",
                choices = list("Personal Use", "Non-personal Use"),
                selected = 1),
    numericInput(ns("fob"), "FOB / Cost (Harga Barang)", value = 0),
    selectInput(ns("kurs"), "Mata Uang",
                choices = kurs,
                selected = 1),
    selectInput(ns("tarif_pph"), "Tarif PPh (%)",
                choices = list("Non NPWP (15%)", "NPWP (7,5%)"),
                selected = 1),
    
    h3("RINCIAN PEMBAYARAN"),
    p("Total Bea Masuk"),
    textOutput(NS(id, "bea_masuk")),
    p("Total PPN"),
    textOutput(NS(id, "ppn")),
    p("Total PPh"),
    textOutput(NS(id, "pph")),
    
    h3("-----------------------------------------------"),
    p("Total Bayar"),
    textOutput(NS(id, "total"))
  )
}

# barang bawaan server
server_kalkulator_barang_bawaan <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    personal_use <- reactive({
      x <- switch(input$personal,
                  "Personal Use" = 1, 
                  "Non-personal Use" = 0)
      return(x)
    })
    
    pembebasan <- reactive({
      if (personal_use() == 1) {
        x <- switch(input$sebagai,
                    "Penumpang" = 500 * kurs$USD,
                    "Awak Sarana Pengangkut" = 50 * kurs$USD)
      } else {
        x <- 0
      }
      return(x)
    })
    
    total_harga <- reactive({
      input$fob * as.numeric(input$kurs)
    })
    bea_masuk <- reactive({
      (total_harga() - pembebasan()) * 0.1
    })
    ppn <- reactive({
      (total_harga() + bea_masuk() - pembebasan()) * 0.11
    })
    pph <- reactive({
      x <- switch(input$tarif_pph,
                  "Non NPWP (15%)" = 0.15,
                  "NPWP (7,5%)" = 0.075)
      (total_harga() + bea_masuk() - pembebasan()) * x
    })
    
    # Output
    output$bea_masuk <- renderText({
      if (total_harga() != 0) {
        paste(bea_masuk())
      }
    })
    output$ppn <- renderText({
      paste(ppn())
    })
    output$pph <- renderText({
      paste(pph())
    })
    output$total <- renderText({
      paste(bea_masuk() + ppn() + pph())
    })
  })
}
