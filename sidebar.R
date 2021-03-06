convertMenuItem <- function(mi,tabName) {
  mi$children[[1]]$attribs['data-toggle']="tab"
  mi$children[[1]]$attribs['data-value'] = tabName
  if(length(mi$attribs$class)>0 && mi$attribs$class=="treeview"){
    mi$attribs$class=NULL
  }
  mi
}

convertMenuItem(menuItem("Charts", tabName = "charts",icon = icon("bar-chart-o"),selected=T,
                         menuSubItem("Sub-item 1", tabName = "subitem1"),
                         menuSubItem("Sub-item 2", tabName = "subitem2")),"charts")

selectGWs <- as.numeric(fpl_shots$round)

sidebar <- function() {
  sidebar <- dashboardSidebar(width = 250, tags$style(".left-side, .main-sidebar {padding-top: 10px}"),
         tags$head(tags$style(
           ".footnote { font-size: 11px;position:fixed; bottom:0; right:0.2; left:0; width:'2px';background:#343E48;  z-index: 100; opacity: 0.9; padding:20px;}"
           
           
         )),                     
    sidebarMenu(id = "tabs", 
                tags$a(
                       tags$img(src='https://drive.google.com/uc?id=1Q236F97gIzTNogf6czXtworeSKuOpjai', height='100',width ='100%',style="display: block; margin-left: auto; margin-right: auto;"),
                        ),
                menuItem('Home', tabName = 'pageHome'
                                            ),
                convertMenuItem(menuItem('Season Analysis', tabName = 'pag1'
                                         ), 'pag1'),
                convertMenuItem(menuItem('Player Season Analysis', tabName = 'pag2',selected=T,
                         pickerInput("PickSeason", selected = "2019/2020", choices= levels(fpl_shots$season),
                                    shiny::HTML("<p><span style='color: white'>Select Season</span></p>"), 
                                     options = list(title = "Just Pick a Season!", size = 10, 'actions-box' = TRUE, 
                                                    virtualScroll = TRUE), multiple = F),
                         pickerInput("PickPlayer1Shots", selected = "Mohamed Salah", choices= levels(fpl_shots$player),
                                     shiny::HTML("<p><span style='color: white'>Select Player</span></p>"), 
                                     options = list(title = "Pick One Player Here", 'live-search' = TRUE, virtualScroll = TRUE), multiple = F),
                         pickerInput("PickPlayer2Shots", selected = "Raheem Sterling", choices= levels(fpl_shots$player),
                                     shiny::HTML("<p><span style='color: white'>Select Player To Compare</span></p>"), 
                                     options = list(title = "Pick One Another Here", 'live-search' = TRUE, virtualScroll = TRUE), multiple = F),
                         sliderInput(inputId = 'PickGWs',shiny::HTML("<p><span style='color: white'>Select Gameweeks</span></p>"), 
                                     min=min(selectGWs), max = max(selectGWs), value = c(12,19), sep = '', animate = T)),'pag2'
                         ),
                convertMenuItem(menuItem('Pre-Gameweek Analysis', tabName = 'pag3', selected=T, 
                         pickerInput("PickSeason_pag3", selected = "2019/2020",choices= levels(fpl_bar$season),
                                    shiny::HTML("<p><span style='color: white'>Select Season</span></p>"), 
                                     options = list(`actions-box` = TRUE), multiple = F),
                         pickerInput("PickGWs_pag3", selected = "19", choices= unique(fpl_bar$round),
                                     shiny::HTML("<p><span style='color: white'>Select Gameweek</span></p>"), 
                                     options = list(`actions-box` = TRUE), multiple = F),
                         pickerInput("PickPlayer1_pag3", selected = "Mohamed Salah",choices= levels(fpl_bar$player),
                                     shiny::HTML("<p><span style='color: white'>Select Player</span></p>"), 
                                     options = list(title = "Pick One Player Here", 'live-search' = TRUE, virtualScroll = TRUE), multiple = F),
                         pickerInput("PickPlayer2_pag3", selected = "Raheem Sterling",choices= levels(fpl_bar$player),
                                     shiny::HTML("<p><span style='color: white'>Select Player To Compare</span></p>"), 
                                     options = list(title = "Pick One Player Here", 'live-search' = TRUE, virtualScroll = TRUE), multiple = F)
                ),'pag3'),
                menuItem('Assistant Manager', tabName = 'pag4'),
                tags$li(class = 'dropdown', tags$style(
                  HTML('
      /* main sidebar */
        .skin-blue .main-sidebar {
                              background-color: #343E48;
                              font-family: monospace;
                              }

        /* active selected tab in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                              background-color: #16191c;
                              }

        /* other links in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                              background-color: #343E48;
                              color: #FFFFFF;
                              }

        /* other links in the sidebarmenu when hovered */
         .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                              background-color: #92E3FF;
                              }
        /* toggle button when hovered  */                    
         .skin-blue .main-header .navbar .sidebar-toggle:hover{
                              background-color: #499CBA;
         }
          /* pickerinput */                    
         .picker-dropdown{
                    background-color: #16191c; color: #ffffff; !important;
         }
        #PickSeason + div>.picker-input{
                    background-color: #16191c; color: #ffffff; !important;
         }             
                       '
                       ))),
                tags$li(class = 'input', tags$style(
                  HTML('
        #PickSeason + div>.picker-input{
                    background-color: #16191c; color: #ffffff; !important;
         }             
                       '
                  ))),
                hr(),
                tags$div( class = "footnote", tags$p("Created by Dhaneswara Mandrasa"), tags$p("dhaneswara.mandrasa@gmail.com")
                          ,align = "center"),
                shiny::actionButton(inputId='ab1', label="Find Me!              ", 
                                    icon = icon("linkedin"), 
                                    onclick ="window.open('https://www.linkedin.com/in/dhaneswaramandrasa/', '_blank')")
    )
  )
    
  return(sidebar)
}