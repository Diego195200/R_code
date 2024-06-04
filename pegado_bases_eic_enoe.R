library(dplyr)
viv <- read.csv("TR_VIVIENDA03.CSV")
per <- read.csv("TR_PERSONA03.CSV")


# aguascalientes (01)

ag_per <- read.csv("TR_PERSONA01.CSV")
ag_viv <- read.csv("TR_VIVIENDA01.CSV")

ag_viv$ID_VIV <- as.character(ag_viv$ID_VIV)
ag_per$ID_PERSONA <- as.character(ag_per$ID_PERSONA)
ag_per$ID_VIV <- as.character(ag_per$ID_VIV)
VIVPER2 <- merge(ag_viv,ag_per, by='ID_VIV')


# baja california (02)
bc_viv <- read.csv("TR_VIVIENDA02.CSV")
bc_per <- read.csv("TR_PERSONA02.CSV")


bc_viv$ID_VIV <- as.character(bc_viv$ID_VIV)  # typecasting
bc_per$ID_VIV <- as.character(bc_per$ID_VIV)  #typecasting
bc_per$ID_PERSONA <- as.character(bc_per$ID_PERSONA)  #typecasting

VIVPER3 <- merge(bc_viv, bc_per, by='ID_VIV')

# baja california sur (03)
class(viv$ID_VIV)  # verify data type
viv$ID_VIV <- as.character(viv$ID_VIV)  # typecasting
per$ID_VIV <- as.character(per$ID_VIV)  #typecasting
per$ID_PERSONA <- as.character(per$ID_PERSONA)  #typecasting



VIVPER1 <- merge(viv, per, by='ID_VIV')  # para saber que base primero en el documento dice


# pegado por renglones

data <- bind_rows(VIVPER1, VIVPER2, VIVPER3)
