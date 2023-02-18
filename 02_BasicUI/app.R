library(shiny)

# Different UI Elements

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
  # Text
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3),
  
  # Numeric
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
  
  # Dates
  dateInput("dob", "When were you born?"),
  dateInput("dob", "When were you born?, different date style", format = "dd-mm-yyyy"),
  dateRangeInput("holiday", "When do you want to go on vacation next?"),
  
  # Limited choices
  selectInput("state", "What's your favourite state?", state.name),
  selectInput("state", "What's your favourite state? , multiple selection possible", multiple = TRUE, state.name),
  radioButtons("animal", "What's your favourite animal?", animals),
  checkboxGroupInput("animal", "What animals do you like?", animals),
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  
  # File upload
  fileInput("upload", NULL)
  
  
)

shinyApp(ui, server = function(input, output) {
  
})