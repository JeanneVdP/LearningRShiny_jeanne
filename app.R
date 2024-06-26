library(ggplot2)
library(shiny)

parameter_tabs <- tabsetPanel(
  id = "params",
  type = "hidden",
  tabPanel("histogram", numericInput("binwidth_hist", "binwidth", value = 0.01)),
  tabPanel("freqpoly", numericInput("binwidth_freq", "binwidth", value = 0.01)),
  tabPanel("kernel_density", selectInput("bw", "bw", choices = c("nrd0", "nrd", "bcv"), selected = "nrd0")),
)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("plot_type", "Choose the plot type", choices = c("histogram", "feqpoly", "kernel density")),
      parameter_tabs
    ),
    mainPanel(plotOutput("diamond_ggplot"))
  )
)

server <- function(input, output, session) {
  observeEvent(input$params, {
    updateTabsetPanel(inputId = "params", selected = input$plot_type)
  })
  
  definitive_plot <- reactive({
    switch(input$plot_type,
           histogram = ggplot2::ggplot(diamonds, mapping = aes(x = carat)) + ggplot2::geom_histogram(binwitdh = input$binwidth_hist),
           freqpoly = ggplot2::ggplot(diamonds, mapping = aes(x = carat)) + ggplot2::geom_freqpoly(binwidth = input$binwidth_freq),
           kernel_density = ggplot2::ggplot(diamonds, mapping = aes(x = carat)) + ggplot2::geom_density(bw = input$bw) 
           )
  })
  
  output$diamond_ggplot <- renderPlot(definitive_plot(), res = 96)
}

shinyApp(ui, server)