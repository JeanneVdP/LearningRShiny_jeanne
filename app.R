library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  tableOutput("plot")
) 

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$plot <- renderPlot({
    plot(dataset), res = 96
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
