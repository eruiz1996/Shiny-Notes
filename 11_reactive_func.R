library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("Reactive Function Example"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("num", "Enter a number:", value = 1, min = 0)
    ),
    
    mainPanel(
      textOutput("square")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression to calculate the square of the input number
  square <- reactive({
    input$num^2
  })
  
  # Output the square of the number
  output$square <- renderText({
    paste("The square of the number is:", square())
  })
}

# Run the application 
shinyApp(ui = ui, server = server)