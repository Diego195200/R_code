# tamaño muestra muestreo estratificado

# muestra estratificada 
mestratiequitativa <- function(niv, er, Ni, vari){
  
  # niv: nivel de confianza
  # er: margen de error
  # Ni: tamaño i-esimo estrato (vector containng all strates)
  # vari: varianza del i-esimo estrato (vector)
  
  k <-length(Ni) # number of strata
  N <- sum(Ni)  # total population size
  alf <- 1-niv  # significance level
  #sig <- sqrt(vari)
  z <- qnorm(1-alf/2)  # critical value corresponding to 1-alf/2
  x <- (k*(z^2)*sum(Ni^2*vari))
  y <- ((N*er)^2+(z^2)*sum(Ni*vari))
  nfinal <- ceiling(x/y)  # tamaño total de la muestra, cuantos se entrevistan
  mestrfin <- ceiling(nfinal/rep(k,k)) # tamaño de cada estrato
  return(list(n=nfinal, ni=mestrfin))
}



# ecuacion para el calculo de una muestra estratificada de tipo equitativo
# n = (K*Z^2*sum(N^2*sigma^2))/N^2^e2+Z^2*sum(N*sigma^2)
# donde k es el numero de estratos, N el total de la población, e el error muestral
# z el nivel de confianza

# dentro de muestreo estratificado hay tres tipos de muestreo 1) equitativo
# 2) proporcional 3) asignación de Neyman
# esta funcion que pusimos anteriormente hace referencia al tipo equitativo, es decir
# en todos los estratos se entrevista al mismo numero de personas por eso se le denomina equitativo

poblacion <- read.csv(file.choose())

#estratos <- tapply(poblacion$edad,poblacion$entidad, sum, na.rm = TRUE)
#variances <- tapply(poblacion$edad, poblacion$entidad, var, na.rm=T)

#my_n <- mestratiprop(0.95, 0.05, estratos, variances)



k  <- length(unique(poblacion$entidad))
# table(poblacion$entidad)

Ni <- tapply(poblacion$edad, poblacion$entidad, length)

vari <- tapply(poblacion$edad, poblacion$entidad, sd, na.rm=T)
niv <- 0.95
er <- 1
m <- mestratiprop(0.95, .05, Ni, vari)  # el error se relaciona con la edad
m



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

