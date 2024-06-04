# dplyr, tidyr, ggplot2
# Barranco Herrera Diego Isau

library('dplyr')
library('tidyr')
library('ggplot2')

sim.one.PoissonProcess <- function(run, tmax, lambda){
  
  w <- c()
  w[1] <- 0
  i <- 2
  while(w[i-1] < tmax){
    
    Ti <- rexp(1, lambda)
    #print(Ti)
    if(w[i-1]+ Ti < tmax){
      w[i] <- w[i-1] + Ti
      
    }else{
      break
    }
    i <- i + 1
  }
 df <- data.frame('runs' = rep(run, length(w)),
                  'n' = 0:(length(w)-1),
                  't' = w)
 return(df)
}


sim.PoissonProcess <- function(n.runs, tmax, lambda){
  for(i in 1:n.runs){
    if(i == 1){
      df_1 <- sim.one.PoissonProcess(run=i, tmax, lambda)
      
    }else{
      df_i <- sim.one.PoissonProcess(run=i, tmax, lambda)
      df_1 <- rbind(df_1, df_i)
    }
    
  }
  return(df_1)
}

n.runs <- 1
tmax <- 200
lambda <- 0.2

sim.PP <- sim.PoissonProcess(n.runs, tmax, lambda)


moments_pp <- data.frame('t'=c(0:tmax), 'lambda'=lambda) %>%
  mutate('mean' = t*lambda,
         'sd_inf' = mean - 2*sqrt(t*lambda),
         'sd_sup' = mean + 2*sqrt(t*lambda))
head(sim.PP)

options(repr.plot.width=16, repr.plot.height=8)
p1 <- ggplot(sim.PP, mapping=aes(x=t, y=n, color = runs)) + 
  geom_step(sim.PP, mapping=aes(x=t, y=n, group = runs), alpha = 0.25, col='black') + 
  geom_step(moments_pp, mapping=aes(x=t,y=mean),col='red',size=0.7, alpha=0.5) +
  geom_step(moments_pp, mapping=aes(x=t,y=sd_sup),col='blue',size=0.7,linetype = "dashed") +
  geom_step(moments_pp, mapping=aes(x=t,y=sd_inf),col='blue',size=0.7,linetype = "dashed") +
  labs( title = paste(n.runs, "Trajectorias del proceso Poisson con lambda ", lambda)) +
  theme(legend.position = "none") +
  scale_colour_grey(start = 0.2,end = 0.8) +
  coord_cartesian(xlim = c(0, tmax))
p1
