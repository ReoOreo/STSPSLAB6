vars <- setdiff(names(iris), "Species")

pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'x variable', vars),
    selectInput('ycol', 'Y variable', vars, selected = vars[[2]]),
    numericInput('clusters', 'cluster count', 3, min = 1, max = 9)
  ),
  mainPanel(plotOutput('plot1'))
)