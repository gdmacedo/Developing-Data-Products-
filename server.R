library(ggplot2)
options(shiny.sanitize.errors = TRUE)
function(input, output, session) {
  output$plot <- renderPlot({
    plot(cars, 
         type=input$plotType
    )
  })
  
  output$summary <- renderPrint({
    summary(cars)
  })
  
  # Filter data based on selections
  output$tableMpg <- DT::renderDataTable(DT::datatable({data <- mpg
  if (input$man != "All") {
    data <- data[data$manufacturer == input$man,]
  }
  if (input$cyl != "All") {
    data <- data[data$cyl == input$cyl,]
  }
  if (input$year != "All") {
    data <- data[data$year == input$year,]
  }
  if (input$trans != "All") {
    data <- data[data$trans == input$trans,]
  }
  data
  }
  )
  )
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'black')
  })
  output$PlotHstgm <- renderPlot({y <- mtcars[,1]
                                  bins <- seq(min(y), 
                                               max(y), 
                                               length.out = input$mpg + 1
                                              )  
                                  hist(y, main="Miles Per Galon",
                                       xlab="Galon",
                                       ylab="Miles",
                                       breaks = bins, 
                                       col = "blue", 
                                       border = "black"
                                      )
                                  }
                                 )
}
