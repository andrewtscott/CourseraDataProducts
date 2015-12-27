require(markdown)

shinyUI(fluidPage(
  # Application title
  titlePanel("IndexStats"),
  p("An easy tool for viewing stock market index statistics over a selected time period. Please see the Documentation tab for more information."),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("index", "Stock Index:",
                   c("Dow Jones Industrial Average" = "DJIA",
                     "S&P 500" = "SP")),
      dateRangeInput("range", "Analysis Date Range:")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Summary",
          conditionalPanel('output.showControls == true', 
            h3("Plot"),
            fluidRow(
              column(width = 12, plotOutput("indexPlot"))
            ),
            h3("Calculations"),
            fluidRow(
              column(width = 6, 
                p(style="text-align:center;", 
                  tags$b("Days in Range:"), 
                  textOutput("daysInRange", inline = TRUE)
                )
              ),
              column(width = 6, 
                p(style="text-align:center;", 
                  tags$b("Average:"),
                  textOutput("average", inline = TRUE)
                )
              )
            ),
            fluidRow(
              column(width = 6, 
                p(style="text-align:center;", 
                  tags$b("High:"),
                  textOutput("high", inline = TRUE)
                )
              ),
              column(width = 6, 
                p(style="text-align:center;", 
                  tags$b("Low:"),
                  textOutput("low", inline = TRUE)
                )
              )
            ),
            fluidRow(
              column(width = 12, 
                p(style="text-align:center;", 
                  tags$b("Percentage Change:"),
                  textOutput("pctChange", inline = TRUE)
                )
              )
            )
          ),
          conditionalPanel('output.showControls == false', 
            div(class = "alert alert-warning", role="alert", 
              span("There are no results to display for the parameters entered. Please try again.")   
            )
          )
        ),
        tabPanel("Data", 
          conditionalPanel('output.showControls == true',
            dataTableOutput("table")
          ),
          conditionalPanel('output.showControls == false', 
            div(class = "alert alert-warning", role="alert", 
              span("There are no results to display for the parameters entered. Please try again.")   
            )
          )         
        ),
        tabPanel("Documentation", 
          includeMarkdown("documentation.md")
        )
      )
    )
  )
))