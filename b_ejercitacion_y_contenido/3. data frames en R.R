# Data Frames o "marcos de datos" en R

# vamos a crear un data frame mediante vectores

nombre = c("Brune", "Juana", "Pepe")
edad = c(27, 30, 45)
altura = c(1.70, 1.60, 1.65)

# pasos para crear un data frame y tener un conjunto de datos
estudiantes = data.frame(nombre, edad, altura)
View(estudiantes)
