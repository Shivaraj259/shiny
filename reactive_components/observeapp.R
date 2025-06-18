library(shiny)

ui <- fluidPage(
  titlePanel("Understanding observe() in Shiny"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("num", "Enter a number:", value = 1, min = 1, max = 100),
      actionButton("action", "Click Me")
    ),
    
    mainPanel(
      verbatimTextOutput("valueText"),
      textOutput("actionText"),
      h4("Note:"),
      p("observe() is used to perform side-effects such as printing, logging, or triggering code 
        that does not directly create output in the UI. It does not return any value to the UI.")
    )
  )
)

server <- function(input, output, session) {
  
  # Example 1: Observe numeric input and print its value
  observe({
    print(paste("You entered number:", input$num))
  })
  
  # Example 2: Observe button click and print the click count
  observe({
    print(paste("Action button clicked:", input$action, "times"))
  })
  
  # Render the input values to UI
  output$valueText <- renderText({
    paste("Numeric Input Value:", input$num)
  })
  
  output$actionText <- renderText({
    paste("Action Button Clicked:", input$action, "times")
  })
}

shinyApp(ui = ui, server = server)
