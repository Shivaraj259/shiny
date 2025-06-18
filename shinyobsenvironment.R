library(shiny)
library(tidyverse)

ui <- fluidPage(
  selectInput("gear","Select",choices=c(3,4,5)),
  tableOutput("tb1"),
  actionButton("btn1",label = "table click"),
  actionButton("btn3",label = "scatter plot click"),
  actionButton("btn2",label = "bar plot click"),
  plotOutput("p1"),
  plotOutput("p2")
  
  
  
)

server <- function(input, output, session) {
  observeEvent(input$btn2,{
   output$p1<-renderPlot({
    mtcars%>%
      filter(gear==input$gear)%>%
      group_by(am) %>% 
      summarise(avg_mpg = mean(mpg,na.rm = TRUE)) %>% 
      ggplot(aes(x=am,y=avg_mpg))+
      geom_col()+
      labs(title=input$mtcars)
  })
  })
 
  
  observeEvent(input$btn3,{
  output$p2<-renderPlot({
    mtcars%>%
      filter(gear==input$gear)%>%
      ggplot(aes(x=hp,y=disp))+
      geom_point()+
      labs(title=input$mtcars)
  })
  })
    
  observeEvent(input$btn1,{
  output$tb1<-renderTable({
    mtcars%>%
      filter(gear==input$gear)
  })
})
}
shinyApp(ui, server)