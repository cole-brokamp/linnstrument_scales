## full Linnstrument

noteNameToPlotIndicies <- function(note.name) {
  arr.ind <- which(note.matrix.names ==  note.name,arr.ind=TRUE)
  arr.ind[ ,'row'] <- sapply(arr.ind[ ,'row'],function(x) switch(paste(x),'1'=8,
                                                                 '2'=7,'3'=6,'4'=5,'5'=4,
                                                                 '6'=3,'7'=2,'8'=1))
  return(data.frame('x'=arr.ind[ ,'col'],'y'=arr.ind[ ,'row']))
}

noteNumberToPlotIndicies <- function(note.number) {
  arr.ind <- which(note.matrix ==  note.number,arr.ind=TRUE)
  arr.ind[ ,'row'] <- sapply(arr.ind[ ,'row'],function(x) switch(paste(x),
                                                                 '1'=8,'2'=7,'3'=6,
                                                                 '4'=5,'5'=4,'6'=3,
                                                                 '7'=2,'8'=1))
  return(data.frame('x'=arr.ind[ ,'col'],'y'=arr.ind[ ,'row']))
}

# Smaller Display of Linnstrument

# plot smaller version to highlight scales and keys
noteNumberToPlotIndiciesSmall <- function(note.number) {
  arr.ind <- which(note.matrix.small ==  note.number,arr.ind=TRUE)
  arr.ind[ ,'row'] <- sapply(arr.ind[ ,'row'],function(x) switch(paste(x),'1'=5,'2'=4,'3'=3,'4'=2,'5'=1))
  return(data.frame('x'=arr.ind[ ,'col'],'y'=arr.ind[ ,'row']))
}

noteNameToPlotIndiciesSmall <- function(note.name) {
  arr.ind <- which(note.matrix.small.names ==  note.name,arr.ind=TRUE)
  arr.ind[ ,'row'] <- sapply(arr.ind[ ,'row'],function(x) switch(paste(x),'1'=5,'2'=4,'3'=3,'4'=2,'5'=1))
  return(data.frame('x'=arr.ind[ ,'col'],'y'=arr.ind[ ,'row']))
}

## Return note names in key
listNotes <- function(root.note='C',musical.mode='Minor'){
  selected.musical.mode <- musical.mode
  root.note.numbers <- note.numbers[root.note]
  scale.note.numbers <- c(sapply(root.note.numbers,function(x) x + 
                                   c(musical.modes[[selected.musical.mode]],12)))
  scale.note.names <- unique(sapply(scale.note.numbers,noteNumberToName))
  return(scale.note.names)
}