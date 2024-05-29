library(shiny)
library(shinyjs)
library(bslib)
library(bsicons)
library(shinydashboard)
library(ggplot2)
library(DT)

data <- read.csv("data/data.csv")

# dashboard ui
module_dashboard <- function(id) {
  ns <- NS(id)
  # UI Module
  dashboardPage(
    dashboardHeader(title = "Dashboard Bea Cukai"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Data Bea Cukai", tabName = "data", icon = icon("table"))
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "data",
                fluidRow(
                  box(title = "Data Bea Cukai", width = 12, status = "primary", solidHeader = TRUE,
                      dataTableOutput(NS(id, "table1"))
                  )
                )
        )
      )
    )
  )
}

# dashboard server
server_dashboard <- function(id) {
  moduleServer(id, function(input, output, server) {
    # Server Module
    output$plot2 <- renderPlot({
      ggplot(data, aes(x = Impor.menurut.barang, y = Berat.Bersih.Kg.)) +
        geom_line(color = "red") +
        labs(title = "Jumlah Transaksi", x = "Impor.menurut.barang", y = "Berat.Bersih.Kg.")
    })
    
    output$table1 <- renderDataTable({
      data
    })
  })
}
