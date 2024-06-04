library(dplyr)
# Llaves primarias:
# vivenda: cd_a, ent, con, v_sel
# hogar: cd_a, ent, con, v_sel, n_hog, h_mud
# socdem:  cd_a, ent, con, v_sel, n_hog, h_mud, n_ren
# coe1: cd_a, ent, con, v_sel, n_hog, h_mud, n_ren
# coe2: cd_a, ent, con, v_sel, n_hog, h_mud, n_ren

key_VH <- c("cd_a", "ent", "con", "v_sel")
key_VHS <- c("cd_a", "ent", "con", "v_sel", 'n_hog', 'h_mud')
key_VHSC <- c("cd_a", "ent", "con", "v_sel", 'n_hog', 'h_mud', 'n_ren')

# importando tablas
vivienda <- read.csv('vivt219.csv')
hogar <- read.csv('hogt219.csv')
socdem <- read.csv('sdemt219.csv')
coe1 <- read.csv('coe1t219.csv')
coe2 <- read.csv('coe2t219.csv')


# en una vivienda puede tener más de un hogar
# relación uno a muchos, creando tabla con esa relación (outer join)


left <- left_join(vivienda, hogar, by=key_VH)  # creando tabla con los datos de vivienda, contemplando los datos de hogar y sus relaciones
left <- left_join(socdem, left, by=key_VHS)
colnames(left)[colnames(left) == 'h_mud.x'] <- 'h_mud'
left<- left_join(left, coe1, by=key_VHSC)
left <- left_join(left, coe2, by=key_VHSC)

# la base final pegada es "left"


# intento fallido

# necesitamos hacer un left_join para
# que se incluyan los datos de la intersección y aquellos que no lo están

# podemos apreciar que no existe una relación uno a uno entre las tablas
#vivienda %>% select(all_of(key_V)) %>% count()
#hogar %>% select(all_of(key_V)) %>% count()


# creando una "junction table" para lograr la unión sin repetir ni quitar datos



#keys_vivienda <- vivienda %>% select(all_of(key_V))
#keys_hogar <- hogar %>% select(all_of(key_H))
#common <- inner_join(keys_vivienda, keys_hogar)

#full <- full_join(keys_vivienda, keys_hogar)
#data <- setdiff(full, common)


# test
table(left$e_con, left$p1.y) #suma de coe1


