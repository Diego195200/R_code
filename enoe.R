enoe1 <- read.csv(file.choose())
table (enoe1$eda)  # verificar frecuencia de cada columna
table (enoe1$cs_p12)
# diversos universos, a veces se necesita realizar un porcentaje sobre otra población

install.packages('dplyr')
require (dplyr)
enoe1redu <- as_tibble(enoe1) %>% # as_tibble crea una estructura de datos
select(eda, sex, cs_p13_1, e_con) %>% # con las variables indicadas
  # pipe anida funciones

  mutate(gpoeda = case_when(eda>=0 & eda <= 60 ~ 1,
         
         eda > 60 & eda <= 97 ~ 2,
         eda == 98 | eda == 99 ~ 3))

  # nueva variable de grupo de edad con la función mutate gpoeda = 1 (0 a 60 años)
# gpoeda = 2 (>60 y < 97), gpoeda = 3(98 y 99)

  

# another forms 
enoe1redu2 <- enoe1[,c('eda', 'sex', 'cs_p13_1', 'e_con')]
enoe3redu <- enoe1[1:100, c('eda', 'sex', 'cs_p13_1', 'e_con') ]

subset()