# Créer une toile de fond vide pour le graphique
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")


# Tracer la densité de probabilité pour chaque simulation
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 10000000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 0.5), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")


graphique= rnorm(n=10000,mean=0,sd=1)



hist(graphique, probability = TRUE)
lines(density(graphique))

mean(graphique)
quantile(graphique, probs = c(0.25, 0.5, 0.75,1))

quantile(graphique, probs = c(0.95))

qnorm(0.95,mean=0,sd=1)
pnorm(1.644854,mean=0,sd=1)

qnorm(p = 0.975, mean = 0, sd = 1)
pnorm(q = 1.96, mean = 0, sd = 1)





indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#on crée un vecteur vide pour ajouter les probas au fur et à mesure
all_probas = c()
#On parcourt les indices lignes
for (i in indices_lignes){
  proba = pnorm(q = i, mean = 0, sd = 1)
  #on ajoute la nouvelle proba au vecteur existant
  all_probas = c(all_probas,proba)
  all_probas = round(all_probas,digits = 4)
}


population = rnorm(n=10000000,mean= 171, sd = 9)