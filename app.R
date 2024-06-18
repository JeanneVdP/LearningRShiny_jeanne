library(glue)
library(shiny)
library(shinyFeedback)


ui <- fluidPage(
  shinyFeedback::useShinyFeedback(),
  textInput("dataset", "Dataset name"),
  tableOutput("data")
)

server <- function(input, output, session) {
  getData <- reactive({
    req(input$dataset)
    
    doesExist <- exists(input$dataset, "package:datasets")
    shinyFeedback::feedbackDanger("dataset", !doesExist, "Unknown dataset")
    req(doesExist, cancelOutput = FALSE)
    
    get(input$dataset, "package:datasets")
  
  })
  
  output$data <- renderTable({
    head(getData())
  })
}

shinyApp(ui, server)