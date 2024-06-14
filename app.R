library(shiny)

ui <- fluidPage(
  dataTableOutput("dynamic")
) 

server <- function(input, output, session) {
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
}

# Run the application 
shinyApp(ui = ui, server = server)
