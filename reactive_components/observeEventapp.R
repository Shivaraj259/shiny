library(shiny)

ui <- fluidPage(
  titlePanel("Understanding observeEvent() in Shiny"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("clickMe", "Click Me!"),
      numericInput("num", "Change this number:", value = 1, min = 1, max = 100)
    ),
    
    mainPanel(
      h4("Output when Button is Clicked:"),
      verbatimTextOutput("buttonText"),
      
      h4("Output when Numeric Input Changes:"),
      verbatimTextOutput("numText"),
      
      h4("Note:"),
      p("observeEvent() responds only to specific triggers (e.g., button click)."),
      p("It does NOT automatically react to other input changes unless specified.")
    )
  )
)

server <- function(input, output, session) {
  
  # observeEvent for button click
  observeEvent(input$clickMe, {
    output$buttonText <- renderText({
      paste("Button clicked", input$clickMe, "times!")
    })
  })
  

    output$numText <- renderText({
      paste("Numeric input changed to:", isolate(input$num))
    })

  
  # # observeEvent for numeric input change
  # observeEvent(input$clickMe, {
  #   output$numText <- renderText({
  #     paste("Numeric input changed to:", input$num)
  #   })
  # })
}

shinyApp(ui = ui, server = server)
