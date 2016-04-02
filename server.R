# server.r

library(shiny)

source('linnplot_functions.R')
source('defs_resources.R')
source('note_functions.R')
source('linnstrument_scales.R')


shinyServer(function(input, output, session) {

  output$linnplot_small <- renderPlot({
    plotScaleSmall(root.note=input$root.note,musical.mode=input$musical.mode,
                   zoom.factor=input$zoom.factor,key.colors=input$key.colors)
  })
  output$chord_legend <- renderImage(list(src='chord_type_legend.png'),deleteFile=FALSE)
})