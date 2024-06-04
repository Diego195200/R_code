library('ggplot2')
#x <- cumsum(1:10)
#y <- seq(1,10, by=0.1)
#fex <- dexp(y, rate = 5)
#plot(fex)
######################################

exp1 = cumsum(rexp(10, 0.5))
exp2 = cumsum(rexp(10, 0.75))
x_values = seq(0:9)
data <- data.frame(x_values, exp1, exp2)

ggplot(data, aes(x = x_values, y=exp1)) + 
  geom_step(aes(y=exp1),color='red')+ 
  geom_step(aes(y=exp2),color='blue')+
  scale_x_discrete(limits=x_values)+
  labs(title = "Simulación Proceso de 
       Poisson")+
  xlab('t') + ylab('exp1, exp2')




#X <- cumsum(rexp(10, rate = 0.5)) #X values
#X2 <- cumsum(rexp(10, rate= 0.75))
#p1 <- ggplot(data.frame(t = X, count = seq_along(X)),aes(x = t, y = count))+geom_step()
#p1


