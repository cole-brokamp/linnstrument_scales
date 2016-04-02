# ui.r

library(shiny)

shinyUI(fluidPage(
  
  title = "Linnstrument Scale Explorer",
  
  plotOutput('linnplot_small',width='100%',height='500px'),
  
  hr(),
  
  fluidRow(
    column(3,
           h4('Scale Settings'),
           selectInput('root.note', 'Root Note', names(note.numbers),'Major'),
           br(),
           selectInput('musical.mode', 'Mode', names(musical.modes),'C')
    ),
    column(4, offset = 1,
           h4('Visual Settings'),
           sliderInput('zoom.factor', 'Circle Zoom', 1.5, min = 0.5, max = 3, step = 0.1),
           checkboxInput('key.colors','Color Code Chord Types?',value=FALSE),
           imageOutput('chord_legend')
    ),
    column(2,
           h4('Linnstrument Scale Explorer'),
           h5('Created by:'),
           h5('cole.brokamp@gmail.com'),
           h5('@cole_brokamp')
  ))
))
