library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)
library(shinydashboard)
library(ggplot2)
library(dplyr)

data <- read.csv("data/impor_menurut_barang.csv")

# dashboard ui
module_dashboard <- function(id) {
  ns <- NS(id)
  # UI Module
  dashboardPage(
    # Header
    dashboardHeader(title = "Dashbaord Bea Cukai"),
    
    # Sidebar
    dashboardSidebar(
      sidebarMenu(
        menuItem("Grafik", tabName = "grafik", icon = icon("dashboard")),
        menuItem("Data", tabName = "data", icon = icon("th"))
      )
    ),
    
    # Body
    dashboardBody(
      tabItems(
        tabItem(tabName = "grafik",
                fluidRow(
                  box(title = "Grafik Bea Cukai", width = 12, status = "primary", solidHeader = TRUE,
                      plotOutput(NS(id, "grafik"))
                  )
                )
        )
      ),
      tabItems(
        tabItem(tabName = "data",
                fluidRow(
                  box(title = "Data Bea Cukai", width = 12, status = "primary", solidHeader = TRUE,
                      dataTableOutput(NS(id, "tabel"))
                  )
                )
        )
      ),
    )
  )
}

# dashboard server
server_dashboard <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    output$grafik <- renderPlot({
      ggplot(data1, aes(x = `Impor menurut barang`, y = `Berat Bersih(Kg)`, fill = `Impor menurut barang`)) +
        geom_bar(stat = "identity", width = 0.5) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
        labs(title = "Impor menurut Jenis Barang", x = "Jenis Barang", y = "Berat Bersih (Kg)")
    })
    
    output$tabel <- renderDataTable({
      data
    })
  })
}
