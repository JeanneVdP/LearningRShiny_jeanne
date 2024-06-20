library(glue)
library(shiny)
library(shinyFeedback)
library(waiter)



ui <- fluidPage(
  waiter::use_waiter(),
  actionButton("go", "go"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  data <- eventReactive(input$go,{
    # use the new function to create a new waiter with an ID of 
    # an existing element (output$plot) to overlay the waiter with
    # (otherwise the waiter will overlay the entire body)
    waiter::Waiter$new(id = "plot")$show()
    # notice how on.exit is no longer needed
    
    Sys.sleep(3)
    data.frame(x = runif(50), y = runif(50))
  })
  
  output$plot <- renderPlot(plot(data(), res = 96))
}

shinyApp(ui, server)