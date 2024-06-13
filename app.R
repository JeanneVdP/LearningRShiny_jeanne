library(shiny)

ui <- fluidPage(
  textInput("name", "What is your name?"),
  textOutput("greeting")
) 

server <- function(input, output) {
  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
