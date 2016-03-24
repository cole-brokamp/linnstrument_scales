musical.modes <- list('Major'= c(0, 2, 4, 5, 7, 9, 11), 
                      'Minor'= c(0, 2, 3, 5, 7, 8, 10),
                      'Dorian'= c(0, 2, 3, 5, 7, 9, 10),
                      'Mixolydian'= c(0, 2, 4, 5, 7, 9, 10),
                      'Lydian'= c(0, 2, 4, 6, 7, 9, 11),
                      'Phrygian'= c(0, 1, 3, 5, 7, 8, 10),
                      'Locrian'= c(0, 1, 3, 5, 6, 8, 10),
                      'Diminished'= c(0, 1, 3, 4, 6, 7, 9, 10),
                      'Whole-half'= c(0, 2, 3, 5, 6, 8, 9, 11),
                      'Whole Tone'= c(0, 2, 4, 6, 8, 10),
                      'Minor Blues'= c(0, 3, 5, 6, 7, 10),
                      'Minor Pentatonic'= c(0, 3, 5, 7, 10),
                      'Major Pentatonic'= c(0, 2, 4, 7, 9),
                      'Harmonic Minor'= c(0, 2, 3, 5, 7, 8, 11),
                      'Melodic Minor'= c(0, 2, 3, 5, 7, 9, 11),
                      'Super Locrian'= c(0, 1, 3, 4, 6, 8, 10),
                      'Bhairav'= c(0, 1, 4, 5, 7, 8, 11),
                      'Hungarian Minor'= c(0, 2, 3, 6, 7, 8, 11),
                      'Minor Gypsy'= c(0, 1, 4, 5, 7, 8, 10),
                      'Hirojoshi'= c(0, 2, 3, 7, 8),
                      'In-Sen'= c(0, 1, 5, 7, 10),
                      'Iwato'= c(0, 1, 5, 6, 10),
                      'Kumoi'= c(0, 2, 3, 7, 9),
                      'Pelog'= c(0, 1, 3, 4, 7, 8),
                      'Spanish'= c(0, 1, 3, 4, 5, 6, 8, 10)
)

note.numbers <- c('C'=0,'C#'=1,'D'=2,'D#'=3,'E'=4,'F'=5,'F#'=6,'G'=7,'G#'=8,'A'=9,'A#'=10,'B'=11)

minor.scale.chords <- c('min','dim','maj','min','min','maj','maj','min')
major.scale.chords <- c('maj','min','min','maj','maj','min','dim','maj')
lydian.scale.chords <- c('maj','maj','min','dim','maj','min','min','maj')
mixolydian.scale.chords <- c('maj','min','dim','maj','min','min','maj','maj')
dorian.scale.chords <- c('min','min','maj','maj','min','dim','maj','min')
phrygian.scale.chords <- c('min','maj','maj','min','dim','maj','min','min')
locrian.scale.chords <- c('dim','maj','min','min','maj','maj','min','dim')

noteNumberToName <- function(note.number) {
  names(note.numbers[note.numbers == note.number - (12*(note.number %/% 12))])
}

# matrix note layout on LinnStrument
note.matrix <- t(sapply(7:0,function(x) c(6:30) + (5*x)))
note.matrix.names <- apply(note.matrix,MARGIN=c(1,2),noteNumberToName)

note.matrix.small <- note.matrix[3:7,2:10]
note.matrix.small.names <- apply(note.matrix.small,MARGIN=c(1,2),noteNumberToName)