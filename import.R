#load data
loans <- read.csv('loandata.csv', stringsAsFactors = T)

#replace blanks with NA
loans[loans==""] <- NA

#correct order of Ratings (AA higher than A)
loans$Rating <- factor(loans$Rating, levels = c("AA", "A", "B", "C", "D", "E", "F", "HR"))
loans$WorkExperience <- factor(loans$WorkExperience, levels = c("LessThan2Years",
                                                "2To5Years",
                                                "5To10Years",
                                                "10To15Years",
                                                "15To25Years",
                                                "MoreThan25Years"))


#define useful columns (comment out for development)
useful <- c(
  "ProbabilityOfDefault",
  "Rating",
  "Country",
  "IncomeTotal",
  "MonthlyPayment",
  "FreeCash",
  "MonthlyPayment",
  "WorkExperience",
  "Age",
  "Amount",
  "AppliedAmount",
  "Interest",
  "LoanDuration",
  "MonthlyPayment",
  "UseOfLoan",
  "Education",
  "WorkExperience",
  "FreeCash",
  "LastPaymentOn",
  "Status",
  "RecoveryStage",
  "PrincipalPaymentsMade",
  "InterestAndPenaltyPaymentsMade",
  "ExpectedReturn",
  "FirstPaymentDate",
  "BidsManual",
  "BidsPortfolioManager",
  "BidsApi",
  "LossGivenDefault"
)
  



#strip rows with no Rating and non-useful columns
loans <- loans[!is.na(loans$Rating),useful]

rm(useful)

#split dataset by rating
dfloans <- split(loans, as.factor(loans$Rating))

#Save split dataset and hash of original file
SHAloan <- sha1('loandata.csv')
save(SHAloan,dfloans,file="envir")

#clean up
rm(SHAloan)
rm(loans)