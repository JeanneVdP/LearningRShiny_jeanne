library(shiny)

ui <- fluidPage(
  sliderInput("valuePicker", "What do you choose?", min = 0, max = 100, value = 0, step = 5, animate = TRUE)
) 

server <- function(input, output, session) {
}

# Run the application 
shinyApp(ui = ui, server = server)
