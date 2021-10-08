## app.R ##
library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)

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
              box(title = "Risk Factors", dataTableOutput('risk_fac')),
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

server <- function(input, output) {
  rf <- data.frame(Disease = c("Cerebralvascular Disease", "Coronary Artery Disease",
                               "Heart Failure", "Hypertension",
                               "Diabetes", "Hyperlipidemia"), 
                   Status = c(0, 0, 0, 1, 0, 0))
  rf <- datatable(rf) %>% formatStyle(
    'Status',
    backgroundColor = styleEqual(c(0, 1), c('#a7d4a1', '#de4b4b'))
  )
  output$risk_fac <- renderDataTable(rf)
}

shinyApp(ui, server)