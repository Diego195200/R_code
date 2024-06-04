# dplyr select and mutate, %>% pipe anida funciones create conections btw funct

#Diego Barranco

library('dplyr')
# filter and arrange function from dplyr
# filter para filtrar renglones

bcs <- read.csv(file.choose())

# un estudio de personas de zonas rurales que trabajen y que tengan de 50 años
# y que esten unidos o alguna vez unidos

# zona rural menos de 2500 habitantes

# se usa el filter

bcs1 <- as_tibble (bcs) %>%
  filter (TAMLOC == 1 & 
            ( CONACT >= 10 & CONACT <= 16 | CONACT == 33) & 
            (EDAD > 50 & EDAD <= 110) & 
            (SITUA_CONYUGAL >= 1 & SITUA_CONYUGAL<= 5))


# trabajo economico y no economico 
          