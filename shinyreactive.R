library(shiny)
library(tidyverse)

ui <- fluidPage(
  plotOutput("pl"),
  actionButton("click",label = "click me")
  
)

server <- function(input, output, session) {
  data1 <- reactive({
    print("in data1")
    tibble(x=1:10)
  })
  
  data2 <-reactive({
    print("in data2")
    data1() %>% 
      mutate(y=11:20)
  })
  
  data3 <- reactive({
    print("in data3")
    data2() %>% 
      mutate(z=c(rep("a",5),rep("b",5)))
  })
  
  observeEvent(input$click,{
    print(paste0("button clicked: ",input$click))
    output$pl <- renderPlot({
      print("in renderplot pl")
      data3() %>% 
        ggplot(aes(x,y,colour = z))+
        geom_point(size=10)+
      labs(title = "simple analyzing data")
    })
  })
  
}

shinyApp(ui, server)



