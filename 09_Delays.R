library(shiny)
ui <- fluidPage(
  titlePanel("Inches to Centimeters Conversion"),
  sidebarLayout(
    sidebarPanel(
      numericInput("height", "Height (in)", 60),
      actionButton("show_height_cm", "Show height in cm")
    ),
    mainPanel(
      textOutput("height_cm")
    )
  )
)

server <- function(input, output, session) {
  # MODIFY CODE BELOW: Delay the height calculation until
  # the show button is pressed
  rval_height_cm <- eventReactive(input$show_height_cm, {
    input$height * 2.54
  })
  
  output$height_cm <- renderText({
    height_cm <- rval_height_cm()
    paste("Your height in centimeters is", height_cm, "cm")
  })
}

shinyApp(ui = ui, server = server)