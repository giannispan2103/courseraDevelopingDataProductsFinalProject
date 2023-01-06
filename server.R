library(shiny)


shinyServer(function(input, output) {
  
  model <- lm(dist ~ speed, data = cars)
  
  modelpred <- reactive({
    speedInput <- input$sliderS
    predict(model, newdata = data.frame(speed = speedInput))
  })
  
  output$plot <- renderPlot({
    sInput <- input$sliderS
    
    plot(cars$speed, cars$dist, xlab = "speed (K/H)", 
         ylab = "distance", bty = "n", pch = 16,
         xlim = c(10, 25), ylim = c(0, 100))
    if(input$showModel){
      abline(model, col = "red", lwd = 2)
    }
    legend(25, 250, c("Model Prediction"), pch = 16, 
           col = c("blue"), bty = "n", cex = 1.2)
    points(sInput, modelpred(), col = "red", pch = 16, cex = 2)
  })
  
  output$pred <- renderText({
    modelpred()
  })

})