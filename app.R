library(shinydashboard)
library(shiny)
library(shinyWidgets)
library(shinyjs)


header <- function() {
  header <- dashboardHeader()
  anchor <- tags$a(href='http://www.fantasy.premierleague.com',
                   tags$img(src='https://png2.cleanpng.com/sh/62a0014bda805cfa18176eb65590042c/L0KzQYm3V8EyN6drgZH0aYP2gLBuTcIxOWc2T595cnXwebb5TfxmaZh6fZ9ubnfvecTvTfZwd6Vned51LXzocbj8hb1tNZ1uh9C2ZX3yerq0VfI1PmFrSKk7MkK3QIK1UcQ4P2k8Tac6NUO0Q4KBUMI0OWQAUZD5bne=/kisspng-201617-premier-league-english-football-league-l-lion-emoji-5b460f07222401.1477875515313180231399.png', height='40'),
                   '')
  
  header$children[[2]]$children <- tags$div(
    tags$head(tags$style(HTML(".name { background-color: black }"))),
    anchor,
    class = 'name')
  
  header$children[[3]]$children[[1]] <- tags$div(style = "padding-left: 40px",
                                                 actionButton('btn_tab_home', 'Home', style = "height: 50px; font-family: Fixedsys; background-color: #121212; border: 0; color: #ddd; border-bottom: 3px solid; border-color:#ddd"),
                                                 actionButton('btn_tab_player_shots', 'Player Shots', style = "height: 50px; font-family: Fixedsys; background-color: #121212; border: 0; color: #ddd; border-bottom: 3px solid; border-color:#ddd")
  )
  header$children[[3]]$children[[2]] <- NULL
  return(header)
}

sidebar <- function() {
  sidebar <- dashboardSidebar(
    sidebarMenu(id = "tabs",
                tags$div(style = "display: none;", menuItem("Player Shots", tabName = "pag2", icon = icon("dashboard"))),
                tags$div(style = "display: none;", menuItem("Home",tabName = "pag1", icon = icon("th"))),
                pickerInput("PickPlayer", choices= levels(fpl_shots$player),
                            shiny::HTML("<p><span style='color: white'>Select Player</span></p>"), 
                            options = list(`actions-box` = TRUE), multiple = F)
    )
  )
  return(sidebar)
}

body <- function() {
  
  dashboardBody(
    useShinyjs(),
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
    tabItems(
      # First tab content
      tabItem(tabName = "pag1", 
      ),
      # Second tab content
      tabItem(tabName = "pag2", uiOutput(outputId = "player_photo")
              
      )
    )
  )
}

ui <- dashboardPage(header(),
                    sidebar(),
                    body())

server <- function(input, output, session) {
  
  observeEvent(input$btn_tab_home, {
    updateTabItems(session, "tabs", "pag1")
  })
  
  observeEvent(input$btn_tab_player_shots, {
    updateTabItems(session, "tabs", "pag2")
  })
  
  photos_link <- reactive({
    req(input$PickPlayer)
    
    fpl_shots <- fpl_shots %>% 
      dplyr::filter(player %in% input$PickPlayer) 
    
    unique_player <- unique(fpl_shots$photo)
    
    unique_player <- paste0("Data_Input/2018_2019/photos/", unique_player)
    
    return(unique_player)
    
  })
  
  
  output$player_photo <- renderUI({
    
    photos_link <- photos_link()
    
    
    tags$img(photos_link, width = 300, height = 240)
    
    
    
  })
  
}

shinyApp(ui, server)