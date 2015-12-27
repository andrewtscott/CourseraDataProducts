library(shiny)
library(ggplot2)
library(dplyr)

#Only load the index data once.
IndexData <- read.csv("IndexData.csv")
IndexData$date = as.Date(IndexData$date)

printNumber <- function(number) {
  format(number, digits = 2, nsmall=2, big.mark = ",")
}

shinyServer(
  function(input, output, session) {
    
    reactiveData <- reactive({
      filter(IndexData, date >= input$range[1], date <= input$range[2], index == input$index)
    })
    
    output$showControls <- reactive({
      nrow(reactiveData()) > 0
    })
    
    output$indexPlot <- renderPlot({
      plotTitle = ifelse(input$index == "DJIA", 
                paste("Dow Jones Industrial Average Closing Values (", input$range[1], " - ", input$range[2], ")", collapse = ""),
                paste("S&P 500 Closing Values (", input$range[1], " - ", input$range[2], ")", collapse = ""))
      
      ggplot(reactiveData(), aes(date, value)) + 
        geom_line() + 
        geom_point() +
        labs(title = plotTitle, x = "Day", y = "Closing Value")
    })
    
    output$table <- renderDataTable(reactiveData())
    
    output$daysInRange <- renderText({
      printNumber(nrow(reactiveData()))
    })
    
    output$average <- renderText({
      rData <- reactiveData()
      ifelse(nrow(rData) > 0, printNumber(mean(rData$value)), "N/A")
    })
    
    output$high <- renderText({
      rData <- reactiveData()
      ifelse(nrow(rData) > 0, printNumber(max(rData$value)), "N/A")
    })
    
    output$low <- renderText({
      rData <- reactiveData()
      ifelse(nrow(rData) > 0, printNumber(min(rData$value)), "N/A")
    })
    
    output$pctChange <- renderText({
      rData <- reactiveData() %>%
        arrange(date)
      
      firstValue <- first(rData$value)
      lastValue <- last(rData$value)
      paste(printNumber((lastValue - firstValue) / firstValue * 100), '%', separator = "")
    })
    
    
    ##Code to dynamically change the Min/Max DateRange options based on the chosen Index
    observe({
      x <- input$controller
      rData <- filter(IndexData, index == input$index)
      
      minDate = ifelse(nrow(rData) > 0, min(rData$date), Sys.Date() - 1)
      maxDate = ifelse(nrow(rData) > 0, max(rData$date), Sys.Date())
      
      #ifelse converts the result to int, change it back
      class(minDate) <- class(maxDate) <- "Date" 
      
      updateDateRangeInput(session, "range",
        label = paste("Date range:", x),
        min = as.character(minDate),
        max = as.character(maxDate),
        start = maxDate - 30,
        end = maxDate 
      )
    })
    
    outputOptions(output, "showControls", suspendWhenHidden=FALSE)
    
  }
)