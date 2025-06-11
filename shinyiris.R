library(shiny)


ui <- fluidPage(
  selectInput("species","Select Species",choices=c("setosa","versicolor","virginica")),
  plotOutput("speciesplot"),
  tableOutput(("speciestable"))
)

server <- function(input, output, session) {
  
  output$speciesplot<-renderPlot({
    iris%>%
      filter(Species==input$species)%>%
      ggplot(aes(x=Sepal.Length,y=Sepal.Width))+
      geom_point()+
      labs(title=input$species)
  })
  
  output$speciestable<-renderTable({
    iris%>%
      filter(Species==input$species)
  })
  
}

shinyApp(ui,server)