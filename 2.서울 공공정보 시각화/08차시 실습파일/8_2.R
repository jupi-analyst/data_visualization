install.packages('ggmap')
library(ggmap)
setwd("c:/rja")
seoul_wifi <- read.csv("서울시wifi위치정보.csv",header=T)
head(seoul_wifi)

gmap <- get_map('seoul_si',zoom=15,maptype='roadmap')
gomap <- ggmap(gmap)+geom_point(data=seoul_wifi, aes(x=seoul_wifi$경도 , y=seoul_wifi$위도 ),size=2,
                  alpha=.5,color="red")
gomap

gomap + geom_text(data=seoul_wifi, aes(x = seoul_wifi$경도, y = seoul_wifi$위도+0.01, 
                                      label=seoul_wifi$설치기관.회사),size=5)

