salaire_net_cadre = function(salaire_brut_cadre = 2500, temps_travail = 100) {
 
  if(!is.numeric(salaire_brut_cadre)){
    
    salaire_net= "Le salaire doit être une valeur numérique"
    return(salaire_net)
  }
  
  if((temps_travail>100) | (temps_travail<0)){
    
    salaire_net= "le temps de travail doit être entre 0 et 100%"
    return(salaire_net)
  }
  
    temps_travail = temps_travail/100
    salaire_net = (salaire_brut_cadre * 0.75)*temps_travail
    
    return(salaire_net)}
  
  

salaire_net_cadre(30000,100)






salaire_net = function(salaire_brut = 2500,temps_travail = 1, statut) {
  
  if (!is.numeric(salaire_brut)) {
    return("Erreur :  le salaire brut doit être une valeur numérique")
  }
  
  if (is.numeric(temps_travail) & (temps_travail >= 0) & (temps_travail <= 1)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
  }
  
  if (!statut %in% c("cadre","non cadre")) {
    return("Erreur :  le statut doit être cadre ou non cadre")
  }
  
  if (statut == "cadre") {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.75
  } else {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.78
  }
  
  return(salaire_net_avant_impot) 
}
#Test de la fonction
salaire_net(salaire_brut = 2000, statut = "cadre")
salaire_net(salaire_brut = 2000, statut = "non cadre")
salaire_net(salaire_brut = 2000, statut = "technicien")
