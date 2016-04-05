# ui.r

library(shiny)

source('linnplot_functions.R')
source('defs_resources.R')
source('note_functions.R')
source('linnstrument_scales.R')

# navbarPage("Navbar!",
           # tabPanel("Plot",

shinyUI(navbarPage('Linnstrument Scale Explorer',
                   tabPanel('Small Scale',
                            fluidPage(
                              plotOutput('linnplot_small',width='100%',height='500px'),
                              hr(),
                              fluidRow(
                                column(3,
                                       selectInput('root.note', 'Root Note', names(note.numbers),selected='Minor'),
                                       br(),
                                       selectInput('musical.mode', 'Mode', names(musical.modes),selected='G')
                                ),
                                column(4, offset = 1,
                                       sliderInput('zoom.factor', 'Circle Zoom', 1.5, min = 0.5, max = 3, step = 0.1),
                                       checkboxInput('key.colors','Color Code Chord Types?',value=FALSE),
                                       imageOutput('chord_legend')
                                )
                              )
                            )
                   ),
                   tabPanel('Large Scale',
                            fluidPage(
                              plotOutput('linnplot_large',width='100%',height='500px'),
                              hr(),
                              fluidRow(
                                column(3,
                                       h4('Scale Settings'),
                                       selectInput('root.note', 'Root Note', names(note.numbers),selected='Minor'),
                                       br(),
                                       selectInput('musical.mode', 'Mode', names(musical.modes),selected='G')
                                ),
                                column(4, offset = 1,
                                       sliderInput('zoom.factor2', 'Circle Zoom', 2.5, min = 1, max = 4, step = 0.1)
                                )
                              )
                            )
                   ),
                   tabPanel('Large Scale Overlays',
                            fluidPage(
                              plotOutput('linnplot_large_overlay',width='100%',height='500px'),
                              hr(),
                              fluidRow(
                                column(3,
                                       h4('Scale Settings'),
                                       selectInput('root.note', 'Root Note', names(note.numbers),selected='Minor'),
                                       br(),
                                       selectInput('musical.mode', 'Mode', names(musical.modes),selected='G')
                                ),
                                column(3,
                                       h4('Overlay Scale Settings'),
                                       selectInput('root.note2', 'Root Note', names(note.numbers),selected='Minor'),
                                       br(),
                                       selectInput('musical.mode2', 'Mode', names(musical.modes),selected='F')
                                ),
                                column(4, offset = 1,
                                       sliderInput('zoom.factor3', 'Circle Zoom', 2.5, min = 1, max = 4, step = 0.1)
                                )
                              )
                            )
                   ),
                   tabPanel('About',
                            fluidPage(
                              fluidRow(
                                column(2,
                                       h4('Linnstrument Scale Explorer'),
                                       br(),
                                       br(),
                                       p('Created by Cole Brokamp'),
                                       p('cole.brokamp@gmail.com'),
                                       p('@cole_brokamp'),
                                       a('Source code on GitHub',href='https://github.com/cole-brokamp/linnstrument_scales')
                                )
                              )
                            )
                   )
))
