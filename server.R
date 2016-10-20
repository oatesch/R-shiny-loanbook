library(shiny)
library(digest)

#load previous enviroment

try(load("envir"))
if(!(exists("SHAloan") && exists("dfloans"))) source("import.R") else
  if(SHAloan != sha1('loandata.csv')) source("import.R")

shinyServer(function(input, output) {

  output$plotDefault <- renderPlot({
      plot(
      density(dfloans[[input$Rating]]$ProbabilityOfDefault*100),
      xlim=c(0, 80),
      main="Probability of Default",
      xlab="Probably of Default / %"
    )
  })
  
   output$plotIncome <- renderPlot({

    barplot(
      c(mean(dfloans[[input$Rating]]$IncomeTotal,na.rm=TRUE),
        mean(dfloans[[input$Rating]]$FreeCash,na.rm=TRUE),
        mean(dfloans[[input$Rating]]$MonthlyPayment,na.rm=TRUE)),
      ylim = c(0,1400),
      names.arg = c("Income",
                    "Free Cash",
                    "Loan Payment"),
      main="Income",
      col = c("darkblue","darkgreen","darkred")
    )
   })

  output$plotCountry <- renderPlot({
    series <- table(dfloans[[input$Rating]]$Country)
    barplot(
      series,
      main="Borrower Country"
    )
  })
  
  output$plotExperience <- renderPlot({
    series <- table(dfloans[[input$Rating]]$WorkExperience)
    barplot(
      series,
      main="Years in Employment"
    )
  })

  
  
  
})
