df<-read.csv("D:/Cours/SD1/Programmation/Programmation statistique/TP2/fao.csv", header= TRUE, dec=",", sep = ";")
# importer le CSV

nrow(df)
# nombre de lignes = nombre de pays dans le dataset

summary(df)
# résumé des infos du dataset
# il manque une valeur dans la production de viante, 24 dans l'exportation et 1 concernant la population

(sum(df$Dispo_alim*df$Population,na.rm = TRUE))/sum(df$Population, na.rm=TRUE)
# calcul la moyenne de la variable dispo_alim, à pondérer avec la population
# 2986.316 kcal/personne/jour

sum(df$Population,na.rm = TRUE)
# somme population, ignore les valeurs indisponibles
# pop = 7 592 664 054

sd(df$Export_viande,na.rm = TRUE)
sd(df$Import_viande,na.rm = TRUE)
# ecart-type exportation viande, ignore NA
# 1088.94 export
# 1179.726 import

median(df$Prod_viande,na.rm = TRUE)
# mediane production viande 295 tonnes

quantile(df$Dispo_alim, na.rm = TRUE, probs = c(0.25, 0.5, 0.75, 1), )
# quartiles dispo_alim

quantile(df$Import_viande, na.rm = TRUE, probs = seq(0,1,0.01))
#calcule les centiles du volume d'importation en viande


top5_moins_pop <- df[head(order(df$Population, decreasing = FALSE),n=5),]
# sélectionne les numéros de ligne des 5 pays avec le moins de pop
# sélectionne dans df uniquement ces 5 lignes et les enregistre dans la variable

top5_plus_pop <- df[head(order(df$Population, decreasing = TRUE),n=5),]
# sélectionne les numéros de ligne des 5 pays avec le plus de pop
# sélectionne dans df uniquement ces 5 lignes et les enregistre dans la variable

top5_prod_Viande <- top5_plus_pop <- df[head(order(df$Prod_viande, decreasing = TRUE),n=5),]

top5_import_viande <- df[head(order(df$Import_viande, decreasing = TRUE),n=5),]

nb_pays_sup2300 <-(subset(df, df$Dispo_alim>=2300))
nrow(nb_pays_sup2300)
# sous-ensemble df avec dispo alim>=2300 kcal

nb_pays_sup3500_import <-subset(df, df$Dispo_alim>3500 & df$Import_viande>=1000)
nrow(nb_pays_sup3500_import)

fra_belg<- subset(df,df$Nom==c("France","Belgique"))
# sous-ensemble belgique/france

df$part_export = c(df$Export_viande/df$Prod_viande)
# ajoute une nouvelle colonne part_export au dataframe

df$dispo_alim_pays = c(df$Dispo_alim*df$Population)


write.table(df, file = "D:/Cours/SD1/Programmation/Programmation statistique/TP2/ExportTp2.csv", sep = ",", row.names = FALSE)
# enregistrer table modifiée dans un nouveau csv

sum(df$dispo_alim_pays,na.rm = TRUE)
# somme alimentaire mondiale

sum(df$Population,na.rm = TRUE)
sum(df$dispo_alim_pays,na.rm = TRUE)/2300
# résultat = 9 858 300 378 
# pop_mond = 7 592 664 054
# il est possible de nourrir tout le monde

plot(df$Prod_viande, df$Export_viande)
# nuage de point x y

cor(x = df$Prod_viande, y =df$Export_viande,use = "complete.obs" ,method = "pearson")
# corrélation , pour ignorer les NA, ajouter "use="complete.obs"" après les variables

matriceCor = cor(df[,-1])
# créer une matrice des corrélations à partir des variables
# quantitatives de la matrice df
# df[,-1] pour retirer la première colonne comportant du txt donc pas corrélable
matriceCor = round(matriceCor , 2)
# arrondir les chiffres de la matrice deux chiffres après la virgule
View(matriceCor)

install.packages("corrplot")

library(corrplot)

corrplot(matriceCor)
