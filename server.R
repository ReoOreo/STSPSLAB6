function(input, output, session)
{
  selecteddata <- reactive({
    iris[,c(input$xcol, input$ycol)]
  })
  clusters <- reactive({
    kmeans(selecteddata(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#f781bf", "#999999"))
    
    par(mar = c(5.2, 4.2, 0, 1))
    plot(selecteddata(),
         col=clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 5, cex = 5, lwd = 5)
  })
  
}