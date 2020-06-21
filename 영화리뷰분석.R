library(KoNLP)
library(wordcloud)
library(RColorBrewer)

data1 <- readLines("./data/Moviescore.txt", encoding = 'UTf-8')
data1 
data2 <- sapply(data1, extractNoun, USE.NAMES=F)
data2
data3 <- unlist(data2) 
data3 <- Filter(function(x) { nchar(x) >= 2 }, data3)
data3

write(unlist(data3), "Moviescore2.txt")
data4 <- read.table("Moviescore2.txt")
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 20)
palete <- brewer.pal(9, "Set3") 

wordcloud(names(wordcount),
          freq = wordcount,scale=c(5,1),
          rot.per = 0.25,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors=palete,
          family = 'AppleGothic')


data1 <- readLines("./data/m1.txt", encoding = 'UTF-8') 
data1 
data2 <- sapply(data1, extractNoun, USE.NAMES=F)
data2
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x) >= 2} , data3)
data3
write(unlist(data3),"m2.txt")
data4 <- read.table("m2.txt")
wordcount <- table(data4)
head(sort(wordcount, decreasing = T), 20)
palete <- brewer.pal(9,"Set3") 

wordcloud(names(wordcount),
          freq = wordcount,
          scale = c(5,1),
          rot.per = 0.25,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors = palete,
          family = 'AppleGothic')
