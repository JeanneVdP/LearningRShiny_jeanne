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
  ),
  numericInput("yMultiplication", "y * input", 2, min = 1, max = 10),
  numericInput("zMultiplication", "z * input", 5, min = 1, max = 10)
)


server <- function(input, output, session) {
  output$xAndY <- renderPlot({
    yMultiplied <- yValues * input$yMultiplication
    plot(xValues, yMultiplied)
  },
  res = 96)
  
  output$xAndZ <- renderPlot({
    zMultiplied <- zValues * input$zMultiplication
    plot(xValues, zMultiplied)
  },
  res = 96)
}

shinyApp(ui, server)