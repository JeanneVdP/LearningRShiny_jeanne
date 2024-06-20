library(glue)
library(shiny)

modalConfirm <- modalDialog(
  "Are you sure you want to continue?",
  title = "Deleting files",
  footer = tagList(
    actionButton("cancel", "Cancel"),
    actionButton("ok", "Delete", class = "btn btn-danger")
  )
)

ui <- fluidPage(
  actionButton("delete", "Delet dis")
)

server <- function(input, output, session) {
  observeEvent(input$delete, {
    showModal(modalConfirm)
  })
  
  observeEvent(input$ok, {
    showNotification("Files deleted")
    removeModal()
  })
  
  observeEvent(input$cancel, {
    removeModal()
  })
}

shinyApp(ui, server)