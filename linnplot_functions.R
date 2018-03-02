CBapply <- function (X, FUN, output = "data.frame", fill = FALSE, num.cores = 1, ...) {
  if (!output %in% c("data.frame", "list")) 
    stop("output must be specified as \"data.frame\" or \"list\"")
  if (num.cores == 1) 
    tmp <- sapply(X, FUN, simplify = FALSE, USE.NAMES = TRUE, 
                  ...)
  if (!num.cores == 1) 
    tmp <- parallel::mclapply(X, FUN, mc.cores = num.cores, 
                              ...)
  if (output == "data.frame") {
    if (fill) {
      tmp <- lapply(tmp, as.data.frame)
      rtn <- do.call(plyr::rbind.fill, tmp)
      try({
        row.names(rtn) <- names(tmp)
      }, silent = TRUE)
    }
    if (!fill) {
      rtn <- do.call(rbind, tmp)
      try({
        row.names(rtn) <- names(tmp)
      }, silent = TRUE)
    }
  }
  if (output == "list") 
    rtn <- tmp
  return(rtn)
}

## plot default LinnStrument layout
plotLinn <- function(zoom.factor=1,accent.notes='C',main.notes=c('D','E','F','G','A','B')) {
  par(mar=c(0.5,0.5,0.5,0.5))
  plot(expand.grid(1:25,1:8),
       xlim=c(1.25,24.75),ylim=c(0.75,8.25),
       xaxt='n',yaxt='n',bty='n',pch=NA)
  sapply(1:26,function(x) lines(x=c(x-0.5,x-0.5),c(0.5,8.5)))
  sapply(1:9,function(y) lines(x=c(0.5,25.5),y=c(y-0.5,y-0.5)))
  points(CBapply(accent.notes,noteNameToPlotIndicies),
         col=rgb(0, 0, 1, 0.25),pch=19,cex=2.75*zoom.factor)
  points(CBapply(main.notes,noteNameToPlotIndicies),
         col=rgb(0, 1, 0, 0.25),pch=19,cex=2.75*zoom.factor)
}


## overlay points for a scale
plotScale <- function(root.note='C',octave=3,mode='Minor',scale.color='red',add.numbers=FALSE,zoom.factor=1) {
  # plotLinn(...)
  root.note.numbers <- note.numbers[root.note] + octave*12
  scale.note.numbers <- c(sapply(root.note.numbers,function(x) x + 
                                   c(musical.modes[[mode]],12)))
  scale.plot.indices <- CBapply(scale.note.numbers,noteNumberToPlotIndicies)
  points(scale.plot.indices,col=scale.color,cex=1.5*zoom.factor,pch=19)
  if (add.numbers) {
    # for numbers in order of scale
    scale.note.numbers.dict <- data.frame('note.number'=scale.note.numbers,
                                          'note.order'=as.character(1:length(scale.note.numbers)))
    scale.note.numbers.num.label <- as.character(sapply(do.call(c,sapply(scale.note.numbers,function(x) rep(x,sum(x == note.matrix)))),
                                                        function(x) scale.note.numbers.dict[scale.note.numbers.dict$note.number==x,'note.order']))
    points(CBapply(scale.note.numbers,noteNumberToPlotIndicies),col=rgb(1,1,1,1),cex=0.7*zoom.factor,
           pch=scale.note.numbers.num.label)
  }
}


