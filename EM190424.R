# tamaño de muestra ... representatividad

# tipo de muestreo
# 1. probabilistico
# 2. no probabilistico

# muestreo probabilistico

# - aleatorio simple
# - aleatorio estratificado
# - aleatorio por conglomerados

# muestreo no prob
# 1. conveniencia
# 2. intencional
# 3. cuotas
# 4. Bola de nieve


# MUESTREO ALETORIO SIMPLE (MAS)

# dentro de los muestreos prob el MAS es el muestreo más básico
# existen dos tipos de MAS: con reemplazo y sin reemplazo

# necesitamo conocer todos los elementos de la población 
# en R existen diversas funciones que realizan el cálculo de un MAS
# ventajas
# -Calculo sencillo
# - facil de comprender
# - muestreo basico
# desventajas
# -conocer a toda la poblacion
# - no siempre el MAS es representativo, ie, no se puede generalizar la info

ccc <- data.frame(cars)
help(cars)
library(dplyr)
cc1 <- slice_sample(ccc, n=10)
cc2 <- sample(ccc, 10, replace=T)

# muestreo aleatorio estratificado

