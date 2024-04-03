a = 10
b = 5

A = 7.2
B = 10.1

#le language fait la distinction si un caractère est en majuscule ou non

resultat = A+B

rm(a,b,A,B,resultat)




v1= c(1:5)

#class(vecteur)
#vecteur[3]

v2 = c(v1+3)
v3 = c(1:6)
v4 = c(v3^2)
v5 = c(v4/2)

jours_semaine=c("lundi","mardi","mercredi",
                "jeudi","vendredi","samedi","dimanche")
class(jours_semaine)
jours_semaine [c(2,7)]

v6 = c(seq(0,1, by =0.2))
class(v6)
v6 [c(-3)]

mois = c("janvier","fevrier","mars","avril","mai","juin","juiller",
         "août","septembre","octobre","novembre","decembre")
mois[c(1,2,3)]

v7 = c(-1,-2,-3)
class(v7)
v7[c(3,1)]

fruits = c("pomme","banane","noix","kiwi")
class(fruits)
fruits[c(-1,-2)]

v8 = c(1,2,NA,4,5,NA)
class(v8)


v1a10 = c(seq(1,10,by=1))
length(v1a10)

v2a20 = c(seq(2,20, by = 2))
length(v2a20)

vneg = c(seq(from=0,to=-5))
length(vneg)

v5a50 = c(seq(from = 5,to = 50, by =5))
length(v5a50)

v33 = c(rep(3,3))
vABC = rep(c("A","B","C"),3)

v123 = rep(c(1,2,3),3)

vtf = rep(c("true","fasle"),4)

rm(vtf,v123)





1 = runif(5,0,1)
mean(v1)
median(v1)
min(v1)
max(v1)

v2 = runif(10,-5,5)
mean(v2)
median(v2)
min(v2)
max(v2)

v3 = runif(100,10,20)
mean(v3)
median(v3)
min(v3)
max(v3)

v4 = runif(15,50,100)
mean(v4)
median(v4)
min(v4)
max(v4)

g1 = rnorm(20,-2,3)
mean(g1)
sd(g1)

g2 = rnorm(2000,-2,3)
mean(g2)
sd(g2)

g3 = rnorm(2000,0,1)
mean(g3)
sd(g3)

quantile(g3,c(0.25))
quantile(g3,c(0.50))
quantile(g3,c(0.75))

quantile(g3,seq(0,1,0.1))

quantile

hist(g3)

rm(list=ls())

l1 = rnorm(3000,2400,300)
hist(l1)
mean(l1)
sd(l1)


round(l1,2)

sum(l1)
median((l1))
quantile(l1,c(0.99))
quantile(l1,c(0.20))

sample(c(1,2,3,4,5,6),1)

simulation = sample(c(1,2,3,4,5,6),12,TRUE)
unique(simulation)
sort(table(simulation))
prop.table(table(simulation))
#le nombre d'essais n'est pas assze grand pour nous laisser 
#voir une répartition égale entre les lancers de dé

simulation = sample(c(1,2,3,4,5,6),10000,TRUE)
sort(prop.table(table(simulation)))
print("ces résultats sont proches des proba théoriques")
