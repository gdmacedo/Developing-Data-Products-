library(shiny)
library(ggplot2)
library(shinythemes)
fluidPage(tags$head(tags$link(rel = "stylesheet", 
                              type = "text/css", 
                              href = "./www/style.css"
                              )
                    ),
              includeCSS("./www/style.css"),
              theme = shinytheme("cerulean"),
              # Application title
              titlePanel("Â DATA SCIENCE"),
              navbarPage("Developing Data Products",
                     tabPanel("Project",
                              fluidRow(column(4,
                                              headerPanel("MTCars : Motor Trend Car"),
                                              img(class="img-polaroid",
                                                  src=paste0("https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/60830516_2343055332413021_530036820168146944_n.jpg?_nc_cat=103&_nc_ht=scontent-gru2-2.xx&oh=d90c767917455ab41b3c322b2b5f5c04&oe=5D5AEC27")
                                                  )
                                              ),
                                       column(8,
                                              headerPanel("The Project"),
                                              img(class="img-polaroid",
                                                  src=paste0("https://scontent.ffor21-1.fna.fbcdn.net/v/t1.0-9/64396807_2211761662193860_1967510959085846528_o.jpg?_nc_cat=106&_nc_oc=AQmiGDLyw-iqUaDZ92OSfyiNXgTqQhf8y6E9m8XYcMWvoRm-9VfvOt80WTPkxhGlKy8&_nc_ht=scontent.ffor21-1.fna&oh=cc9cd586896ed0f1aca0daed7d865e90&oe=5D86F909")
                                              )
                                       )
                                      )
                            ),
                     tabPanel("Data",
                              titlePanel("MTCars : Motor Trend Car - Road test data set"),
                              fluidRow(
                                column(3,
                                       selectInput("man",
                                                   "Manufacturer:",
                                                   c("All",
                                                     unique(as.character(mpg$manufacturer))))
                                ),
                                column(3,
                                       selectInput("trans",
                                                   "Transmission:",
                                                   c("All",
                                                     unique(as.character(mpg$trans))))
                                ),
                                column(3,
                                       selectInput("year",
                                                   "year:",
                                                   c("All",
                                                     unique(as.character(mpg$year))))
                                ),
                                column(3,
                                       selectInput("cyl",
                                                   "Cylinders:",
                                                   c("All",
                                                     unique(as.character(mpg$cyl))))
                                )
                              ),
                              fluidRow(DT::dataTableOutput("tableMpg")
                                      )
                            ),
                     navbarMenu("Graphics",
                                tabPanel("Histagran",
                                sidebarLayout(sidebarPanel(sliderInput("mpg",
                                                                       "Miles Per Galon",
                                                                        min = 1,
                                                                        max = 50,
                                                                        value = 30
                                                                      )
                                                        ),
                                             mainPanel(plotOutput("PlotHstgm"))
                                             )
                                       ),
                                tabPanel("Plot",
                                         sidebarLayout(sidebarPanel(radioButtons("plotType", 
                                                                                 "Plot type",
                                                                                 c("Scatter"="p", 
                                                                                   "Line"="l"
                                                                                  )
                                                                                )
                                                                    ),
                                                      mainPanel(tags$small("O grafico Abaixo"),
                                                                plotOutput("plot")
                                                               )
                                                       )
                                        )
                          ),
                     tabPanel("The Author",
                              fluidRow(column(4,
                                              headerPanel("Macedo, Glener Diniz"),
                                              img(class="img-polaroid",
                                                  src=paste0("https://scontent.ffor21-1.fna.fbcdn.net/v/t1.0-9/19895061_1375893182447383_7592759197865761547_n.jpg?_nc_cat=102&_nc_eui2=AeHnofEmBWhsTfKAcKw4MOcn6xq-GfgXmpjp85-1_N_7dhxxeKqPrRaDk8MnLLwwztQLjKtzd6NIhu0B7lZTj1ufhym47dGxoYbPPXJOKyn0MA&_nc_ht=scontent.ffor21-1.fna&oh=4b53017593a9a233de9090430f877ae5&oe=5D5E9ADD")
                                              )
                              ),
                              column(8,
                                     headerPanel("The Author"),
                                     img(class="img-polaroid",
                                         src=paste0("https://scontent.ffor21-1.fna.fbcdn.net/v/t1.0-9/62261034_2211761648860528_4689876039784988672_n.jpg?_nc_cat=101&_nc_oc=AQlIIeaHorMFE33OtAJOizcYOFCPbFm0lYQGMk2hD-ut_s2w2QfIYZsrYlSe3ppFC_U&_nc_ht=scontent.ffor21-1.fna&oh=31f20f944307c6b2996cea839fd933af&oe=5D931DB0")
                                        )
                                    )
                              )
                     ),
                     navbarMenu("Help",
                                tabPanel("About",
                                         fluidRow(column(4,
                                                         headerPanel("About"),
                                                         img(class="img-polaroid",
                                                             src=paste0("https://scontent.ffor21-1.fna.fbcdn.net/v/t1.0-9/64307251_2211821288854564_7531273557817425920_n.png?_nc_cat=103&_nc_oc=AQnsx9W2fiFdXnW0Of6FNnN-dbieOnAB-1wrWOoMXITOFcf0tRBoKcuDh8pEcp3b3mY&_nc_ht=scontent.ffor21-1.fna&oh=8651b961f0dd57a079d3dd194b9dd933&oe=5D7F86E9")
                                                             )
                                                        ),
                                                  column(8,
                                                         headerPanel("The University"),
                                                         img(class="img-polaroid",
                                                             src=paste0("https://scontent.ffor21-1.fna.fbcdn.net/v/t1.0-9/62214582_2211861935517166_1605283832636899328_o.jpg?_nc_cat=110&_nc_oc=AQn0c4I_3dNgU6lIJqhk-j6SHvS1ER5bal-Lf0H3W7HxeXiljecMTPGZ5f19hEw8t-c&_nc_ht=scontent.ffor21-1.fna&oh=b2239cae0d30c3feb0e4f17e23718a35&oe=5D90105F")
                                                            )
                                                        )
                                                  )
                                        )
                              )
              )
)
