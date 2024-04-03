iris
class(iris)

View(iris)

nrow(iris)
ncol(iris)
colnames(iris)

summary(iris)

iris[,c("Sepal.Length","Species")]

iris[c(100,103,105),]
iris[c(50:100),]

mean(iris$Sepal.Length)

median(iris$Sepal.Width)

sd(iris$Petal.Length)

quantile(iris$Petal.Width,probs = seq(
  from = 0.1, to = 0.9, by = 0.1
))





dfManga <- read.csv("L:/BUT/SD/Promo 2023/lmichallat/Programmation/Programmation statistique/TP1/manga.csv",
                   header = TRUE,
                   sep = ",",
                   dec = ".")

dfAnime <-read.csv("L:/BUT/SD/Promo 2023/lmichallat/Programmation/Programmation statistique/TP1/anime.csv",
                   header = TRUE,
                   sep = ",",
                   dec = ".")

class(dfManga)
class(dfAnime)

View(dfManga)
View(dfAnime)

dim(dfManga)
dim(dfAnime)

mean(dfManga$"Score")
mean(dfAnime$"Score")

sum(dfAnime$"Vote")
sum(dfManga$"Vote")

sd(dfAnime$"Score")
sd(dfManga$"Score")

quantile(dfManga$"Score",seq(0.1,0.9,0.1))
quantile(dfAnime$"Score",seq(0.1,0.9,0.1))

neufsurdix = subset(dfManga,Score>9)
nrow(neufsurdix)

Manga20000=subset(dfManga,Vote>20000)
nrow(Manga20000)

Manga200008=subset(dfManga, Score>8 & Vote>20000)
nrow(Manga200008)

Manga78= subset(dfManga, Score <=8 & Score >= 7)
nrow(Manga78)

effectifRating = table(dfAnime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating)

A17 = subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(A17)

