setwd("c:\\R")
library(rvest)
library(httr)
library(KoNLP)
url = 'https://search.naver.com/search.naver?where=post&sm=tab_pge&query=%EC%84%B8%ED%83%81%EA%B8%B0%20%EB%AF%BC%EC%9B%90&st=sim&date_option=0&date_from=&date_to=&dup_remove=1&post_blogurl=&post_blogurl_without=&srchby=all&nso=&ie=utf8&start=1'
response = GET(url)
htxt = html(response)
comments = html_nodes(htxt, 'dd.sh_blog_passage')
html_text(comments)

a = repair_encoding(html_text(comments)) ## 윈도일 경우
a
write(a,"세탁기민원.txt")
data2 <- sapply(a,extractNoun,USE.NAMES=F)
data2
data3 <- unlist(data2) # 비순차적으로 정렬합니다.
data3
data3 <- Filter(function(x) {nchar(x) >= 2} ,data3)
data3
write(unlist(data3),"세탁기민원2.txt")
data4 <- read.table("세탁기민원2.txt")
wordcount <- table(data4) # 테이블 데이터의 개수를 변수에 할당합니다.
wordcount
head(sort(wordcount, decreasing=T),50)
palete <- brewer.pal(9,"Set3") 
display.brewer.all()
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,random.order=F,random.color=T,colors=palete)


