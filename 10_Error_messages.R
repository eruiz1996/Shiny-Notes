# Load the Shiny package
library(shiny)

# Define the user interface
ui <- fluidPage(
  titlePanel("Validate with need in Shiny"),
  sidebarLayout(
    sidebarPanel(
      textInput("number", "Enter a number:", value = "")
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # Validate that the input is a number and greater than 0
    validate(
      need(input$number != "", "Please enter a number."),
      need(as.numeric(input$number) > 0, "Number must be greater than 0.")
    )
    
    # Generate a histogram of random numbers
    hist(rnorm(100, mean = as.numeric(input$number)))
  })
}

# Run the application
shinyApp(ui = ui, server = server)