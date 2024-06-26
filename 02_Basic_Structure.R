library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Mi edad en 10 a�os..."),
  sidebarLayout(
    # Panel izquierdo
    #---------------------------------------------------------------------------
    sidebarPanel(
      # input 1: de texto
      textInput(inputId = 'name', label = "Introduce tu nombre", value = "Edgar"),
      # input 2: num�rico
      numericInput('edad', "Introduce tu edad", value = 27)
    ),
    #---------------------------------------------------------------------------
    
    # Panel principal
    #---------------------------------------------------------------------------
    mainPanel(
      h1("Datos"),
      h3("Nombre:"),
      verbatimTextOutput('nombre'),
      h3("En 10 a�os tendr�:"),
      verbatimTextOutput('edad')
    )
    #---------------------------------------------------------------------------
  )
)

server <- function(input, output, sesion){
  # output de nombre
  output$nombre <- renderText({
    input$name
  })
  
  # output de edad
  output$edad <- renderText({
    nueva_edad <- input$edad + 10
    nueva_edad
  })
}

shinyApp(ui, server)