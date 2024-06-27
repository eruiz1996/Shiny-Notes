library(shiny)
library(shinythemes)
library(leaflet)
library(dplyr)
ui <- bootstrapPage(
  theme = shinythemes::shinytheme('simplex'),
  leaflet::leafletOutput('map', height = '100%', width = '100%'),
  absolutePanel(top = 10, right = 10, id = 'controls',
                # CODE BELOW: Add slider input named nb_fatalities
                sliderInput('nb_fatalities', "Minimum Fatalities",
                            min=1, max=40, value=15),
                # CODE BELOW: Add date range input named date_range
                dateRangeInput('date_range', "Select Date",
                               "2010-01-01", "2019-12-01")
  ),
  tags$style(type = "text/css", "
    html, body {width:100%;height:100%}     
    #controls{background-color:white;padding:20px;}
  ")
)

server <- function(input, output, session) {
  output$map <- leaflet::renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView( -98.58, 39.82, zoom = 5) %>% 
      addTiles()
  })
}

shinyApp(ui, server)