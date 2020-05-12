fluidRow(div(style = "font-size: 15px; padding: 0px 0px; margin-left:3em", 
     column(2, pickerInput("PickPlayer1Shots", choices= levels(fpl_shots$player),
                           shiny::HTML("<p><span style='color: white'>Select Player</span></p>"), 
                           options = list(`actions-box` = TRUE), multiple = F))),
  div(style = "font-size: 15px; padding: 0px 0px; margin-left:20em",
      column(4, sliderInput(inputId = 'PickGWs',shiny::HTML("<p><span style='color: white'>Select Gameweeks</span></p>"), 
                            min=min(selectGWs), max = max(selectGWs), value =range(selectGWs), sep = '', animate = T)
      )),
  div(style = "font-size: 15px; padding: 0px 0px; margin-left:20em",
      column(3, pickerInput("PickShotResult", choices= levels(fpl_shots$result),
                            shiny::HTML("<p><span style='color: white'>Select Shot Result</span></p>"), 
                            options = list(`actions-box` = TRUE), multiple = T))),
  div(style = "font-size: 15px; padding: 0px 0px",
      column(2,offset = 1, pickerInput("PickPlayer2Shots", choices= levels(fpl_shots$player),
                                       shiny::HTML("<p><span style='color: white'>Select Player</span></p>"), 
                                       options = list(`actions-box` = TRUE), multiple = F)))
),
div(style = "style='height:50vh';font-size: 15px; padding: 0px 0px; margin-top:2.5em; margin-bottom:-50em", 
 fluidRow(class = "myRow1",
          div(style = "font-size: 15px; padding: 0px 0px; margin-left:2em", column(2, 
                                                                                   plotOutput(outputId = "player_photo1_shots")
          )), 
          div(style = "font-size: 15px; padding: 0px 0px; margin-left:3em", column(3, offset = 1,
                                                                                   tableOutput("player1_shots_table"),
                                                                                   tags$head(tags$style("#player1_shots_table  table {background-color:#2D3741;
                              color: #FFFFFF;}", media="screen", type="text/css"))
                                                                                   
          )),
          div(style = "font-size: 15px; padding: 0px 0px", column(3,
                                                                  tableOutput("player2_shots_table"),
                                                                  tags$head(tags$style("#player2_shots_table  table {background-color:#2D3741;
                              color: #FFFFFF;}", media="screen", type="text/css"))
                                                                  
          )),
          div(style = "font-size: 15px; padding: 0px 0px; margin-left:20em", column(2,
                                                                                    plotOutput(outputId = "player_photo2_shots")
          )
          )))



fluidRow(style = "margin-top:2.5em", class = "myRow1",
         column(2, 
                plotOutput(outputId = "player_photo1_shots")
         ), 
         column(3, offset = 1,
                tableOutput("player1_shots_table"),
                tags$head(tags$style("#player1_shots_table  table {background-color:#2D3741;
                              color: #FFFFFF;}",  type="text/css"))
                
         ),
         column(3,
                tableOutput("player2_shots_table"),
                tags$head(tags$style("#player2_shots_table  table {background-color:#2D3741;
                              color: #FFFFFF;}", media="screen", type="text/css"))
                
         ),
         column(2,
                plotOutput(outputId = "player_photo2_shots")
         )
),
fluidRow(style = "margin-top:-20em", class = "myRow2",
         column(12, align = 'center', plotlyOutput(outputId = "player_shots_map")))