muestra_est_prop <- function(niv, er, Ni, vari){
  
  # niv: nivel de confianza
  # er: margen de error
  # Ni: tamaño i-esimo estrato (vector containng all strates)
  # vari: varianza del i-esimo estrato (vector)
  
  N <- sum(Ni)  # total population size
  alf <- 1 - niv  # significance level
  z <- qnorm(1 - alf/2)  # critical value corresponding to 1-alf/2
  x <- (N * z^2 * sum(Ni*vari))
  y <- ((N*er)^2 + (z^2)*sum(Ni*vari))
  nfinal <- ceiling(x/y)  # tamaño total de la muestra, cuantos se entrevistan
  mestrfin <- (nfinal*Ni/N) # tamaño proporcional
  return(list(n=nfinal, ni=mestrfin))
}

Ni <- tapply(poblacion$edad, poblacion$entidad, length)
vari <- tapply(poblacion$edad, poblacion$entidad, sd, na.rm=T)

my_n<- muestra_est_prop(0.95, 0.05, Ni, vari)
my_n