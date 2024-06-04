install.packages('markovchain')
library(markovchain)

P <- matrix(c(0, 0.5, 0.5, 0.5, 0, 0.5, 0.5, 0.5, 0), nrow = 3, ncol = 3,
            byrow = TRUE)

mc = new("markovchain", transitionMatrix=P, states=c('a', 'b', 'c'), name='DB')
str(mc)
summary(mc)
plot(mc)

# cadena con 4 estados

P2<-matrix(c(0,0.25,0.5,0.25,0.25,0,0.25,0.5,0.5,0.25,0,0.25,0.25,0.25,0.5,0), nrow = 4, ncol = 4, byrow = TRUE)

mc2 = new("markovchain",transitionMatrix=P2,states=c("a","b","c", "d"), name="DBM")
str(mc2)
summary(mc2)
plot(mc2)