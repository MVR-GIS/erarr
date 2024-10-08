#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @noRd
#' 
#' @importFrom shiny fluidPage navbarPage conditionalPanel mainPanel 
#'                   sidebarPanel tabPanel tabsetPanel sidebarLayout 
#'                   selectizeInput downloadButton
#'                   tag tags tagList div img h6
#' @importFrom shinyjs useShinyjs hidden
#' @importFrom dplyr select mutate filter
#' @importFrom bslib bs_theme layout_column_wrap card card_header card_body 
#'                   tooltip
#' @importFrom plotly plotlyOutput
#' @importFrom DT DTOutput
#' @importFrom stringr str_trim
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    tags$head(tags$style(HTML("
                          body > nav{
                          margin-bottom:0 !important;}
                          body > div.container-fluid{
                          padding:0;}
                          .popover {--bs-popover-max-width: 100%;
                          data-bs-animation: FALSE;}
                          .action-button {border-radius: 12px;}
                          .navbar-header { padding: 20px;
                                            height : 75px;}
                          #upperdiv { background-color: #EAEAEA; } 
                          "))),
    fluidPage(
      shinyjs::useShinyjs(),
      theme = bslib::bs_theme(bootswatch = "pulse", version = 5, primary = "#9B4121", alert = "#9B4121"),
      div(
        style = "background-color: #333; padding: 10px; border-bottom: 1px solid #dee2e6; display: flex; align-items: center;",  # Use Flexbox
        img(src = "www/castle.png", height = "50px", width = "60px"),
        h3("Risk Analysis Reporting System", style = "margin: 0; padding-left: 10px; color: white;")  # Remove default margin
      ),
      bslib::navset_tab(
        tabPanel("District",
                 sidebarLayout(
                   sidebarPanel(
                     h5("Filter Projects"),
                     selectizeInput('MSCInput',
                                    'MSC',
                                    choices = NULL,
                                    selected = NULL,
                                    multiple = F,
                                    options=list(placeholder = 'Select an MSC')), 
                     selectizeInput(
                       'districtsInput',
                       "District",
                       choices = NULL,
                       selected = NULL,
                       multiple = F,
                       options=list(placeholder = 'Select a District', 
                                    maxOptions = 40)),
                     selectizeInput('ProgramCodeInput',
                                    'Program (Code)',
                                    choices = NULL,
                                    selected = NULL,
                                    options=list(placeholder = 'Program (Code)')),
                     selectizeInput('ProgramTypeInput',
                                    'Program Type',
                                    choices = NULL,
                                    selected = NULL,
                                    options=list(placeholder = 'Program Type')),
                     selectizeInput('MissionInput',
                                    'Primary Mission',
                                    choices = NULL,
                                    selected = NULL,
                                    options=list(placeholder = 'Primary Mission')),
                     h5("Filter Project Risks"),
                     selectizeInput(
                       "projdisInput",
                       "Discipline",
                       choices = NULL,
                       selected = NULL,
                       multiple = F,
                       options=list(placeholder = 'Select a Discipline')
                     ),  selectizeInput(
                       "projcatInput",
                       "Risk Category",
                       choices = NULL,
                       selected = NULL,
                       multiple = F,
                       options=list(placeholder = 'Select a Risk Category')
                     ),
                     selectizeInput(
                       "projphaseInput",
                       "Phase",
                       choices = NULL,
                       selected = NULL,
                       multiple = F,
                       options=list(placeholder = 'Enter Phase')),
                     shinyjs::hidden(
                       selectizeInput(
                         "projmileInput",
                         "Milestone",
                         choices = NULL,
                         selected = NULL,
                         multiple = F,
                         options=list(placeholder = 'Enter Milestone'))),
                     actionButton("resetBtn","Reset Filters", 
                                  style = "color: #9B4121;",
                                  icon =icon("arrows-rotate"))
                     ,
                     width=2
                   ), 
                   mainPanel(tabsetPanel(
                     tabPanel(
                       "Explore Projects",
                       textOutput("dynamic_title_program"),
                       textOutput("last_updated"),
                       plotly::plotlyOutput("projpies"),
                       DT::DTOutput("projoverview"), 
                       value= "Explore Projects"),
                     tabPanel("Reports",   
                              layout_column_wrap(
                                width = 1/4,
                                height = 275,
                                bslib::card(
                                  height = 165,
                                  full_screen = FALSE,
                                  card_header("Program Top 4s",
                                              shiny::downloadButton(
                                                outputId="download_ProgTop4s",
                                                label="Download",
                                                style = "color: #9B4121; 
                                                background-color: transparent;
                                                float:right;
                                                border-color: transparent;"
                                              )),
                                  card_body(
                                    tags$button(id = "Prog4s", 
                                                class="action-button",
                                                tags$img(src="www/ProjectTop4.png",
                                                         height = '165px',
                                                         max_width = '100%',
                                                ),
                                    ),
                                    
                                  )))))))),

        tabPanel("Project",
                 sidebarLayout(
                   sidebarPanel(
                     h5("Filter Risks"),
                     selectizeInput(
                       'districtInput',
                       "District",
                       choices = NULL,
                       selected = NULL,
                       multiple = F,
                       options=list(placeholder = 'Select a District', 
                                    maxOptions = 40)
                     ),
                     selectizeInput("projectInput", 
                                    "Project", 
                                    choices = NULL,
                                    selected = NULL,
                                    multiple = F,
                                    options=list(
                                      placeholder = 'Select a Project')),
                     h6("or"),
                     selectizeInput(
                       "P2Input",
                       "P2 Number",
                       choices = NULL,
                       selected = NULL,
                       multiple = F,
                       options=list(placeholder = 'Enter P2 Number')
                     ),
                     shinyjs::hidden(
                       selectizeInput(
                         "SubIDInput",
                         "Sub ID",
                         choices = NULL,
                         selected = NULL,
                         multiple = FALSE,
                         options =  list(placeholder = "Select SubID")
                       )),
                     conditionalPanel(condition = "input.reporttabs == 'Reports'",
                                      selectizeInput(
                                        "riskInput",
                                        "Risk",
                                        choices = NULL ,
                                        selected = NULL,
                                        multiple = F,
                                        options=list(
                                          placeholder = 'Select a Risk Item')
                                      )),
                     conditionalPanel(condition = "input.reporttabs == 'Explore'",
                                      selectizeInput(
                                        "phaseInput",
                                        "Phase",
                                        choices = NULL,
                                        selected = NULL,
                                        multiple = F,
                                        options=list(
                                          placeholder = 'Enter Phase')),
                                      shinyjs::hidden(
                                        selectizeInput(
                                          "mileInput",
                                          "Milestone",
                                          choices = NULL,
                                          selected = NULL,
                                          multiple = F,
                                          options=list(
                                            placeholder = 'Enter Milestone'))),
                                      selectizeInput(
                                        "disInput",
                                        "Discipline",
                                        choices = NULL,
                                        selected = NULL,
                                        multiple = F,
                                        options=list(
                                          placeholder = 'Select a discipline')
                                      ),
                                      actionButton("resetBtn","Reset Filters", 
                                                   style = "color: #9B4121;",
                                                   icon =icon("arrows-rotate"))
                     ), width=2),
                   
                   mainPanel(
                     tabsetPanel(
                       tabPanel(
                         "Explore Risks",
                         textOutput("dynamic_title_project"),
                         textOutput("last_updated"),
                         plotly::plotlyOutput("pie"),
                         DT::DTOutput("overviewtab"),
                         value= "Explore"
                       ),
                       tabPanel("Reports",
                                layout_column_wrap(
                                  width = 1/4,
                                  height = 275,
                                  bslib::card(
                                    height = 165,
                                    full_screen = FALSE,
                                    card_header("Project Risks",
                                                shiny::downloadButton(
                                                  outputId="download_Proj",
                                                  label="Download",
                                                  style = "color: #9B4121; 
                                                background-color: transparent;
                                                float:right;
                                                border-color: transparent;"
                                                )
                                    ),
                                    card_body(
                                      tags$button(id ="Proj", class="action-button",
                                                  tags$img(src="www/ProjAllRisk.png", 
                                                           height='165px', 
                                                           max_width='100%')
                                      )
                                    )),
                                  bslib::card(
                                    height = 100,
                                    full_screen = FALSE,
                                    card_header("All Risk",
                                                shiny::downloadButton(
                                                  outputId="download_AllRisk",
                                                  label="Download",
                                                  style = "color: #9B4121; 
                                                background-color: transparent;
                                                float:right;
                                                border-color: transparent;"
                                                )),
                                    card_body(
                                      tags$button(id = "AllRisk", 
                                                  class="action-button",
                                                  tags$img(src="www/AllRiskDetail.png", 
                                                           height='165px', 
                                                           max_width='100%')))                   
                                  ),
                                  bslib::card(
                                    height = 165,
                                    full_screen = FALSE,
                                    card_header("Top 4s",
                                                shiny::downloadButton(
                                                  outputId="download_Top4s",
                                                  label="Download",
                                                  style = "color: #9B4121; 
                                                background-color: transparent;
                                                float:right;
                                                border-color: transparent;"
                                                )),
                                    card_body(
                                      tags$button(id = "Proj4s", 
                                                  class="action-button",
                                                  tags$img(src="www/ProjectTop4.png",
                                                           height = '165px',
                                                           max_width = '100%',
                                                  ),
                                      ),
                                      
                                    )
                                    #d-flex align-items-center gap-1
                                  ),
                                  bslib::card(
                                    height = 165,
                                    full_screen = FALSE,id="RiskItemCard",
                                    card_header("Risk Item",
                                                tooltip(bsicons::bs_icon("info-circle"),
                                                        "Select a Risk Item", 
                                                        placement="right", 
                                                        id="tooltip"),
                                                shiny::downloadButton(
                                                  outputId="download_RiskItem",
                                                  label="Download",
                                                  style = "color: #9B4121; 
                                                background-color: transparent;
                                                float:right;
                                                border-color: transparent;"
                                                )),
                                    card_body(
                                      tags$button(id = "RiskItem", 
                                                  class="action-button",
                                                  tags$img(src="www/RiskItem.png", 
                                                           height='165px', 
                                                           max_width = '100%'))
                                    )),
                                )
                       ),
                       id = "reporttabs" )
                   )
                 )
        ), id="upperdiv")
    )
  )} 