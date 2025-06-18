library(shiny)

ui <- fluidPage(
  actionButton("btn",label = "click"),
  plotOutput("pl")
)

server <- function(input, output, session) {
  observe({
    input$btn
    print(paste0("button clicked",input$btn))
    
    output$pl <-renderPlot({
      plot(mtcars)
      })
  })
  
}

shinyApp(ui, server)