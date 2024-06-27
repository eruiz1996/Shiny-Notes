library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("observeEvent Example"),
  sidebarLayout(
    sidebarPanel(
      actionButton("action", "Click me")
    ),
    mainPanel(
      textOutput("text")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  observeEvent(input$action, {
    # Code to run when the action button is clicked
    output$text <- renderText({
      paste("Button clicked", input$action, "times")
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)