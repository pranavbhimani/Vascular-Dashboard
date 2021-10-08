## app.R ##
library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Guideline Recommendations", tabName = "guideline", icon = icon("th"))
  )
)



body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            fluidRow(
              box(title = "Description", "
              John Doe
              Age: 53 years old
Height (m): 1.78
Weight (kg): 78
BMI: 24.6
"),
              box(title = "NLP Summary of last visit", 
                  "He continues to take aspirin, Plavix
and Lipitor daily. He doesn't smoke.
He states that he walks without any
muscle pain or cramping and uses
two walking sticks to help him hold
his balance. He denies any pain in
the feet when legs are elevated or
wounds/sores on his lower
extremities.", 
                  "Last visit on June 17, 2021"),
              box(title = "Risk Factors"),
              box(title = "AI PAD Prediction", valueBox("32%", "Do not consider PAD screening", 
                                                        color = "green", icon = icon("thumbs-up")))
            )),
    tabItem(tabName = "guideline",
            h2("Guideline Recommendations"))
    
  ))


ui <- dashboardPage(
  dashboardHeader(title = "Busy Dashboard"),
  sidebar,
  body
  
)

server <- function(input, output) { }

shinyApp(ui, server)
