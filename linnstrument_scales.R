## plot scale on large Linn
plot_large_linn <- function(root.note,mode,scale.color,octaves,zf) {
  plotLinn(zoom.factor=zf)
  for (o in octaves) plotScale(root.note='C',mode='Minor',scale.color='red',octave=o,zoom.factor=zf*1.3)
}

# ex
# plot_large_linn(root.note='C',mode='minor',scale.color='red',octaves=c(2,3))

# plot overlaying different scales
plot_overlaying_scales <- function(root.note.1='C',root.note.2='G',mode.1='Minor',mode.2='Phrygian',zf=1,octave=3){
  plotLinn(zoom.factor=zf)
  plotScale(root.note=root.note.1,mode=mode.1,scale.color='red',zoom.factor=zf*1.3,octave=octave)
  plotScale(root.note=root.note.1,mode=mode.1,scale.color='red',zoom.factor=zf*1.3,octave=octave+1)
  plotScale(root.note=root.note.1,mode=mode.1,scale.color='red',zoom.factor=zf*1.3,octave=octave-1)
  plotScale(root.note=root.note.2,mode=mode.2,scale.color='orange',add.numbers=TRUE,zoom.factor=zf*0.8,octave=octave)
}

# plot_overlaying_scales(octave=3)

# plot smaller linnstrument
# plotScaleSmall(root.note='G',musical.mode='Minor',zoom.factor=1,key.colors=TRUE)

# plot_chord_legend <- function(){
#   plot(1,1,xaxt='n',yaxt='n',bty='n',pch=NA)
#   legend(title='chord type',horiz=F,
#          'center',legend=c('minor','major','dim'),
#          bty='n',cex=2,
#          fill=c(rgb(0.5294118,0.8078431,1,1),
#                 rgb(0.8039216,0.1490196,0.1490196,1),
#                 rgb(0.745098,0.745098,0.745098,1)))
# }

### make three tabs:
# 1) plot just one scale across a lot of octaves
# 2) plot two overlaying different scales
# 3) plot one scale with chord legend