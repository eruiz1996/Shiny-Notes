library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("observeEvent with showModal Example"),
  sidebarLayout(
    sidebarPanel(
      actionButton("show", "Show Modal")
    ),
    mainPanel(
      textOutput("text")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Modal Title",
      "This is a simple modal dialog.",
      easyClose = TRUE,
      footer = tagList(
        modalButton("Close"),
        actionButton("ok", "OK")
      )
    ))
  })
  
  observeEvent(input$ok, {
    removeModal()
    output$text <- renderText({
      paste("Modal confirmed at", Sys.time())
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)