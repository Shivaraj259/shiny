library(shiny)
library(tidyverse)
library(janitor)
library(stringr)
library(lubridate)
library(dplyr)
        

ui <- fluidPage(
  tableOutput("yr_tr")
  
)

server <- function(input, output, session) {
  
  data1<-reactive({
    read_csv("INDIA-AQI-DATA-2015-2020.csv")%>%
  clean_names()->adf1
    
    adf1%>% 
    mutate(year=date %>% year(),
           month=date %>% month(),
           day=date%>%day(),
           week=date %>% week(),
           weekday=date %>% wday(label=T))->adf2
    
    adf2%>% 
      pivot_longer(3:15,names_to = "parameter", values_to = "values") -> afd3
  
  })
  
  output$yr_tr<-renderTable({
    data1() %>% 
      group_by(year,parameter) %>% 
      summarise(mean_value=mean(values,na.rm=T), .groups = "drop")
  })
}

shinyApp(ui, server)