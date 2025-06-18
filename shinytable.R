library(shiny)
library(DT)

ui <- fluidPage(
  #tableOutput("table1")
  dataTableOutput("table1")
)

server <- function(input, output, session) {
  output$table1<-renderDataTable(
    data.frame(x=1:1000,
               y=1:1000)
  )
  
}

shinyApp(ui, server)
