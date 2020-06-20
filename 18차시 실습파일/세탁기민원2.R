setwd("c:\\R")
library(rvest)
library(httr)
library(KoNLP)

url_base = 'https://search.naver.com/search.naver?where=post&sm=tab_pge&query=%EC%84%B8%ED%83%81%EA%B8%B0%20%EB%AF%BC%EC%9B%90&st=sim&date_option=0&date_from=&date_to=&dup_remove=1&post_blogurl=&post_blogurl_without=&srchby=all&nso=&ie=utf8&start=1'
all.reviews<-c()
for(page in 1:100){
  url<-paste(url_base, page, sep='')
  htxt<-html(url)
  comments<-html_nodes(htxt, 'dd.sh_blog_passage')
  #links<-html_nodes(comments, 'a')
  reviews<-html_text(comments)
  if( length(reviews)==0 ){ break }
  all.reviews<-c(all.reviews, reviews)
  print(page)
}
#
  length(all.reviews)
all.reviews
data1 <- repair_encoding(all.reviews)
a<- data1
write(a,"세탁기민원100.txt")
data2 <- sapply(a,extractNoun,USE.NAMES=F)
data2
data3 <- unlist(data2) # 비순차적으로 정렬합니다.
data3
data3 <- Filter(function(x) {nchar(x) >= 2} ,data3)
data3
write(unlist(data3),"세탁기민원100_2.txt")
data4 <- read.table("세탁기민원100_2.txt")
wordcount <- table(data4) # 테이블 데이터의 개수를 변수에 할당합니다.
wordcount
head(sort(wordcount, decreasing=T),50)
palete <- brewer.pal(9,"Set3") 
display.brewer.all()
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,random.order=F,random.color=T,colors=palete)

