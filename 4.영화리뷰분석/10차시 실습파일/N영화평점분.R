setwd("c:/R/sample/lesson10")
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("RColorBrewer")
library(KoNLP)
library(wordcloud)
library(RColorBrewer)

data1 <- readLines("Moviescore.txt") 
data1 
data2 <- sapply(data1,extractNoun,USE.NAMES=F)
data2
data3 <- unlist(data2) # 비순차적으로 정렬합니다.
data3 <- Filter(function(x) {nchar(x) >= 2} ,data3)
data3
write(unlist(data3),"Moviescore2.txt")
data4 <- read.table("Moviescore3.txt")
wordcount <- table(data4) # 테이블 데이터의 개수를 변수에 할당합니다.
head(sort(wordcount, decreasing=T),20)
palete <- brewer.pal(9,"Set3") 

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,random.order=F,random.color=T,colors=palete)