## small layout for single octave scales
plotScaleSmall <- function(root.note='C',musical.mode='Major',zoom.factor=1,key.colors=TRUE,accent.notes='C',main.notes=c('D','E','F','G','A','B')) {
  plotLinnSmall()
  root.note.number <- note.numbers[root.note] + 12
  scale.note.numbers <- c(root.note.number + c(musical.modes[[musical.mode]],12))
  
  scale.note.numbers.dict <- data.frame('note.number'=scale.note.numbers,
                                        'note.order'=as.character(1:length(scale.note.numbers)))
  scale.points <- CBapply(scale.note.numbers,noteNumberToPlotIndiciesSmall)
  noteNumberToPlotIndiciesSmall(note.numbers[root.note] + 12)[1, ]
  scale.points.unique <- scale.points[(scale.points$x < noteNumberToPlotIndiciesSmall(root.note.number)[1, ]$x + 5) &
                                        (scale.points$x >= noteNumberToPlotIndiciesSmall(root.note.number)[1, ]$x) &
                                        (scale.points$y >= noteNumberToPlotIndiciesSmall(root.note.number)[1, ]$y), ]
  
  if (key.colors) {
    box.colors <- sapply(switch(musical.mode,
                                'Minor'=minor.scale.chords,
                                'Major'=major.scale.chords,
                                'Dorian'=dorian.scale.chords,
                                'Lydian'=lydian.scale.chords,
                                'Mixolydian'=mixolydian.scale.chords,
                                'Phrygian'=phrygian.scale.chords,
                                'Locrian'=locrian.scale.chords),
                         function(x) switch(x,
                                            'min'=rgb(0.5294118,0.8078431,1,1), #skyblue1
                                            'maj'=rgb(0.8039216,0.1490196,0.1490196,1), #firebrick3
                                            'dim'=rgb(0.745098,0.745098,0.745098,1)) #grey
    )
    points(scale.points.unique,col=box.colors,bg=box.colors,pch=22,cex=8*zoom.factor)
  }

  points(scale.points.unique,col='black',cex=4*zoom.factor,pch=19)
  points(scale.points.unique,col=rgb(1,1,1,1),cex=1.4*zoom.factor,
         pch=as.character(1:length(scale.note.numbers)))
}


plotScaleSmall <- function(root.note='C',musical.mode='Major',zoom.factor=1,key.colors=TRUE,accent.notes='C',main.notes=c('D','E','F','G','A','B')) {
  par(mar=c(0.5,0.5,0.5,0.5))
  plot(expand.grid(1:9,1:6),
       xlim=c(0.25,9.75),ylim=c(0.25,6.25),
       xaxt='n',yaxt='n',bty='n',pch=NA)
  sapply(1:10,function(x) lines(x=c(x-0.5,x-0.5),y=c(0.5,5.5)))
  sapply(1:6,function(y) lines(x=c(0.5,9.5),y=c(y-0.5,y-0.5)))
  
  root.note.number <- note.numbers[root.note] + 12
  scale.note.numbers <- c(root.note.number + c(musical.modes[[musical.mode]],12))
  
  scale.note.numbers.dict <- data.frame('note.number'=scale.note.numbers,
                                        'note.order'=as.character(1:length(scale.note.numbers)))
  scale.points <- CBapply(scale.note.numbers,noteNumberToPlotIndiciesSmall)
  noteNumberToPlotIndiciesSmall(note.numbers[root.note] + 12)[1, ]
  scale.points.unique <- scale.points[(scale.points$x < noteNumberToPlotIndiciesSmall(root.note.number)[1, ]$x + 5) &
                                        (scale.points$x >= noteNumberToPlotIndiciesSmall(root.note.number)[1, ]$x) &
                                        (scale.points$y >= noteNumberToPlotIndiciesSmall(root.note.number)[1, ]$y), ]
  
  if (key.colors) {
    box.colors <- sapply(switch(musical.mode,
                                'Minor'=minor.scale.chords,
                                'Major'=major.scale.chords,
                                'Dorian'=dorian.scale.chords,
                                'Lydian'=lydian.scale.chords,
                                'Mixolydian'=mixolydian.scale.chords,
                                'Phrygian'=phrygian.scale.chords,
                                'Locrian'=locrian.scale.chords),
                         function(x) switch(x,
                                            'min'=rgb(0.5294118,0.8078431,1,1), #skyblue1
                                            'maj'=rgb(0.8039216,0.1490196,0.1490196,1), #firebrick3
                                            'dim'=rgb(0.745098,0.745098,0.745098,1)) #grey
    )
    points(scale.points.unique,col=box.colors,bg=box.colors,pch=22,cex=8*zoom.factor)
  }
  
  points(CBapply(accent.notes,noteNameToPlotIndiciesSmall),col=rgb(0, 0, 1, 0.5),pch=19,cex=6*zoom.factor)
  points(CBapply(main.notes,noteNameToPlotIndiciesSmall),col=rgb(0, 1, 0, 0.5),pch=19,cex=6*zoom.factor)
  
  points(scale.points.unique,col='black',cex=4*zoom.factor,pch=19)
  points(scale.points.unique,col=rgb(1,1,1,1),cex=1.4*zoom.factor,
         pch=as.character(1:length(scale.note.numbers)))
}

