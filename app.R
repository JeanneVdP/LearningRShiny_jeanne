library(shiny)

ui <- fluidPage(
  #a. verbatimTextOutput("CarSummary")
  #b. textOutput("greeting")
  #c. verbatimTextOutput("tTest")
  verbatimTextOutput("structureCars") #d
) 

server <- function(input, output, session) {
  #a.output$CarSummary <- renderPrint(summary(mtcars))
  #b. output$greeting <- renderText("Good morning!")
  #c. output$tTest <- renderPrint(t.test(1:5, 2:6)) 
  output$structureCars <- renderText(str(lm(mpg~wt, data = mtcars))) #d
}

# Run the application 
shinyApp(ui = ui, server = server)
