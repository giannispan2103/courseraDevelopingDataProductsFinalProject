library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Distance from Speed"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderS", "What is the Speed of the car?", 10, 25, value = 20),
      checkboxInput("showModel", "Show/Hide Model", value = TRUE),
    ),
    mainPanel(
      plotOutput("plot"),
      h3("Predicted distance from Model:"),
      textOutput("pred"),
    )
  )
))