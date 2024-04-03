df <- read.csv(file = "NBA2014_2015.csv", sep = ",",
               header = TRUE, dec = ".")

# Le nom du csv n'était pas exact. De même pour les spécifications de la fonction read.csv

nrow(df)
ncol(df)

# Sur ces deux dernières lignes le nom du dataframe n'était pas correct

colnames(df)

# Il manquait un -s à la fin de colnames


df$PERIOD <- as.factor(df$PERIOD)

# la colonne PERIOD n'était pas écrite en majuscules

df$PTS_TYPE <- as.factor(df$PTS_TYPE)

# Il manquait le _ dans le nom de la colonne + la flèche était dans le mauvais sens


df$SHOOTER = as.factor(df$SHOOTER)





######################################################################################################

# Script 2



length(df$Period) # Fonction level ?
length(df$PTS_TYPE) # Manque _ nom colonne
length(df$SHOOTER) # maque un o nom colonne

# Erreur d'orthographe sur length

summary(df) # d en trop sur le nom de dataframe

sd(df$SHOT_DIST) # df mal écrit

     sd(df$SHOT_CLOCK, na.rm = TRUE) #[] au lieu de () + rajouter na.rm =
     
     #combien de tirs manqués/réussis
     
     table(df$SHOT_RESULT) # erreur ortographe nom colonne + [""] au lieu de df$
     
     
     
     
     #les quartiles
     quantile(df$SHOT_CLOCK, probs = c(0.25, 0.5, 0.75,1), na.rm = TRUE) # manque na.rm mtrue et les probs étaient incorrectes  
     
     
     
     #les déciles
     quantile(df$CLOSE_DEF_DIST, probs = seq(0, 1, by = 0.1), na.rm = TRUE) # erreur ortographe nom fonction, mauvaise prob+ mauvais nom variable + na.rm true manquant
     


     
     #nombre de matches différents
     liste_game <- unique(df$GAME_ID) # parenthèse en trop
length(liste_game) # erreur listegame
#nombre de joueurs différents
df$SHOOTER <- as.factor(df$SHOOTER)
nlevels(df$SHOOTER) # Manque -s level + parenthèse


       #conversion de la variable SHOT_DIST en mètre pour que les européens comprennent nos chiffres
       df$SHOT_DIST_METRE = df$SHOT_DIST * 0.30 # mauvais df + deux ==
       
       
       #nombre de points qu'a rapporté la tentative (0,2 ou 3)
       df$PTS_MARQUES <- ifelse(df$SHOT_RESULT == "made", yes = df$PTS_TYPE, no = 0) # manque un = + le no=
       #On supprime la variable GAME_RESULT car elle n'est pas utile
       df$GAME_RESULT <- NULL # manquait un l à NULL
       
       #création d'un objet sans la première colonne GAME_ID
       df2 <- df[,-1] # le -1 était placé à gauche
       
       
       
       
       
###################################################################################################################
       
       
#Script 3
       
#Les 100 tirs réussis ou manqués les plus loin
rang <- order(df$SHOT_DIST, decreasing = TRUE)
df <- df[rang,]
df3 <- df3[ 1 : 100,]

#Les 100 tirs réussis les plus loin
df4 = subset(df, df$SHOT_RESULT == "made")
df4 <- df4[ 1 : 100 , ]




#Combien de tirs à 3 points a réussi Kobe Bryant ?
df_kobe = subset(df,SHOT_RESULT == "made" &
                   PTS_TYPE == 3 &
                   SHOOTER == "kobe bryant")

dim(df_kobe)

#Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
df_total <- aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = function(x) sum(x))
df_total_tri <- df_total[order(df_total$PTS_MARQUES, decreasing = TRUE),]
df_top5 <-  df_total_tri[1:5,]




###################################################################################################

# Script 4


#Des graphiques adaptés selon le type de variable

#construction de la fonction
build_graph <- function(une_colonne, nom_colonne) {
  if(is.numeric(une_colonne)) {
    print(boxplot(une_colonne, main = nom_colonne))
  }
  else if (as.factor(une_colonne)) {
    tri <- table(une_colonne)
    print(barplot(tri, main = nom_colonne))
  }
  
  #on déroule la fonction sur chaque colonne du data frame.
  
  for (colonne in colnames(df) {
    build_graph(une_colonne = df[colonne , ] , nom_colonne = colone)
  }
}
