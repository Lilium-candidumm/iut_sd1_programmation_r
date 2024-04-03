getwd()
# Montre le répertoire de travail

setwd("L:/BUT/SD/Promo 2023/lmichallat/Programmation/Programmation statistique/TP2/dataset")
# Modifie le répertoire de travail ou ctrl + shift + h

bodies_karts <- read.csv("bodies_karts.csv", header = TRUE, dec = ",", sep = ";")
drivers <- read.csv("drivers.csv", header = TRUE, dec = ",", sep = ";")
gliders <- read.csv("gliders.csv", header = TRUE, dec = ".", sep = "|")
tires <- read.csv("tires.csv", header = TRUE, dec = ",", sep = "\t")
#importe le contenu de fichiers csv dans des variables sous forme de dataset

dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)
#dimensions datasets

summary(bodies_karts)
summary(tires)
summary(gliders)
summary(drivers)
#résumé des datasets

plot(x=drivers$Weight, y=drivers$Acceleration, xlab="Poids", ylab="Accélération")
#plus une valeur augmente, plus l'autre diminue et vice-versa
#affiche un nuage de points entre le poids des conducteurs et leur accélération

correlation <- cor(x=drivers$Weight,y=drivers$Acceleration, method = "pearson")
#Correlation entre deux vecteurs

covariance <- cov(x=drivers$Weight,y=drivers$Acceleration)
#Covarince entre deux vecteurs

ecartype1 <- sd(drivers$Weight)
ecartype2 <- sd(drivers$Acceleration)
#ecart-type de chaque stat

correlation_manuellement <- covariance/(ecartype1*ecartype2)
#Calcul correlation manuellement

determination <- correlation^2
# calcul du coefficient de détermination

correlation_drivers <- cor(drivers[,-1])
correlation_drivers <- round(correlation_drivers, 2)
View(correlation_drivers)
#création d'une matrice à partir des corrélations
# des variables quantitatives du dataset driver. Enlever la première
#ligne car ce sont les noms de personnages

install.packages("corrplot")

corrplot::corrplot(correlation_drivers,method = "circle")
# créer un corrélogramme à partir de la matrice des corrélations
# method = "circle" méthode par défaut

correlation_bodies_karts = cor(bodies_karts[,-1])
correlation_gliders = cor(gliders[,-1])
correlation_tires = cor(tires[,-1])

correlation_bodies_karts = round(correlation_bodies_karts,2)
correlation_gliders = round(correlation_gliders,2)
correlation_tires = round(correlation_tires,2)

corrplot::corrplot(correlation_bodies_karts,method = "circle")
corrplot::corrplot(correlation_gliders,method = "circle")
corrplot::corrplot(correlation_tires,method = "circle")

