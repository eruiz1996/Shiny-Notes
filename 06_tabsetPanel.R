library(shiny)
library(ggplot2)
library(dplyr)
library(babynames)

# UI
ui <- fluidPage(
  
  # Encabezado de la aplicación
  headerPanel("Dashboard con Gráficos de Nombres de Bebés"),
  
  # Panel de pestañas
  tabsetPanel(
    # Primer panel
    tabPanel("Gráfico de Barras",
             plotOutput("bar_plot")), # Output para el gráfico de barras
    
    # Segundo panel
    tabPanel("Gráfico de Línea",
             plotOutput("line_plot")) # Output para el gráfico de línea
  )
)

# Server
server <- function(input, output) {
  
  # Función para generar el gráfico de barras
  output$bar_plot <- renderPlot({
    # Filtrar datos para obtener los nombres más populares
    top_names <- babynames %>%
      group_by(name) %>%
      summarize(total = sum(n)) %>%
      top_n(10, total)
    
    # Crear el gráfico de barras
    ggplot(data = top_names, aes(x = reorder(name, -total), y = total)) +
      geom_bar(stat = "identity", fill = "green") +
      labs(title = "Nombres de Bebés Más Populares",
           x = "Nombre",
           y = "Total") +
      theme_minimal()
  })
  
  # Función para generar el gráfico de línea
  output$line_plot <- renderPlot({
    # Filtrar datos para obtener la tendencia de un nombre específico
    name_trend <- babynames %>%
      filter(name == "John") %>%
      group_by(year) %>%
      summarize(total = sum(n))
    
    # Crear el gráfico de línea
    ggplot(data = name_trend, aes(x = year, y = total)) +
      geom_line(color = "orange") +
      labs(title = "Tendencia del Nombre 'John'",
           x = "Año",
           y = "Total") +
      theme_minimal()
  })
}

# Ejecutar la aplicación Shiny
shinyApp(ui, server)