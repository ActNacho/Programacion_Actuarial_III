# Prueba de Asignación de Variables
x <- 1
# Impresión forzada
print(x)
# Impresión indirecta
x
msg <- "Hola a todos"
msg

x <-1 # Un comentario sin sentido

#Se inicia una secuencia de datos y se imprime
x <- 1:100
x
# Con corchete, al inicio de cada fila se verá
# la posición que corresponde al primer elemento
# de cada renglón impreso.

#Es más útil saber esto para situaciones como esta:
x <- rep(c("a","b","c"),30)
x

#El signo de : se utiliza para denotar series de numeros
x <- 1:20
x

##Clases atómicas en R
?class
class(1)     # numeric
class(1L)    # integer
class(1*1L)  # numeric
class(3+12i) # complex
(3+12i)*(3-12i)
class((3+12i)*(3-12i)) 
class(TRUE)  # boolean
class(TRUE*1)
class(c(1,FALSE,3L,2+4i,"a"))
# La clase más dominante es character

# Para crear vectores vacios del tipo y 
# tamaño que me interesa.
a <- vector(mode = "numeric", length = 10)
# La función c() también me permite 
# crear vectores, pero lo hace a partir
# de los elementos del vector
a <- c(1,5,3L,2+4i,T,FALSE)
a
b <- c(a,"cadena")
b
c <- c(1,5,3L,2+4i,T,FALSE,"cadena")
c

# Coerción explícita
x <- 0:6
class(x)
as.integer(x)
as.numeric(x)
as.logical(x)
as.complex(x)
as.character(x)

#Listas de Objetos
x <- list(F, 3L, 94.5, 2+3i, "a")
x
# Cada elemento de la lista puede ser de 
# diferente clase.


#Matrices
x <- matrix(nrow=2, ncol=3)
x
attributes(x)
# Ejemplo de llenado por filas,
# si cambiamos el T por F se llena 
# por columnas
x <- matrix(1:6,2,3,TRUE)
x

x <- matrix(1:10,2,5,F)
x

# Creación de una Matriz al forzar
# su dimensión.
x <- 1:10
x
dim(x) <- c(2,5)
x

# cbind y rbind
x <- 1:5
y <- 11:15
z <- 21:25


cbind(x,y,z)
rbind(x,y,z)

x1<- c(11:14,"15")
x2<- c(21:24,"25")
x3<- c(31:34,"35")
x4<- c(41:44,"45")
x5<- c(51:54,"55")

rbind(x1,x2,x3,x4,x5)

# Factores
x <- factor(c("si","si","no","si","no"))
x
y <- factor(c("verde","azul","amarillo","rojo","azul","azul","morado","verde","verde"))
y
# Para ver la cantidad de elementos de cada tipo
table(x)
table(y)
# Lo vemos graficamente
plot(x)
plot(y)
# Separamos los componentes de la lista de factor
unclass(x)

# Para ordenar de una manera alternativa los niveles
x <- factor(c("si","si","no","si","no"), levels = c("si","no"))
x
# Para mantener sólo los niveles que me interesan
y <- factor(c("verde","azul","amarillo","rojo","azul","azul","morado","verde","verde"),levels = c("azul","morado"))
y


# Valores Faltantes
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

y <- c(1,2,NaN,NA,3)
is.na(y)
is.nan(y)

# Data Frames
x <- data.frame(foo=11:14, bar=c(T,F,F,T))
x
row.names(x)
# Para modificar el nombre de las filas
row.names(x) <- c("hugo","paco","luis","rosita")
x

nrow(x)
ncol(x)

# Para modificar el nombre de las columnas
x <- 1:3
names(x) <- c("foo","bar","norf")
x
# Nombres en listas
x <- list(a=1,b=2,c=3)
#Nombres en matrices
m <- matrix(1:4,nrow=2,ncol=2)
m
dimnames(m) <- list(c("a","b"),c("c","d"))
m


data <- read.csv(file="table.csv")
head(data)

# Probaremos la función dput y dget
y <- data.frame(a=1, b="a")
y
dput(y)
dput(y,file="y.R")
# Con la siguiente instruccion eliminamos de 
# memoria a y
rm(y)
# Si referente en la memoria, recuperamos el 
# objeto y a partir del archivo que guardamos.
nueva.y <- dget(file="y.R")
nueva.y


# Probemos ahora dump
x <- "Programación Actuarial III"
y <- data.frame(a=1,b="a")
# dump me permite realizar lo mismo que 
# dget pero con objetos múltiples
dump(c("x","y"),file="data.R")
rm(x,y)
source("data.R")

## Conexiones
con <- url("http://www.fcfm.buap.mx/","r")
readLines(con,10)

# Creamos un vector
x <- c("a","b","c","c","d","e")
x
# Extraemos un elemento con []
x[1]
x[2]
x[1:4]
x[x>="c"]
u <- x == "c"
x[u]
x[!u]

# Extracción de una lista con []
x <- list(foo=1:4, bar=0.6, baz="Hola")
x
x[1]; class(x[1])
x[[1]]; class(x[[1]])
x$foo
x["bar"]
x[["bar"]]

x <- list(a=list(10,12,14), b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]