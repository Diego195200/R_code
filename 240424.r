viv <- read.csv(file.choose())
sdem <- read.csv(file.choose())
hog <- read.csv(file.choose())

# names(viv)


# variable identificador
viv$folio <- paste(viv$cd_a, viv$ent, viv$con, viv$v_sel)
hog$folio <- paste(hog$cd_a, hog$ent, hog$con, hog$v_sel, hog$n_hog, hog$h_mud)

# base1 <- merge(viv, hog, by='folio', all.x = T, all.y = T) pega todos renglones y columnas

base1 <- merge(viv, hog, by='folio', all.x = T)
