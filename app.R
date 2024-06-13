library(shiny)

minDate <- as.Date("2020-09-16")
maxDate <- as.Date("2020-09-23")
defaultDate <- as.Date("2020-09-17")

ui <- fluidPage(
  sliderInput("deliveryDate", "When should we deliver?", min = minDate, max = maxDate, value = defaultDate)
) 

server <- function(input, output, session) {
}

# Run the application 
shinyApp(ui = ui, server = server)
