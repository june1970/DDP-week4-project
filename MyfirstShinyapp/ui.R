#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

shinyUI(fluidPage(
    # Application title
    
 titlePanel("Prediction of MPG by Weight in mtcars Data"),
    
 includeMarkdown("Prediction of MPG by Weight.Rmd"),
 
 sidebarLayout(
  sidebarPanel(
   sliderInput ("sliderWeight", "Weight of the Car", 1.500, 5.500, value= 3.000), 
   checkboxInput("showmodel", "show/Hide Model", value= TRUE),
   submitButton ("Submit")
  ),
  mainPanel(
    h3("Prediction of MPG from Weight"),
    plotOutput("plot"),
    h4 ("Predicted MPG from Weight:"),
    textOutput("Prediction"),
  )
 )
))
