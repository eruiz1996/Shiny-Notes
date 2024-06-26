library(shiny)
library(ggplot2)
library(dplyr)
library(babynames)

# UI
ui <- fluidPage(
  
  # Encabezado de la aplicaci�n
  headerPanel("Dashboard con Gr�ficos de Nombres de Beb�s"),
  
  # Panel de pesta�as
  tabsetPanel(
    # Primer panel
    tabPanel("Gr�fico de Barras",
             plotOutput("bar_plot")), # Output para el gr�fico de barras
    
    # Segundo panel
    tabPanel("Gr�fico de L�nea",
             plotOutput("line_plot")) # Output para el gr�fico de l�nea
  )
)

# Server
server <- function(input, output) {
  
  # Funci�n para generar el gr�fico de barras
  output$bar_plot <- renderPlot({
    # Filtrar datos para obtener los nombres m�s populares
    top_names <- babynames %>%
      group_by(name) %>%
      summarize(total = sum(n)) %>%
      top_n(10, total)
    
    # Crear el gr�fico de barras
    ggplot(data = top_names, aes(x = reorder(name, -total), y = total)) +
      geom_bar(stat = "identity", fill = "green") +
      labs(title = "Nombres de Beb�s M�s Populares",
           x = "Nombre",
           y = "Total") +
      theme_minimal()
  })
  
  # Funci�n para generar el gr�fico de l�nea
  output$line_plot <- renderPlot({
    # Filtrar datos para obtener la tendencia de un nombre espec�fico
    name_trend <- babynames %>%
      filter(name == "John") %>%
      group_by(year) %>%
      summarize(total = sum(n))
    
    # Crear el gr�fico de l�nea
    ggplot(data = name_trend, aes(x = year, y = total)) +
      geom_line(color = "orange") +
      labs(title = "Tendencia del Nombre 'John'",
           x = "A�o",
           y = "Total") +
      theme_minimal()
  })
}

# Ejecutar la aplicaci�n Shiny
shinyApp(ui, server)