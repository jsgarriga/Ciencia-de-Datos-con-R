# 5. Visualización de datos

# Diapositivas del taller de hoy 
# https://r-intro-aset.netlify.app/a_diapositivas/03_visualizacion

# Para chusmear sus ilustraciones:
# Data science illustrations - Allison Horst 
# https://allisonhorst.com/data-science-art

# Instalamos la librería si aún no la tenemos
install.packages("eph")

# Cargamos las librerías
library(eph)
library(ggplot2)
library(dplyr)

# Cargamos los datos
base_eph <- eph::toybase_individual_2016_04

# Sobre las variables utilizadas en los datos de la EPH, INDEC:
# - Condición de actividad = ESTADO
# 0 = Entrevista individual no realizada
# 1 = Ocupado
# 2 = Desocupado
# 3 = Inactivo
# 4 = Menor de 10 años
# - Sexo = CH04: 1 masculino, 2 femenino
# - Edad = CH06
# - Factor de ponderación = PONDERA

# Ver Diseño de registro y estructura para las bases preliminares Hogar y Personas
# https://www.indec.gob.ar/ftp/cuadros/menusuperior/eph/EPH_registro_1T2022.pdf

# Visualizamos datos, edad en histograma
ggplot(data = base_eph,
       mapping = aes(x = CH06)) +
  geom_histogram()

# Lo hacemos más bonito
# Los colores pueden ser nombres en inglés o valores hex. Pueden chusmear colores en 
# https://coolors.co/palettes/trending
# Mi versión con colores en hex
ggplot(data = base_eph, 
       mapping = aes(x = CH06)) + 
  geom_histogram(fill = "#2a9d8f",
                 colour = "#264653",
                 alpha = 0.5)

# Vamos a filtrar los datos
# Ejemplo
base_eph %>% 
  filter(CH06 == 0) %>% 
  count()

# Filtrado, subconjunto
tabla_edad <- base_eph %>% 
  filter(CH06 >= 0) %>% 
  group_by(CH04) %>% 
  summarise(edad_media = mean(CH06, na.rm = TRUE)) %>% 
  mutate(edad_media = round(edad_media, digits = 0))

# Veamoslo en un gráfico de barras
ggplot(data = tabla_edad,
       mapping = aes(x = CH04,
                     y = edad_media)) +
  geom_col(aes(fill = CH04),
           colour = "black",
           alpha = 0.7)

# Sexo como factores
ggplot(data = tabla_edad,
       mapping = aes(x = as.factor(CH04),
                     y = edad_media)) +
  geom_col(fill = c("#2a9d8f", "#cdb4db"),
           colour = "black",
           alpha = 0.7)

# Filtro por aglomerados y sexo. Seguimos visualizando
# 02 = Gran La Plata
# 32 = Ciudad Autónoma de Buenos Aires
# 33 = Partidos del GBA
base_eph %>%
  filter(AGLOMERADO %in% c(32, 33, 2)) %>%
  count(AGLOMERADO, CH04) %>%
  ggplot(mapping = aes(x = as.factor(AGLOMERADO),
                       y = n)) +
  geom_col(aes(fill = as.factor(AGLOMERADO))) +
  facet_wrap(facets = "CH04") +
  geom_text(aes(label = n),
            vjust = -0.25)

# Los mismo para Cuyo
# 10 = Gran Mendoza
# 26 = Gran San Luis
# 27 = Gran San Juan
base_eph %>%
  filter(AGLOMERADO %in% c(10, 26, 27)) %>%
  count(AGLOMERADO, CH04) %>%
  ggplot(mapping = aes(x = as.factor(AGLOMERADO),
                       y = n)) +
  geom_col(aes(fill = as.factor(AGLOMERADO))) +
  facet_wrap(facets = "CH04") +
  geom_text(aes(label = n),
            vjust = -0.25) +
  labs(title = "Cantidad de personas por sexo en Cuyo",
       x = "Aglomerados de Cuyo",
       y = "Cantidad de personas",
       fill = "Aglomerados",
       caption = "Notas: 1. Masculino, 2. Femenino")

# Más ejemplos!
tabla_ejercicio_2 <- base_eph %>% 
  filter(AGLOMERADO %in% c(36, 9, 17)) %>% 
  count(AGLOMERADO, ESTADO) %>% 
  group_by(AGLOMERADO) %>% 
  mutate(peso = round(n / sum(n) * 100, digits = 2))

ggplot(data = tabla_ejercicio_2,
       mapping = aes(x = as.factor(AGLOMERADO) ,
                     y = n)) +
  geom_col(aes(fill = ESTADO)) +
  facet_wrap(facets = "ESTADO") +
  geom_text(aes(label = n),
            vjust = -0.25) 

# EXTRA!

# Pueden chusmear más sobre visualización...
# https://es.r4ds.hadley.nz/28-communicate-plots.html
# https://ggplot2-book.org/start
# https://clauswilke.com/dataviz/
# https://r-graphics.org/

# Además, la siguiente librería
install.packages("esquisse")

