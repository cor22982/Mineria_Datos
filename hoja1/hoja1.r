
# EJERCICIO 1
carros <- read.csv("hoja1\\cars.csv", 
                    header = TRUE, 
                    sep = ",", 
                    stringsAsFactors = FALSE, 
                    encoding = "UTF-8")

# Mostrar las primeras filas del dataset
print(head(carros, 5))


# EJERCICIO 2
print(nrow(subset(carros, body_style == 'hatchback')))

convertibles <- subset(carros, body_style=='convertible')
cat("La Media de convertibles: " , mean(subset(convertibles, !is.na(normalized_losses) & normalized_losses != "")$normalized_losses))

# EJERCICIO 3

# Calcular la media de 'normalized_losses' agrupada por 'make' y 'symboling'
str(carros)

peligrosos <- aggregate(carros[,c("symboling", "normalized_losses")], by=list(carros$make), FUN="mean")
colnames(peligrosos) <- c("marca", "indicadorPeligro", "promedioPerdidas")
print(head(peligrosos))

peligrosos_complete <- subset(peligrosos, !is.na(promedioPerdidas))
