bcs <- read.csv(file.choose())
bc <- read.csv(file.choose())
# 1 hombre 3 mujer

table(bcs$SEXO)
table(bc$SEXO)

bcs_sex <- table(bcs$SEXO)
bc_sex <- table(bcs$SEXO)
prop.table(bcs_sex)
prop.table(bc_sex)

