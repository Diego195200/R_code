moneda <- 1:2
probmoneda <-rep(0.5, 2)
sim <- sample(moneda, 10, prob = probmoneda, replace=TRUE)
t1 <- table(sim)
prop.table(t1) * 100
# (sim/sum(sim) )* 100
barplot(sim)
sim2 <- sample(moneda, size=10000, prob = probmoneda, replace = TRUE)

t2 <- table(sim2)
prop.table(t2)

# Suponiendo que la moneda tiene 0.7 de prob de caer un lado, 
# simular 10 lanzamientos y luego 1000000

probmoneda <- c(0.7, 0.3)
sim3 <- sample(moneda, 10, prob=probmoneda, replace = TRUE)
t3 <- table(sim3)
prop.table(t3)*100
barplot(sim3)

sim4 <- sample(moneda, 1000000, prob=probmoneda, replace = TRUE)
t4 <- table(sim4)
prop.table(t4)*100

dado <- 1:6
probdado <- rep(1/6, 6)

simdado <- sample(dado, 10, prob=probdado, replace = TRUE)
d1 <- table(simdado)
prop.table(d1)
barplot(d1)


# install.packages('prob')

# lanzamiento de dos monedas

# c1 <- c(c(1,1), c(1,2), c(2,1), c(2,2))
c11 <- c(1,1)
c12 <- c(1,2)
c21 <- c(2,1)
c22 <- c(2,2)

tosscoin(2)
