library(shiny) # app
library(dplyr) # manipulation
library(DT) # datatables
library(babynames) # example database

# ui
ui <- fluidPage(
  DT::DTOutput("babynames_table")
)

# server
server <- function(input, output, session) {
    output$babynames_table <- DT::renderDT({
      babynames %>%
        # subser 10% of rows
        dplyr::slice_sample(prop = 0.1) %>% 
        # define datatable
        DT::datatable()
    })
  }

# Run the application 
shinyApp(ui = ui, server = server)
