library(shiny)

ui <- fluidPage(
  textInput("name", "What is your name?"),
  # CODE BELOW: Display the text output, greeting
  # Make sure to add a comma after textInput()
  textOutput("greeting")
)

server <- function(input, output) {
  # CODE BELOW: Render a text output, greeting
  output$greeting <- renderText({
    paste("Hello, ", input$name)
  })
  
  
}

shinyApp(ui = ui, server = server)