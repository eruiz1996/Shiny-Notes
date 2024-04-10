library(shiny)

the_options <- 1:10

ui <- fluidPage(
  titlePanel("Inputs"),
  sidebarLayout(
    # left panel
    sidebarPanel(
      h1("Unique Choice"),
      # ---------------------------------------
      # unique choice
      selectInput('id_op_unique',
                  "Select an option: ",
                  choices = the_options,
                  selected = the_options[1],
                  multiple = F),
      # ---------------------------------------
      # multiple choices
      h1("Multiple Choices"),
      selectInput('id_op_multiple',
                  "Select multiple options: ",
                  choices = the_options,
                  selected = the_options[1],
                  multiple = T)
      ),
    # main panel
    mainPanel(
      # the output of text1
      h1("The output of text 1"),
      textOutput('text1'),
      # the output of text2
      h1("The output of text 2"),
      textOutput('text2')
    )
    )
  )

server <- function(input, output, sesion){
  # text1
  output$text1 <- renderText({
    # return the selection
    input$id_op_unique
  })
  # text2
  output$text2 <- renderText({
    # sum the selections
    sum(as.numeric(input$id_op_multiple))
  })
}

shinyApp(ui, server)