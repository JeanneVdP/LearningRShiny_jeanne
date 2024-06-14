library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
) 

# server 1
# old:
#server <- function(input, output, server) {
#  input$greeting <- renderText(paste0("Hello ", name))
#}

# improved: server -> session argument, assignment of output instead of input, call input ID
#server <- function(input, output, session) {
#  output$greeting <- renderText(paste0("Hello ", input$name))
#}

# server 2
# old:
#server <- function(input, output, server){
#  greeting <- paste0("Hello ", input$name)
#  output$greeting <- renderText(greeting)
#}

# fixed: server -> session argument, wrap paste into reactive (to access input value), call greeting as a method
#server <- function(input, output, session){
#  greeting <- reactive(paste0("Hello ", input$name))
#  output$greeting <- renderText(greeting())
#}

# server 3
# old:
#server <- function(input, output, server){
#  output$greting <- paste0("Hello ", input$name)
#}

#improved: server -> session, typo in output ID, cannot assign 
#value to output ID without render
server <- function(input, output, session){
  output$greeting <- renderText(paste0("Hello ", input$name))
}

# Run the application 
shinyApp(ui = ui, server = server) 