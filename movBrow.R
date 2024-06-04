# movimiento browniano sencillo, siguiendo una normal
n <- 1000
t <- 100
bm <- c(0, cumsum(rnorm(n,0.075,sqrt(t/n))))
steps <- seq(0, t, length=n+1)
plot(steps, bm, type='l')

# otr movimineto browniano

simGBM <- function(P0, mu, sigma, T, nSteps, nRepl){
  dt <- T/nSteps
  muT <- (mu-sigma^2/2)*dt
  sigmaT <- sqrt(dt)*sigma
  pathMatrix <- matrix(nrow=nRepl, ncol=nSteps+1)
  pathMatrix[,1]<-P0
  for(i in 1:nRepl){
    for(j in 2:(nSteps+1)){
      pathMatrix[i,j] <- pathMatrix[i, j-1]*exp(rnorm(1, muT, sigmaT))
    }
  }
  
  return (pathMatrix)
}

P0 <- 1
mu <- 0.1
sigma <- 0.5
T <- 100/360
nSteps <- 50
nRepl <- 2000

paths <- simGBM(P0, mu, sigma, T, nSteps, nRepl)
yBounds <- c(min(paths), max(paths))

plot(paths[1,], ylim=yBounds, type='l', col=1, main='Simulacion de una trayectoria', xlab='Tiempo', ylab='Precio')
for(k in 2:nRepl) lines(paths[k,], col=k)
