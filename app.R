# Pakete laden ----
library(shiny)# Load shiny package

# User Interface ----
# Input
ui <- fluidPage( # lay out the appearance of your app, 1. Komponente
  titlePanel("Title goes here"),
  sidebarLayout(
    sidebarPanel(textInput(inputId = "text_input", label = "Text einfügen:")), # verbindet mit Server-Teil -> definiert text_input
    mainPanel(textOutput(outputId = "text_output")) # verbindet mit Server-Teil -> definiert text_output
  )
  
)

# Server ----
# Input verarbeiten
server <- function(input, output){
  output$text_output <- renderText({
    # Display text
    paste("Du hast", input$text_input,  "eingegeben") # nimmt Input und arbeitet damit
  })
}# instructions needed to build the app, 2. Komponente

# Anwenden ----
shinyApp(ui = ui, server = server) # kombiniert die beiden Komponenten, um App zu launchen