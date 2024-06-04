#Conocer todos los resultados posibles del lanzamiento de dos dados
dado <- 6
probdado <- rep(1/6, 6)
com <- expand.grid(1:dado, 1:dado) # Generar las combinaciones
com

# Obtener la suma de todos los posibles resultados
sum1 <- apply(com, 1, sum) # Aplica la operación sobre la matriz
sum1

#Obtener la probabilidad de la suma de todos los posibles resultados
prob <- table(sum1)
prop.table (sum1)

#Graficar las probabilidades
barplot(prob, col = "rosybrown1", space = 0.5, main = "Prob. de la suma de
        cada posible resultado", xlab = "Suma", ylab = "Núm. dado",)

        
  
