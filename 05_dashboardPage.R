library(shiny)
library(shinydashboard)
library(shinyWidgets)

# para íconos: https://fontawesome.com/icons

ui <- dashboardPage(
  # encabezado
  ######################################################################
  dashboardHeader(title = 'Nombre de la app'),
  ######################################################################
  
  
  # barra lateral
  ######################################################################
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      # Item 1 - hoja 1
      menuItem('Item 1', tabName = 'sheet1', icon = icon('chart-bar')),
      # segunda hoja
      menuItem('Multi-Item', icon = icon('bars'),
               # sub-item 1 - hoja 2
               menuSubItem('SubItem1', tabName = 'subitem1'),
               # sub-item 2 - hoja 2
               menuSubItem('SubItem2', tabName = 'subitem2')
      )
    )
  ),
  
  # cuerpo
  ######################################################################
  dashboardBody(
    tabItems(
      # hoja 1
      # ----------------------------------------------------------------
      tabItem(tabName = 'sheet1',
              titlePanel('Título del Panel')),
      # ----------------------------------------------------------------
      
      # hoja 2
      # ----------------------------------------------------------------
      # sub-item 1
      tabItem(tabName = 'subitem1',
              titlePanel('Sub-item 1 de Hoja 2')),
      # sub-item 2
      tabItem(tabName = 'subitem2',
              titlePanel('Sub-item 2 de Hoja 2'))
      # ----------------------------------------------------------------
    )
  ),
  ######################################################################
  
  # color de la app
  skin = 'black'
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)