library(shiny)

ui<-fluidPage(
  #input
  textInput("id1",label = "enter name"),
  textInput("id2",label = "enter place"),
  
  #output
  textOutput("outid1")
)
server <-function(input,output,session){
  output$outid1 <-renderText({
    paste0(input$id1, " is from ", input$id2)
  })
  
}

shinyApp(ui, server)






