#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model <- lm(mpg ~ wt, data=mtcars)
    modelpred <- reactive({
      wtInput <- input$sliderWeight 
      predict(model, newdata = data.frame (wt = wtInput))
        
    })
    
  output$plot<-renderPlot({
      wtInput <- input$sliderWeight
      plot(mtcars$wt, mtcars$mpg, xlab="Weight of a Car", 
           ylab="Miles per Gallon", bty="n", pch = 16,
        xlim = c(1.500, 5.500), ylim = c(10, 35))
      if(input$showmodel){
          abline(model, col = "green", lwd = 2)
      }
      points(wtInput, modelpred(), color = "green", pch = 16, cex = 2)
     
})    
 output$Prediction <- renderText({
     modelpred()
 })       
      

})
