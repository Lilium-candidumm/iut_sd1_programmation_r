df= read.csv(file="velov.csv",header=TRUE, dec = ",",sep=";")

summary(df)

df$status = as.factor(df$status)
df$CodePostal = as.factor(df$CodePostal)

df$bornes = ifelse(df$bikes+df$stands == df$capacity, yes = "OK",no = "KO")
df$bornes = as.factor(df$bornes)

summary(df$bornes)


hist(df$capacity, main = "Répartition de la capacité des stations", xlab = "capacité", col ="green")

hist(df$capacity, main = "Répartition de la capacité des stations", xlab = "capacité", col ="green", breaks = 6)

hist(df$capacity, main = "Répartition de la capacité des stations", xlab = "capacité", col ="red", breaks = 6)

abline(col = "blue",h=100, lty = 1)


hist(df$capacity, main = "densité de la capacité des stations", xlab = "capacité", col ="red", probability = TRUE, ylim = c(0,0.08))

lines(density(df$capacity),lwd = 3, lty = 1, col = "blue")
# Tracer la courbe de densité




boxplot(df$capacity, main = "Boîte à moustache de la capacité des stations", horizontal = TRUE)

boxplot(df$capacity, main = "Boîte à moustache de la capacité des stations", horizontal = FALSE, outline = FALSE)

points(x= mean(df$capacity), pch = 11, col= "red")

par(mfrow=c(1,2))


arrond1 = subset(df, df$CodePostal == "69007")
arrond2 = subset(df, df$CodePostal == "69008")


boxplot(arrond1$bikes, main = "69007",ylim = c(0,40))
boxplot(arrond2$bikes, main = "69008",ylim = c(0,40))


#(╯°□°）╯︵ ┻━┻ 
# Il y a plus de vélos dans le 7ème mais leur nombre est également plus dispersé d'une station à l'autre


par(mfrow=c(1,1)) #fenêtre sur 1 ligne et 1 colonne
# Tracer le graphique boxplot
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")




tapply(df$bike, INDEX = df$bonus, FUN = mean)
points(tapply(df$bike, INDEX = df$bonus, FUN = mean), col="red", pch = 11)



barplot(df$bonus, main = "Bonus")


effectif = table(df$bonus)
barplot(height = effectif,
        main = "Répartition du nombre \n de station bonus")