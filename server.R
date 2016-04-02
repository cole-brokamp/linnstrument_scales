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
  output$linnplot_large <- renderPlot({
    plot_large_linn(root.note=input$root.note,mode=input$musical.mode,
                    zf=input$zoom.factor2,octaves=c(2,3))
  })
  output$linnplot_large_overlay <- renderPlot({
    plot_overlaying_scales(root.note.1=input$root.note,root.note.2=input$root.note2,
                           mode.1=input$musical.mode,mode.2=input$musical.mode2,
                           zf=input$zoom.factor3,octave=3)
  })
  output$chord_legend <- renderImage(list(src='chord_type_legend.png'),deleteFile=FALSE)
})