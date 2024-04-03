fichiers = list.files( pattern = ".csv$", full.names = TRUE)
# Liste tous les fichiers csv du répertoire actuel


library(tools)


common_player_info = basename("common_player_info.csv")
# Retrouve le nom d'un fichier
common_player_info = file_path_sans_ext("common_player_info.csv")
# Retrouve le nom d'un fichier sans extension


assign(x = "", value = read.csv("common_player_info.csv", header = TRUE, dec=".", sep = ","))



for(i in 1:length(fichiers)){
  
  nom = basename(fichiers[i])
  assign(x = file_path_sans_ext(nom), value = read.csv(fichiers[i], header = TRUE, dec=".", sep = ","))
  
}



merge(x = )

LA = subset(team, city == "Los Angeles", select = c("id","city"))
LA2 = subset(game, select = c("game_id","team_id_home"))

matchsLA= merge(LA, LA2, by.x = "id", by.y = "team_id_home", all.x = TRUE)
matchsLA= merge(LA, game, by.x = "id", by.y = "team_id_home", all.x = TRUE)

nrow(matchsLA)

spectateursLA = merge(matchsLA, game_info, by.x = "game_id", by.y= "game_id", select= c("game_id","attendance") )
mean(spectateursLA$attendance, na.rm = TRUE)


date = subset(game_info , game_date == 2020, select = c("game_id","game_date"))
