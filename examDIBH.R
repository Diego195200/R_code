# ejercicios secuencias

# 1) generar 1000 datos de 3 en 3 y obtener el dato 300 de la secuencia
seq1 <- seq(0,2999, 3)
seq1[300]

# 2) 450 datos que sus secuencias sea de 50 datos en 50, obtener el dato 10

seq2 <- seq(0, 22499, 50)
seq2[10]

# 3) 2000 datos que su secuencia sea de 0.3 en 0.3, 
# obtener los datos 3, 15, 800 y 1999

seq3 <- seq(0, 299.9, 0.3)
seq3[3]
seq3[15]
seq3[800]
seq3[1999]

# ejercicios datos aleatorios

# 1) muestra de 500 trabajadores, rango de antiguedad de 0 a 30 años,
# obtener el el ultimo dato de la muestra

trab_samp <- sample(0:30, 500, replace=T)
trab_samp[500]

# 2) generar una muestra de 50,000 de un rango de 0 hasta 100000

samp2 <- sample(0:100000, 50000, replace=T)


# 3) muestra de 50 datos que con rango de 10 a 19, obtener datos 34, 43, 49

samp3 <- sample(10:19, 50, replace=T)
samp3[34]
samp3[43]
samp3[49]
