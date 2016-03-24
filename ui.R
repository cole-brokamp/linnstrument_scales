# ui.r

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('Linnstrument Scales'),
  sidebarPanel(
    selectInput('root.note', 'Root Note', names(note.numbers),'Major'),
    selectInput('musical.mode', 'Mode', names(musical.modes),'C'),
    sliderInput('zoom.factor', 'Circle Zoom', 1,
                 min = 1, max = 3, step = 0.1),
    checkboxInput('key.colors','Color Code Chord Types?',value=FALSE),
    plotOutput('chord_legend',width='200%',height='800px')
  ),
  mainPanel(
    plotOutput('linnplot_small',width='50%',height='200px')
  )
))

