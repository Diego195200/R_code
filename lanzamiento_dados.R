library('dplyr')

nlanzam <- 5
numdados <- 10
dado <- c(1,2,3,4,5,6)
val1 <- tibble(val=dado)

for (j in 1: numdados){
  if (j==1){
    resulta <- data.frame(
      val=slice_sample(val1, replace=T, n=nlanzam), sample=j)
  }else{
    resulta <- bind_rows(
      resulta, data.frame(val=slice_sample(val1, replace=T, n=nlanzam), 
                          sample=j))
  }

}
View(resulta)
