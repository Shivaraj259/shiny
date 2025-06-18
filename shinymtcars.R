library(shiny)
library(tidyverse)



mtcars
View(mtcars)
ui <- fluidPage(
  selectInput("gear","Select gear",choices=c(3,4,5)),
  plotOutput("barplot"),
  plotOutput("scatterplot")
  
)

server <- function(input, output, session) {
  output$barplot<-renderPlot({
    mtcars%>%
      filter(gear==input$gear)%>%
      group_by(am) %>% 
      summarise(avg_mpg = mean(mpg,na.rm = TRUE)) %>% 
      ggplot(aes(x=am,y=avg_mpg))+
      geom_col()+
      labs(title=input$mtcars)
  })
  
  output$scatterplot<-renderPlot({
    mtcars%>%
      filter(gear==input$gear)%>%
      ggplot(aes(x=hp,y=disp))+
      geom_point()+
      labs(title=input$mtcars)
  })
  
}

shinyApp(ui, server)