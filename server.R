# server.R

library(quantmod)
source("helpers.R")
library(caret)
library(forecast)
Sys.setenv(LANG="en")
Sys.setlocale(local="en_US.UTF-8")

shinyServer(function(input, output) {

  dataInput<-reactive({
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  finalInput<-reactive({
    if (!input$adjust) return(dataInput())
    adjust(dataInput())
  })
  
  output$plot <- renderPlot({
    d<-finalInput()[,4]
    mod_ts<-bats(d)
    fcast<-forecast(mod_ts, level=95, h=20)
    #chartSeries(finalInput(), theme = chartTheme("white"), 
    #  type = "line", log.scale = input$log, TA = NULL, name=input$symb)
    plot(fcast)
  })
  
})