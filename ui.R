library(shiny)
Sys.setenv(LANG="en")
Sys.setlocale(local="en_US.UTF-8")

shinyUI(fluidPage(
  titlePanel("DevelopingDataProducts"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input Stock Symbol."),
    
      textInput("symb", "Symbol", "SPY"),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE),
      
      checkboxInput("adjust", 
        "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(plotOutput("plot"))
  )
))