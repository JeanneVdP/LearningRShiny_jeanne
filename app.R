library(glue)
library(shiny)
library(shinyFeedback)


ui <- fluidPage(
  shinyFeedback::useShinyFeedback(),
  numericInput("n", "n", value = 10),
  textOutput("half")
)

server <- function(input, output, session) {
  half <- reactive({
    isEven <- input$n %% 2 == 0
    shinyFeedback::feedbackWarning("n", !isEven, "Please select an even number")
    req(isEven)
    input$n / 2
  })
  
  output$half <- renderText(half())
}

shinyApp(ui, server)