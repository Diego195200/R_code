# Diego Barranco

caras_dado <- c(1, 2, 3, 4, 5, 6)
posibles_resultados <- c()
# obteniendo los posibles resultados al lanzar dos dados
for (c1 in caras_dado){
  for (c2 in caras_dado){
    posibles_resultados <- c(posibles_resultados, c(c1, c2))
  }
}
  

frecuencia_resultados <- rep(0, length(caras_dado) * 2 - 1)

# ahora frecuencia de toda posible suma de 2 a 12
for (dado1 in caras_dado) {
  for (dado2 in caras_dado) {
    suma <- dado1 + dado2
    frecuencia_resultados[suma - 1] <- frecuencia_resultados[suma - 1] + 1
  }
}

# la probabilidad de un evento es la probabilidad de ocurrencia del evento de
# interés sobre el total de combinaciones
total_combinaciones <- length(caras_dado) ** 2
probabilidades <- frecuencia_resultados / total_combinaciones

resultados <- seq(2, 12, by = 1) # para graficar

# Graficar las probabilidades
barplot(probabilidades, 
        names.arg = resultados, 
        xlab = "Suma de los dados", 
        ylab = "Probabilidad de la suma", 
        main = "Probabilidades de las sumas",
        col = "darkblue",
        ylim = c(0, 0.2))
