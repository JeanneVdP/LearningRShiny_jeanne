library(glue)
library(shiny)
library(dplyr, warn.conflicts = FALSE)



ui <- fluidPage(
  tabsetPanel(id = "wizard",
              type = "hidden",
              tabPanel("page_1", "welcome!", actionButton("page_12", "next")),
              tabPanel("page_2", 
                       "Only one page to go!", 
                       actionButton("page_21", "prev"),
                       actionButton("page_23", "next")),
              tabPanel("page_3", "You're done!", actionButton("page_32", "prev")),
    )
)

server <- function(input, output, session) {
  switchPage <- function(i){
    updateTabsetPanel(inputId = "wizard", selected = paste0("page_", i))
   }
  
  observeEvent(input$page_12, switchPage(2))
  observeEvent(input$page_21, switchPage(1))
  observeEvent(input$page_23, switchPage(3))
  observeEvent(input$page_32, switchPage(2))
}

shinyApp(ui, server)