library(shiny)
library(ggplot2)

#================== Introduction ================== 

# ui <- fluidPage(
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )
# 
# server <- function(input, output, session) {
#   # Create a reactive expression
#   dataset <- reactive({
#     get(input$dataset, "package:datasets")
#   })
# 
#   output$summary <- renderPrint({
#     # Use a reactive expression by calling it like a function
#     summary(dataset())
#   })
# 
#   output$table <- renderTable({
#     dataset()
#   })
# }
# 
# shinyApp(ui, server)

#================== Exercise 1.8.1 ================== 

# ui <- fluidPage(
#   textInput("name", "What's your name?"),
#   textOutput("greeting")
# )
# 
# server <- function(input, output, session) {
#   
#   output$greeting <- renderText({
#     paste0("Hello ", input$name)
#   })
#   
# }
# 
# shinyApp(ui, server)


#================== Exercise 1.8.2 ================== 

# ui <- fluidPage(
#   sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
#   "then x times 5 is",
#   textOutput("product")
# )
# 
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     input$x * 5
#   })
# }
# 
# shinyApp(ui, server)

#================== Exercise 1.8.3 ================== 

# ui <- fluidPage(
#   sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
#   sliderInput("y", label = "and y is", min = 1, max = 50, value = 30),
#   "then x times y is",
#   textOutput("product")
# )
# 
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     input$x * input$y
#   })
# }
# 
# shinyApp(ui, server)

#================== Exercise 1.8.4 ================== 

# ui <- fluidPage(
#   sliderInput("x", "If x is", min = 1, max = 50, value = 30),
#   sliderInput("y", "and y is", min = 1, max = 50, value = 5),
#   "then, (x * y) is", textOutput("product"),
#   "and, (x * y) + 5 is", textOutput("product_plus5"),
#   "and (x * y) + 10 is", textOutput("product_plus10")
# )
# 
# server <- function(input, output, session) {
# # Reactive expression to avoid doublication of code
#   product <- reactive({
#     input$x * input$y
#   })
# 
# 
#   output$product <- renderText({
#     product()
#   })
# 
#   output$product_plus5 <- renderText({
#     product() + 5
#   })
# 
#   output$product_plus10 <- renderText({
#     product() + 10
#   })
# }
# 
# shinyApp(ui, server)

#================== Exercise 1.8.5 ==================


datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  # Error 3 - tableOutput instead of plotOutput
  plotOutput("plot")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  # Error 1 - Typo in output$summary
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  # Error 2 - dataset instead of dataset()
  output$plot <- renderPlot({
    plot(dataset())
  }, res = 96)
}

shinyApp(ui, server)
