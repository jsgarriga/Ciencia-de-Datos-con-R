# Continuación de la explicación de R base

# Objetos o variables
sabado = "pastillas"

# Tipos de datos

# "pastillas" es un dato de tipo "character", o en español "cadena de texto"
# Veamos...
class(sabado)

# veamos otro objeto: datos numéricos
numero = 1
class(numero) # con esta función verificamos el tipo de dato

# y qué pasa si...?
y_esto_que_es = "2"
class(y_esto_que_es)

# ejemplo de datos de tipo lógicos
# 5 es menor que 7?
5 < 7

# 5 es menor que 3?
comparacion = 5 < 3
comparacion

# alternativa a "class"
typeof(5.676567) # "double"
typeof(4) # idem

class(5.676567) # "numeric"
class(4) # idem

# UN NUEVO OBJETO APARACE: LAS AVENTURAS DE LOS VECTORES

edad = c(18, 20, 22, 38)
class(edad)

# coerción implícita, ejemplo que sigue la propiedad de homogeneidad
otro_vector = c(72, 45, "papa")






