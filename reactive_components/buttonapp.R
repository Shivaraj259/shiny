library(shiny)

ui <- fluidPage(
  actionButton("btn", label = "Click"),
  plotOutput("p1")
)

server <- function(input, output, session) {
  
  observe({
    input$btn
    print(paste0("Button Clicked ", input$btn))
    
    output$p1 <- renderPlot({
      plot(mtcars)
    })
    
  })
  
  
}

shinyApp(ui, server)