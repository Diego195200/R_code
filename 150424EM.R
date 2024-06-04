# write.csv
# write.xlxs
library(questionr)
library(dplyr)
library(data.table)
eness2017 <- read.csv(file.choose())

df <- as_tibble(eness2017) %>% 
  select(P2_1, P2_2, P2_3, P2_4, P2_5, P2_6, P2_7, P2_8, P2_9,
         P1_SEX, FACTOR) %>%
  mutate(by_sex = case_when(P1_SEX==1 ~1, P1_SEX==2 ~2),
         by_afil = case_when(P2_1 == 1 ~1, 
                              P2_2 == 2 ~2, 
                              P2_3 == 3 ~3, 
                              P2_4 == 4 ~4, 
                              P2_5 == 5 ~5, 
                              P2_6 == 6 ~6, 
                              P2_7 == 7 ~7, 
                              P2_8 == 8 ~8, 
                              P2_9 == 9 ~9
                              )
         )
df
table(df$P1_SEX, df$by_afil)
datos<- wtd.table(df$P1_SEX, df$by_afil, weights = df$FACTOR)
rownames(datos) <- c('Hombre', 'Mujer')
colnames(datos) <- c('IMSS', 'ISSSTE', 'ISSSTE Estatal', 'PEMEX',
                     'Defensa o marina', 'Seguro popular', 'IMSS-prospera',
                     'PRIVADA', 'OTRA No Tiene')
datos
