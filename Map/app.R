#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Visualization 3"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel("sidebar panel"),
      mainPanel(
        h1("Visual 3",
           selectInput("select", label = h3("select a season and weekday"),
                       choices = list("Choice 1" = 1, "Choice 2" = 2, selected = 1)
      )
   )
)))

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

