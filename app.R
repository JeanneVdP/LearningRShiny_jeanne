library(shiny)
library(vroom)
library(tidyverse)

dir.create("neiss")
download_data <- function(name) {
  url_data <- "https://github.com/hadley/mastering-shiny/tree/main/neiss/"
  download.file(paste0(url_data, name), paste0("neiss/", name), quiet = TRUE)
}
download_data("injuries.tsv.gz")
download_data("population.tsv")
download_data("products.tsv")


injuries <- vroom::vroom("neiss/injuries.tsv.gz")
toilet_injuries <- injuries %>% filter(prod_code = 649) # product code 649 is toilet product related to injury


ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
) 

server <- function(input, output, session) {
}

# Run the application 
shinyApp(ui = ui, server = server) 