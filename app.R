library(shiny)

df <- readr::read_csv("data/analytical-professions-competency-data.csv")

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(),
    mainPanel(DT::dataTableOutput("table"))
  )  
)

server <- function(input, output, session) {
  
  output$table <- DT::renderDataTable(
    df    
  )
}

shinyApp(ui, server)