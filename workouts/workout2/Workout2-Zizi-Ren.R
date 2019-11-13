# Workout2, Stat 133 Fall 2019, Zizi Ren
# Inputs:
#   Initial_Amount: Intial Amount
#   Annual_Contribution: Anuual Contribution
#   Annual_Growth_Rate: Annual Growth Rate (in %)
#   High_Yield_Rate: High Yield Rate (in %)
#   Fixed_Income_Rate: Fixed Income volatility (U.S. Bonds in %)
#   US_Equity_Rate: US Equity rate (U.S. Stocks in %)
#   High_Yield_Volatility: High Yield volatility (in %)
#   Fixed_Income_Volatility: Fixed Income volatility (U.S. Bonds in %)
#   US_Equity_Volatility: US Equity rate (U.S. Stocks in %)
#   Years: Years
#   Seed: Choose a random seed
#   Facet: Facet
#
# Outputs:
#   Timeline plot of three different scenarios of investment


library(shiny)
library(ggplot2)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Three Investing Scenerios"),
  
  # Sidebar  
  fluidRow(
    column(3,
      sliderInput("Initial_Amount ",
                  label = "Intial Amount:",
                  min = 0,
                  max = 10000,
                  value = 1000),
      sliderInput("Annual_Contribution",
                  label = "Anuual Contribution:",
                  min = 0,
                  max = 5000,
                  value = 200),
      sliderInput("Annual_Growth_Rate",
                  label = "Annual Growth Rate (in %):",
                  min = 0,
                  max = 20,
                  value = 2)),
    column(3,
      sliderInput("High_Yield_Rate",
                  label = "High Yield Rate (in %):",
                  min = 0,
                  max = 20,
                  value = 2),
      sliderInput("Fixed_Income_Rate",
                  label = "Fixed Income rate (U.S. Bonds in %):",
                  min = 0,
                  max = 20,
                  value = 5),
      sliderInput("US_Equity_Rate",
                  label = "US Equity rate (U.S. Stocks in %):",
                  min = 0,
                  max = 20,
                  value = 10)),
    column(3,
      sliderInput("High_Yield_Volatility",
                  label = "High Yield volatility (in %):",
                  min = 0,
                  max = 20,
                  value = 0.1),
      sliderInput("Fixed_Income_Volatility",
                  label = "Fixed Income volatility (U.S. Bonds in %):",
                  min = 0,
                  max = 20,
                  value = 4.5),
      sliderInput("US_Equity_Volatility",
                  label = "US Equity volatility (U.S. Stocks in %):",
                  min = 0,
                  max = 20,
                  value = 15)),
    column(3,
      sliderInput("Years",
                  label = "Years:",
                  min = 0,
                  max = 50,
                  value = 10),
      numericInput("Seed",
                   "Choose a random seed",
                   value = 12345),
      selectInput("Facet",
                  "Facet:",
                  c("Yes" = TRUE, 
                    "No" = FALSE)))
    ),
    
    # Show a plot of the timelines
    mainPanel(
      plotOutput("Timelines")
    )
  )



# Define server logic required to draw the plot
server <- function(input, output) {
  
  dat <- reactive({
    
    #generates three vectors of random rates according to the seed selected 
    set.seed(input$Seed)
    r_hyr <- rnorm(input$Years,mean = (input$High_Yield_Rate)*0.01, sd = (input$High_Yield_Volatility)*0.01)
    r_fif <- rnorm(input$Years, mean = (input$Fixed_Income_Rate)*0.01 ,sd = (input$Fixed_Income_Volatility)*0.01)
    r_user <- rnorm(input$Years, mean = (input$US_Equity_Rate)*0.01, sd = (input$US_Equity_Volatility)*0.01)
    
    #' @title money
    #' @description generates a vector containing yearly amount of investment in terms of the rate given for each year
    #' @param vec the vector of yearly rates
    #' @return the a vector of yearly amount of investment 
    money <- function(vec){
      r <- c(input$Initial_Amount,rep(0,input$Years+1))
      for (i in 1:input$Years) {
        r[i+1] <- r[i]*(1+vec[i])+input$Annual_Contribution*(1+(input$Annual_Growth_Rate)*0.01)^i
      }
      return(r)
    }
    
    #generates three vectors (types) of yearly amount of investment
    m_hyr <- money(r_hyr)
    m_fif <- money(r_fif)
    m_user <- money(r_user)
    
    #create a data frame containing three vectors (types) of yearly amount of investment
    dat <- data.frame(year = rep(0:input$Years,3),
      money = c(m_hyr, m_fif, m_user),
      type = c(rep("High_Yield",input$Years+1),rep("us_bonds",input$Years+1),rep("us_stocks",input$Years+1)))
    return(dat) 
    
  })
  
  # Fill in the spot we created for a plot
  output$Timelines <- renderPlot({
    if(input$Facet){
      ggplot(data = dat(), aes(x = year, y = money, group = type)) +
        geom_path(aes(color = type)) + facet_wrap(~type)+
        ggtitle("Timelines")
    }else{
      ggplot(data = dat(), aes(x = year, y = money, group = type)) +
        geom_path(aes(color = type))+
        ggtitle("Timelines")
    }  
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)