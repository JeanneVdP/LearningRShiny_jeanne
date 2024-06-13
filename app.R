library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "if x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "and y is", min = 1, max = 50, value = 5),
  "then (x * y) is", textOutput("product"),
  "and (x * y) + 5 is", textOutput("product_plus5"),
  "and (x * y ) + 10 is", textOutput("product_plus10"),
) 

server <- function(input, output, session) {
  productOfTwoNumbers <- reactive(input$x * input$y)
  
  output$product <- renderText({
    productOfTwoNumbers()
  })
  
  output$product_plus5 <- renderText({
    productOfTwoNumbers() + 5
  })
  
  output$product_plus10 <- renderText({
    productOfTwoNumbers() + 10
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
