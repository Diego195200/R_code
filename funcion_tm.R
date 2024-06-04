library(dplyr)

viv <- read.csv(file.choose())

muestracong <- function(niv, er, yi, xi, N, M){
  xbarra <- sum(xi)/sum(yi)
  ybarra <- M/N
  nn = length(yi)
  desv <- sqrt(sum((xi-xbarra*yi)^2)/nn)
  z <- qnorm(1-(1-niv)/2)
  n0 <- (z*desv/(er*ybarra))^2
n <- (n0*N)/(n0+N)
return(ceiling(n))
}


xi <- tapply(viv$estim_pag, viv$est_dis, sum, na.rm = TRUE)
xi
yi <- tapply(viv$estim_pag, viv$est_dis, length)
yi
N <- length(unique(viv$est_dis))
M <- nrow(viv)

muesenigh <- muestracong(.95, 1000, yi, xi, N, M)
muesenigh

set.seed(2)
muestrafinal <- sample(unique(viv$est_dis), muesenigh)
muestrafinal

# seleccionar los 10 conglomerados

muestra_viv <- viv %>% filter(est_dis %in% muestrafinal)
muestra_viv

