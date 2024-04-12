library(shiny)
library(plotly)
library(dplyr)
library(babynames)

ui <- fluidPage(
  titlePanel("Gráfico Interactivo con Plotly"),
  sidebarLayout(
    sidebarPanel(
      selectInput("sexo", "Seleccionar sexo:",
                  choices = c("M" = "M", "F" = "F"),
                  selected = "M")
    ),
    mainPanel(
      plotlyOutput("plot")
    )
  )
)

server <- function(input, output) {
  
  output$plot <- renderPlotly({
    # Filtrar el dataframe por el sexo seleccionado
    df <- filter(babynames, sex == input$sexo)
    
    # Calcular la cantidad total de nombres por año
    df_sum <- df %>% 
      group_by(year) %>% 
      summarise(total_n = sum(n))
    
    # Crear la gráfica Plotly
    plot_ly(data = df_sum, x = ~year, y = ~total_n, type = "scatter", mode = "lines")
  })
  
}

shinyApp(ui = ui, server = server)