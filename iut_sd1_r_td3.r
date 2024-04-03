install.packages("readxl")
library("readxl")
pokemon =readxl::read_excel(path = "D:/Cours/SD1/Programmation/Programmation statistique/TD3/pokemon.xlsx", sheet = "pokemon")

dim(pokemon)
# nb lignes et nb colonnes dim pour dimensions

nrow(pokemon)
# nb lignes

ncol(pokemon)
# nb colonnes

pokemon$generation = as.factor(pokemon$generation)
pokemon$type = as.factor(pokemon$type)
pokemon$is_legendary = as.factor(pokemon$is_legendary)

summary(pokemon)


pokemon$attack_group = ifelse(pokemon$attack >= median(pokemon$attack), yes = "attack+", no = "attack-")

pokemon$attack_group = as.factor(pokemon$attack_group)


pokemon$water_fire = ifelse(pokemon$type %in% c("water","fire"), "yes","no")
# Cré une colonne spécifiant si oui ou non un pokemon est de type feu ou eau. opérateur %in% pour dire si les valeurs sont comprises dans c("water","fire")


pokemon$water_fire = as.factor(pokemon$water_fire)



pokemon$best = ifelse(pokemon$attack >= quantile(pokemon$attack, probs = c(0.75)) & pokemon$defense >= quantile(pokemon$defense, probs = c(0.75)) & pokemon$speed >= quantile(pokemon$speed, probs = c(0.75)) , yes = "yes", no="no" )
# les pokemons dont les stats d'attaque de def et de vitesse sont supérieures à celles du troisième quartile


pokemon$best = as.factor(pokemon$best)


requete = subset(pokemon, is.na(pokemon$weight_kg))

requete = subset(pokemon, pokemon$weight_kg != is.na(pokemon$weight_kg))

pokemon$weight_kgNa = ifelse(is.na(pokemon$weight_kg),  yes = median(pokemon$weight_kg, na.rm = TRUE),no = pokemon$weight_kg)
# Change dans la nouvelle variables les poids NA par la médiane 

pokemon$height_m = ifelse(is.na(pokemon$height_m),  yes = median(pokemon$height_m, na.rm = TRUE),no = pokemon$height_m)
# Pareil avec la taille


quantile(pokemon$weight_kgNa, probs = c(0.25, 0.5, 0.75))

pokemon$weight_group = cut(pokemon$weight_kgNa, breaks = 3  , labels = c("léger", "Moyen", "Lourd"))

pokemon$height_m_group = cut(pokemon$height_m,
                             breaks = c(0,1,2,3,
                                        max(pokemon$height_m,
                                            na.rm = TRUE)))

pokemon$defense_group = cut(pokemon$defense,
                            breaks = quantile(pokemon$defense,
                                              na.rm = TRUE),
                            include.lowest = TRUE)
summary(pokemon$defense_group)




count.fields()nrow()aggregate(x = attack ~ type, data = pokemon, FUN = function(x) mean(x))
# calcul la moyenne d'attaque par type

aggregate(x = attack ~ type + generation, data = pokemon, FUN = function(x) median(x))
# calcul la médiane d'attaque par type et par génération

aggregate(x = pokedex_number ~ type, data = pokemon, FUN = function(x) length(x))
# le nombre de pokemons par type


length(pokemon$pokedex_number)
# compter nombre de pokemons


aggregate(x = speed ~ type + generation, data = pokemon, FUN = function(x) c(moyenne = mean(x), med = median(x), eff = length(x)))
# calcul la vitesse moyenne, médiane et l'effectif par type et génération
          