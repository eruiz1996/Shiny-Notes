library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Baby Name Explorer"),
  sidebarLayout(
    # to the left
    sidebarPanel(
      textInput("name", 'Enter Name', "David")
    ),
    mainPanel(
      plotOutput('trend')
    )
  )
)

server <- function(input, output, sesion){
  output$trend <- renderPlot({
    ggplot()
  })
}

shinyApp(ui, server)