library(shiny)
library(DT)

ui <- fluidPage(
  
  # tableOutput("tbl1")
  dataTableOutput("tbl1")
  
)

server <- function(input, output, session) {
  
  output$tbl1 <- renderDataTable({
    data.frame(x = 1:10000,
               y = 1:10000)
  })
  
}

shinyApp(ui, server)