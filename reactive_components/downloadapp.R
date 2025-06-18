library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Download ggplot2 Plot Example"),
  sidebarLayout(
    sidebarPanel(
      downloadButton("downloadPlot", "Download ggplot2 Plot")
    ),
    mainPanel(
      plotOutput("ggPlot")
    )
  )
)

server <- function(input, output) {
  
  # Generate ggplot object
  myplot <- reactive({
    ggplot(mtcars, aes(x = wt, y = mpg)) +
      geom_point(color = 'blue', size = 3) +
      labs(title = "MPG vs Weight of Cars", x = "Weight", y = "Miles/(US) gallon")
  })
  
  # Render plot in UI
  output$ggPlot <- renderPlot({
    myplot()
  })
  
  # Download handler using ggsave
  output$downloadPlot <- downloadHandler(
    
    filename = function() {
      paste("mtcars_ggplot", ".png", sep = "")
    },
    content = function(file) {
      # Save the ggplot to the file using ggsave
      ggsave(file, plot = myplot(), device = "png", width = 6, height = 4)
    }
  )
}

shinyApp(ui = ui, server = server)
