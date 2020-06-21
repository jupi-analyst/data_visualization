install.packages('ggmap')
library(ggmap)
setwd("c:/rja")
seoul_park <- read.csv("서울시한강공원주차장.csv",header=T)
head(seoul_park)

gmap <- get_map('Yongsan-gu',zoom=12,maptype='roadmap')
gomap <- ggmap(gmap)+geom_point(data=seoul_park, 
      aes(x=seoul_park$경도 , y=seoul_park$위도 ),size=2,
                  alpha=.5,color="red")
gomap

gomap + geom_text(data=seoul_park, 
                  aes(x = seoul_park$경도,
                      y = seoul_park$위도+0.01, 
                  label=seoul_park$주차장위치),size=2)

