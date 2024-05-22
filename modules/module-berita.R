library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)

news_data <- data.frame(
  title = c("Bea Cukai dan Embarkasi Haji 2024", "Bea Cukai dan Penyelundupan Benih Lobster", "Bea Cukai dan Memerangi Barang Ilegal"),
  description = c("Dalam rangka mendukung kelancaran penyelenggaraan ibadah haji, Bea Cukai bekerja sama dengan Saudi Customs terkait pemeriksaan barang bawaan penumpang calon jemaah haji asal Indonesia.",
                  "Bea Cukai Yogyakarta bersama Aviation Security (Avsec) Bandara Internasional Yogyakarta serta maskapai penerbangan Air Asia di Yogyakarta International Airport (YIA) gagalkan penyelundupan benih bening lobster (BBL) sejumlah 80.000 ekor.",
                  "Bea Cukai Yogyakarta adakan pertemuan dengan Detasemen Polisi Militer Denpom IV/2 Yka Pompam IV/Diponegoro dan Badan Narkotika Nasional Provinsi DI Yogyakarta."),
  url = c("https://www.beacukai.go.id/berita/bea-cukai-berikan-pembekalan-aturan-barang-bawaan-penumpang-untuk-embarkasi-haji-2024.html", "https://www.beacukai.go.id/berita/bea-cukai-dan-otoritas-bandara-yogyakarta-gagalkan-penyelundupan-80-000-benih-lobster-ke-malaysia.html", "https://www.beacukai.go.id/berita/bea-cukai-yogyakarta-tingkatkan-sinergi-dengan-instansi-lain-untuk-perangi-barang-ilegal.html")
)

related_news_data <- data.frame(
  title = c("Publik Ramai Kritik Bea Cukai, Ekonom: Itu untuk Kebaikan", "Bea Cukai jadi Sorotan, CITA Sarankan Sejumlah Langkah Perbaikan", "Penerimaan Bea Cukai Raih 95,4 Persen di 2023"),
  url = c("https://bisnis.tempo.co/read/1868352/publik-ramai-kritik-bea-cukai-ekonom-itu-untuk-kebaikan", "https://bisnis.tempo.co/read/1865235/bea-cukai-jadi-sorotan-cita-sarankan-sejumlah-langkah-perbaikan", "https://nasional.tempo.co/read/1817453/penerimaan-bea-cukai-raih-954-persen-di-2023")
)

# berita ui
module_berita <- function(id) {
  ns <- NS(id)
  # UI Module
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        textInput(ns("query"), "Search for News:", value = "Bea Cukai"),
        actionButton(ns("search"), "Search"),
        hr(),
        h4("Related News"),
        uiOutput(NS(id, "related_news"))
      ),
      
      mainPanel(
        h3("News Articles"),
        uiOutput(NS(id, "news_articles"))
      )
    )
  )
}

# berita server
server_berita <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    observeEvent(input$search, {
      query <- input$query
      # Filter the static dataset based on the search query
      filtered_news <- news_data[grepl(query, news_data$title, ignore.case = TRUE) | 
                                   grepl(query, news_data$description, ignore.case = TRUE), ]
      
      output$news_articles <- renderUI({
        articles <- lapply(1:nrow(filtered_news), function(i) {
          tags$div(
            tags$h4(tags$a(href = filtered_news$url[i], target = "_blank", filtered_news$title[i])),
            tags$p(filtered_news$description[i]),
            tags$hr()
          )
        })
        do.call(tagList, articles)
      })
      
      output$related_news <- renderUI({
        related_articles <- lapply(1:nrow(related_news_data), function(i) {
          tags$div(
            tags$p(tags$a(href = related_news_data$url[i], target = "_blank", related_news_data$title[i]))
          )
        })
        do.call(tagList, related_articles)
      })
    })
    
  })
}
