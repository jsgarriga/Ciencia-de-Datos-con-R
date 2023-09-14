# Manipulación de datos con Tidyverse

# Para instalar el paquete:
install.packages("tidyverse")

# Importamos las librerías necesarias
library(tidyverse)

# OPCIÓN 1: Vamos a cargar datos csv para trabajar
mundo <- read_csv("./datos/gapminder.csv", sep = ";")

# NOTA: para asignar valores a un objeto es válido tanto "=" como " <- ". De todas maneras, por convención en la comunidad, se estiliza la asignación con " <- "

# OPCIÓN 2: LO MISMO PERO DESDE UN PAQUETE
install.packages("datos")
library(datos)
library(gapminder)

mundo <- gapminder

# Vamos a manipular los datos
argentina <- mundo %>%
  filter(country == "Argentina")

# Filtramos los datos para solamente Argentina creando un subconjunto de datos, es decir, un recorte o segmento
argentina <- filter(mundo, country == "Argentina")

# Filtramos datos de años posteriores a 1967
argentina <- filter(argentina, year > 1967)

# Vamos a achicar más aún, o bien, segmentar con select
argentina <- select(argentina, -continent)


