library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
) 

# why would this code fail?
server <- function(input, output, session) {
  var <- reactive(df[[input$var]])
  range <- reactive(range(var(), na.rm = TRUE))
}
# because;
# 1 - we have no input with 'var' ID
# 2 - var is already a standard function in R to determine the variance
# so it is not a good idea to override this function
# 3 - range is also a standard function in R, best not to assign a new function to it


# Run the application 
shinyApp(ui = ui, server = server) 