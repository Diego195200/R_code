install.packages('shiny')
require('shiny') # activar sesion libreria

t1 <- read.csv(file.choose('file name')) # open file
baseenigh<- read.csv(file.choose())
max(baseenigh$antiguedad)
table(baseenigh$antiguedad)
