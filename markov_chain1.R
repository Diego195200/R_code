library(markovchain)

P <- matrix(c(1/4, 3/4, 1/8, 7/8, 3/7, 4/7, 8/10, 2/10, 4/7, 3/7, 1/2, 1/2), 
            byrow = TRUE, nrow = 4, ncol=4)

mc <- new('mark chain', transitionMatrix=P, states=c('1', '2', '3', '4'),
          name='Dmark')
str(mc)
summary(mc)
plot(mc)
P_square = P %*% P



