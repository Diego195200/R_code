# histograma en R con ggplot2
library('dplyr')
library('ggplot2')

# descargar base de datos
# hist() old function
# from ggplot2 most used function

# importing the dataset bcs
bcs <- read.csv(file.choose())
# cleaning the database
# check the descriptor to know the values without specifications to delete them

# deleting the 999 values without specification from AGE

# -------------FORMA 1 ---------------------------------------------
# creating a new structure
bcs1 <- as_tibble(bcs) %>%
mutate(eda1 = case_when(EDAD == 999~ NA_real_))
table(bc$EDAD)
table(bc$eda1)
# ------------------------------------------------------------------

# ----------------- FORMA 2-------------------------------------------
# deleting the unspecified values of AGE and assigning to a new dataset bcs1
bcs1 <- as_tibble(bcs) %>%
  filter (EDAD != 999)
table(bcs$EDAD)
table(bcs$eda1)
table(bcs1$EDAD)

# graph of the bcs1 EDAD

ggplot(bcs1, aes(x=EDAD)) + 
  geom_histogram(color="darkblue", fill="lightblue") + 
  labs(title='Distribucion edad') + 
  xlab('Edad') + ylab('conteo')

bc2 <- as_tibble(bcs) %>%
  filter (INGTRMEN != 999999)

ggplot(bc2, aes(x=INGTRMEN)) + 
  geom_histogram(bins=1000, color='darkblue', fill='lightblue')+
xlim(0,100000) + 
  labs(title='Distribución ingreso')+
xlab('Ingreso') + ylab('conteo')
