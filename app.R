library(shiny)
library(glue)

# exercise 2

xValues <- c(1:10)
yValues <- c(2:11)
zValues <- c(10:1)

ui <- fluidPage(
  titlePanel("Two plots"),
  fluidRow(column(6, plotOutput("xAndY")),
           column(6, plotOutput("xAndZ"))
  )
)


server <- function(input, output, session) {
  output$xAndY <- renderPlot({
    plot(xValues, yValues)
  },
  res = 96)
  
  output$xAndZ <- renderPlot({
    plot(xValues, zValues)
  },
  res = 96)
}

shinyApp(ui, server)