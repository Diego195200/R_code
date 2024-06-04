# Diego Isau Barranco Herrera

y <- c(53, 25, 18, 86, 12, 19, 34, 42, 44, 62, 58, 21, 56, 36)
d1 <- c(1,2,3,4,5,6)
d2 <- c(3,6,3,2,4,6,6,6) # 2 3 3 4 6 6 6 6
y_bar <- sum(y)/length(y)


# MEDIA
prom <- function(datos){    # same as prom <- function (x) sum(x)/length(x)
  avg <- sum(datos)/length(datos)
  return(avg)
}
prom(y)  
prom(d1)
prom(d2)


# Moda
moda <- function(data) {
  u <- unique(data)  # Crea un vector sin repeticiones
  tab <- tabulate(match(data, u))  # crea un vector con el no de repeticiones
  u[tab == max(tab)]  # se crea una seq de booleans y verifica cual es True
}

moda(d2)


# Mediana

mediana <- function (data){
  # ordenando vector
  ord_v <- sort(data)
  len <- length(data)
  # Obteniendo mediana
  if (len %% 2 == 0){
    med <- (ord_v[len/2] + ord_v[len/2 + 1])/2
    return(med)
  }
  else{
    med <- ord_v[len/2 + 1]
    return(med)
  }
}

mediana(c(3, 13, 7, 5, 21, 23, 39, 23, 40, 23, 14, 12, 56, 23, 29))
mediana(d2)
mediana(c(3, 13, 7, 5, 21, 23, 23, 40, 23, 14, 12, 56, 23, 29))
