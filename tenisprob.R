# Diego Isau Barranco Herrera

# feller v1 ehrenfest

P <- matrix(c(1, 2, 3, 4, 5, 6,0,8,3), nrow= 3, ncol = 3)
P1 <- matrix(c(1, 2, 3, 4, 5, 6,0,8,3), nrow= 3, ncol = 3)
p2 <- matrix(1:6, nrow = 3, ncol = 2)
p3 <- matrix(1:4, nrow=2, ncol=2)
A1 <- matrix(c(0.2,0.8,1,0), ncol = 2, nrow = 2)
A1[2,2]
A1[1,2]

# comment

Pmat <- function(p){
  # juego (A, B)
  
  # 01 (0, 0)  #02 (15, 0) #03 (30, 0)  #04 (40,0)
  # 05 (0, 15) #06 (15,15) # 07 (30, 15)  #08 (40, 15)
  # 09 (0,30)  #10 (15,30) #11 (30, 30) #12 (40, 30)
  # 13 0, 40  #14 15, 40 #15 30,40 #16 (40,40) deuce
  # 17 Ven A
  # 18 Ven B
  # 19 A gana
  # 20 B gana
  
  P <- matrix(0,20,20)

  P[1,2]<- P[2,3]<-P[3,4]<-P[4,19] <- p #jugador A gana
  P[1,5]<- P[2,6]<-P[3,7]<-P[4,8]<-1-p #jugador B gana
  P[5,6]<-P[6,7]<-P[7,8]<-P[8,19]<-p
  P[5,9] <- P[6,10] <- P[7,11] <- P[8,12] <- 1-p
  P[9,10] <- P[10,11] <- P[11,12] <- P[12,19]<- p
  P[9,13] <- P[10,14]<- P[11,15]<-P[12,16]<- 1-p
  P[13,14]<- P[14,15]<- P[15,16]<-P[16,17] <- p
  P[13,20]<- P[14,20]<- P[15,20]<- P[16,18]<- 1-p
  P[17,18]<-p
  P[17,16]<-1-p
  P[18,16]<- p
  P[18,20]<- 1-p
  P[19,19] <- 1
  P[20,20] <- 1
  
  return(P)
}


P <- Pmat(0.48) # 50% prob de que A gane
n <- 0
pi_n <- c(1, rep(0,19))
cdf <- pi_n[19] + pi_n[20]
max_n <- 100
for (n in 1:max_n){
  
  pi_n <- pi_n %*% P
  cdf[n+1] <- pi_n[19] + pi_n[20]
} 

pmf <- cdf - c(0, cdf[1:max_n])
plot(0:max_n, pmf, type='h', xlab='puntos jugados', col='blue')


  