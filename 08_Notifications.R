library(shiny)
ui <- fluidPage(
  textInput('name', 'Enter your name')
)

server <- function(input, output, session) {
  # CODE BELOW: Add an observer to display a notification
  # 'You have entered the name xxxx' where xxxx is the name
  
  observe({
    showNotification(
      paste('You have entered the name', input$name)
    )
  })
}

shinyApp(ui = ui, server = server)