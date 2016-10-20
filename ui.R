#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  
  # Application title
  titlePanel("Borrower Profiles"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      #radioButtons(
      checkboxGroupInput(
                  "Rating",
                   "Borrower Rating:",
                   c("AA","A","B","D","E","F","HR")
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plotIncome"),
       plotOutput("plotDefault"),
       plotOutput("plotCountry"),
       plotOutput("plotExperience") 
    )
    
    
  )
))
