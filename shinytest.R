library(shiny)
library(readr)
library(janitor)
library(dplyr)

ui <- fluidPage(
  tableOutput("tb1")
)

server <- function(input, output, session) {
  
  data1 <- reactive({
    read_csv("10_Property_stolen_and_recovered.csv") %>%
      clean_names()
  })
  
  data2 <- reactive({
    data1() %>%
      rename(state_ut = area_name)
  })
  
  output$tb1 <- renderTable({
    data2()
  })
  
}

shinyApp(ui, server)
