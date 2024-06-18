library(glue)
library(shiny)
library(shinyFeedback)

squareTransformation <- "square"
nonNegativeTransformations <- c("log", "square-root")

ui <- fluidPage(
  numericInput("x", "x", value = 0),
  selectInput("trans", "transformation", choices = append(squareTransformation, 
                                                          nonNegativeTransformations)),
  textOutput("out")
)

server <- function(input, output, session) {
  output$out <- renderText({
    if (input$x < 0 && input$trans %in% nonNegativeTransformations){
      validate("x cannot be negative for this transformation")
    }
    
    switch (input$trans,
      square = input$x ^2,
      "square-root" = sqrt(input$x),
      log = log(input$x)
    )
  })
}

shinyApp(ui, server)